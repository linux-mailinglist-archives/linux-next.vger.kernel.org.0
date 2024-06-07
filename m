Return-Path: <linux-next+bounces-2492-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA59D8FFA21
	for <lists+linux-next@lfdr.de>; Fri,  7 Jun 2024 05:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA3F71C222B8
	for <lists+linux-next@lfdr.de>; Fri,  7 Jun 2024 03:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB7D12E7E;
	Fri,  7 Jun 2024 03:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PR5L7I6C"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B005A125B9;
	Fri,  7 Jun 2024 03:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717730221; cv=none; b=LoLm4XIo2oW8onZKE6/ZN4K0W5JBRLNqFxnfmM6EuPIT1P4lbBAk0XRIR0Y8xJmDh12Y5tWX2KRie7wFZAjs4b1HMcEN/y61G2z/92RZoD5YUdrMPhb+RufSs59D36IxPPBYz42/3/fT6X5jBFM9psfJLx9rpANjdUKeRnqmeV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717730221; c=relaxed/simple;
	bh=R2XXGEwU8B524jLKOUoiwiP//g/YZEigjc0IV5MJlQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=vB0xzxTD607vrDwttbXx4eHIzvqd9oWkWdfKrlIzOPOVO4qKgQeTB+/NyDkYqwP40dO97clF8YXh2S0pMM+r2gFy3zSNj/c2tQ2iWttp7aN3k8+KG5hNXPe5pEUvePtkCuAVX7Ya1EqaL3RaA2QxPu2saOGoABxq0iHbMnfUnL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PR5L7I6C; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717730215;
	bh=DCeBiAPtqP0nVPXSUa4LiZk9kCtTCqXPeaGqifNeu5Y=;
	h=Date:From:To:Cc:Subject:From;
	b=PR5L7I6C+i8E3M+R9LvJYk2jP5lQgTIBbVFWoqssl8zuL2MWze1IkHFRXWB2cDiHl
	 YbMO4+VONkj6sqv4z8Arx45p+Oiu3xRs/E66otKdGDBU6V0VMJz7eCQzvz+znDEiOU
	 tYMymVHZKXLVEinwxMvJMxrrjGgZJWQGJpzeW1IJ1eD3v47h37glOi6NM7rZxy2now
	 zxjyBGLb6HYoSKD1ZCmi3K6UGFMW/iDEKrEHfMQl9m+9koFYrsTs2J5N9u1tvzyG/e
	 1gbNL00VK9rL20OvAvdfjzwJExHSxyte8YQRzO+P06vLK7dqeeO7mn7nuBFeIz0q62
	 TitbYc3pVNpHA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VwRFM4GNPz4wc4;
	Fri,  7 Jun 2024 13:16:55 +1000 (AEST)
Date: Fri, 7 Jun 2024 13:16:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 7
Message-ID: <20240607131653.3ae8e5a7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CNvb05QElBlpDgx+lZrcMcD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CNvb05QElBlpDgx+lZrcMcD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

News: I will not be doing any linnux-next releases between June 14 and
June 30, inclusive.

Changes since 20240606:

The stm32 tree lost its build failure.

The btrfs tree gained a conflict against the btrfs-fixes tree.

The input tree gained a conflict against the mm tree.

