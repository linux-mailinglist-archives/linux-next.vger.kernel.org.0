Return-Path: <linux-next+bounces-2926-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DECF92CF91
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 12:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 834EF1C21DC9
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 10:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FE0198851;
	Wed, 10 Jul 2024 10:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hyIGh3gq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3DE196D9E;
	Wed, 10 Jul 2024 10:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720607816; cv=none; b=gVzVyjmTsmc3rOEkX5HBgy51woBBB+UATU7tqwttYhaBoscFZ7nr8wlxve5q6DfgVXxs/p0mIxVLpXfKkP2HLkpYGkyx8swTRYLpJ4RqIoKqk2jIS4FqTmR4eaIUloEJZMsnGqg0Zcs1hCIzzI20YaPzjXPtpUzW1PDidzfCjIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720607816; c=relaxed/simple;
	bh=17V+C5JMppdYYlznbpV1JxOmXobVYRjJSLhJePUSCe0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hwBrTEYoHkn9AimWBO1jCEvdd6KpaytbEhlg592DaMKGHUMGC/oyvTNcWe5ytZgCgaT0yBJRwZj3m3vtRzu52JaOeElQ7hYF9BVpMWuJTWP7ej/0lfxKNiKQU3ocTpkzfdY5+jsc+Sg0JLmDqPHeMtN+9Y/njOngriadY/Sl/5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hyIGh3gq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720607808;
	bh=cXIFRknkO6kY2y251nfqWVl3OXvKVWcL4SLYnvVIUwc=;
	h=Date:From:To:Cc:Subject:From;
	b=hyIGh3gqvrQTRsgZh1caYjg9KgvK5LGako00QdTuco3LyqLz42xI3fYWARD4YRN32
	 9uUpNBLHS5KdOsvbFTkb4pEj5Qbhwd1QKTKRbZooeWKg6smXjgP/287TWAvhfksg3R
	 lthfZ9UIJi75SOi4NaOXLzui65aTYsFFpqWBnVCzFir0/lfCTwQd+64CgMBWcVtyj+
	 UV7x2N80t6QnTD/dnN7UdHNgsynwjDTpRcslKB7D5JjkIChidzd4saiZ9Hf3zIxWrJ
	 1FUo4xNjl1FyQZ0zpICyBv7E02+x9m6BodpW/7NcH7/HDj8p+TSPhCH8m0/z8FK8IN
	 ZoyognnIvKGMA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJvRh1lptz4w2R;
	Wed, 10 Jul 2024 20:36:48 +1000 (AEST)
Date: Wed, 10 Jul 2024 20:36:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 10
Message-ID: <20240710203646.306d9190@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NYRIbLSHrHYuucegfi.2CzU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NYRIbLSHrHYuucegfi.2CzU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20240709:

The mm tree lost its build failure but gained another for which I applied
a patch.

The dma-mapping tree gained a build failure for which I applied a patch.

The drm tree still had its build failures for which I reverted a commit.

The mfd tree gained a conflict against the mmc tree.

The leds-lj tree gained a build failure so I used the version from
next-20240709.

