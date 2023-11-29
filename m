Return-Path: <linux-next+bounces-112-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FCF7FCC7A
	for <lists+linux-next@lfdr.de>; Wed, 29 Nov 2023 03:02:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07B5228303A
	for <lists+linux-next@lfdr.de>; Wed, 29 Nov 2023 02:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6BE1FB3;
	Wed, 29 Nov 2023 02:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TNHbciMm"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB4731998;
	Tue, 28 Nov 2023 18:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701223326;
	bh=C3wX/06VopOvtrpQOf2OcHcMwNBKsT4VTGue8Fwl3zM=;
	h=Date:From:To:Cc:Subject:From;
	b=TNHbciMmLSQvclvp7ifU/0SkwF8i+q3NOkdjLVCwrGWrg4DruNeB4yTu8vw5qLpPE
	 w9PO1Wz8Fv7Dxuoba/uwJlIiNbAbzftQA+YPMpsfnvWUQ/bjx9wR+Jr6C3T5xyILx5
	 37DF4P7AkHRDxgqipbe8ipkXVfnADZesA8nwDgHWqOhEeeralhROwqkZvzDnXQOLYs
	 GjTZ+VRkmThzWEA8B3jeeAysfEudpJlHBH/ONnx1fvhD38vExFJmekNqV7uhRq830M
	 JPYhKE+85k0qfC1n06/LNtVuNWtKaPYXmMivE7TPwBiQpyslTpttcAu0yqhs6LTG7n
	 Ox8tUoVWGUU0Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sg2dB1Wy6z4wx5;
	Wed, 29 Nov 2023 13:02:06 +1100 (AEDT)
Date: Wed, 29 Nov 2023 13:02:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 29
Message-ID: <20231129130204.5dd07fb0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=z7K=azTAiLq9AZgzek4x=r";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=z7K=azTAiLq9AZgzek4x=r
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20231128:

The mm tree gained a build failure for which I reverted 2 commits.
The mm tree still had its build failures for which I applied patches.

The perf tree gained a conflict against Linus' tree.