Non-merge commits (relative to Linus' tree): 3800
 4115 files changed, 426551 insertions(+), 68947 deletions(-)

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

I am currently merging 375 trees (counting Linus' and 105 trees of bug
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
Merging origin/master (8a92980606e3 Merge tag 'scsi-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/jejb/scsi)
Merging fixes/fixes (2dde18cd1d8f Linux 6.5)
Merging mm-hotfixes/mm-hotfixes-unstable (9e29995e6eed lib/alloc_tag: fix R=
CU imbalance in pgalloc_tag_get())
Merging vfs-brauner-fixes/vfs.fixes (0fbe97059215 iomap: Fix iomap_adjust_r=
ead_range for plen calculation)
Merging fscrypt-current/for-current (4cece7649650 Linux 6.9-rc1)
Merging fsverity-current/for-current (4cece7649650 Linux 6.9-rc1)
Merging btrfs-fixes/next-fixes (9696c6c6c5b0 Merge branch 'misc-6.10' into =
next-fixes)
Merging vfs-fixes/fixes (bba1f6758a9e lirc: rc_dev_get_from_fd(): fix file =
leak)
Merging erofs-fixes/fixes (7af2ae1b1531 erofs: reliably distinguish block b=
ased and fscache mode)
Merging nfsd-fixes/nfsd-fixes (4a77c3dead97 SUNRPC: Fix loop termination co=
ndition in gss_free_in_token_pages())
Merging v9fs-fixes/fixes/next (1613e604df0c Linux 6.10-rc1)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging fs-current (2a425a3f1098 Merge branch 'nfsd-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/cel/linux)
Merging kbuild-current/fixes (d856f0250666 kbuild: explicitly run mksysmap =
as sed script from link-vmlinux.sh)
Merging arc-current/for-curr (e67572cd2204 Linux 6.9-rc6)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (5c40e428aea6 arm64/io: add constant-arg=
ument check)
Merging arm-soc-fixes/arm/fixes (5549d1e39989 Merge tag 'qcom-arm64-fixes-f=
or-6.9-2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux int=
o arm/fixes)
Merging davinci-current/davinci/for-current (6613476e225e Linux 6.8-rc1)
Merging drivers-memory-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging sophgo-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging m68k-current/for-linus (ec8c8266373f m68k: defconfig: Update defcon=
figs for v6.9-rc1)
Merging powerpc-fixes/fixes (2b85b7fb1376 powerpc/crypto: Add generated P8 =
asm to .gitignore)
Merging s390-fixes/fixes (01c51a32dc18 KVM: s390x: selftests: Add shared ze=
ropage test)
Merging net/main (d30d0e49da71 Merge tag 'net-6.10-rc3' of git://git.kernel=
.org/pub/scm/linux/kernel/git/netdev/net)
Merging bpf/master (d30d0e49da71 Merge tag 'net-6.10-rc3' of git://git.kern=
el.org/pub/scm/linux/kernel/git/netdev/net)
Merging ipsec/master (96f887a612e4 net: esp: cleanup esp_output_tail_tcp() =
in case of unsupported ESPINTCP)
Merging netfilter/main (f8f0de9d58d9 Merge branch 'mlx5-fixes')
Merging ipvs/main (f8f0de9d58d9 Merge branch 'mlx5-fixes')
Merging wireless/for-next (819bda58e77b wifi: rtlwifi: Ignore IEEE80211_CON=
F_CHANGE_RETRY_LIMITS)
Merging wpan/master (b8ec0dc3845f net: mac802154: Fix racy device stats upd=
ates by DEV_STATS_INC() and DEV_STATS_ADD())
Merging rdma-fixes/for-rc (fa0aa4d75f6b RDMA/mlx5: Add check for srq max_sg=
e attribute)
Merging sound-current/for-linus (55fac50ea46f ALSA: seq: ump: Fix missing S=
ystem Reset message handling)
Merging sound-asoc-fixes/for-linus (2ed22161b19b ASoC: atmel: atmel-classd:=
 Re-add dai_link->platform to fix card init)
Merging regmap-fixes/for-linus (76f19626bd35 regmap: add missing MODULE_DES=
CRIPTION() macros)
Merging regulator-fixes/for-linus (8141b6da1763 regulator: tps6594-regulato=
r: Fix the number of irqs for TPS65224 and TPS6594)
Merging spi-fixes/for-linus (4eecb644b8b8 spi: cs42l43: Correct SPI root cl=
ock speed)
Merging pci-current/for-linus (c9d52fb313d3 PCI: Revert the cfg_access_lock=
 lockdep mechanism)
Merging driver-core.current/driver-core-linus (c0a40097f0bc drivers: core: =
synchronize really_probe() and dev_uevent())
Merging tty.current/tty-linus (ae01e52da244 serial: drop debugging WARN_ON_=
ONCE() from uart_write())
Merging usb.current/usb-linus (16637fea001a usb-storage: alauda: Check whet=
her the media is initialized)
Merging usb-serial-fixes/usb-linus (dd5a440a31fa Linux 6.9-rc7)
Merging phy/fixes (163c1a356a84 phy: qcom: qmp-combo: Switch from V6 to V6 =
N4 register offsets)
Merging staging.current/staging-linus (c3552ab19aeb staging: vchiq_debugfs:=
 Fix NPD in vchiq_dump_state)
Merging iio-fixes/fixes-togreg (78f0dfa64cbd iio: inkern: fix channel read =
regression)
Merging counter-current/counter-current (1613e604df0c Linux 6.10-rc1)
Merging char-misc.current/char-misc-linus (7c55b78818cf jfs: xattr: fix buf=
fer overflow for invalid xattr)
Merging soundwire-fixes/fixes (e2d8ea0a066a soundwire: fix usages of device=
_get_named_child_node())
Merging thunderbolt-fixes/fixes (985cfe501b74 thunderbolt: debugfs: Fix mar=
gin debugfs node creation condition)
Merging input-current/for-linus (955af6355ddf Input: i8042 - add Ayaneo Kun=
 to i8042 quirk table)
Merging crypto-current/master (67ec8cdf2997 hwrng: core - Remove add_early_=
randomness)
Merging vfio-fixes/for-linus (aac6db75a9fc vfio/pci: Use unmap_mapping_rang=
e())
Merging kselftest-fixes/fixes (4bf15b1c657d selftests/futex: don't pass a c=
onst char* to asprintf(3))
Merging dmaengine-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging backlight-fixes/for-backlight-fixes (6613476e225e Linux 6.8-rc1)
Merging mtd-fixes/mtd/fixes (b27d8946b5ed mtd: rawnand: rockchip: ensure NV=
DDR timings are rejected)
Merging mfd-fixes/for-mfd-fixes (6613476e225e Linux 6.8-rc1)
Merging v4l-dvb-fixes/fixes (ffb9072bce20 media: intel/ipu6: add csi2 port =
sanity check in notifier bound)
Merging reset-fixes/reset/fixes (4a6756f56bcf reset: Fix crash when freeing=
 non-existent optional resets)
Merging mips-fixes/mips-fixes (1613e604df0c Linux 6.10-rc1)
Merging at91-fixes/at91-fixes (1fe5e0a31e62 ARM: dts: microchip: at91-sama7=
g54_curiosity: Replace regulator-suspend-voltage with the valid property)
Merging omap-fixes/fixes (9b6a51aab5f5 ARM: dts: Fix occasional boot hang f=
or am3 usb)
Merging kvm-fixes/master (db574f2f96d0 KVM: x86/mmu: Don't save mmu_invalid=
ate_seq after checking private attr)
Merging kvms390-fixes/master (175f2f5bcdfc KVM: s390: Check kvm pointer whe=
n testing KVM_CAP_S390_HPAGE_1M)
Merging hwmon-fixes/hwmon (52a2c70c3ec5 hwmon: (shtc1) Fix property misspel=
ling)
Merging nvdimm-fixes/libnvdimm-fixes (33908660e814 ACPI: NFIT: Fix incorrec=
t calculation of idt size)
Merging cxl-fixes/fixes (49ba7b515c4c cxl/region: Fix memregion leaks in de=
vm_cxl_add_region())
Merging dma-mapping-fixes/for-linus (75961ffb5cb3 swiotlb: initialise restr=
icted pool list_head when SWIOTLB_DYNAMIC=3Dy)
Merging drivers-x86-fixes/fixes (77f1972bdcf7 platform/x86/amd/hsmp: Check =
HSMP support on AMD family of processors)
Merging samsung-krzk-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging pinctrl-samsung-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging devicetree-fixes/dt/linus (e7985f43609c of: property: Fix fw_devlin=
k handling of interrupt-map)
Merging dt-krzk-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging scsi-fixes/fixes (4254dfeda82f scsi: mpt3sas: Avoid test/set_bit() =
operating in non-allocated memory)
Merging drm-fixes/drm-fixes (1cfa043fc012 Merge tag 'drm-xe-fixes-2024-06-0=
4' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (c3f38fa61af7 Linux 6.10-rc2)
Merging mmc-fixes/fixes (35e85fd211fc mmc: sdhci-brcmstb: check R1_STATUS f=
or erase/trim/discard)
Merging rtc-fixes/rtc-fixes (4cece7649650 Linux 6.9-rc1)
Merging gnss-fixes/gnss-linus (0bbac3facb5d Linux 6.9-rc4)
Merging hyperv-fixes/hyperv-fixes (831bcbcead66 Drivers: hv: Cosmetic chang=
es for hv.c and balloon.c)
Merging soc-fsl-fixes/fix (06c2afb862f9 Linux 6.5-rc1)
Merging risc-v-fixes/fixes (e2c79b4c5c4d Revert "riscv: mm: accelerate page=
fault when badaccess")
Merging riscv-dt-fixes/riscv-dt-fixes (2c917b55d665 riscv: dts: canaan: Dis=
able I/O devices unless used)
Merging riscv-soc-fixes/riscv-soc-fixes (1613e604df0c Linux 6.10-rc1)
Merging fpga-fixes/fixes (54435d1f21b3 fpga: dfl-pci: add PCI subdevice ID =
for Intel D5005 card)
Merging spdx/spdx-linus (c3f38fa61af7 Linux 6.10-rc2)
Merging gpio-brgl-fixes/gpio/for-current (90dd7de4ef7b gpio: tqmx86: fix br=
oken IRQ_TYPE_EDGE_BOTH interrupt type)
Merging gpio-intel-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging pinctrl-intel-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging auxdisplay-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging kunit-fixes/kunit-fixes (1613e604df0c Linux 6.10-rc1)
Merging memblock-fixes/fixes (3ac36aa73073 x86/mm/numa: Use NUMA_NO_NODE wh=
en calling memblock_set_node())
Merging renesas-fixes/fixes (8c987693dc2d ARM: dts: renesas: rcar-gen2: Add=
 missing #interrupt-cells to DA9063 nodes)
Merging perf-current/perf-tools (ca9680821dfe perf bpf: Fix handling of min=
imal vmlinux.h file when interrupting the build)
Merging efi-fixes/urgent (99280413a5b7 efi: Add missing __nocfi annotations=
 to runtime wrappers)
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (d3911f1639e6 power: supply: rt5033: Bring back=
 i2c_set_clientdata)
Merging uml-fixes/fixes (73a23d771033 um: harddog: fix modular build)
Merging iommufd-fixes/for-rc (dd5a440a31fa Linux 6.9-rc7)
Merging rust-fixes/rust-fixes (1613e604df0c Linux 6.10-rc1)
Merging w1-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging pmdomain-fixes/fixes (c3f38fa61af7 Linux 6.10-rc2)
Merging i2c-host-fixes/i2c/i2c-host-fixes (9224b8546453 i2c: designware: Fi=
x the functionality flags of the slave-only interface)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (2607133196c3 clk: sifive: Do not register clkd=
evs for PRCI clocks)
Merging drm-misc-fixes/for-linux-next-fixes (5703fc058efd drm/vmwgfx: Don't=
 memcmp equivalent pointers)
Merging mm-stable/mm-stable (1613e604df0c Linux 6.10-rc1)
Merging mm-nonmm-stable/mm-nonmm-stable (1613e604df0c Linux 6.10-rc1)
Merging mm/mm-everything (992ebfa7280d foo)
Merging kbuild/for-next (1b1c9f0fd3fb dt-bindings: kbuild: Fix dt_binding_c=
heck on unconfigured build)
Merging clang-format/clang-format (5a205c6a9f79 clang-format: Update with v=
6.7-rc4's `for_each` macro list)
Merging perf/perf-tools-next (9aa61d8ecb7f perf: parse-events: Fix compilat=
ion error while defining DEBUG_PARSER)
Merging compiler-attributes/compiler-attributes (2993eb7a8d34 Compiler Attr=
ibutes: counted_by: fixup clang URL)
Merging dma-mapping/for-next (82d71b53d7e7 Documentation/core-api: correct =
reference to SWIOTLB_DYNAMIC)
Merging asm-generic/master (02af68767d27 Merge branch 'alpha-cleanup-6.9' i=
nto asm-generic)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (2043e518d37d Merge branch 'clkdev' into for-next)
Merging arm64/for-next/core (e92bee9f861b arm64/fpsimd: Avoid erroneous eli=
de of user state reload)
Merging arm-perf/for-next/perf (410e471f8746 arm64: Add USER_STACKTRACE sup=
port)
Merging arm-soc/for-next (1e3dd71e2587 Merge branch 'soc/defconfig' into fo=
r-next)
Merging amlogic/for-next (87501b7ca000 Merge branch 'v6.11/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (c44211af1aa9 ARM: dts: aspeed: Add ASRock E3C256D4=
I BMC)
Merging at91/at91-next (3a94fa4cb86e arm64: dts: microchip: sparx5_pcb135: =
move non-MMIO nodes out of axi)
Merging broadcom/next (06902980d07a Merge branch 'devicetree/next' into nex=
t)
Merging davinci/davinci/for-next (6613476e225e Linux 6.8-rc1)
Merging drivers-memory/for-next (1613e604df0c Linux 6.10-rc1)
Merging imx-mxs/for-next (59689727034b Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (85ccbe8afbb4 arm64: dts: mediatek: mt7981: add I=
2C controller)
Merging mvebu/for-next (da8e8356f594 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (5856330c3d56 Merge branch 'drivers-ti-sysc-for-v6.10=
' into for-next)
Merging qcom/for-next (b96259e4c6ba Merge branches 'arm32-for-6.11', 'arm64=
-defconfig-for-6.11', 'arm64-fixes-for-6.10', 'arm64-for-6.11', 'clk-fixes-=
for-6.10', 'clk-for-6.11' and 'drivers-for-6.11' into for-next)
Merging renesas/next (f86b864474e4 Merge branches 'renesas-arm-defconfig-fo=
r-v6.11' and 'renesas-dts-for-v6.11' into renesas-next)
Merging reset/reset/next (6d89df61650d reset: ti-sci: Convert to platform r=
emove callback returning void)
Merging rockchip/for-next (55d3141714e4 Merge branch 'v6.11-clk/next' into =
for-next)
Merging samsung-krzk/for-next (b363a45913d2 clk: samsung: exynos-clkout: Re=
move misleading of_match_table/MODULE_DEVICE_TABLE)
Merging scmi/for-linux-next (02ba7b5a731a Merge branch 'for-next/vexpress/u=
pdates' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux=
 into for-linux-next)
Merging sophgo/for-next (1613e604df0c Linux 6.10-rc1)
Merging stm32/stm32-next (4732b1ffb466 ARM: dts: stm32: Fix STM32MP13xx DHC=
OR DHSBC Makefile entry)
Merging sunxi/sunxi/for-next (bab57a244b51 Merge branch 'sunxi/clk-for-6.11=
' into sunxi/for-next)
Merging tee/next (cd88a296582c Merge branch 'optee_notif_wait_timeout_for_v=
6.11' into next)
Merging tegra/for-next (2fd759c1796c Merge branch for-6.10/arm64/defconfig =
into for-next)
Merging ti/ti-next (1613e604df0c Linux 6.10-rc1)
Merging xilinx/for-next (a1ebcd60bf4e Merge remote-tracking branch 'git/zyn=
qmp/dt' into for-next)
Merging clk/clk-next (11b6b52cdef4 Merge branch 'clk-cleanup' into clk-next)
Merging clk-imx/for-next (f5072cffb35c clk: imx: imx8mp: Convert to platfor=
m remove callback returning void)
Merging clk-renesas/renesas-clk (b86c2b1ce7a3 clk: renesas: rcar-gen2: Use =
DEFINE_SPINLOCK() for static spinlock)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (eb36e520f4f1 LoongArch: Fix GMAC's phy-mo=
de definitions in dts)
Merging m68k/for-next (1d8491d3e726 m68k: amiga: Turn off Warp1260 interrup=
ts during boot)
Merging m68knommu/for-next (c3f38fa61af7 Linux 6.10-rc2)
Merging microblaze/next (32cf1deb9c04 MICROBLAZE kc705 2017.4 full with cpu=
-reg fix NEW with reserved memory)
Merging mips/mips-next (1613e604df0c Linux 6.10-rc1)
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (bbf5c979011a Linux 5.9)
Merging powerpc/next (11e6e6d8bf8f powerpc/mm/drmem: Silence drmem_init() e=
arly return)
Merging soc-fsl/next (fb9c384625dd bus: fsl-mc: fsl-mc-allocator: Drop a wr=
ite-only variable)
Merging risc-v/for-next (6d8e604c9502 Merge patch series "Support Zve32[xf]=
 and Zve64[xfd] Vector subextensions")
Merging riscv-dt/riscv-dt-for-next (1dc5f8f6ea73 riscv: dts: starfive: Upda=
te flash partition layout)
Merging riscv-soc/riscv-soc-for-next (1613e604df0c Linux 6.10-rc1)
Merging s390/for-next (f8ea75c82e7e Merge branch 'features' into for-next)
Merging sh/for-next (1613e604df0c Linux 6.10-rc1)
Merging sparc/for-next (1c9e709cde80 sparc/leon: Remove on-stack cpumask va=
r)
Merging uml/next (919e3ece7f5a um: virtio_uml: Convert to platform remove c=
allback returning void)
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging bcachefs/for-next (4c28fbebd24c bcachefs: Coalesce accounting keys =
before journal replay)
Merging pidfd/for-next (a901a3568fd2 Merge tag 'iomap-6.5-merge-1' of git:/=
/git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging fscrypt/for-next (7f016edaa0f3 fscrypt: try to avoid refing parent =
dentry in fscrypt_file_open)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (1ee85281a864 Merge branch 'for-next-next-v6.10-2024=
0605' into for-next-20240605)
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.c
[fs-next 9e21c4441ebe] Merge branch 'for-next' of git://git.kernel.org/pub/=
scm/linux/kernel/git/kdave/linux.git
Merging ceph/master (93a2221c9c1a doc: ceph: update userspace command to ge=
t CephFS metadata)
Merging cifs/for-next (aab74f0ab27e netfs, cifs: Move CIFS_INO_MODIFIED_ATT=
R to netfs_inode)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging erofs/dev (c3f38fa61af7 Linux 6.10-rc2)
Merging exfat/dev (0daa52fbc7ac exfat: fix potential deadlock on __exfat_ge=
t_dentry_set)
Merging exportfs/exportfs-next (e8f897f4afef Linux 6.8)
Merging ext3/for_next (a66c186557cb Pull fsnotify softlockup fix.)
Merging ext4/dev (c6a6c9694aad ext4: fix error pointer dereference in ext4_=
mb_load_buddy_gfp())
Merging f2fs/dev (72ece20127a3 Merge tag 'f2fs-for-6.10.rc1' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs)
Merging fsverity/for-next (ee5814dddefb fsverity: use register_sysctl_init(=
) to avoid kmemleak warning)
Merging fuse/for-next (529395d2ae64 virtio-fs: add multi-queue support)
Merging gfs2/for-next (713f8834389f gfs2: Get rid of demote_ok checks)
Merging jfs/jfs-next (ee6817e72d4e jfs: Remove use of folio error flag)
Merging ksmbd/ksmbd-for-next (c3f38fa61af7 Linux 6.10-rc2)
Merging nfs/linux-next (99bc9f2eb3f7 NFS: add barriers when testing for NFS=
_FSDATA_BLOCKED)
Merging nfs-anna/linux-next (57331a59ac0d NFSv4.1: Use the nfs_client's rpc=
 timeouts for backchannel)
Merging nfsd/nfsd-next (f35f79ee1a67 lockd: Use *-y instead of *-objs in Ma=
kefile)
Merging ntfs3/master (1613e604df0c Linux 6.10-rc1)
Merging orangefs/for-next (53e4efa470d5 orangefs: fix out-of-bounds fsid ac=
cess)
Merging overlayfs/overlayfs-next (db03d39053a9 ovl: fix copy-up in tmpfile)
Merging ubifs/next (af9a8730ddb6 jffs2: Fix potential illegal address acces=
s in jffs2_free_inode)
Merging v9fs/9p-next (c898afdc1564 9p: add missing locking around taking de=
ntry fid list)
Merging v9fs-ericvh/ericvh/for-next (1613e604df0c Linux 6.10-rc1)
Merging xfs/for-next (b0c6bcd58d44 xfs: Add cond_resched to block unmap ran=
ge and reflink remap path)
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
Merging vfs-brauner/vfs.all (23e0b3b1c6d8 Merge branch 'vfs.iomap' into vfs=
.all)
CONFLICT (content): Merge conflict in fs/nfs/symlink.c
[fs-next 3be6a81b346a] Merge branch 'vfs.all' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/vfs/vfs.git
Merging vfs/for-next (a38297e3fb01 Linux 6.9)
Merging fs-next (3be6a81b346a Merge branch 'vfs.all' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/vfs/vfs.git)
Merging printk/for-next (9830c7048b03 Merge branch 'rework/write-atomic' in=
to for-next)
Merging pci/next (3f7563262863 Merge branch 'pci/controller/tegra194')
CONFLICT (content): Merge conflict in drivers/pci/pci.c
Merging pstore/for-next/pstore (9dd12ed95c2d pstore/blk: replace deprecated=
 strncpy with strscpy)
Merging hid/for-next (0955b9f5553b Merge branch 'for-6.11/module-descriptio=
n' into for-next)
Merging i2c/i2c/for-next (ec23dafe4ed1 Merge tag 'i2c-host-6.10-pt2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-me=
rgewindow)
Merging i2c-host/i2c/i2c-host (c3f38fa61af7 Linux 6.10-rc2)
Merging i3c/i3c/next (1d08326020fb i3c: dw: Add hot-join support.)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (431761d744cc hwmon: (w83795): Remove use =
of i2c_match_id())
Merging jc_docs/docs-next (cd706ca28a0a Merge branch 'docs-mw' into docs-ne=
xt)
Merging v4l-dvb/master (8771b7f31b7f media: bcm2835-unicam: Depend on COMMO=
N_CLK)
Merging v4l-dvb-next/master (8771b7f31b7f media: bcm2835-unicam: Depend on =
COMMON_CLK)
Merging pm/linux-next (81a727d37e25 Merge branch 'pm-cpufreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (101388b8ef10 cpufreq: ti-cpufre=
q: Handle deferred probe with dev_err_probe())
Merging cpupower/cpupower (43cad521c6d2 tools/power/cpupower: Fix Pstate fr=
equency reporting on AMD Family 1Ah CPUs)
Merging devfreq/devfreq-next (ccad360a2d41 PM / devfreq: exynos: Use DEFINE=
_SIMPLE_DEV_PM_OPS for PM functions)
Merging pmdomain/next (e5cddc34067a pmdomain: arm: scmi_pm_domain: set flag=
 GENPD_FLAG_ACTIVE_WAKEUP)
Merging opp/opp/linux-next (d86a2f080068 OPP: Fix missing cleanup on error =
in _opp_attach_genpd())
Merging thermal/thermal/linux-next (69b08420b697 thermal: renesas: rcar: Ad=
d dependency on OF)
Merging dlm/next (fa0b54f17afe dlm: move recover idr to xarray datastructur=
e)
Merging rdma/for-next (c8683b995d8a RDMA/mana_ib: extend query device)
Merging net-next/main (62b5bf58b928 Merge git://git.kernel.org/pub/scm/linu=
x/kernel/git/netdev/net)
Merging bpf-next/for-next (f85af9d955ac selftests/bpf: Drop useless argumen=
ts of do_test in bpf_tcp_ca)
Merging ipsec-next/master (5233a55a5254 mISDN: remove unused struct 'bf_ctx=
')
Merging mlx5-next/mlx5-next (1613e604df0c Linux 6.10-rc1)
Merging netfilter-next/main (5c1672705a1a net: revert partially applied PHY=
 topology series)
Merging ipvs-next/main (5c1672705a1a net: revert partially applied PHY topo=
logy series)
Merging bluetooth/master (0b22b7f8aef3 Bluetooth: hci_bcm4377: Add BCM4388 =
support)
Merging wireless-next/for-next (a46300b1b09b Merge tag 'ath-next-20240605' =
of git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath)
CONFLICT (content): Merge conflict in drivers/net/wireless/microchip/wilc10=
00/netdev.c
CONFLICT (content): Merge conflict in net/mac80211/cfg.c
Merging wpan-next/master (9187210eee7d Merge tag 'net-next-6.9' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging wpan-staging/staging (9187210eee7d Merge tag 'net-next-6.9' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mtd/mtd/next (cf4ccd1c029e mtd: physmap: Use *-y instead of *-objs =
in Makefile)
Merging nand/nand/next (b9bf7737de32 mtd: rawnand: gpmi: add iMX8QXP suppor=
t.)
Merging spi-nor/spi-nor/next (2d95d1324844 mtd: spi-nor: get rid of SPI_NOR=
_NO_FR)
Merging crypto/master (aabbf2135f9a crypto: atmel-sha204a - fix negated ret=
urn value)
Merging drm/drm-next (c3f38fa61af7 Linux 6.10-rc2)
Merging drm-exynos/for-linux-next (7097bc7ba60f drm/exynos: hdmi: report sa=
fe 640x480 mode as a fallback when no EDID found)
Merging drm-misc/for-linux-next (539d33b57838 drm/komeda: remove unused str=
uct 'gamma_curve_segment')
Merging amdgpu/drm-next (b95fa494d6b7 drm/amdgpu: add RAS is_rma flag)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ras=
.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu13/sm=
u_v13_0_4_ppt.c
Merging drm-intel/for-linux-next (92959898fdd6 drm/i915: Reduce DDI clock g=
ating printk level from NOTICE to DEBUG)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_vb=
t_defs.h
Merging drm-tegra/for-next (2429b3c529da drm/tegra: Avoid potential 32-bit =
integer overflow)
Merging drm-msm/msm-next (b587f413ca47 drm/msm/gen_header: allow skipping t=
he validation)
Merging drm-msm-lumag/msm-next-lumag (104e548a7c97 drm/msm/mdp4: use drmm-m=
anaged allocation for mdp4_plane)
Merging drm-xe/drm-xe-next (6800e63cf97b drm/xe: move disable_c6 call)
  c063cce7df3a ("drm/xe/pf: Update the LMTT when freeing VF GT config")
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_devcoredump.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_device.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_pci.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_vm.c
Merging etnaviv/etnaviv/next (e843e87abb90 drm/etnaviv: Disable SH_EU clock=
 gating on VIPNano-Si+)
Merging fbdev/for-next (a38297e3fb01 Linux 6.9)
Merging regmap/for-next (4a69c17ee09a Merge remote-tracking branch 'regmap/=
for-6.11' into regmap-next)
Merging sound/for-next (55fac50ea46f ALSA: seq: ump: Fix missing System Res=
et message handling)
Merging ieee1394/for-next (5189ce108f8a firewire: core: add tracepoints eve=
nt for self_id_sequence)
Merging sound-asoc/for-next (983623b8e349 Merge remote-tracking branch 'aso=
c/for-6.11' into asoc-next)
Merging modules/modules-next (2c9e5d4a0082 bpf: remove CONFIG_BPF_JIT depen=
dency on CONFIG_MODULES of)
Merging input/next (18547925519a Merge branch 'ib/6.9-disable-irq-guard' in=
to next)
CONFLICT (content): Merge conflict in include/linux/interrupt.h
Merging block/for-next (b5cca5417e5f Merge branch 'for-6.11/io_uring' into =
for-next)
Merging device-mapper/for-next (825d8bbd2f32 dm: always manage discard supp=
ort in terms of max_hw_discard_sectors)
Merging libata/for-next (a4e5862b1bf8 Merge remote-tracking branch 'libata/=
for-6.11' into HEAD)
Merging pcmcia/pcmcia-next (ccae53aa8aa2 pcmcia: cs: make pcmcia_socket_cla=
ss constant)
Merging mmc/next (9f56e5de3f51 mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (ebcd1453f15e mfd: intel-lpss: Rename SPI intel_lp=
ss_platform_info structs)
Merging backlight/for-backlight-next (b72755f5b577 backlight: Add new lm350=
9 backlight driver)
Merging battery/for-next (ad175de1f8da power: supply: hwmon: Add support fo=
r power sensors)
Merging regulator/for-next (4134ae4e8bae Merge remote-tracking branch 'regu=
lator/for-6.11' into regulator-next)
Merging security/next (61df7b828204 lsm: fixup the inode xattr capability h=
andling)
Merging apparmor/apparmor-next (3dd384108d53 apparmor: fix possible NULL po=
inter dereference)
Merging integrity/next-integrity (fbf06cee6087 ima: fix wrong zero-assignme=
nt during securityfs dentry remove)
Merging selinux/next (1613e604df0c Linux 6.10-rc1)
Merging smack/next (2fe209d0ad2e smack: tcp: ipv4, fix incorrect labeling)
Merging tomoyo/master (c6144a21169f tomoyo: update project links)
Merging tpmdd/next (2df0193e62cf Merge tag 'thermal-6.10-rc3' of git://git.=
kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging watchdog/master (c3f38fa61af7 Linux 6.10-rc2)
Merging iommu/next (526606b0a199 iommu/amd: Fix Invalid wait context issue)
Merging audit/next (1613e604df0c Linux 6.10-rc1)
Merging devicetree/for-next (fec32ea96dd9 of: reserved_mem: Rename fdt_* fu=
nctions to refelct the change from using fdt APIs)
Merging dt-krzk/for-next (1613e604df0c Linux 6.10-rc1)
Merging mailbox/for-next (10b98582bc76 dt-bindings: mailbox: qcom-ipcc: Doc=
ument the SDX75 IPCC)
Merging spi/for-next (ba59f299e800 Merge remote-tracking branch 'spi/for-6.=
11' into spi-next)
Merging tip/master (bf432610fb7b Merge branch into tip/master: 'x86/percpu')
Merging clockevents/timers/drivers/next (2030a7e11f16 clocksource/drivers/a=
rm_arch_timer: Mark hisi_161010101_oem_info const)
Merging edac/edac-for-next (a1ae762610c4 Merge ras/edac-misc into for-next)
Merging ftrace/for-next (5673d97c6fc2 Merge probes/for-next)
Merging rcu/next (4ac721883991 Merge branches 'doc.2024.06.03a', 'fixes.202=
4.06.03a', 'mb.2024.06.03a', 'nocb.2024.06.03a', 'rcu-tasks.2024.06.03a' an=
d 'rcutorture.2024.06.03a' into HEAD)
Merging paulmck/non-rcu/next (ded6b7eb9d46 Merge branches 'cmpxchg.2024.06.=
03a', 'kcsan.2024.05.30b', 'lkmm.2024.05.30b', 'torture.2024.05.30b' and 't=
sc.2024.05.27a' into HEAD)
Merging kvm/next (f99b052256f1 KVM: SNP: Fix LBR Virtualization for SNP gue=
st)
Merging kvm-arm/next (eaa46a28d596 Merge branch kvm-arm64/mpidr-reset into =
kvmarm-master/next)
Merging kvms390/next (39cd87c4eb2b Linux 6.9-rc2)
Merging kvm-ppc/topic/ppc-kvm (c3f38fa61af7 Linux 6.10-rc2)
Merging kvm-riscv/riscv_kvm_next (c66f3b40b17d RISC-V: KVM: Fix incorrect r=
eg_subtype labels in kvm_riscv_vcpu_set_reg_isa_ext function)
Merging kvm-x86/next (af0903ab52ee Merge branches 'fixes', 'generic', 'misc=
', 'mmu', 'mtrrs', 'pmu', 'selftests' and 'svm')
Merging xen-tip/linux-next (a3607581cd49 drivers/xen: Improve the late XenS=
tore init protocol)
Merging percpu/for-next (2d9ad81ef935 Merge branch 'for-6.8-fixes' into for=
-next)
Merging workqueues/for-next (2a1b02bcba78 workqueue: Refactor worker ID for=
matting and make wq_worker_comm() use full ID string)
Merging drivers-x86/for-next (0da7a954480c doc: TPMI: Add entry for Perform=
ance Limit Reasons)
Merging chrome-platform/for-next (04ca0a51f1e6 platform/chrome: cros_ec_lpc=
: Add quirks for Framework Laptop)
Merging chrome-platform-firmware/for-firmware-next (1613e604df0c Linux 6.10=
-rc1)
Merging hsi/for-next (f02cfe695047 HSI: ssi_protocol: Remove unused linux/g=
pio.h)
Merging leds-lj/for-leds-next (005408af25d5 leds: trigger: Add new LED Inpu=
t events trigger)
Merging ipmi/for-next (999dff3c1393 ipmi: kcs_bmc_npcm7xx: Convert to platf=
orm remove callback returning void)
Merging driver-core/driver-core-next (1968845d358e driver core: device.h: G=
roup of_node handling declarations and definitions)
Merging usb/usb-next (5821bf2dffbe usb: typec: ucsi: Enable UCSI v2.0 notif=
ications)
Merging thunderbolt/next (3c34a29159df thunderbolt: Mention Thunderbolt/USB=
4 debugging tools in Kconfig)
Merging usb-serial/usb-next (39cd87c4eb2b Linux 6.9-rc2)
Merging tty/tty-next (ffd8e8bd26e9 serial: 8250: Extract platform driver)
Merging char-misc/char-misc-next (a774c5d1f9c4 mcb: mcb-pci: detect IO mapp=
ed devices before requesting resources)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (9b47d9982d1d hwtracing: hisi_ptt: Assign parent for=
 event_source device)
Merging fastrpc/for-next (a16833330e2f misc: fastrpc: Use memdup_user())
Merging fpga/for-next (b7c0e1ecee40 fpga: region: add owner module and take=
 its refcount)
Merging icc/icc-next (230d05b1179f interconnect: qcom: qcm2290: Fix mas_sno=
c_bimc QoS port assignment)
Merging iio/togreg (823c485ffd06 iio: adc: ti-adc161s626: make use of iio_d=
evice_claim_direct_scoped())
Merging phy-next/next (2f2f5c13cc5e phy: qcom-qmp-pcie: Add support for IPQ=
9574 g3x1 and g3x2 PCIEs)
Merging soundwire/next (9b5fd115e7d5 soundwire: intel_ace2.x: add AC timing=
 extensions for PantherLake)
Merging extcon/extcon-next (3e8e45b65d9f extcon: adc-jack: Document missing=
 struct members)
Merging gnss/gnss-next (0bbac3facb5d Linux 6.9-rc4)
Merging vfio/next (cbb325e77fbe vfio/pci: Restore zero affected bus reset d=
evices warning)
Merging w1/for-next (26bf5fc86033 w1: Drop allocation error message)
Merging spmi/spmi-next (1613e604df0c Linux 6.10-rc1)
Merging staging/staging-next (240a3a167468 staging: vc04_services: Fix kern=
el-doc param for vchiq_register_chrdev)
Merging counter-next/counter-next (b84dba784fcb counter: ftm-quaddec: add m=
issing MODULE_DESCRIPTION() macro)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (44c026a73be8 Linux 6.4-rc3)
Merging dmaengine/next (1613e604df0c Linux 6.10-rc1)
Merging cgroup/for-next (1805c1729f52 cgroup/cpuset: Optimize isolated part=
ition only generate_sched_domains() calls)
Merging scsi/for-next (b8d4b90ad8f4 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (f51b2db9b979 Merge patch series "Declare local f=
unctions static")
Merging vhost/linux-next (c8fae27d141a virtio-pci: Check if is_avq is NULL)
Merging rpmsg/for-next (d7faf9a16886 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (54a687cd49e3 gpiolib: Show more info for i=
nterrupt only lines in debugfs)
Merging gpio-intel/for-next (1613e604df0c Linux 6.10-rc1)
Merging pinctrl/for-next (32335efff386 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (1613e604df0c Linux 6.10-rc1)
Merging pinctrl-renesas/renesas-pinctrl (c45c3f5f9593 pinctrl: renesas: Use=
 scope based of_node_put() cleanups)
Merging pinctrl-samsung/for-next (1613e604df0c Linux 6.10-rc1)
Merging pwm/pwm/for-next (7cf775737d4e pwm: Add driver for AXI PWM generato=
r)
Merging ktest/for-next (07283c1873a4 ktest: force $buildonly =3D 1 for 'mak=
e_warnings_file' test type)
Merging kselftest/next (1613e604df0c Linux 6.10-rc1)
Merging kunit/test (1613e604df0c Linux 6.10-rc1)
Merging kunit-next/kunit (8031042cc531 list: test: remove unused struct 'kl=
ist_test_struct')
Merging livepatching/for-next (73a98bc5a947 Merge branch 'for-6.10' into fo=
r-next)
Merging rtc/rtc-next (4c9a91b94c12 pcf8563: add wakeup-source support)
Merging nvdimm/libnvdimm-for-next (41147b006be2 dax: remove redundant assig=
nment to variable rc)
Merging at24/at24/for-next (1613e604df0c Linux 6.10-rc1)
Merging ntb/ntb-next (9341b37ec17a ntb_perf: Fix printk format)
Merging seccomp/for-next/seccomp (e406737b1110 seccomp: Constify sysctl sub=
helpers)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (1613e604df0c Linux 6.10-rc1)
Merging nvmem/for-next (1613e604df0c Linux 6.10-rc1)
Merging xarray/main (2a15de80dd0f idr: fix param name in idr_alloc_cyclic()=
 doc)
Merging hyperv/hyperv-next (f2580a907e5c x86/hyperv: Use Hyper-V entropy to=
 seed guest random number generator)
Merging auxdisplay/for-next (632691ad8319 auxdisplay: Use sizeof(*pointer) =
instead of sizeof(type))
Merging kgdb/kgdb/for-next (b2aba15ad6f9 serial: kgdboc: Fix NMI-safety pro=
blems from keyboard reset code)
Merging hmm/hmm (6613476e225e Linux 6.8-rc1)
Merging cfi/cfi/next (06c2afb862f9 Linux 6.5-rc1)
Merging mhi/mhi-next (48f98496b1de bus: mhi: host: pci_generic: Add generic=
 edl_trigger to allow devices to enter EDL mode)
Merging memblock/for-next (f1180fd2a7c0 mm/mm_init.c: not always search nex=
t deferred_init_pfn from very beginning)
Merging cxl/next (1613e604df0c Linux 6.10-rc1)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (7c23b186ab89 efi: pstore: Return proper errors on UEFI fa=
ilures)
Merging unicode/for-next (0131c1f3cce7 unicode: make utf8 test count static)
Merging slab/slab/for-next (a0a44d9175b3 mm, slab: don't wrap internal func=
tions with alloc_hooks())
CONFLICT (content): Merge conflict in lib/fortify_kunit.c
Merging random/master (1613e604df0c Linux 6.10-rc1)
Merging landlock/next (0055f53aac80 selftests/landlock: Add layout1.refer_m=
ount_root)
Merging rust/rust-next (1613e604df0c Linux 6.10-rc1)
Merging sysctl/sysctl-next (c819e252c287 sysctl: Add module description to =
sysctl-testing)
Merging execve/for-next/execve (4bbf9c3b53e6 fs/coredump: Enable dynamic co=
nfiguration of max file note size)
Merging bitmap/bitmap-for-next (3d053947e400 lib: bitmap: add missing MODUL=
E_DESCRIPTION() macros)
Merging hte/for-next (297f26dbf870 hte: tegra-194: Convert to platform remo=
ve callback returning void)
Merging kspp/for-next/kspp (f7d3b1ffc654 yama: document function parameter)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (1613e604df0c Linux 6.10-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (4cece7649650 Linux 6.9-rc1)
Merging turbostat/next (256d218ec6ae tools/power turbostat: version 2024.05=
.10)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/CNvb05QElBlpDgx+lZrcMcD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZie6UACgkQAVBC80lX
0GzV1Qf/YVnt2/GB9ZarEThAJcKeqwOJ2PVRfIEWS0QXRxTi3Xc/rtH8Iv8CQAYa
Bwrxwzs1oMn9Twy8xuDQQTvbwSpLJGXkR0xdSmq0wKdAa3ZFV1K17mAlhPgX0hcw
maL+CflvLFWYViutvOzu+3UIjGeI+KuIn4Egl7YKvN8mI413UQgy+euly9YjQe33
vQiVXOFsymzc4+1fgqGB0PzrJAOuM+W51+mufJKiR/HreOUVbNrTfN1e6aUVMszd
7KPUN2lyhAj3gS0czmNRGQLaQ7CD4F2Z/0IMcX9TCtJKM0YdpsEAWB6//VGiDj0z
VCK8Gt60yxyg/DabQJr9pL9hOidtaA==
=TTgj
-----END PGP SIGNATURE-----

--Sig_/CNvb05QElBlpDgx+lZrcMcD--

