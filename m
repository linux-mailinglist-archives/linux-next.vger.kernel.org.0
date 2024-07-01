Return-Path: <linux-next+bounces-2759-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BA891DBA2
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 11:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AB8D2849CD
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 09:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A124A82D93;
	Mon,  1 Jul 2024 09:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aF+zMrgT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1CD2C182;
	Mon,  1 Jul 2024 09:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719826813; cv=none; b=kje28vXtHLwUJhAM1ptOoSKAIUUI8s521fay+RH/cXC7mmzqtNPPKylxR8tTOecdMp0suPkuNeHqWAmyDvd52Nh7LDu3xY4HDJZsd9ZlG8DVqzbI/d8PiJ1fJznL7hAegcUhyp/QuIlDATIu4jgftclvBvRWLqwo0ug87UU4wAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719826813; c=relaxed/simple;
	bh=W036ZOUkfle3Co3gak70SWbB0GYVv7eCLYgLhwuyxQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=a8uxe6DAWNZ/E7zVM3S09ZLr/pMk4Pd/MW/AtBNCxUvRt1Pp1el9+YHhskMQ0QwOZlBKPrDUbyiAfQaxqvVnXiMxN1rNue2v2fe10QsLPHrRqmL7P7zFxVX3am0RgU1Qbk7eUfiCgLa5gtFLuhJ0ZftEPQW1ZLtVmUYAAYB1TsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aF+zMrgT; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719826807;
	bh=RSw6YfdUhSjpEolqi1wg7VvD/UBpkB04vdz+AaiKxI8=;
	h=Date:From:To:Cc:Subject:From;
	b=aF+zMrgTjaMXyfWfJxHrxT+Yo9aq36OhzJ1XKEIn3F29Fukx6qHawrXB5+5o6N4n/
	 RoXkQSEsgFugO2Cdap6rVHycRn058BymkzpWNhganlzGcXq/JjsiRe7ffqItHunMAM
	 cIy0JgvwIqgL6C0JmYvB486ea5mM1glBVOyrt7j1Xhvlhe7c8ei3YxAUxLNXU6obMv
	 q/ZbOX+iVOUp+cEgERCm/KyYD4ySd7j3fvRAidMLS5cfx4Nx7JAtEnghljCq8zK+xo
	 4/Ddy6r1NOIK8TldoqV9Woz8UIQTZpR8JkcvDz/y7qZ5V5HZrcgSVGO7iWYRV+IMcj
	 bX1Lnm3gZFqMw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCLcR4sK2z4wZx;
	Mon,  1 Jul 2024 19:40:07 +1000 (AEST)
Date: Mon, 1 Jul 2024 19:40:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 1
Message-ID: <20240701194007.4cdb517d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EPwWysL6eun8eu+.+pdyWy6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EPwWysL6eun8eu+.+pdyWy6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20240628:

The mm-hotfixes tree gained a build failure for which I reverted a commit.

The ipsec tree still had its build failure so I used the version from
next-20240626.

The mm tree gained a build failure for which I applied a supplied patch.

The pci tree gained a build failure so I used the version from
next-20240628.

The net-next tree gained a conflict against the net tree.

The drm tree still had its build failure so I used the version from
next-20240627.  It gained another for which I reverted a commit.

The hid tree gained a build failure for which I applied a patch.

The counter-next tree gained a conflict against the ti tree.

The bitmap tree gained a conflict against the arm64 tree.