Non-merge commits (relative to Linus' tree): 11134
 11585 files changed, 830616 insertions(+), 214053 deletions(-)

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
Merging origin/master (34afb82a3c67 Merge tag '6.10-rc6-smb3-server-fixes' =
of git://git.samba.org/ksmbd)
Merging fixes/fixes (2dde18cd1d8f Linux 6.5)
Merging mm-hotfixes/mm-hotfixes-unstable (557b663c654c dt-bindings: arm: op=
date James Clark's email address)
Merging vfs-brauner-fixes/vfs.fixes (0570730c1630 hfsplus: fix uninit-value=
 in copy_name)
Merging fscrypt-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging fsverity-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging btrfs-fixes/next-fixes (f04a05bcdad5 Merge branch 'misc-6.10' into =
next-fixes)
Merging vfs-fixes/fixes (bba1f6758a9e lirc: rc_dev_get_from_fd(): fix file =
leak)
Merging erofs-fixes/fixes (9b32b063be10 erofs: ensure m_llen is reset to 0 =
if metadata is invalid)
Merging nfsd-fixes/nfsd-fixes (ac03629b1612 Revert "nfsd: fix oops when rea=
ding pool_stats before server is started")
Merging v9fs-fixes/fixes/next (1613e604df0c Linux 6.10-rc1)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging fs-current (e8ee69b5fe5d Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging kbuild-current/fixes (22a40d14b572 Linux 6.10-rc6)
Merging arc-current/for-curr (e67572cd2204 Linux 6.9-rc6)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (ecc54006f158 arm64: Clear the initial I=
D map correctly before remapping)
Merging arm-soc-fixes/arm/fixes (f3a6a54104b8 MAINTAINERS: Move myself from=
 SPRD Maintainer to Reviewer)
Merging davinci-current/davinci/for-current (6613476e225e Linux 6.8-rc1)
Merging drivers-memory-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging sophgo-fixes/fixes (90f6cc7f8e07 riscv: dts: sophgo: disable write-=
protection for milkv duo)
Merging m68k-current/for-linus (ec8c8266373f m68k: defconfig: Update defcon=
figs for v6.9-rc1)
Merging powerpc-fixes/fixes (8b7f59de92ac selftests/powerpc: Fix build with=
 USERCFLAGS set)
Merging s390-fixes/fixes (b3a58f3b90f5 s390/dasd: Fix invalid dereferencing=
 of indirect CCW data pointer)
Merging net/main (f153831097b4 net: fix rc7's __skb_datagram_iter())
Merging bpf/master (f153831097b4 net: fix rc7's __skb_datagram_iter())
Merging ipsec/master (2d5317753e5f xfrm: Export symbol xfrm_dev_state_delet=
e.)
Merging netfilter/main (9f6958ba2e90 netfilter: nf_tables: unconditionally =
flush pending work before notifier)
Merging ipvs/main (9f6958ba2e90 netfilter: nf_tables: unconditionally flush=
 pending work before notifier)
Merging wireless/for-next (4130c67cd123 wifi: iwlwifi: mvm: check vif for N=
ULL/ERR_PTR before dereference)
Merging wpan/master (b8ec0dc3845f net: mac802154: Fix racy device stats upd=
ates by DEV_STATS_INC() and DEV_STATS_ADD())
Merging rdma-fixes/for-rc (f2661062f16b Linux 6.10-rc5)
Merging sound-current/for-linus (b46953029c52 ALSA: hda/realtek: Enable Mut=
e LED on HP 250 G7)
Merging sound-asoc-fixes/for-linus (680e126ec040 firmware: cs_dsp: Use strn=
len() on name fields in V1 wmfw files)
Merging regmap-fixes/for-linus (76f19626bd35 regmap: add missing MODULE_DES=
CRIPTION() macros)
Merging regulator-fixes/for-linus (f2661062f16b Linux 6.10-rc5)
Merging spi-fixes/for-linus (8221545c440b spi: omap2-mcspi: Revert multi mo=
de support)
Merging pci-current/for-linus (1613e604df0c Linux 6.10-rc1)
Merging driver-core.current/driver-core-linus (6ba59ff42279 Linux 6.10-rc4)
Merging tty.current/tty-linus (2ac33975abda serial: qcom-geni: do not kill =
the machine on fifo underrun)
Merging usb.current/usb-linus (6d3c721e686e usb: gadget: configfs: Prevent =
OOB read/write in usb_string_copy())
Merging usb-serial-fixes/usb-linus (c15a688e4998 USB: serial: mos7840: fix =
crash on resume)
Merging phy/fixes (f2661062f16b Linux 6.10-rc5)
Merging staging.current/staging-linus (22a40d14b572 Linux 6.10-rc6)
Merging iio-fixes/fixes-togreg (1d7cfde11d49 staging: iio: frequency: ad983=
4: Validate frequency parameter value)
Merging counter-current/counter-current (22a40d14b572 Linux 6.10-rc6)
Merging char-misc.current/char-misc-linus (389637d4fb5f mei: vsc: Fix spell=
ing error)
Merging soundwire-fixes/fixes (f2661062f16b Linux 6.10-rc5)
Merging thunderbolt-fixes/fixes (f2661062f16b Linux 6.10-rc5)
Merging input-current/for-linus (7c7b1be19b22 Input: ads7846 - use spi_devi=
ce_id table)
Merging crypto-current/master (a5d8922ab2ae crypto: qat - fix linking error=
s when PCI_IOV is disabled)
Merging vfio-fixes/for-linus (d71a989cf5d9 vfio/pci: Insert full vma on mma=
p'd MMIO fault)
Merging kselftest-fixes/fixes (66cde337fa1b selftests/vDSO: remove duplicat=
e compiler invocations from Makefile)
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
Merging kvm-fixes/master (8ad209fc6448 Merge tag 'kvm-s390-master-6.10-1' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvms390-fixes/master (4c6abb7f7b34 KVM: s390: fix LPSWEY handling)
Merging hwmon-fixes/hwmon (6ba59ff42279 Linux 6.10-rc4)
Merging nvdimm-fixes/libnvdimm-fixes (33908660e814 ACPI: NFIT: Fix incorrec=
t calculation of idt size)
Merging cxl-fixes/fixes (a0f39d51dbf7 cxl: documentation: add missing files=
 to cxl driver-api)
Merging dma-mapping-fixes/for-linus (75961ffb5cb3 swiotlb: initialise restr=
icted pool list_head when SWIOTLB_DYNAMIC=3Dy)
Merging drivers-x86-fixes/fixes (e527a6127223 platform/x86: toshiba_acpi: F=
ix quickstart quirk handling)
Merging samsung-krzk-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging pinctrl-samsung-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging devicetree-fixes/dt/linus (2cf6b7d15a28 of/irq: Disable "interrupt-=
map" parsing for PASEMI Nemo)
Merging dt-krzk-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging scsi-fixes/fixes (7a6bbc2829d4 scsi: sd: Do not repeat the starting=
 disk message)
Merging drm-fixes/drm-fixes (256abd8e550c Linux 6.10-rc7)
Merging drm-intel-fixes/for-linux-next-fixes (f36139c756a9 i915/perf: Remov=
e code to update PWR_CLK_STATE for gen12)
Merging mmc-fixes/fixes (ab069ce12596 mmc: sdhci: Do not lock spinlock arou=
nd mmc_gpio_get_ro())
Merging rtc-fixes/rtc-fixes (1613e604df0c Linux 6.10-rc1)
Merging gnss-fixes/gnss-linus (6ba59ff42279 Linux 6.10-rc4)
Merging hyperv-fixes/hyperv-fixes (3b85a2eacd3d Documentation: hyperv: Add =
overview of Confidential Computing VM support)
Merging soc-fsl-fixes/fix (06c2afb862f9 Linux 6.5-rc1)
Merging risc-v-fixes/fixes (c562ba719df5 riscv: kexec: Avoid deadlock in ke=
xec crash path)
Merging riscv-dt-fixes/riscv-dt-fixes (e21de658f8e8 MAINTAINERS: thead: upd=
ate Maintainer)
Merging riscv-soc-fixes/riscv-soc-fixes (1613e604df0c Linux 6.10-rc1)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (a3e18a540541 Merge tag 'xfs-6.10-fixes-3' of git:/=
/git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging gpio-brgl-fixes/gpio/for-current (256abd8e550c Linux 6.10-rc7)
Merging gpio-intel-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging pinctrl-intel-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging auxdisplay-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging kunit-fixes/kunit-fixes (1613e604df0c Linux 6.10-rc1)
Merging memblock-fixes/fixes (8043832e2a12 memblock: use numa_valid_node() =
helper to check for invalid node ID)
Merging renesas-fixes/fixes (8c987693dc2d ARM: dts: renesas: rcar-gen2: Add=
 missing #interrupt-cells to DA9063 nodes)
Merging perf-current/perf-tools (7b2450bb4027 perf dsos: When adding a dso =
into sorted dsos maintain the sort order)
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
Merging pmdomain-fixes/fixes (ddab91f4b2de pmdomain: qcom: rpmhpd: Skip ret=
ention level for Power Domains)
Merging i2c-host-fixes/i2c/i2c-host-fixes (4e36c0f20cb1 i2c: rcar: bring ha=
rdware to known state when probing)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (10f84de27bd0 Merge tag 'qcom-clk-fixes-for-6.1=
0' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into clk-f=
ixes)
Merging pwrseq-fixes/pwrseq/for-current (83a7eefedc9b Linux 6.10-rc3)
Merging drm-misc-fixes/for-linux-next-fixes (cb520c3f366c drm/gma500: fix n=
ull pointer dereference in cdv_intel_lvds_get_modes)
Merging mm-stable/mm-stable (71547ac57102 mm: zswap: fix zswap_never_enable=
d() for CONFIG_ZSWAP=3D=3DN)
Merging mm-nonmm-stable/mm-nonmm-stable (0f3819e8c483 nilfs2: avoid undefin=
ed behavior in nilfs_cnt32_ge macro)
Merging mm/mm-everything (c94a01613651 foo)
Applying: fixup for "init/modpost: conditionally check section mismatch to =
__meminit*"
Merging kbuild/for-next (cd843d58ee1d kbuild: deb-pkg: use default string w=
hen variable is unset or null)
Merging clang-format/clang-format (5a205c6a9f79 clang-format: Update with v=
6.7-rc4's `for_each` macro list)
Merging perf/perf-tools-next (608c3b1e612a perf install: Don't propagate su=
bdir to Documentation submake)
Merging compiler-attributes/compiler-attributes (2993eb7a8d34 Compiler Attr=
ibutes: counted_by: fixup clang URL)
Merging dma-mapping/for-next (b21a42af002d swiotlb: reduce swiotlb pool loo=
kups)
Applying: fixup for "swiotlb: reduce swiotlb pool lookups"
Merging asm-generic/master (f564176f4e4f riscv: convert to generic syscall =
table)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (b5e352609497 Merge branches 'clkdev', 'fixes' and 'mi=
sc' into for-next)
Merging arm64/for-next/core (8b288f7785c6 Merge branch 'for-next/misc' into=
 for-next/core)
Merging arm-perf/for-next/perf (dc4c33f753ca perf: arm_pmuv3: Add support f=
or Armv9.4 PMU instruction counter)
Merging arm-soc/for-next (cc121e3945aa Merge branch 'soc/dt' into for-next)
Merging amlogic/for-next (18542679e730 Merge branch 'v6.11/arm-dt' into for=
-next)
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
Merging imx-mxs/for-next (ffa7b132ee5f Merge branch 'imx/defconfig' into fo=
r-next)
  3898bc187cde ("arm64: defconfig: Enable the IWLWIFI driver")
Merging mediatek/for-next (1613e604df0c Linux 6.10-rc1)
Merging mvebu/for-next (ffd0d7df6bdb Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (5856330c3d56 Merge branch 'drivers-ti-sysc-for-v6.10=
' into for-next)
Merging qcom/for-next (6fd4da15c334 Merge branches 'arm32-for-6.11', 'arm64=
-defconfig-fixes-for-6.10', 'arm64-defconfig-for-6.11', 'arm64-fixes-for-6.=
10', 'arm64-for-6.11', 'clk-fixes-for-6.10', 'clk-for-6.11', 'drivers-fixes=
-for-6.10' and 'drivers-for-6.11' into for-next)
Merging renesas/next (5c91aa40e630 Merge branches 'renesas-arm-defconfig-fo=
r-v6.11' and 'renesas-dts-for-v6.11' into renesas-next)
Merging reset/reset/next (c1267e1afae6 arm64: dts: renesas: rz-smarc: Repla=
ce fixed regulator for USB VBUS)
Merging rockchip/for-next (d02701b77967 Merge branch 'v6.11-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (b305fd6840d1 Merge branch 'next/dt64' into f=
or-next)
  85863cee8ce0 ("soc: samsung: exynos-pmu: add support for PMU_ALIVE non at=
omic registers")
Merging scmi/for-linux-next (eaaeef9e62f9 Merge tags 'scmi-updates-6.11', '=
ffa-updates-6.11', 'vexpress-updates-6.11' and 'juno-updates-6.11' of ssh:/=
/gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-l=
inux-next)
Merging sophgo/for-next (1613e604df0c Linux 6.10-rc1)
Merging stm32/stm32-next (1eafc48af859 arm64: stm32: enable scmi regulator =
for stm32)
  1eafc48af859 ("arm64: stm32: enable scmi regulator for stm32")
Merging sunxi/sunxi/for-next (0682fbf17dd9 Merge branches 'sunxi/clk-fixes-=
for-6.10', 'sunxi/drivers-for-6.11' and 'sunxi/dt-for-6.11' into sunxi/for-=
next)
Merging tee/next (cd88a296582c Merge branch 'optee_notif_wait_timeout_for_v=
6.11' into next)
Merging tegra/for-next (5211d93c551f Merge branch for-6.11/arm64/defconfig =
into for-next)
Merging ti/ti-next (b6332e83c241 Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (41aa58501753 Merge branch 'zynqmp/soc' into for-ne=
xt)
Merging clk/clk-next (0e3575a61335 Merge branch 'clk-mediatek' into clk-nex=
t)
Merging clk-imx/for-next (466da3d2d967 clk: imx: composite-7ulp: Use NULL i=
nstead of 0)
Merging clk-renesas/renesas-clk (c7e58843d1e4 clk: renesas: r9a08g045: Add =
clock, reset and power domain support for I2C)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (a08dcaa69e33 Merge branch 'loongarch-kvm'=
 into loongarch-next)
CONFLICT (content): Merge conflict in arch/loongarch/include/uapi/asm/unist=
d.h
CONFLICT (content): Merge conflict in tools/perf/arch/loongarch/util/Build
Applying: fixup for "LoongArch: Define __ARCH_WANT_NEW_STAT in unistd.h"
Merging m68k/for-next (21b9e722ad28 m68k: cmpxchg: Fix return value for def=
ault case in __arch_xchg())
Merging m68knommu/for-next (256abd8e550c Linux 6.10-rc7)
Merging microblaze/next (1613e604df0c Linux 6.10-rc1)
Merging mips/mips-next (680e7863de0c MIPS: GIC: Generate redirect block acc=
essors)
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (2fd4e52e442c parisc: Use max() to calculate par=
isc_tlb_flush_threshold)
Merging powerpc/next (20ce0c247b25 powerpc/pci: Hotplug driver bridge suppo=
rt)
CONFLICT (content): Merge conflict in arch/powerpc/mm/nohash/Makefile
Merging soc-fsl/next (fb9c384625dd bus: fsl-mc: fsl-mc-allocator: Drop a wr=
ite-only variable)
Merging risc-v/for-next (60a6707f582e Merge patch series "riscv: Memory Hot=
(Un)Plug support")
CONFLICT (content): Merge conflict in arch/riscv/kernel/patch.c
Merging riscv-dt/riscv-dt-for-next (2904244a8c46 riscv: dts: starfive: add =
PCIe dts configuration for JH7110)
Merging riscv-soc/riscv-soc-for-next (c813ef3c5f6c MAINTAINERS: drop riscv =
list from cache controllers)
Merging s390/for-next (313a6dadfa35 Merge branch 'features' into for-next)
Merging sh/for-next (1613e604df0c Linux 6.10-rc1)
Merging sparc/for-next (1c9e709cde80 sparc/leon: Remove on-stack cpumask va=
r)
Merging uml/next (98ff534ec2cd um: vector: always reset vp->opened)
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging bcachefs/for-next (d6d793ae5589 bcachefs: Simplify btree key cache =
fill path)
CONFLICT (content): Merge conflict in fs/bcachefs/super.c
[fs-next af7c9743097a] Merge branch 'for-next' of https://evilpiepirate.org=
/git/bcachefs.git
Merging pidfd/for-next (a901a3568fd2 Merge tag 'iomap-6.5-merge-1' of git:/=
/git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging fscrypt/for-next (256abd8e550c Linux 6.10-rc7)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (871a1174fd0c Merge branch 'for-next-next-v6.10-2024=
0704' into for-next-20240704)
Merging ceph/master (93a2221c9c1a doc: ceph: update userspace command to ge=
t CephFS metadata)
Merging cifs/for-next (e8e820877963 cifs: fix setting SecurityFlags to true)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging dlm/next (89b01913dc73 dlm: add rcu_barrier before destroy kmem cac=
he)
Merging erofs/dev (2080ca1ed3e4 erofs: tidy up `struct z_erofs_bvec`)
Merging exfat/dev (0daa52fbc7ac exfat: fix potential deadlock on __exfat_ge=
t_dentry_set)
Merging exportfs/exportfs-next (e8f897f4afef Linux 6.8)
Merging ext3/for_next (85f22bb5d2c2 Merge UDF consistency fixes.)
Merging ext4/dev (83f4414b8f84 ext4: sanity check for NULL pointer after ex=
t4_force_shutdown)
  89a8718cef85 ("jbd2: add missing MODULE_DESCRIPTION()")
Merging f2fs/dev (388a2a0640e1 f2fs: remove redundant sanity check in sanit=
y_check_inode())
Merging fsverity/for-next (256abd8e550c Linux 6.10-rc7)
Merging fuse/for-next (529395d2ae64 virtio-fs: add multi-queue support)
Merging gfs2/for-next (f75efefb6db3 gfs2: Clean up glock demote logic)
Merging jfs/jfs-next (d0fa70aca54c jfs: don't walk off the end of ealist)
Merging ksmbd/ksmbd-for-next (e2e33caa5dc2 ksmbd: discard write access to t=
he directory open)
Merging nfs/linux-next (22a40d14b572 Linux 6.10-rc6)
Merging nfs-anna/linux-next (b571cfcb9dca nfs: don't reuse partially comple=
ted requests in nfs_lock_and_join_requests)
Merging nfsd/nfsd-next (a3123341dc35 gss_krb5: Fix the error handling path =
for crypto_sync_skcipher_setkey)
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
Merging xfs/for-next (49cdc4e834e4 xfs: get rid of xfs_ag_resv_rmapbt_alloc)
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
Merging vfs-brauner/vfs.all (5f30e082ab8b Merge branch 'vfs.iomap' into vfs=
.all Signed-off-by: Christian Brauner <brauner@kernel.org>)
CONFLICT (content): Merge conflict in fs/btrfs/inode.c
[fs-next 097b5bc6147b] Merge branch 'vfs.all' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/vfs/vfs.git
Merging vfs/for-next (a38297e3fb01 Linux 6.9)
Merging fs-next (097b5bc6147b Merge branch 'vfs.all' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/vfs/vfs.git)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/unistd.h
CONFLICT (content): Merge conflict in arch/arm64/include/asm/unistd32.h
CONFLICT (content): Merge conflict in fs/nfs/internal.h
Applying: fixup for "fs/xattr: add *at family syscalls"
Merging printk/for-next (07c2ab22a8da Merge branch 'for-6.11' into for-next)
Merging pci/next (d9dcb950e926 Merge branch 'pci/misc')
CONFLICT (content): Merge conflict in drivers/pci/pci.c
Merging pstore/for-next/pstore (9b3c13c9ea4e pstore: platform: add missing =
MODULE_DESCRIPTION() macro)
Merging hid/for-next (3959f155ad59 Merge branch 'for-6.11/bpf' into for-nex=
t)
CONFLICT (content): Merge conflict in include/linux/hid_bpf.h
Merging i2c/i2c/for-next (35dc6101fd9c Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i2c-host/i2c/i2c-host (fd6acb0d21b8 i2c: mt7621: Add Airoha EN7581 =
i2c support)
Merging i3c/i3c/next (145ca7b61e95 i3c: dw: Add optional apb clock)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (f4a180247e06 hwmon: (g762) Initialize fan=
s after configuring clock)
Merging jc_docs/docs-next (4049657ff563 Merge branch 'docs-mw' into docs-ne=
xt)
Merging v4l-dvb/master (156922faabce media: atomisp: Switch to new Intel CP=
U model defines)
Merging v4l-dvb-next/master (5d5f67b3b23f media: atomisp: Fix spelling mist=
akes in sh_css_sp.c)
Merging pm/linux-next (72d2d9b52a2d Merge branch 'pm-opp' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (d992f881764c cpufreq: sti: fix =
build warning)
Merging cpupower/cpupower (3a5bb5066f4c cpupower: fix lib default installat=
ion path)
Merging devfreq/devfreq-next (1d143dde7679 PM / devfreq: exynos: Use Use de=
vm_clk_get_enabled() helpers)
Merging pmdomain/next (67ce905f5f72 mdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (e3943f00afdb OPP: Introduce an OF helper functi=
on to inform if required-opps is used)
Merging thermal/thermal/linux-next (7eeb114a635a dt-bindings: thermal: conv=
ert hisilicon-thermal.txt to dt-schema)
Merging rdma/for-next (af48f95492dc RDMA/core: Introduce "name_assign_type"=
 for an IB device)
Merging net-next/main (40ab9e0dc865 netxen_nic: Use {low,upp}er_32_bits() h=
elpers)
CONFLICT (content): Merge conflict in arch/riscv/net/bpf_jit_comp64.c
Applying: HID: bpf: Fix up build
Merging bpf-next/for-next (605c96997d89 bpf: relax zero fixed offset constr=
aint on KF_TRUSTED_ARGS/KF_RCU)
Merging ipsec-next/master (f531d13bdfe3 xfrm: support sending NAT keepalive=
s in ESP in UDP states)
Merging mlx5-next/mlx5-next (b339e0a39dc3 RDMA/mlx5: Add Qcounters req_tran=
sport_retries_exceeded/req_rnr_retries_exceeded)
Merging netfilter-next/main (ac26327635d6 Merge branch 'fixes-for-stm32-dwm=
ac-driver-fails-to-probe')
Merging ipvs-next/main (ac26327635d6 Merge branch 'fixes-for-stm32-dwmac-dr=
iver-fails-to-probe')
Merging bluetooth/master (c6052c312e85 Bluetooth: btnxpuart: Add system sus=
pend and resume handlers)
CONFLICT (content): Merge conflict in net/bluetooth/hci_core.c
Merging wireless-next/for-next (0321e45737b8 Merge tag 'rtw-next-2024-07-05=
' of https://github.com/pkshih/rtw)
Merging wpan-next/master (9187210eee7d Merge tag 'net-next-6.9' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging wpan-staging/staging (9187210eee7d Merge tag 'net-next-6.9' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mtd/mtd/next (2538af030d6f mtd: cmdlinepart: Replace `dbg()` macro =
with `pr_debug()`)
Merging nand/nand/next (5f713030117a mtd: rawnand: lpx32xx: Fix dma_request=
_chan() error checks)
Merging spi-nor/spi-nor/next (d35df77707bf mtd: spi-nor: winbond: fix w25q1=
28 regression)
Merging crypto/master (8323c036789b crypto: starfive - Fix nent assignment =
in rsa dec)
Merging drm/drm-next (62a05f4ae9c1 Merge tag 'drm-msm-next-2024-07-04' of h=
ttps://gitlab.freedesktop.org/drm/msm into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_migrate.c
Merging drm-exynos/for-linux-next (221009347844 drm/exynos/vidi: convert to=
 struct drm_edid)
Merging drm-misc/for-linux-next (ec85147a3529 drm/panel: sharp-lq101r1sx01:=
 Fixed reversed "if" in remove)
Merging amdgpu/drm-next (ee98fb71baa8 drm/amdgpu: set CP_HQD_PQ_DOORBELL_CO=
NTROL.DOORBELL_MODE to 1)
Merging drm-intel/for-linux-next (b2013783c445 drm/i915/display: Cache adpa=
tive sync caps to use it later)
Merging drm-tegra/for-next (2429b3c529da drm/tegra: Avoid potential 32-bit =
integer overflow)
Merging drm-msm/msm-next (fe34394ecdad dt-bindings: display/msm: dsi-contro=
ller-main: Add SM7150)
Merging drm-msm-lumag/msm-next-lumag (399af57ccca2 dt-bindings: display/msm=
/gpu: fix the schema being not applied)
Merging drm-xe/drm-xe-next (3d122660dc70 drm/xe/gt: Remove double include)
Merging etnaviv/etnaviv/next (704d3d60fec4 drm/etnaviv: don't block schedul=
er when GPU is still active)
Merging fbdev/for-next (7ee6cfe6d9cf fbdev: omap2: Return clk_prepare_enabl=
e to transfer the error)
Merging regmap/for-next (3dc4236dc44d Merge remote-tracking branch 'regmap/=
for-6.11' into regmap-next)
Merging sound/for-next (d2eb433c8546 ALSA: ppc: keywest: Drop explicit init=
ialization of struct i2c_device_id::driver_data to 0)
Merging ieee1394/for-next (9f349e8e532d Revert "firewire: ohci: use common =
macro to interpret be32 data in le32 buffer")
Merging sound-asoc/for-next (31e84a3d57d0 Merge remote-tracking branch 'aso=
c/for-6.11' into asoc-next)
Merging modules/modules-next (61842868de13 module: create weak dependecies)
Merging input/next (5e91cef94426 Input: himax_hx83112b - add support for HX=
83100A)
CONFLICT (content): Merge conflict in include/linux/interrupt.h
Merging block/for-next (1f04aa0a3392 Merge branch 'for-6.11/block' into for=
-next)
CONFLICT (content): Merge conflict in fs/stat.c
CONFLICT (content): Merge conflict in include/linux/fs.h
Merging device-mapper/for-next (299fb56df9ec dm raid: fix stripes adding re=
shape size issues)
Merging libata/for-next (f97106b10d9a ata: ahci: Add debug print for extern=
al port)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (c17aecf85800 mmc: dw_mmc-bluefield: Add support for eMMC =
HW reset)
Merging mfd/for-mfd-next (70b46487b155 mfd: tmio: Move header to platform_d=
ata)
CONFLICT (modify/delete): include/linux/mfd/tmio.h deleted in mfd/for-mfd-n=
ext and modified in HEAD.  Version HEAD of include/linux/mfd/tmio.h left in=
 tree.
$ git rm -f include/linux/mfd/tmio.h
Applying: fixup for "mfd: tmio: Move header to platform_data"
Merging backlight/for-backlight-next (1df5aa3754ca backlight: sky81452-back=
light: Use backlight power constants)
Merging battery/for-next (be6299c6e55e power: supply: sysfs: use power_supp=
ly_property_is_writeable())
CONFLICT (content): Merge conflict in include/linux/leds.h
Merging regulator/for-next (ef0b29e74496 regulator: dt-bindings: pca9450: M=
ake interrupt optional)
Merging security/next (08b377b86c0c Automated merge of 'dev' into 'next')
Merging apparmor/apparmor-next (3dd384108d53 apparmor: fix possible NULL po=
inter dereference)
Merging integrity/next-integrity (fbf06cee6087 ima: fix wrong zero-assignme=
nt during securityfs dentry remove)
Merging selinux/next (e123134b39dc selinux: Use 1UL for EBITMAP_BIT to matc=
h maps type)
Merging smack/next (e86cac0acdb1 smack: unix sockets: fix accept()ed socket=
 label)
Merging tomoyo/master (b96342141183 rtnetlink: print rtnl_mutex holder/wait=
er for debug purpose)
Merging tpmdd/next (bb3bd6a6663c tpm_tis_spi: add missing attpm20p SPI devi=
ce ID entry)
Merging watchdog/master (22a40d14b572 Linux 6.10-rc6)
Merging iommu/next (87b2e7792b68 Merge branches 'iommu/core', 'iommu/fwspec=
-ops-removal', 'iommu/pci/ats', 'iommu/iommufd/attach-handles', 'iommu/iomm=
ufd/paging-domain-alloc', 'iommu/allwinner/sun50i', 'iommu/amd/amd-vi', 'io=
mmu/arm/smmu', 'iommu/intel/vt-d' and 'iommu/qualcomm/msm' into iommu/next)
Merging audit/next (1613e604df0c Linux 6.10-rc1)
Merging devicetree/for-next (9ca5a7d9d2e0 dt-bindings: soc: fsl: Add fsl,ls=
1028a-reset for reset syscon node)
CONFLICT (content): Merge conflict in scripts/Makefile.lib
Merging dt-krzk/for-next (828f810f69f3 Merge branch 'next/dt64' into for-ne=
xt)
Merging mailbox/for-next (256abd8e550c Linux 6.10-rc7)
Merging spi/for-next (ad02097d49dd Merge remote-tracking branch 'spi/for-6.=
11' into spi-next)
Merging tip/master (aa9d8caba6e4 Merge timers/core into tip/master)
CONFLICT (content): Merge conflict in arch/x86/include/asm/cpufeatures.h
CONFLICT (content): Merge conflict in include/linux/cacheinfo.h
Merging clockevents/timers/drivers/next (0d8d1bd925c8 dt-bindings: timer: r=
enesas,tmu: Add R-Car Gen2 support)
Merging edac/edac-for-next (9a1c5fe0f0a8 Merge ras/edac-misc into for-next)
Merging ftrace/for-next (5dfebf3c26dc Merge ring-buffer/for-next)
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_64.tbl
CONFLICT (content): Merge conflict in include/uapi/asm-generic/unistd.h
Merging rcu/next (02219caa92b5 Merge branches 'doc.2024.06.06a', 'fixes.202=
4.07.04a', 'mb.2024.06.28a', 'nocb.2024.06.03a', 'rcu-tasks.2024.06.06a', '=
rcutorture.2024.06.06a' and 'srcu.2024.06.18a' into HEAD)
Merging paulmck/non-rcu/next (8122d6e11bd8 Merge branches 'cmpxchg.2024.07.=
04a', 'kcsan.2024.06.06a', 'lkmm.2024.06.06a', 'nolibc.2024.06.30a' and 'to=
rture.2024.05.30b' into HEAD)
Merging kvm/next (02b0d3b9d4dd Merge branch 'kvm-6.10-fixes' into HEAD)
CONFLICT (content): Merge conflict in arch/x86/include/asm/sev-common.h
Merging kvm-arm/next (4012664073a0 Merge branch kvm-arm64/misc into kvmarm/=
next)
Merging kvms390/next (7816e58967d0 kvm: s390: Reject memory region operatio=
ns for ucontrol VMs)
Merging kvm-ppc/topic/ppc-kvm (ca8dad041516 KVM: PPC: add missing MODULE_DE=
SCRIPTION() macros)
Merging kvm-riscv/riscv_kvm_next (e325618349cd RISC-V: KVM: Redirect AMO lo=
ad/store access fault traps to guest)
CONFLICT (content): Merge conflict in tools/perf/arch/riscv/util/Build
Merging kvm-x86/next (771df9ffadb8 Merge branch 'static_calls')
Merging xen-tip/linux-next (611ff1b1ae98 xen: privcmd: Fix possible access =
to a freed kirqfd instance)
Merging percpu/for-next (2d9ad81ef935 Merge branch 'for-6.8-fixes' into for=
-next)
Merging workqueues/for-next (fb7e4b92f44e Merge branch 'for-6.11' into for-=
next)
Merging sched-ext/for-next (e7a6395a889a sched_ext: Make scx_bpf_reenqueue_=
local() skip tasks that are being migrated)
Merging drivers-x86/for-next (d23430233494 platform/x86: hp-wmi: Fix platfo=
rm profile option switch bug on Omen and Victus laptops)
Merging chrome-platform/for-next (4baf1cc54433 power: supply: cros_charge-c=
ontrol: Fix signedness bug in charge_behaviour_store())
CONFLICT (content): Merge conflict in MAINTAINERS
Merging chrome-platform-firmware/for-firmware-next (fc2c1d716d4a firmware: =
google: add missing MODULE_DESCRIPTION() macros)
Merging hsi/for-next (f02cfe695047 HSI: ssi_protocol: Remove unused linux/g=
pio.h)
Merging leds-lj/for-leds-next (b9bd59026848 leds: flash: leds-qcom-flash: T=
est the correct variable in init)
$ git reset --hard HEAD^
Merging next-20240709 version of leds-lj
Merging ipmi/for-next (19a01155ddfe ipmi: Drop explicit initialization of s=
truct i2c_device_id::driver_data to 0)
Merging driver-core/driver-core-next (997197b58bf6 devres: Correct code sty=
le for functions that return a pointer type)
CONFLICT (content): Merge conflict in drivers/fsi/fsi-occ.c
CONFLICT (content): Merge conflict in drivers/reset/reset-meson-audio-arb.c
Applying: net: ethernet: rtsn: Fix up for remove() coversion to return void
Applying: drm: Fix up STM LVDS driver for void remove() conversion
Applying: fix up for "platform: Make platform_driver::remove() return void"
Merging usb/usb-next (179264157bba usb: dwc3: core: Check all ports when se=
t phy suspend)
Merging thunderbolt/next (49056c95df44 thunderbolt: debugfs: Use FIELD_GET(=
))
Merging usb-serial/usb-next (df8c0b8a03e8 USB: serial: garmin_gps: use stru=
ct_size() to allocate pkt)
Merging tty/tty-next (17199dfccd4b Documentation: kernel-parameters: Add DE=
VNAME:0.0 format for serial ports)
CONFLICT (content): Merge conflict in drivers/tty/serial/imx.c
Merging char-misc/char-misc-next (e56af94b9b54 misc: keba: Fix missing AUXI=
LIARY_BUS dependency)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/ven=
dor-prefixes.yaml
CONFLICT (content): Merge conflict in MAINTAINERS
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (2e5657aa5966 hwtracing: use for_each_endpoint_of_no=
de())
Merging fastrpc/for-next (1613e604df0c Linux 6.10-rc1)
Merging fpga/for-next (3a0fa8e97d30 fpga: altera-fpga2sdram: remove unused =
struct 'prop_map')
Merging icc/icc-next (226e58b20975 Merge branch 'icc-rpmh-qos' into icc-nex=
t)
Merging iio/togreg (1ebab783647a Merge tag 'mhi-for-v6.11' of ssh://gitolit=
e.kernel.org/pub/scm/linux/kernel/git/mani/mhi into char-misc-next)
Merging phy-next/next (2a011c3c12e8 phy: airoha: Add dtime and Rx AEQ IO re=
gisters)
CONFLICT (content): Merge conflict in include/linux/soc/samsung/exynos-regs=
-pmu.h
Merging soundwire/next (fdd3d14ca3c8 soundwire: debugfs: simplify with clea=
nup.h)
Merging extcon/extcon-next (e508f2606c0b extcon: Add LC824206XA microUSB sw=
itch driver)
Merging gnss/gnss-next (6ba59ff42279 Linux 6.10-rc4)
Merging vfio/next (abe8103da3c5 vfio/pci: Fix typo in macro to declare acce=
ssors)
Merging w1/for-next (26bf5fc86033 w1: Drop allocation error message)
Merging spmi/spmi-next (1613e604df0c Linux 6.10-rc1)
Merging staging/staging-next (d3401cefd0f7 staging: nvec: Use x instead of =
x !=3D NULL to improve readability.)
Merging counter-next/counter-next (7b47e79eac4c Merge tag 'ib-mfd-counter-v=
5.11' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd into co=
unter-next)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (44c026a73be8 Linux 6.4-rc3)
Merging dmaengine/next (316d1225b112 dmaengine: fsl-dpaa2-qdma: add missing=
 MODULE_DESCRIPTION() macro)
Merging cgroup/for-next (ecd36a3ae7ff Merge branch 'for-6.11' into for-next)
Merging scsi/for-next (dbe36d249533 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (6cd48c8f62ad Merge patch series "mpi3mr: Support=
 PCI Error Recovery")
CONFLICT (content): Merge conflict in drivers/scsi/mpi3mr/mpi3mr_transport.c
Merging vhost/linux-next (8e0f5a6d6030 virtio: rename virtio_find_vqs_info(=
) to virtio_find_vqs())
Merging rpmsg/for-next (d87dbfd31796 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (337049890b8c dt-bindings: gpio: convert At=
mel GPIO to json-schema)
Merging gpio-intel/for-next (1613e604df0c Linux 6.10-rc1)
Merging pinctrl/for-next (11eaac6e8e72 Merge tag 'renesas-pinctrl-for-v6.11=
-tag3' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drive=
rs into devel)
Merging pinctrl-intel/for-next (1613e604df0c Linux 6.10-rc1)
Merging pinctrl-renesas/renesas-pinctrl (2453e858e945 pinctrl: renesas: rzg=
2l: Support output enable on RZ/G2L)
Merging pinctrl-samsung/for-next (1613e604df0c Linux 6.10-rc1)
Merging pwm/pwm/for-next (9845ded2f4af pwm: Allow pwm state transitions fro=
m an invalid state)
Merging ktest/for-next (07283c1873a4 ktest: force $buildonly =3D 1 for 'mak=
e_warnings_file' test type)
Merging kselftest/next (e903350a13da selftests/x86: fix printk warnings rep=
orted by clang)
Merging kunit/test (1613e604df0c Linux 6.10-rc1)
Merging kunit-next/kunit (67c9971cd6d3 kunit/usercopy: Add missing MODULE_D=
ESCRIPTION())
Merging livepatching/for-next (9871e6af43db Merge branch 'for-6.11/sysfs-pa=
tch-replace' into for-next)
Merging rtc/rtc-next (a47d377e22c4 rtc: Drop explicit initialization of str=
uct i2c_device_id::driver_data to 0)
Merging nvdimm/libnvdimm-for-next (b0d478e34dbf testing: nvdimm: Add MODULE=
_DESCRIPTION() macros)
Merging at24/at24/for-next (3a9ba4e32230 dt-bindings: eeprom: at24: Add com=
patible for ONSemi N24S64B)
Merging ntb/ntb-next (9341b37ec17a ntb_perf: Fix printk format)
Merging seccomp/for-next/seccomp (f0c508faea64 selftests/seccomp: check tha=
t a zombie leader doesn't affect others)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (1613e604df0c Linux 6.10-rc1)
Merging nvmem/for-next (1613e604df0c Linux 6.10-rc1)
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
Merging mhi/mhi-next (65bc58c3dcad net: wwan: mhi: make default data link i=
d configurable)
Merging memblock/for-next (9364a7e40d54 memblock tests: fix implicit declar=
ation of function 'numa_valid_node')
CONFLICT (content): Merge conflict in mm/memblock.c
Merging cxl/next (86588139b843 Documentation: CXL Maturity Map)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (ebf5a79acf9a x86/efistub: Drop redundant clearing of BSS)
Merging unicode/for-next (68318904a775 unicode: add MODULE_DESCRIPTION() ma=
cros)
Merging slab/slab/for-next (fe4e761669ab Merge branch 'slab/for-6.11/bucket=
s' into slab/for-next)
Merging random/master (9507f35ffebb selftests/vDSO: add tests for vgetrando=
m)
CONFLICT (content): Merge conflict in mm/rmap.c
CONFLICT (content): Merge conflict in tools/testing/selftests/mm/Makefile
Merging landlock/next (395a02d04ed4 landlock: Use bit-fields for storing ha=
ndled layer access masks)
Merging rust/rust-next (fc6e66f4696b rust: add abstraction for `struct page=
`)
CONFLICT (content): Merge conflict in rust/bindings/bindings_helper.h
Merging sysctl/sysctl-next (acc154691fc7 sysctl: Warn on an empty procname =
element)
Merging execve/for-next/execve (2a97388a807b ELF: fix kernel.randomize_va_s=
pace double read)
Merging bitmap/bitmap-for-next (e0eeb938adb0 bitops: Add a comment explaini=
ng the double underscore macros)
CONFLICT (content): Merge conflict in include/linux/cpumask.h
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (cd3e31b57c39 Merge branch 'for-next/hardening' =
into for-next/kspp)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (1613e604df0c Linux 6.10-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (18dcca24963a Merge branch 'iommufd_pri' into iomm=
ufd for-next)
Merging turbostat/next (478a01016c08 tools/power turbostat: Fix typo in tur=
bostat.8)
Merging pwrseq/pwrseq/for-next (50b040ef3732 PCI/pwrctl: only call of_platf=
orm_populate() if CONFIG_OF is enabled)
CONFLICT (add/add): Merge conflict in drivers/power/sequencing/core.c
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)
Applying: Revert "drm/omap: Allow build with COMPILE_TEST=3Dy"

--Sig_/NYRIbLSHrHYuucegfi.2CzU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaOZD4ACgkQAVBC80lX
0GwfdAf8DfCyDo4BZnjYs4pZ8AuWrh5u/QBgIqLyGAHjMcNAkjSK7MEAGCb5RX3S
WZYxLpqFZmrUckVTquYtVp0UL8HR6ZLWgRuiPQuhEjXwa0ttDN3QoBYUguh1vTBx
Trk5GXYs4pAHvREqze5jOcEoFNE8VRuEMjUTvGXgC5qacO3GvmGh9ECfPgv/r9D6
vBuh5ZBC1+g9wYM523DPS1usq4Tv+ooNceK5KIy+v8Zit6rAGW+JnpstWfeq9CtQ
wtBaMEra+koV8jD3cu9bu8bcIoLQDreh0W3Q31zYMgR0fEKDMuhuIAFzUe2Ycmb3
z2oXaUZrFfy7TOKY+VFfzOug4GDH8w==
=yW//
-----END PGP SIGNATURE-----

--Sig_/NYRIbLSHrHYuucegfi.2CzU--