Non-merge commits (relative to Linus' tree): 3272
 3843 files changed, 161496 insertions(+), 105108 deletions(-)

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
Merging origin/master (18d46e76d7c2 Merge tag 'for-6.7-rc3-tag' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging fixes/fixes (2dde18cd1d8f Linux 6.5)
Merging mm-hotfixes/mm-hotfixes-unstable (207f27102c18 kexec-fix-kexec_file=
-dependencies-fix)
Merging kbuild-current/fixes (98b1cc82c4af Linux 6.7-rc2)
Merging arc-current/for-curr (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm-current/fixes (2dde18cd1d8f Linux 6.5)
Merging arm64-fixes/for-next/fixes (c0a857420405 arm64: add dependency betw=
een vmlinuz.efi and Image)
Merging arm-soc-fixes/arm/fixes (736a4aad8a9f Merge tag 'renesas-fixes-for-=
v6.6-tag3' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-d=
evel into arm/fixes)
Merging davinci-current/davinci/for-current (06c2afb862f9 Linux 6.5-rc1)
Merging drivers-memory-fixes/fixes (b85ea95d0864 Linux 6.7-rc1)
Merging tee-fixes/fixes (ceaa837f96ad Linux 6.2-rc8)
Merging m68k-current/for-linus (03191fb3db3d m68k: lib: Include <linux/libg=
cc.h> for __muldi3())
Merging powerpc-fixes/fixes (98b1cc82c4af Linux 6.7-rc2)
Merging s390-fixes/fixes (aab1f809d754 scripts/checkstack.pl: match all sta=
ck sizes for s390)
Merging sparc/master (2d2b17d08bfc sparc: Unbreak the build)
Merging fscrypt-current/for-current (4bcf6f827a79 fscrypt: check for NULL k=
eyring in fscrypt_put_master_key_activeref())
Merging fsverity-current/for-current (a075bacde257 fsverity: don't drop pag=
ecache at end of FS_IOC_ENABLE_VERITY)
Merging net/main (91d3d149978b r8169: prevent potential deadlock in rtl8169=
_close)
Merging bpf/master (0bad281d0ecd netkit: Reject IFLA_NETKIT_PEER_INFO in ne=
tkit_change_link)
Merging ipsec/master (76df934c6d5f MAINTAINERS: Add netdev subsystem profil=
e link)
Merging netfilter/main (54d4434da824 Merge branch 'hv_netvsc-fix-race-of-ne=
tvsc-vf-register-and-slave-bit')
Merging ipvs/main (54d4434da824 Merge branch 'hv_netvsc-fix-race-of-netvsc-=
vf-register-and-slave-bit')
Merging wireless/for-next (4ded3bfe1db6 wifi: mac80211: use wiphy locked de=
bugfs for sdata/link)
Merging wpan/master (2d1c882d4434 Merge tag 'mlx5-fixes-2023-10-12' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/saeed/linux)
Merging rdma-fixes/for-rc (2b78832f50c4 RDMA/irdma: Fix UAF in irdma_sc_ccq=
_get_cqe_info())
Merging sound-current/for-linus (baaacbff64d9 ALSA: hda/realtek: Headset Mi=
c VREF to 100%)
Merging sound-asoc-fixes/for-linus (3acc58f55edf ASoC: hdac_hda: Conditiona=
lly register dais for HDMI and Analog)
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
Merging input-current/for-linus (936e4d49ecbc Input: atkbd - skip ATKBD_CMD=
_GETID in translated mode)
Merging crypto-current/master (9aedd10fe384 crypto: ahash - Set using_shash=
 for cloned ahash wrapper over shash)
Merging vfio-fixes/for-linus (ae2667cd8a47 vfio/pds: Fix possible sleep whi=
le in atomic context)
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
Merging reset-fixes/reset/fixes (b5ec29447279 reset: hisilicon: hi6220: fix=
 Wvoid-pointer-to-enum-cast warning)
Merging mips-fixes/mips-fixes (2cc14f52aeb7 Linux 6.7-rc3)
Merging at91-fixes/at91-fixes (b85ea95d0864 Linux 6.7-rc1)
Merging omap-fixes/fixes (0b9a4a67c60d clk: ti: Fix missing omap5 mcbsp fun=
ctional clock and aliases)
Merging kvm-fixes/master (ffc253263a13 Linux 6.6)
Merging kvms390-fixes/master (27072b8e18a7 KVM: s390/mm: Properly reset no-=
dat)
Merging hwmon-fixes/hwmon (58ebe7fb6eb2 hwmon: max31827: include regulator =
header)
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
Merging drm-fixes/drm-fixes (2cc14f52aeb7 Linux 6.7-rc3)
Merging drm-intel-fixes/for-linux-next-fixes (2cc14f52aeb7 Linux 6.7-rc3)
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
Merging riscv-dt-fixes/riscv-dt-fixes (e80ed63affc9 riscv: dts: sophgo: rem=
ove address-cells from intc node)
Merging riscv-soc-fixes/riscv-soc-fixes (b85ea95d0864 Linux 6.7-rc1)
Merging fpga-fixes/fixes (b85ea95d0864 Linux 6.7-rc1)
Merging spdx/spdx-linus (2cc14f52aeb7 Linux 6.7-rc3)
Merging gpio-brgl-fixes/gpio/for-current (b85ea95d0864 Linux 6.7-rc1)
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
Merging iommufd-fixes/for-rc (98594181944d iommufd/selftest: Fix _test_mock=
_dirty_bitmaps())
Merging rust-fixes/rust-fixes (cfd96726e611 rust: docs: fix logo replacemen=
t)
Merging v9fs-fixes/fixes/next (2dde18cd1d8f Linux 6.5)
Merging w1-fixes/fixes (b85ea95d0864 Linux 6.7-rc1)
Merging pmdomain-fixes/fixes (0cb19e50a911 pmdomain: arm: Avoid polling for=
 scmi_perf_domain)
Merging overlayfs-fixes/ovl-fixes (37f32f526438 ovl: fix memory leak in ovl=
_parse_param())
Merging drm-misc-fixes/for-linux-next-fixes (b9c02e105265 drm/gpuvm: Fix de=
precated license identifier)
Merging mm-stable/mm-stable (5b7ad877e4d8 Merge tag 'afs-fixes-20231124' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs)
Merging mm-nonmm-stable/mm-nonmm-stable (5b7ad877e4d8 Merge tag 'afs-fixes-=
20231124' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-f=
s)
Merging mm/mm-everything (c1bcffa795b1 Merge branch 'mm-nonmm-unstable' int=
o mm-everything)
Applying: powerpc: pmd_move_must_withdraw() is only needed for CONFIG_TRANS=
PARENT_HUGEPAGE
Applying: sparc: turn off Werror for now
Applying: Revert "samples/cgroup: introduce memcg memory.events listener"
Applying: Revert "samples: introduce new samples subdir for cgroup"
Merging kbuild/for-next (ef6609adf1ec kbuild: remove the last use of old cm=
d_src_tar rule in packaging)
Merging clang-format/clang-format (5d0c230f1de8 Linux 6.5-rc4)
Merging perf/perf-tools-next (5940a20a186b perf mmap: Lazily initialize zst=
d streams to save memory when not using it)
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
Merging amlogic/for-next (3a5038e9c055 Merge branch 'v6.8/drivers' into for=
-next)
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
Merging omap/for-next (cb1114df7bb0 Merge branch 'fixes' into for-next)
Merging qcom/for-next (2b05c2dc230b Merge branches 'arm64-defconfig-for-6.7=
', 'arm64-fixes-for-6.6', 'arm64-for-6.7', 'clk-for-6.7', 'drivers-for-6.7'=
 and 'dts-for-6.7' into for-next)
Merging renesas/next (a89ef75a0104 Merge branch 'renesas-dts-for-v6.8' into=
 renesas-next)
Merging reset/reset/next (e4916e791fb6 dt-bindings: reset: imx-src: Simplif=
y compatible schema and drop unneeded quotes)
Merging rockchip/for-next (5d1f1f3b9d04 Merge branch 'v6.8-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (64041620130c Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (b419bd935f13 Merge branch 'for-next/scmi/updat=
es' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux int=
o for-linux-next)
Merging stm32/stm32-next (9a7308232a11 ARM: dts: stm32: add SPI support on =
STM32F746)
Merging sunxi/sunxi/for-next (715a9e70bdd4 Merge branch 'sunxi/clk-for-6.8'=
 into sunxi/for-next)
Merging tee/next (352b5f33b950 Merge branch 'ffa_notif_for_v6.8' into next)
Merging tegra/for-next (650220c2b474 Merge branch for-6.7/arm64/dt into for=
-next)
Merging ti/ti-next (2b27ce85624e Merge branch 'ti-keystone-dts-next' into t=
i-next)
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
Merging powerpc/next (0d555b57ee66 powerpc: pmd_move_must_withdraw() is onl=
y needed for CONFIG_TRANSPARENT_HUGEPAGE)
Merging soc-fsl/next (fb9c384625dd bus: fsl-mc: fsl-mc-allocator: Drop a wr=
ite-only variable)
Merging risc-v/for-next (3ca112b71f35 Merge tag 'probes-fixes-v6.7-rc1' of =
git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace)
Merging riscv-dt/riscv-dt-for-next (b85ea95d0864 Linux 6.7-rc1)
Merging riscv-soc/riscv-soc-for-next (94f4018bc9f3 Merge branch 'riscv-cach=
e-for-next' into riscv-soc-for-next)
Merging s390/for-next (e9304ad4e23b Merge branch 'features' into for-next)
Merging sh/for-next (b85ea95d0864 Linux 6.7-rc1)
Merging uml/next (974b808d85ab um: virt-pci: fix missing declaration warnin=
g)
Merging xtensa/xtensa-for-next (a83a72730c33 xtensa: import ESP32S3 core va=
riant)
Merging bcachefs/for-next (8e0964b74d32 bcachefs: Improve trace_trans_resta=
rt_would_deadlock)
Merging pidfd/for-next (a901a3568fd2 Merge tag 'iomap-6.5-merge-1' of git:/=
/git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging fscrypt/for-next (15baf55481de fscrypt: track master key presence s=
eparately from secret)
Merging afs/afs-next (0a278bc196e7 afs: Automatically generate trace tag en=
ums)
Merging btrfs/for-next (f931faf024dd Merge branch 'for-next-next-v6.7-20231=
124' into for-next-20231124)
Merging ceph/master (d30d7c57a64d ceph: select FS_ENCRYPTION_ALGS if FS_ENC=
RYPTION)
Merging cifs/for-next (d00273876059 smb: client: cleanup smb2_query_reparse=
_point())
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging ecryptfs/next (a3d78fe3e1ae fs: ecryptfs: comment typo fix)
Merging erofs/dev (1a0ac8bd7a4f erofs: fix erofs_insert_workgroup() lockref=
 usage)
Merging exfat/dev (1373ca10ec04 exfat: fix ctime is not updated)
Merging ext3/for_next (8abc712ea486 ext2: Fix ki_pos update for DIO buffere=
d-io fallback case)
Merging ext4/dev (91562895f803 ext4: properly sync file size update after O=
_SYNC direct IO)
Merging f2fs/dev (6bc40e44f1dd Merge tag 'ovl-fixes-6.7-rc2' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/overlayfs/vfs)
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
Merging v9fs/9p-next (ce0708796420 9p/net: fix possible memory leak in p9_c=
heck_errors())
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
Merging vfs-brauner/vfs.all (1633874f3b87 Merge branch 'vfs.fscache' into v=
fs.all)
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.c
CONFLICT (content): Merge conflict in fs/btrfs/subpage.c
CONFLICT (content): Merge conflict in fs/btrfs/super.c
CONFLICT (content): Merge conflict in fs/buffer.c
Merging vfs/for-next (bbe6a7c899e7 bch2_ioctl_subvolume_destroy(): fix lock=
ing)
Merging printk/for-next (b4908d68609b Merge branch 'for-6.7' into for-next)
Merging pci/next (b85ea95d0864 Linux 6.7-rc1)
Merging pstore/for-next/pstore (1d49dee6b691 pstore/ram: Fix crash when set=
ting number of cpus to an odd number)
Merging hid/for-next (8674f6b6cdba Merge branch 'for-6.7/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (382561d16854 i2c: ocores: Move system PM hooks to=
 the NOIRQ phase)
Merging i3c/i3c/next (b4da37db3e2c i3c: master: Fix build error)
Merging dmi/dmi-for-next (13a0ac816d22 firmware: dmi: Fortify entry point l=
ength checks)
Merging hwmon-staging/hwmon-next (f90313944188 hwmon: (nct6775) Fix fan spe=
ed set failure in automatic mode)
Merging jc_docs/docs-next (d254d263f6c8 docs: submitting-patches: improve t=
he base commit explanation)
Merging v4l-dvb/master (a00b3f296eac media: mediatek: vcodec: Set the suppo=
rted vp9 profile for each platform)
Merging v4l-dvb-next/master (3b8551e73271 media: wave5: add OF and V4L_MEM2=
MEM_DRIVERS dependencies)
Merging pm/linux-next (3f96bebf018e Merge branch 'pm-cpufreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (8f96e29aae31 pmdomain: qcom: rp=
mpd: Set GENPD_FLAG_ACTIVE_WAKEUP)
Merging cpupower/cpupower (997bbf2accf6 tools cpupower bench: Override CFLA=
GS assignments)
Merging devfreq/devfreq-next (b85ea95d0864 Linux 6.7-rc1)
Merging pmdomain/next (034c9ec5d5b6 pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (19cc8b1819a4 OPP: Check for invalid OPP in dev_=
pm_opp_find_level_ceil())
Merging thermal/thermal/linux-next (9618efe343ea thermal/qcom/tsens: Drop o=
ps_v0_1)
Merging dlm/next (0c08699744d2 dlm: implement EXPORT_OP_ASYNC_LOCK)
Merging rdma/for-next (50af5d12f7e2 RDMA/IPoIB: Add tx timeout work to reco=
ver queue stop situation)
Merging net-next/main (a379972973a8 Merge branch 'net-page_pool-add-netlink=
-based-introspection')
Merging bpf-next/for-next (cf9791631027 selftests/bpf: update test_offload =
to use new orphaned property)
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
Merging wireless-next/for-next (a214724554ae Merge tag 'wireless-next-2023-=
11-27' of git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-n=
ext)
Merging wpan-next/master (18b849f12dcc ieee802154: ca8210: Remove stray gpi=
od_unexport() call)
Merging wpan-staging/staging (18b849f12dcc ieee802154: ca8210: Remove stray=
 gpiod_unexport() call)
Merging mtd/mtd/next (b85ea95d0864 Linux 6.7-rc1)
Merging nand/nand/next (acb1fd579efb mtd: rawnand: meson: initialize clock =
register)
Merging spi-nor/spi-nor/next (9b3eae3486c8 docs: mtd: spi-nor: drop obsolet=
e info)
Merging crypto/master (cc03a934c5da dt-bindings: crypto: convert Inside Sec=
ure SafeXcel to the json-schema)
Merging drm/drm-next (a13fee31f564 Merge v6.7-rc3 into drm-next)
Merging drm-ci/topic/drm-ci (ad6bfe1b66a5 drm: ci: docs: fix build warning =
- add missing escape)
Merging drm-misc/for-linux-next (fb3f43d50d9b drm/panel-edp: Avoid adding m=
ultiple preferred modes)
Merging amdgpu/drm-next (699d392903c3 drm/amdgpu: Add function parameter 'x=
cc_mask' not described in 'amdgpu_vm_flush_compute_tlb')
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm_mst_types.c
Merging drm-intel/for-linux-next (a4f477e6ac17 drm/i915/psr: Add proper han=
dling for disabling sel fetch for planes)
Merging drm-tegra/for-next (2429b3c529da drm/tegra: Avoid potential 32-bit =
integer overflow)
Merging drm-msm/msm-next (07e6de738aa6 drm/msm/a690: Fix reg values for a69=
0)
Merging drm-msm-lumag/msm-next-lumag (d3b4075b173f drm/msm/dp: use correct =
lifetime device for devm_drm_bridge_add)
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
Merging sound-asoc/for-next (1be95177eb04 Merge remote-tracking branch 'aso=
c/for-6.8' into asoc-next)
Merging modules/modules-next (4652b8e4f3ff Merge tag '6.7-rc-ksmbd-server-f=
ixes' of git://git.samba.org/ksmbd)
Merging input/next (fedfa36d045a Input: cap11xx - remove unnecessary IRQ pa=
rsing)
Merging block/for-next (20d713ea3192 Merge branch 'for-6.8/block' into for-=
next)
Merging device-mapper/for-next (13648e04a9b8 dm-crypt: start allocating wit=
h MAX_ORDER)
Merging libata/for-next (804901fdd637 ata: pata_pxa: convert not to use dma=
_request_slave_channel())
Merging pcmcia/pcmcia-next (4f733de8b78a pcmcia: tcic: remove unneeded "&" =
in call to setup_timer())
Merging mmc/next (078ebb647090 mmc: Merge branch fixes into next)
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
Merging iommu/next (173ff345925a Merge branches 'apple/dart', 'virtio', 'x8=
6/amd' and 'core' into next)
Merging audit/next (24fade412acf Automated merge of 'dev' into 'next')
Merging devicetree/for-next (67f7a63ecc71 dt-bindings: arm/calxeda: drop un=
needed quotes)
Merging dt-krzk/for-next (b85ea95d0864 Linux 6.7-rc1)
Merging mailbox/for-next (96cb7a4e296d dt-bindings: mailbox: qcom-ipcc: doc=
ument the SM8650 Inter-Processor Communication Controller)
Merging spi/for-next (8e6a43961f24 spi: sprd: adi: Use devm_register_restar=
t_handler())
Merging tip/master (c17381b94c15 Merge branch into tip/master: 'x86/percpu')
Merging clockevents/timers/drivers/next (c28ca80ba3b5 clocksource: ep93xx: =
Add driver for Cirrus Logic EP93xx)
Merging edac/edac-for-next (a2f99fbae451 EDAC/{sb,i7core}_edac: Do not use =
a plain integer for a NULL pointer)
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
Merging kvm-arm/next (9daf33ca4801 Merge branch kvm-arm64/lpa2 into kvmarm-=
master/next)
Merging kvms390/next (70fea3019516 KVM: s390: add tracepoint in gmap notifi=
er)
Merging kvm-ppc/topic/ppc-kvm (98b1cc82c4af Linux 6.7-rc2)
Merging kvm-riscv/riscv_kvm_next (d9c00f44e5de KVM: riscv: selftests: Add S=
BI DBCN extension to get-reg-list test)
Merging kvm-x86/next (45b890f7689e Merge tag 'kvmarm-6.7' of git://git.kern=
el.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging xen-tip/linux-next (7f3da4b698bc xen/events: fix error code in xen_=
bind_pirq_msi_to_irq())
Merging percpu/for-next (3fcf62f24c80 Merge branch 'for-6.6' into for-next)
Merging workqueues/for-next (4a6c5607d450 workqueue: Make sure that wq_unbo=
und_cpumask is never empty)
Merging drivers-x86/for-next (3ecb4d85461a platform/x86/dell: alienware-wmi=
: Use kasprintf())
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
Merging driver-core/driver-core-next (2cc14f52aeb7 Linux 6.7-rc3)
Merging usb/usb-next (24af68a0ed53 usb: misc: onboard_usb_hub: Add support =
for Cypress CY7C6563x)
Merging thunderbolt/next (655b8af57d31 thunderbolt: Remove duplicated re-as=
signment of pointer 'out')
Merging usb-serial/usb-next (2cc14f52aeb7 Linux 6.7-rc3)
Merging tty/tty-next (ab58841ab9fc tty: srmcons: use 'buf' directly in srmc=
ons_do_write())
Merging char-misc/char-misc-next (bc1183a63057 misc: ocxl: main: Remove unn=
ecessary =E2=80=980=E2=80=99 values from rc)
Merging accel/habanalabs-next (ce06bc9d7209 accel/habanalabs: expose module=
 id through sysfs)
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
Merging vhost/linux-next (e07754e0a1ea vhost-vdpa: fix use after free in vh=
ost_vdpa_probe())
Merging rpmsg/for-next (cae0e61beb7a arm64: dts: imx8mp: Add reserve-memory=
 nodes for DSP)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (58bfaaac0328 gpio: sysfs: fix forward decl=
aration of struct gpio_device)
Merging gpio-intel/for-next (92fc925f8386 gpio: tangier: simplify locking u=
sing cleanup helpers)
Merging pinctrl/for-next (75eb87dfebda Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (6191e49de389 pinctrl: baytrail: Simplify co=
de with cleanup helpers)
Merging pinctrl-renesas/renesas-pinctrl (dc99d4c8ac46 dt-bindings: pinctrl:=
 renesas: Drop unneeded quotes)
Merging pinctrl-samsung/for-next (904140fa4553 dt-bindings: pinctrl: samsun=
g: use Exynos7 fallbacks for newer wake-up controllers)
Merging pwm/for-next (5d67b8f81b9d dt-bindings: pwm: samsung: add specific =
compatibles for existing SoC)
Merging userns/for-next (05bd6e0242b4 Merge of unpriv-ipc-sysctls-for-v6.2,=
 and fix-atomic_lock_inc_below-for-v6.2 for testing in linux-next)
Merging ktest/for-next (7dc8e24f0e09 ktest: Restore stty setting at first i=
n dodie)
Merging kselftest/next (b85ea95d0864 Linux 6.7-rc1)
Merging kunit/test (b85ea95d0864 Linux 6.7-rc1)
Merging kunit-next/kunit (b85ea95d0864 Linux 6.7-rc1)
Merging livepatching/for-next (602bf1830798 Merge branch 'for-6.7' into for=
-next)
Merging rtc/rtc-next (3d762e21d563 rtc: cmos: Use ACPI alarm for non-Intel =
x86 systems too)
Merging nvdimm/libnvdimm-for-next (9ea459e477dc libnvdimm: remove kernel-do=
c warnings:)
Merging at24/at24/for-next (b85ea95d0864 Linux 6.7-rc1)
Merging ntb/ntb-next (9341b37ec17a ntb_perf: Fix printk format)
Merging seccomp/for-next/seccomp (31c65705a8cf perf/benchmark: fix seccomp_=
unotify benchmark for 32-bit)
Merging fsi/next (f04d61a379d6 fsi: fix some spelling mistakes in comment)
Merging slimbus/for-next (b85ea95d0864 Linux 6.7-rc1)
Merging nvmem/for-next (b85ea95d0864 Linux 6.7-rc1)
Merging xarray/main (2a15de80dd0f idr: fix param name in idr_alloc_cyclic()=
 doc)
Merging hyperv/hyperv-next (ce9ecca0238b Linux 6.6-rc2)
Merging auxdisplay/auxdisplay (35b464e32c8b auxdisplay: hd44780: move curso=
r home after clear display command)
Merging kgdb/kgdb/for-next (23816724fdbd kdb: Corrects comment for kdballoc=
env)
Merging hmm/hmm (0bb80ecc33a8 Linux 6.6-rc1)
Merging cfi/cfi/next (06c2afb862f9 Linux 6.5-rc1)
Merging mhi/mhi-next (83c5dcf78ab9 bus: mhi: host: Add alignment check for =
event ring read pointer)
Merging memblock/for-next (e96c6b8f212a memblock: report failures when memb=
lock_can_resize is not set)
Merging cxl/next (5d09c63f11f0 cxl/hdm: Remove broken error path)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (5329aa5101f7 efivarfs: Add uid/gid mount options)
Merging unicode/for-next (c1869dbd2957 Merge branch 'unicode/negative-dentr=
ies' into unicode/for-next)
Merging slab/slab/for-next (7eec549256f2 Merge branch 'slab/for-6.8/slab-re=
moval' into slab/for-next)
CONFLICT (content): Merge conflict in mm/kasan/quarantine.c
Merging random/master (512dee0c00ad Merge tag 'x86-urgent-2023-01-04' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging landlock/next (323f65ded48d landlock: Document IOCTL support)
Merging rust/rust-next (3857af38e57a docs: rust: add "The Rust experiment" =
section)
Merging sysctl/sysctl-next (8b793bcda61f watchdog: move softlockup_panic ba=
ck to early_param)
Merging execve/for-next/execve (21ca59b365c0 binfmt_misc: enable sandboxed =
mounts)
Merging bitmap/bitmap-for-next (0762cf0860c8 lib/find_bit: Fix the code com=
ments about find_next_bit_wrap)
Merging hte/for-next (b85ea95d0864 Linux 6.7-rc1)
Merging kspp/for-next/kspp (d71f22365a9c gcc-plugins: randstruct: Update co=
de comment in relayout_struct())
Merging kspp-gustavo/for-next/kspp (89741e7e42f6 Makefile: Enable -Wstringo=
p-overflow globally)
Merging nolibc/nolibc (b85ea95d0864 Linux 6.7-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (b2b67c997bf7 iommufd: Organize the mock domain al=
loc functions closer to Joerg's tree)

--Sig_/=z7K=azTAiLq9AZgzek4x=r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVmm5wACgkQAVBC80lX
0GxpcwgAg3U76fPO38RIy+Nr0aZCKlYwGb+NPDpqXWOfxPknjzyN+DE4srXyuV7+
gf+lkIVpuHu0f0V1m03NJZ3GYswrMmgzBXtG3uxE/Ql0C0PqnWEwfT0bCpPTkcN/
4tWU+fC6ZlCDPKJcaawSBTgKgPPXTCREmX27sU+zOz8vzB2GnOfiRTWjgbaHEWwE
zQODeMmp2X9aWpaBBXLWvnx4ItScsUZFg9ue5o4JOUqfYhfWDDTM7TmgxpoXXDmn
WTTQ0gnB/aFivykIi94/LXtM2cWHIYZJHAdo7i6mOLcR7hs5O90dlYywA3yxYU8B
8cMsK3AwtQftEhHkc5SNTcAQwzeapA==
=S8ox
-----END PGP SIGNATURE-----

--Sig_/=z7K=azTAiLq9AZgzek4x=r--