Non-merge commits (relative to Linus' tree): 8823
 9361 files changed, 719277 insertions(+), 163805 deletions(-)

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

I am currently merging 378 trees (counting Linus' and 106 trees of bug
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
Merging origin/master (22a40d14b572 Linux 6.10-rc6)
Merging fixes/fixes (2dde18cd1d8f Linux 6.5)
Merging mm-hotfixes/mm-hotfixes-unstable (5f408bfe0d13 mm: gup: stop abusin=
g try_grab_folio)
Applying: Revert "mm: gup: stop abusing try_grab_folio"
Merging vfs-brauner-fixes/vfs.fixes (9d66154f73b7 netfs: Fix netfs_page_mkw=
rite() to flush conflicting data, not wait)
Merging fscrypt-current/for-current (4cece7649650 Linux 6.9-rc1)
Merging fsverity-current/for-current (4cece7649650 Linux 6.9-rc1)
Merging btrfs-fixes/next-fixes (dbaa36ca6e1e Merge branch 'misc-6.10' into =
next-fixes)
Merging vfs-fixes/fixes (bba1f6758a9e lirc: rc_dev_get_from_fd(): fix file =
leak)
Merging erofs-fixes/fixes (cc69a681b257 erofs: convert to use super_set_uui=
d to support for FS_IOC_GETFSUUID)
Merging nfsd-fixes/nfsd-fixes (ac03629b1612 Revert "nfsd: fix oops when rea=
ding pool_stats before server is started")
Merging v9fs-fixes/fixes/next (1613e604df0c Linux 6.10-rc1)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging fs-current (f7695f55634c Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/xiang/erofs.git)
Merging kbuild-current/fixes (a11aaf6d0bb4 kbuild: scripts/gdb: bring the "=
abspath" back)
Merging arc-current/for-curr (e67572cd2204 Linux 6.9-rc6)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (ecc54006f158 arm64: Clear the initial I=
D map correctly before remapping)
Merging arm-soc-fixes/arm/fixes (56d62dc2ba68 Merge tag 'optee-fix-for-v6.1=
1' of https://git.linaro.org/people/jens.wiklander/linux-tee into arm/fixes)
Merging davinci-current/davinci/for-current (6613476e225e Linux 6.8-rc1)
Merging drivers-memory-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging sophgo-fixes/fixes (90f6cc7f8e07 riscv: dts: sophgo: disable write-=
protection for milkv duo)
Merging m68k-current/for-linus (ec8c8266373f m68k: defconfig: Update defcon=
figs for v6.9-rc1)
Merging powerpc-fixes/fixes (a1216e62d039 powerpc/eeh: avoid possible crash=
 when edev->pdev changes)
Merging s390-fixes/fixes (cea5589e958f s390/boot: Do not adjust GOT entries=
 for undef weak sym)
Merging net/main (134061163ee5 bnx2x: Fix multiple UBSAN array-index-out-of=
-bounds)
Merging bpf/master (dc6be0b73f4f Merge tag 'ieee802154-for-net-2024-06-27' =
of git://git.kernel.org/pub/scm/linux/kernel/git/wpan/wpan into main)
Merging ipsec/master (07b87f9eea0c xfrm: Fix unregister netdevice hang on h=
ardware offload.)
$ git reset --hard HEAD^
Merging next-20240626 version of ipsec
Merging netfilter/main (7931d32955e0 netfilter: nf_tables: fully validate N=
FT_DATA_VALUE on store to data registers)
Merging ipvs/main (7931d32955e0 netfilter: nf_tables: fully validate NFT_DA=
TA_VALUE on store to data registers)
Merging wireless/for-next (816c6bec09ed wifi: mac80211: fix BSS_CHANGED_UNS=
OL_BCAST_PROBE_RESP)
Merging wpan/master (b8ec0dc3845f net: mac802154: Fix racy device stats upd=
ates by DEV_STATS_INC() and DEV_STATS_ADD())
Merging rdma-fixes/for-rc (f2661062f16b Linux 6.10-rc5)
Merging sound-current/for-linus (4b3e38107383 Merge tag 'asoc-fix-v6.10-rc5=
' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for=
-linus)
Merging sound-asoc-fixes/for-linus (68f97fe330e0 ASoC: rt5645: fix issue of=
 random interrupt from push-button)
Merging regmap-fixes/for-linus (76f19626bd35 regmap: add missing MODULE_DES=
CRIPTION() macros)
Merging regulator-fixes/for-linus (f2661062f16b Linux 6.10-rc5)
Merging spi-fixes/for-linus (40b3d0838a1f spi: axi-spi-engine: fix sleep ca=
lculation)
Merging pci-current/for-linus (419d57d429f6 CREDITS: Add Synopsys DesignWar=
e eDMA driver for Gustavo Pimentel)
Merging driver-core.current/driver-core-linus (6ba59ff42279 Linux 6.10-rc4)
Merging tty.current/tty-linus (cc8d5a2f09a5 Revert "printk: Save console op=
tions for add_preferred_console_match()")
Merging usb.current/usb-linus (fc1d1a712b51 usb: dwc3: core: Workaround for=
 CSR read timeout)
Merging usb-serial-fixes/usb-linus (4298e400dbdb USB: serial: option: add T=
elit generic core-dump composition)
Merging phy/fixes (f2661062f16b Linux 6.10-rc5)
Merging staging.current/staging-linus (fcdd7b7bda3c staging: vchiq_debugfs:=
 Fix build if CONFIG_DEBUG_FS is not set)
Merging iio-fixes/fixes-togreg (74cb21576ea5 iio: trigger: Fix condition fo=
r own trigger)
Merging counter-current/counter-current (0cf81c73e4c6 counter: ti-eqep: ena=
ble clock at probe)
Merging char-misc.current/char-misc-linus (06ebbce9c3a8 Merge tag 'counter-=
fixes-for-6.10' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/wbg/c=
ounter into char-misc-linus)
Merging soundwire-fixes/fixes (f2661062f16b Linux 6.10-rc5)
Merging thunderbolt-fixes/fixes (f2661062f16b Linux 6.10-rc5)
Merging input-current/for-linus (7c7b1be19b22 Input: ads7846 - use spi_devi=
ce_id table)
Merging crypto-current/master (a5d8922ab2ae crypto: qat - fix linking error=
s when PCI_IOV is disabled)
Merging vfio-fixes/for-linus (d71a989cf5d9 vfio/pci: Insert full vma on mma=
p'd MMIO fault)
Merging kselftest-fixes/fixes (48236960c06d selftests/resctrl: Fix non-cont=
iguous CBM for AMD)
Merging dmaengine-fixes/fixes (f2661062f16b Linux 6.10-rc5)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (b27d8946b5ed mtd: rawnand: rockchip: ensure NV=
DDR timings are rejected)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (fd404435d44b media: ivsc: Depend on IPU_BRIDGE=
 or not IPU_BRIDGE)
Merging reset-fixes/reset/fixes (ab35896730a5 reset: hisilicon: hi6220: add=
 missing MODULE_DESCRIPTION() macro)
Merging mips-fixes/mips-fixes (0d5679a0aae2 mips: fix compat_sys_lseek sysc=
all)
Merging at91-fixes/at91-fixes (1613e604df0c Linux 6.10-rc1)
Merging omap-fixes/fixes (9b6a51aab5f5 ARM: dts: Fix occasional boot hang f=
or am3 usb)
Merging kvm-fixes/master (dee67a94d4c6 Merge tag 'kvm-x86-fixes-6.10-rcN' o=
f https://github.com/kvm-x86/linux into HEAD)
Merging kvms390-fixes/master (175f2f5bcdfc KVM: s390: Check kvm pointer whe=
n testing KVM_CAP_S390_HPAGE_1M)
Merging hwmon-fixes/hwmon (6ba59ff42279 Linux 6.10-rc4)
Merging nvdimm-fixes/libnvdimm-fixes (33908660e814 ACPI: NFIT: Fix incorrec=
t calculation of idt size)
Merging cxl-fixes/fixes (a0f39d51dbf7 cxl: documentation: add missing files=
 to cxl driver-api)
Merging dma-mapping-fixes/for-linus (75961ffb5cb3 swiotlb: initialise restr=
icted pool list_head when SWIOTLB_DYNAMIC=3Dy)
Merging drivers-x86-fixes/fixes (7add1ee34692 platform/x86: add missing MOD=
ULE_DESCRIPTION() macros)
Merging samsung-krzk-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging pinctrl-samsung-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging devicetree-fixes/dt/linus (e7985f43609c of: property: Fix fw_devlin=
k handling of interrupt-map)
Merging dt-krzk-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging scsi-fixes/fixes (ab2068a6fb84 scsi: libsas: Fix exp-attached devic=
e scan after probe failure scanned in again after probe failed)
Merging drm-fixes/drm-fixes (4f2a129b33a2 drm/drm_file: Fix pid refcounting=
 race)
Merging drm-intel-fixes/for-linux-next-fixes (996c3412a065 drm/i915/gt: Fix=
 potential UAF by revoke of fence registers)
Merging mmc-fixes/fixes (ab069ce12596 mmc: sdhci: Do not lock spinlock arou=
nd mmc_gpio_get_ro())
Merging rtc-fixes/rtc-fixes (1613e604df0c Linux 6.10-rc1)
Merging gnss-fixes/gnss-linus (6ba59ff42279 Linux 6.10-rc4)
Merging hyperv-fixes/hyperv-fixes (3b85a2eacd3d Documentation: hyperv: Add =
overview of Confidential Computing VM support)
Merging soc-fsl-fixes/fix (06c2afb862f9 Linux 6.5-rc1)
Merging risc-v-fixes/fixes (cc2c169e34b4 Merge patch "riscv: stacktrace: co=
nvert arch_stack_walk() to noinstr")
Merging riscv-dt-fixes/riscv-dt-fixes (e21de658f8e8 MAINTAINERS: thead: upd=
ate Maintainer)
Merging riscv-soc-fixes/riscv-soc-fixes (1613e604df0c Linux 6.10-rc1)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (a3e18a540541 Merge tag 'xfs-6.10-fixes-3' of git:/=
/git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging gpio-brgl-fixes/gpio/for-current (b44039638741 gpiolib: cdev: Ignor=
e reconfiguration without direction)
Merging gpio-intel-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging pinctrl-intel-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging auxdisplay-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging kunit-fixes/kunit-fixes (1613e604df0c Linux 6.10-rc1)
Merging memblock-fixes/fixes (8043832e2a12 memblock: use numa_valid_node() =
helper to check for invalid node ID)
Merging renesas-fixes/fixes (8c987693dc2d ARM: dts: renesas: rcar-gen2: Add=
 missing #interrupt-cells to DA9063 nodes)
Merging perf-current/perf-tools (83a7eefedc9b Linux 6.10-rc3)
Merging efi-fixes/urgent (46e27b9961d8 efi/arm64: Fix kmemleak false positi=
ve in arm64_efi_rt_init())
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (d3911f1639e6 power: supply: rt5033: Bring back=
 i2c_set_clientdata)
Merging uml-fixes/fixes (73a23d771033 um: harddog: fix modular build)
Merging iommufd-fixes/for-rc (dd5a440a31fa Linux 6.9-rc7)
Merging rust-fixes/rust-fixes (a126eca84435 rust: avoid unused import warni=
ng in `rusttest`)
Merging w1-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging pmdomain-fixes/fixes (c3f38fa61af7 Linux 6.10-rc2)
Merging i2c-host-fixes/i2c/i2c-host-fixes (103458874bac i2c: viai2c: turn c=
ommon code into a proper module)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (2607133196c3 clk: sifive: Do not register clkd=
evs for PRCI clocks)
Merging pwrseq-fixes/pwrseq/for-current (83a7eefedc9b Linux 6.10-rc3)
Merging drm-misc-fixes/for-linux-next-fixes (80bec6825b19 drm/nouveau: fix =
null pointer dereference in nouveau_connector_get_modes)
Merging mm-stable/mm-stable (37a658069afb selftests/damon/damon_nr_regions:=
 test online-tuned max_nr_regions)
Merging mm-nonmm-stable/mm-nonmm-stable (2a49c8b6b6d0 selftests/fpu: add mi=
ssing MODULE_DESCRIPTION() macro)
Merging mm/mm-everything (2c411ab262e6 foo)
Applying: Revert "mm-gup-introduce-memfd_pin_folios-for-pinning-memfd-folio=
s-fix"
Merging kbuild/for-next (d9ddc122becc kconfig: remove E_LIST expression typ=
e)
Merging clang-format/clang-format (5a205c6a9f79 clang-format: Update with v=
6.7-rc4's `for_each` macro list)
Merging perf/perf-tools-next (7afbf90ea2e2 perf pmu: Don't de-duplicate cor=
e PMUs)
CONFLICT (content): Merge conflict in tools/perf/builtin-record.c
Merging compiler-attributes/compiler-attributes (2993eb7a8d34 Compiler Attr=
ibutes: counted_by: fixup clang URL)
Merging dma-mapping/for-next (82d71b53d7e7 Documentation/core-api: correct =
reference to SWIOTLB_DYNAMIC)
Merging asm-generic/master (01b6ed5fcd5a syscalls: fix sys_fanotify_mark pr=
ototype)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (b5e352609497 Merge branches 'clkdev', 'fixes' and 'mi=
sc' into for-next)
Merging arm64/for-next/core (8da1d1f1cda6 Merge branch 'for-next/vcpu-hotpl=
ug' into for-next/core)
Merging arm-perf/for-next/perf (410e471f8746 arm64: Add USER_STACKTRACE sup=
port)
Merging arm-soc/for-next (7e820f46fdc7 soc: document merges)
Merging amlogic/for-next (338c92a5d195 Merge branch 'v6.11/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (73feb9cd46f1 ARM: dts: aspeed: System1: Updates to=
 BMC board)
Merging at91/at91-next (1cdb1c9626a4 Merge branch 'at91-defconfig' into at9=
1-next)
Merging broadcom/next (4caff16b6e00 Merge branch 'devicetree-arm64/next' in=
to next)
Merging davinci/davinci/for-next (6613476e225e Linux 6.8-rc1)
Merging drivers-memory/for-next (815cc7715ab1 dt-bindings: memory: fsl: rep=
lace maintainer)
Merging imx-mxs/for-next (87eab3bd3ac4 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (47db8e7dbe24 Merge branches 'v6.10-next/soc', 'v=
6.10-next/dts32' and 'v6.10-next/dts64' into for-next)
  047ce9d9deea ("soc: mediatek: mtk-mutex: Add MDP_TCC0 mod to MT8188 mutex=
 table")
  5d6ea873c931 ("soc: mediatek: Disable 9-bit alpha in ETHDR")
  ac21fd549d09 ("soc: mtk-cmdq: Add cmdq_pkt_logic_command to support math =
operation")
Merging mvebu/for-next (da8e8356f594 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (5856330c3d56 Merge branch 'drivers-ti-sysc-for-v6.10=
' into for-next)
Merging qcom/for-next (dae46512ffb8 Merge branches 'arm32-for-6.11', 'arm64=
-defconfig-fixes-for-6.10', 'arm64-defconfig-for-6.11', 'arm64-fixes-for-6.=
10', 'arm64-for-6.11', 'clk-fixes-for-6.10', 'clk-for-6.11', 'drivers-fixes=
-for-6.10' and 'drivers-for-6.11' into for-next)
$ git reset --hard HEAD^
Merging next-20240624 version of qcom
Merging renesas/next (ae035db289ff Merge branches 'renesas-drivers-for-v6.1=
1' and 'renesas-dts-for-v6.11' into renesas-next)
Merging reset/reset/next (eb5d88b15388 reset: RESET_IMX8MP_AUDIOMIX should =
depend on ARCH_MXC)
Merging rockchip/for-next (84a3d3b435e7 Merge branch 'v6.11-clk/next' into =
for-next)
Merging samsung-krzk/for-next (08146fa0ef12 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (eaaeef9e62f9 Merge tags 'scmi-updates-6.11', '=
ffa-updates-6.11', 'vexpress-updates-6.11' and 'juno-updates-6.11' of ssh:/=
/gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-l=
inux-next)
Merging sophgo/for-next (1613e604df0c Linux 6.10-rc1)
Merging stm32/stm32-next (45fad67e8307 arm64: dts: st: enable Ethernet2 on =
stm32mp257f-ev1 board)
Merging sunxi/sunxi/for-next (0682fbf17dd9 Merge branches 'sunxi/clk-fixes-=
for-6.10', 'sunxi/drivers-for-6.11' and 'sunxi/dt-for-6.11' into sunxi/for-=
next)
Merging tee/next (cd88a296582c Merge branch 'optee_notif_wait_timeout_for_v=
6.11' into next)
Merging tegra/for-next (5211d93c551f Merge branch for-6.11/arm64/defconfig =
into for-next)
Merging ti/ti-next (091c47479625 Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (613af8986db8 Merge remote-tracking branch 'git/zyn=
qmp/dt' into for-next)
Merging clk/clk-next (5029c56be4ba Merge branch 'clk-cleanup' into clk-next)
Merging clk-imx/for-next (466da3d2d967 clk: imx: composite-7ulp: Use NULL i=
nstead of 0)
Merging clk-renesas/renesas-clk (c7e58843d1e4 clk: renesas: r9a08g045: Add =
clock, reset and power domain support for I2C)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (8051b80fbeef LoongArch: Automatically dis=
able KASLR for hibernation)
Merging m68k/for-next (156872f08e33 zorro: Use str_plural() in amiga_zorro_=
probe())
Merging m68knommu/for-next (22a40d14b572 Linux 6.10-rc6)
Merging microblaze/next (1613e604df0c Linux 6.10-rc1)
Merging mips/mips-next (04f38d1a4db0 mips: bmips: enable RAC on BMIPS4350)
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (5f55e098b8d0 parisc: Add 64-bit gettimeofday() =
and clock_gettime() vDSO functions)
Merging powerpc/next (932bed412170 powerpc/kexec_file: fix cpus node update=
 to FDT)
Merging soc-fsl/next (fb9c384625dd bus: fsl-mc: fsl-mc-allocator: Drop a wr=
ite-only variable)
Merging risc-v/for-next (60a6707f582e Merge patch series "riscv: Memory Hot=
(Un)Plug support")
CONFLICT (content): Merge conflict in arch/riscv/kernel/patch.c
Merging riscv-dt/riscv-dt-for-next (ca0ef1c2f38e riscv: dts: starfive: add =
PCIe dts configuration for JH7110)
Merging riscv-soc/riscv-soc-for-next (16b8597f1774 Merge branch 'riscv-cach=
e-for-next' into riscv-soc-for-next)
Merging s390/for-next (de779b5b1e59 Merge branch 'features' into for-next)
Merging sh/for-next (1613e604df0c Linux 6.10-rc1)
Merging sparc/for-next (1c9e709cde80 sparc/leon: Remove on-stack cpumask va=
r)
Merging uml/next (919e3ece7f5a um: virtio_uml: Convert to platform remove c=
allback returning void)
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging bcachefs/for-next (d6d793ae5589 bcachefs: Simplify btree key cache =
fill path)
CONFLICT (content): Merge conflict in fs/bcachefs/super.c
[fs-next f6a1b2ef5213] Merge branch 'for-next' of https://evilpiepirate.org=
/git/bcachefs.git
Merging pidfd/for-next (a901a3568fd2 Merge tag 'iomap-6.5-merge-1' of git:/=
/git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging fscrypt/for-next (7f016edaa0f3 fscrypt: try to avoid refing parent =
dentry in fscrypt_file_open)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (80d54c4200e1 Merge branch 'for-next-next-v6.10-2024=
0624' into for-next-20240624)
CONFLICT (content): Merge conflict in fs/btrfs/qgroup.c
CONFLICT (content): Merge conflict in fs/btrfs/tree-log.c
[fs-next fc744107b7a3] Merge branch 'for-next' of git://git.kernel.org/pub/=
scm/linux/kernel/git/kdave/linux.git
Merging ceph/master (93a2221c9c1a doc: ceph: update userspace command to ge=
t CephFS metadata)
Merging cifs/for-next (f2661062f16b Linux 6.10-rc5)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging dlm/next (89b01913dc73 dlm: add rcu_barrier before destroy kmem cac=
he)
Merging erofs/dev (f2661062f16b Linux 6.10-rc5)
Merging exfat/dev (0daa52fbc7ac exfat: fix potential deadlock on __exfat_ge=
t_dentry_set)
Merging exportfs/exportfs-next (e8f897f4afef Linux 6.8)
Merging ext3/for_next (85f22bb5d2c2 Merge UDF consistency fixes.)
Merging ext4/dev (8262fe9a902c ext4: make ext4_da_map_blocks() buffer_head =
unaware)
Merging f2fs/dev (8cb1f4080dd9 f2fs: assign CURSEG_ALL_DATA_ATGC if blkaddr=
 is valid)
Merging fsverity/for-next (ee5814dddefb fsverity: use register_sysctl_init(=
) to avoid kmemleak warning)
Merging fuse/for-next (529395d2ae64 virtio-fs: add multi-queue support)
Merging gfs2/for-next (5a1906a476bc gfs2: Revert "check for no eligible quo=
ta changes")
Merging jfs/jfs-next (d0fa70aca54c jfs: don't walk off the end of ealist)
Merging ksmbd/ksmbd-for-next (6ba59ff42279 Linux 6.10-rc4)
Merging nfs/linux-next (22a40d14b572 Linux 6.10-rc6)
Merging nfs-anna/linux-next (e53a863bab58 nfs/blocklayout: SCSI layout trac=
e points for reservation key reg/unreg)
Merging nfsd/nfsd-next (7e83592d7626 MAINTAINERS: Add a bugzilla link for N=
FSD)
Merging ntfs3/master (bde63e8eae5d fs/ntfs3: Fix formatting, change comment=
s, renaming)
Merging orangefs/for-next (53e4efa470d5 orangefs: fix out-of-bounds fsid ac=
cess)
Merging overlayfs/overlayfs-next (004b8d1491b4 ovl: fix encoding fid for lo=
wer only root)
Merging ubifs/next (af9a8730ddb6 jffs2: Fix potential illegal address acces=
s in jffs2_free_inode)
Merging v9fs/9p-next (2211561723a6 9p: Enable multipage folios)
Merging v9fs-ericvh/ericvh/for-next (1613e604df0c Linux 6.10-rc1)
Merging xfs/for-next (673cd885bbbf xfs: honor init_xattrs in xfs_init_new_i=
node for !ATTR fs)
Merging zonefs/for-next (df2f9708ff1f zonefs: enable support for large foli=
os)
Merging iomap/iomap-for-next (3ac974796e5d iomap: fix short copy in iomap_w=
rite_iter())
Merging djw-vfs/vfs-for-next (ce85a1e04645 xfs: stabilize fs summary counte=
rs for online fsck)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging iversion/iversion-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6=
-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (6cbc40abcac6 Merge branch 'vfs.iomap' into vfs=
.all)
CONFLICT (content): Merge conflict in fs/btrfs/inode.c
[fs-next 56acf8150da2] Merge branch 'vfs.all' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/vfs/vfs.git
Merging vfs/for-next (a38297e3fb01 Linux 6.9)
Merging fs-next (56acf8150da2 Merge branch 'vfs.all' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/vfs/vfs.git)
  7f07ee5a23a5 ("proc: Remove usage of the deprecated ida_simple_xx() API")
CONFLICT (content): Merge conflict in fs/nfs/internal.h
Merging printk/for-next (07c2ab22a8da Merge branch 'for-6.11' into for-next)
Merging pci/next (4548d07493dc Merge remote-tracking branch 'origin/control=
ler/tegra194' into next)
CONFLICT (content): Merge conflict in drivers/pci/pci.c
$ git reset --hard HEAD^
Merging next-20240628 version of pci
CONFLICT (content): Merge conflict in drivers/pci/pci.c
[master 5d6d9aa3b16a] next-20240628/pci
Merging pstore/for-next/pstore (9b3c13c9ea4e pstore: platform: add missing =
MODULE_DESCRIPTION() macro)
Merging hid/for-next (48e326f1cee8 Merge branch 'for-6.11/bpf' into for-nex=
t)
Merging i2c/i2c/for-next (6367df381ba9 Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i2c-host/i2c/i2c-host (db0fde5789ef dt-bindings: i2c: nxp,lpc1788-i=
2c: convert to dt schema)
Merging i3c/i3c/next (67678602c4fc i3c: mipi-i3c-hci: Round IBI data chunk =
size to HW supported value)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (b3e992f69c23 hwmon: (jc42)  Strengthen de=
tect function)
Merging jc_docs/docs-next (93dd11d0dd74 Merge branch 'docs-mw' into docs-ne=
xt)
Merging v4l-dvb/master (8771b7f31b7f media: bcm2835-unicam: Depend on COMMO=
N_CLK)
Merging v4l-dvb-next/master (156922faabce media: atomisp: Switch to new Int=
el CPU model defines)
Merging pm/linux-next (f7cd54956dc7 Merge branch 'pm-cpufreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (ce84b7beeb52 cpufreq: sti: add =
missing MODULE_DEVICE_TABLE entry for stih418)
Merging cpupower/cpupower (cdaed24abf83 cpupower: Disable direct build of t=
he 'bench' subproject)
Merging devfreq/devfreq-next (1d143dde7679 PM / devfreq: exynos: Use Use de=
vm_clk_get_enabled() helpers)
Merging pmdomain/next (cc647e931a24 pmdomain: amlogic: add missing MODULE_D=
ESCRIPTION() macros)
Merging opp/opp/linux-next (e3943f00afdb OPP: Introduce an OF helper functi=
on to inform if required-opps is used)
Merging thermal/thermal/linux-next (7eeb114a635a dt-bindings: thermal: conv=
ert hisilicon-thermal.txt to dt-schema)
Merging rdma/for-next (589b844f1bf0 RDMA/mlx5: Send UAR page index as ioctl=
 attribute)
Merging net-next/main (30972a4ea092 Merge branch 'ethtool-track-custom-rss-=
contexts-in-the-core')
CONFLICT (content): Merge conflict in include/linux/mlx5/mlx5_ifc.h
Merging bpf-next/for-next (a12978712d90 selftests/bpf: Move ARRAY_SIZE to b=
pf_misc.h)
Applying: HID: bpf: Fix up build
Merging ipsec-next/master (f531d13bdfe3 xfrm: support sending NAT keepalive=
s in ESP in UDP states)
Merging mlx5-next/mlx5-next (78a6cbd5145c RDMA/mlx5: Use sq timestamp as QP=
 timestamp when RoCE is disabled)
  78a6cbd5145c ("RDMA/mlx5: Use sq timestamp as QP timestamp when RoCE is d=
isabled")
Merging netfilter-next/main (f4ebd03496f6 netfilter: xt_recent: Lift restri=
ctions on max hitcount value)
Merging ipvs-next/main (8871d1e4dceb netfilter: xt_recent: Lift restriction=
s on max hitcount value)
  8871d1e4dceb ("netfilter: xt_recent: Lift restrictions on max hitcount va=
lue")
CONFLICT (content): Merge conflict in tools/testing/selftests/net/netfilter=
/nft_queue.sh
Merging bluetooth/master (989e25f5b99e Bluetooth: btusb: Add Realtek RTL885=
2BE support ID 0x13d3:0x3591)
Merging wireless-next/for-next (8c62617295d3 wifi: mac80211: remove DEAUTH_=
NEED_MGD_TX_PREP)
Merging wpan-next/master (9187210eee7d Merge tag 'net-next-6.9' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging wpan-staging/staging (9187210eee7d Merge tag 'net-next-6.9' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mtd/mtd/next (cf4ccd1c029e mtd: physmap: Use *-y instead of *-objs =
in Makefile)
Merging nand/nand/next (b9bf7737de32 mtd: rawnand: gpmi: add iMX8QXP suppor=
t.)
Merging spi-nor/spi-nor/next (d35df77707bf mtd: spi-nor: winbond: fix w25q1=
28 regression)
Merging crypto/master (95c0f5c3b8bb hwrng: core - Fix wrong quality calcula=
tion at hw rng registration)
Merging drm/drm-next (fb625bf6187d Merge tag 'drm-habanalabs-next-2024-06-2=
3' of https://github.com/HabanaAI/drivers.accel.habanalabs.kernel into drm-=
next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ato=
mfirmware.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/hwss/d=
cn35/dcn35_init.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/inc/smu_=
types.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_gt_idle.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_pc.c
$ git reset --hard HEAD^
Merging next-20240627 version of drm
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ato=
mfirmware.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/hwss/d=
cn35/dcn35_init.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/inc/smu_=
types.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_gt_idle.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_pc.c
[master caddfd8ddfd9] next-20240627/drm
Merging drm-exynos/for-linux-next (9347028bfcfc drm/exynos/vidi: convert to=
 struct drm_edid)
Merging drm-misc/for-linux-next (0c94f58cef31 drm/lima: Mark simple_ondeman=
d governor as softdep)
Merging amdgpu/drm-next (15eb8573ad72 drm/amd: Don't initialize ISP hardwar=
e without FW)
Merging drm-intel/for-linux-next (32a120f52a4c drm/i915/mtl: Skip PLL state=
 verification in TBT mode)
Merging drm-tegra/for-next (2429b3c529da drm/tegra: Avoid potential 32-bit =
integer overflow)
Merging drm-msm/msm-next (2c4c53f316f6 drm/msm/adreno: Introduce gmu_chipid=
 for a740 & a750)
Merging drm-msm-lumag/msm-next-lumag (104e548a7c97 drm/msm/mdp4: use drmm-m=
anaged allocation for mdp4_plane)
Merging drm-xe/drm-xe-next (4f82ac610278 drm/xe/mcr: Avoid clobbering DSS s=
teering)
Merging etnaviv/etnaviv/next (704d3d60fec4 drm/etnaviv: don't block schedul=
er when GPU is still active)
Merging fbdev/for-next (7ee6cfe6d9cf fbdev: omap2: Return clk_prepare_enabl=
e to transfer the error)
Merging regmap/for-next (438685f6714a Merge remote-tracking branch 'regmap/=
for-6.11' into regmap-next)
Merging sound/for-next (5b707581c072 selftests/alsa:Fix printf format strin=
g in pcm-test.c)
Merging ieee1394/for-next (502099acb8cb firewire: core: Fix spelling mistak=
es in tracepoint messages)
Merging sound-asoc/for-next (84561ce85a53 Merge remote-tracking branch 'aso=
c/for-6.11' into asoc-next)
Merging modules/modules-next (61842868de13 module: create weak dependecies)
Merging input/next (7c459517252e Input: ili210x - use guard notation when d=
isabling and reenabling IRQ)
CONFLICT (content): Merge conflict in include/linux/interrupt.h
Merging block/for-next (c42a9e372432 Merge branch 'for-6.11/block' into for=
-next)
CONFLICT (content): Merge conflict in fs/stat.c
CONFLICT (content): Merge conflict in include/linux/fs.h
Merging device-mapper/for-next (aaa53168cbcc dm: optimize flushes)
Merging libata/for-next (f5a0205ad031 Merge remote-tracking branch 'libata/=
for-6.11' into HEAD)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (f7e7e00f7b86 MAINTAINERS: drop entry for VIA SD/MMC contr=
oller)
Merging mfd/for-mfd-next (33c0e553c8c3 dt-bindings: mfd: syscon: Add APM po=
weroff mailbox)
Merging backlight/for-backlight-next (b337cc3ce475 backlight: lm3509_bl: Fi=
x early returns in for_each_child_of_node())
Merging battery/for-next (b498ddb6f283 power: reset: piix4: add missing MOD=
ULE_DESCRIPTION() macro)
Merging regulator/for-next (db576ed76232 Add USB VBUS regulator for RZ/G2L)
  b147ae7ae514 ("regulator: Add bindings for MediaTek DVFSRC Regulators")
Merging security/next (9ca51b3176e0 Automated merge of 'dev' into 'next')
Merging apparmor/apparmor-next (3dd384108d53 apparmor: fix possible NULL po=
inter dereference)
Merging integrity/next-integrity (fbf06cee6087 ima: fix wrong zero-assignme=
nt during securityfs dentry remove)
Merging selinux/next (1613e604df0c Linux 6.10-rc1)
Merging smack/next (e86cac0acdb1 smack: unix sockets: fix accept()ed socket=
 label)
Merging tomoyo/master (b96342141183 rtnetlink: print rtnl_mutex holder/wait=
er for debug purpose)
Merging tpmdd/next (ae5b33558fad KEYS: encrypted: add missing MODULE_DESCRI=
PTION())
Merging watchdog/master (acf9e67a7625 watchdog: add missing MODULE_DESCRIPT=
ION() macros)
Merging iommu/next (cfb822815752 Merge branches 'fixes', 'allwinner/sun50i'=
, 'qualcomm/msm', 'intel/vt-d', 'amd/amd-vi' and 'core' into next)
Merging audit/next (1613e604df0c Linux 6.10-rc1)
Merging devicetree/for-next (f2a524d9ef5b of: reserved_mem: Restructure cod=
e to call reserved mem init functions earlier)
  634c4347b3b4 ("dt-bindings: interrupt-controller: riscv,cpu-intc: convert=
 to dtschema")
  c0ea5d103c5d ("dt-bindings: riscv: cpus: add ref to interrupt-controller")
  e83445ff82c3 ("dt-bindings: interrupt-controller: convert marvell,mpic bi=
nding to YAML")
Merging dt-krzk/for-next (c28796e5fb43 Merge branch 'next/dt' into for-next)
Merging mailbox/for-next (10b98582bc76 dt-bindings: mailbox: qcom-ipcc: Doc=
ument the SDX75 IPCC)
Merging spi/for-next (8b8a29a7e064 Merge remote-tracking branch 'spi/for-6.=
11' into spi-next)
Merging tip/master (3e60034e1aca Merge branch into tip/master: 'x86/vmware')
CONFLICT (content): Merge conflict in arch/x86/include/asm/cpufeatures.h
CONFLICT (content): Merge conflict in include/linux/cacheinfo.h
Merging clockevents/timers/drivers/next (2030a7e11f16 clocksource/drivers/a=
rm_arch_timer: Mark hisi_161010101_oem_info const)
Merging edac/edac-for-next (9a1c5fe0f0a8 Merge ras/edac-misc into for-next)
Merging ftrace/for-next (5dfebf3c26dc Merge ring-buffer/for-next)
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_64.tbl
CONFLICT (content): Merge conflict in include/uapi/asm-generic/unistd.h
Merging rcu/next (a9e1661087f1 Merge branches 'doc.2024.06.06a', 'fixes.202=
4.06.18a', 'mb.2024.06.28a', 'nocb.2024.06.03a', 'rcu-tasks.2024.06.06a', '=
rcutorture.2024.06.06a' and 'srcu.2024.06.18a' into HEAD)
Merging paulmck/non-rcu/next (f5d5a3bc7a69 tools/memory-model: simple.txt: =
Fix stale reference to recipes-pairs.txt)
Merging kvm/next (02b0d3b9d4dd Merge branch 'kvm-6.10-fixes' into HEAD)
CONFLICT (content): Merge conflict in arch/x86/include/asm/sev-common.h
Merging kvm-arm/next (62933f02c855 Merge branch kvm-arm64/docs into kvmarm/=
next)
Merging kvms390/next (39cd87c4eb2b Linux 6.9-rc2)
Merging kvm-ppc/topic/ppc-kvm (0b65365f3fa9 KVM: PPC: Book3S HV nestedv2: K=
eep nested guest HASHPKEYR in sync)
Merging kvm-riscv/riscv_kvm_next (e325618349cd RISC-V: KVM: Redirect AMO lo=
ad/store access fault traps to guest)
CONFLICT (content): Merge conflict in tools/perf/arch/riscv/util/Build
Merging kvm-x86/next (771df9ffadb8 Merge branch 'static_calls')
Merging xen-tip/linux-next (a3607581cd49 drivers/xen: Improve the late XenS=
tore init protocol)
Merging percpu/for-next (2d9ad81ef935 Merge branch 'for-6.8-fixes' into for=
-next)
Merging workqueues/for-next (03979a8f5adf Merge branch 'for-6.11' into for-=
next)
Merging sched-ext/for-next (b5ba2e1a9554 sched_ext: add CONFIG_DEBUG_INFO_B=
TF dependency)
Merging drivers-x86/for-next (4261031484d8 Merge branch 'pdx86/platform-dri=
vers-x86-lenovo-c630' into review-ilpo)
Merging chrome-platform/for-next (5b8feca8dee4 dt-bindings: input: cros-ec-=
keyboard: Add keyboard matrix v3.0)
Merging chrome-platform-firmware/for-firmware-next (fc2c1d716d4a firmware: =
google: add missing MODULE_DESCRIPTION() macros)
Merging hsi/for-next (f02cfe695047 HSI: ssi_protocol: Remove unused linux/g=
pio.h)
Merging leds-lj/for-leds-next (940b27161afc Revert "leds: led-core: Fix ref=
count leak in of_led_get()")
CONFLICT (content): Merge conflict in MAINTAINERS
Merging ipmi/for-next (0627cef36145 ipmi: ssif_bmc: prevent integer overflo=
w on 32bit systems)
Merging driver-core/driver-core-next (6b521fc111a2 MAINTAINERS: add Rust de=
vice abstractions to DRIVER CORE)
CONFLICT (content): Merge conflict in drivers/fsi/fsi-occ.c
CONFLICT (content): Merge conflict in drivers/reset/reset-meson-audio-arb.c
Applying: net: ethernet: rtsn: Fix up for remove() coversion to return void
Applying: drm: Fix up STM LVDS driver for void remove() conversion
Merging usb/usb-next (2ea6d07efe53 usb: typec: ucsi: add Lenovo Yoga C630 g=
lue driver)
Merging thunderbolt/next (49056c95df44 thunderbolt: debugfs: Use FIELD_GET(=
))
Merging usb-serial/usb-next (6ba59ff42279 Linux 6.10-rc4)
Merging tty/tty-next (4fb92bdb8e84 serial: sc16is7xx: hardware reset chip i=
f reset-gpios is defined in DT)
CONFLICT (content): Merge conflict in drivers/tty/serial/8250/8250_core.c
Applying: serial: Fix up for multi-file merge conflict
Merging char-misc/char-misc-next (c4681b2b3862 Merge tag 'peci-next-6.11-rc=
1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/iwi/linux into cha=
r-misc-next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/ven=
dor-prefixes.yaml
CONFLICT (content): Merge conflict in MAINTAINERS
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (4dcc0f95ca2a coresight: constify the struct device_=
type usage)
Merging fastrpc/for-next (47bf4198bf38 MAINTAINERS: CC dri-devel list on Qu=
alcomm FastRPC patches)
Merging fpga/for-next (3a0fa8e97d30 fpga: altera-fpga2sdram: remove unused =
struct 'prop_map')
Merging icc/icc-next (3c6ffb017091 Merge branch 'icc-msm8953' into icc-next)
Merging iio/togreg (3341d69268ac iio: dac: ad3552r: use devm_regulator_get_=
enable_read_voltage())
Merging phy-next/next (d7d2818b9383 phy: airoha: Add PCIe PHY driver for EN=
7581 SoC.)
Merging soundwire/next (5a4c1f0207d8 soundwire: bus: simplify by using loca=
l slave->prop)
Merging extcon/extcon-next (e508f2606c0b extcon: Add LC824206XA microUSB sw=
itch driver)
Merging gnss/gnss-next (6ba59ff42279 Linux 6.10-rc4)
Merging vfio/next (abe8103da3c5 vfio/pci: Fix typo in macro to declare acce=
ssors)
Merging w1/for-next (26bf5fc86033 w1: Drop allocation error message)
Merging spmi/spmi-next (1613e604df0c Linux 6.10-rc1)
Merging staging/staging-next (d11cbdee2595 staging: rtl8192e: Fix conflicti=
ng types error with net_device.)
Merging counter-next/counter-next (474bbfc637c7 counter: ti-eqep: Allow eQE=
P driver to be built for K3 devices)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/ti/k3-am62p-main.=
dtsi
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (44c026a73be8 Linux 6.4-rc3)
Merging dmaengine/next (316d1225b112 dmaengine: fsl-dpaa2-qdma: add missing=
 MODULE_DESCRIPTION() macro)
Merging cgroup/for-next (147b4f64b42f Merge branch 'for-6.10-fixes' into fo=
r-next)
Merging scsi/for-next (dbe36d249533 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (06b91c00db39 Merge patch series "mpi3mr: Host di=
ag buffer support")
Merging vhost/linux-next (c8fae27d141a virtio-pci: Check if is_avq is NULL)
Merging rpmsg/for-next (8fa5d65ee3f2 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
$ git reset --hard HEAD^
Merging next-20240625 version of rpmsg
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (3550b5db3af4 dt-bindings: gpio: fsl,qoriq-=
gpio: add common property gpio-line-names)
Merging gpio-intel/for-next (1613e604df0c Linux 6.10-rc1)
Merging pinctrl/for-next (0cd9f140389b pinctrl: mlxbf3: Fix return value ch=
eck for devm_platform_ioremap_resource)
Merging pinctrl-intel/for-next (1613e604df0c Linux 6.10-rc1)
Merging pinctrl-renesas/renesas-pinctrl (fb0024d1d074 pinctrl: renesas: r8a=
779h0: Remove unneeded separators)
Merging pinctrl-samsung/for-next (707807f4c112 pinctrl: samsung: Use scope =
based of_node_put() cleanups)
Merging pwm/pwm/for-next (b8689bb9b901 pwm-stm32: Make use of parametrised =
register definitions)
Merging ktest/for-next (07283c1873a4 ktest: force $buildonly =3D 1 for 'mak=
e_warnings_file' test type)
Merging kselftest/next (15a783a493b0 selftests: Add information about TAP c=
onformance in tests)
Merging kunit/test (1613e604df0c Linux 6.10-rc1)
Merging kunit-next/kunit (cf6219ee889f usercopy: Convert test_user_copy to =
KUnit test)
Merging livepatching/for-next (046635d2eb61 Merge branch 'for-6.11' into fo=
r-next)
Merging rtc/rtc-next (43696b3a9e46 rtc: isl1208: Update correct procedure f=
or clearing alarm)
Merging nvdimm/libnvdimm-for-next (b0d478e34dbf testing: nvdimm: Add MODULE=
_DESCRIPTION() macros)
Merging at24/at24/for-next (1613e604df0c Linux 6.10-rc1)
Merging ntb/ntb-next (9341b37ec17a ntb_perf: Fix printk format)
Merging seccomp/for-next/seccomp (22cc0f3b4d0c selftests/seccomp: check tha=
t a zombie leader doesn't affect others)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (1613e604df0c Linux 6.10-rc1)
Merging nvmem/for-next (65f09ab3b3ef Merge branches 'nvmem-fixes' and 'for-=
6.11' into nvmem-for-next)
Merging xarray/main (2a15de80dd0f idr: fix param name in idr_alloc_cyclic()=
 doc)
Merging hyperv/hyperv-next (f2580a907e5c x86/hyperv: Use Hyper-V entropy to=
 seed guest random number generator)
Merging auxdisplay/for-next (2ccfe94bc3ac auxdisplay: ht16k33: Drop referen=
ce after LED registration)
Merging kgdb/kgdb/for-next (9bccbe7b2087 kdb: Get rid of redundant kdb_curr=
_task())
Merging hmm/hmm (6613476e225e Linux 6.8-rc1)
Merging cfi/cfi/next (06c2afb862f9 Linux 6.5-rc1)
Merging mhi/mhi-next (c7d0b2db5bc5 bus: mhi: ep: Do not allocate memory for=
 MHI objects from DMA zone)
Merging memblock/for-next (94ff46de4a73 memblock: Move late alloc warning d=
own to phys alloc)
CONFLICT (content): Merge conflict in mm/memblock.c
Merging cxl/next (1613e604df0c Linux 6.10-rc1)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (2e15194fbc85 x86/efi: Drop support for fake EFI memory ma=
ps)
Merging unicode/for-next (68318904a775 unicode: add MODULE_DESCRIPTION() ma=
cros)
Merging slab/slab/for-next (f10d55c75472 slab: delete useless RED_INACTIVE =
and RED_ACTIVE)
CONFLICT (content): Merge conflict in lib/fortify_kunit.c
Merging random/master (c286c21ff942 Merge tag 'block-6.10-20240614' of git:=
//git.kernel.dk/linux)
Merging landlock/next (591561c2b47b landlock: Use bit-fields for storing ha=
ndled layer access masks)
Merging rust/rust-next (1613e604df0c Linux 6.10-rc1)
Merging sysctl/sysctl-next (acc154691fc7 sysctl: Warn on an empty procname =
element)
Merging execve/for-next/execve (2a97388a807b ELF: fix kernel.randomize_va_s=
pace double read)
Merging bitmap/bitmap-for-next (e0eeb938adb0 bitops: Add a comment explaini=
ng the double underscore macros)
CONFLICT (content): Merge conflict in include/linux/cpumask.h
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (350e853715b2 Merge branches 'for-linus/hardenin=
g' and 'for-next/hardening' into for-next/kspp)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (1613e604df0c Linux 6.10-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (53e6b65693b6 iommufd/iova_bitmap: Remove iterator=
 logic)
Merging turbostat/next (c6bd6265bc18 tools/power turbostat: Group SMI count=
er with APERF and MPERF)
Merging pwrseq/pwrseq/for-next (6140d185a43d PCI/pwrctl: Add a PCI power co=
ntrol driver for power sequenced devices)
  249ebf3f65f8 ("power: sequencing: implement the pwrseq core")
  2f1630f437df ("power: pwrseq: add a driver for the PMU module on the QCom=
 WCN chipsets")
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)
Applying: fs/procfs: fix integer to pointer cast warning in do_procmap_quer=
y()
Applying: fix up for "HID: add source argument to HID low level functions"
Applying: Revert "drm/omap: Allow build with COMPILE_TEST=3Dy"

--Sig_/EPwWysL6eun8eu+.+pdyWy6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCeXcACgkQAVBC80lX
0GyAjAgAljjzj1OK+1e9L3Vd+qydC8Rt9g6Bj5Q9sIiQgh07Qixyjf2MO5sK6c+t
rnvf9vZmqTkoEBtIixCco1xb+NW09a9nWHOKCPmBnbFChVf9gdKxPxG/Q6owpWOE
CZNmmjpgQKYlahaxz4CSfHGxz9Je0V40tF26D8qhZJcJwaePh8o4e0KHVrWBaEdm
34TiZcNAPBdK037bbQHiE8NLlZwFTRczCs3pRCxFeCo0JTRtolKsup2jR6pabCJy
/L7IGO3wPaJ1GEILfENVFH0iR0USM4Q8Ut0/DWCPQGqoPgVBsCK3WtD0dds/Lt69
aJFGHcCa3p+OvVs0G9mv8rcdNALreg==
=mMv8
-----END PGP SIGNATURE-----

--Sig_/EPwWysL6eun8eu+.+pdyWy6--

