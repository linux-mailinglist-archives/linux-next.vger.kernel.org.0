Return-Path: <linux-next+bounces-3230-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1D794746A
	for <lists+linux-next@lfdr.de>; Mon,  5 Aug 2024 06:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37E021F20F12
	for <lists+linux-next@lfdr.de>; Mon,  5 Aug 2024 04:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C52213D531;
	Mon,  5 Aug 2024 04:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BwykH1lI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573C9A3B;
	Mon,  5 Aug 2024 04:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722832802; cv=none; b=FOGfK72c9upuX6MUBeMzR1gNclg6OpYMRVQ3flfeRBn+zkPnroMStk7Ggok8Lf8q8XXFAHB79weRCv7qmVLx6j5UWryXXYvJ0YimJKCFVtR3p9evebNAOlI9ekIAsxLqC1uqR4oW5K2XUVD02vPqEvOQLl9752aloa2tlZKSyVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722832802; c=relaxed/simple;
	bh=x1uRlOhIoANFhO2sGltHi/yQ8JIUrArMSrNlOVKvLrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k6SCNoCNn3DUN70qK9WlPxMcEuQ1aSirYxzjpEek5r1frNQo6/imXEjo885tTC9ydQGto2j3VCQh/7yWqF2vOpeHoKd+Pdnezmr4yJvk78gASSdkWDk586mYsc4Y8qQ/jPZfAdzc/YfJY87AVOLmL7hYfys6tMc7d3hw62IwBOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BwykH1lI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722832792;
	bh=T3nd67mWpAaKF482I09CKBCPqNM9gUzm8WYkaH5tNa8=;
	h=Date:From:To:Cc:Subject:From;
	b=BwykH1lIf/Z6IJBTrDJU4eZwwxKXUAWQa4facj0ZqeiVYVCCum+wzXflm4oCAelz6
	 UV2bs5AozvzBYrKdk24FsRoy2YhEBjr+1dNMSK56OXbbAiYoKbxsBcxsg0dVfe5Cmv
	 H7kvNWw3cVkH7/WA7deuJd2S7+GJztBPHuK2pusvEdvpGSgqTF8RcXgyDQ8il5ScPi
	 zRJxcH7ndSynxjhQ87j2T1ppolej+jqCVkV1z25bf98Z1+tHpYCXOcWo5caqKPohl9
	 CvDm0EuUpMuw5c00fQNzvAx+Mk9rkgT3kMmhUVzcmRfn7o1IaErH0q14gIoHvzjb5l
	 VPB7iD+yg2+Mg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WckHr06LTz4wbR;
	Mon,  5 Aug 2024 14:39:51 +1000 (AEST)
Date: Mon, 5 Aug 2024 14:39:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 5
Message-ID: <20240805143951.2c65eff4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5=TG2gaOdclrQx2NbaDqZ8N";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5=TG2gaOdclrQx2NbaDqZ8N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20240802:

The qcom tree still had its build failure so I used the version from
next-20240801.

The cpufreq-arm tree lost its build failure.

Non-merge commits (relative to Linus' tree): 2563
 3025 files changed, 110973 insertions(+), 55357 deletions(-)

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

I am currently merging 380 trees (counting Linus' and 107 trees of bug
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
Merging origin/master (de9c2c66ad8e Linux 6.11-rc2)
Merging fixes/fixes (2dde18cd1d8f Linux 6.5)
Merging mm-hotfixes/mm-hotfixes-unstable (1272bf9ff24d crash: Fix riscv64 c=
rash memory reserve dead loop)
Merging vfs-brauner-fixes/vfs.fixes (fa0e22eb97a5 pidfd: prevent creation o=
f pidfds for kthreads)
Merging fscrypt-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging fsverity-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging btrfs-fixes/next-fixes (8d8ce2d7a07f Merge branch 'misc-6.11' into =
next-fixes)
Merging vfs-fixes/fixes (7858ffb98387 fix bitmap corruption on close_range(=
) with CLOSE_RANGE_UNSHARE)
Merging erofs-fixes/fixes (0c3836482481 Linux 6.10)
Merging nfsd-fixes/nfsd-fixes (91da337e5d50 nfsd: don't set SVC_SOCK_ANONYM=
OUS when creating nfsd sockets)
Merging v9fs-fixes/fixes/next (0c3836482481 Linux 6.10)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging fs-current (a30bdcb59da6 Merge branch 'nfsd-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/cel/linux)
Merging kbuild-current/fixes (8400291e289e Linux 6.11-rc1)
Merging arc-current/for-curr (e67572cd2204 Linux 6.9-rc6)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (cfb00a357864 arm64: jump_label: Ensure =
patched jump_labels are visible to all CPUs)
Merging arm-soc-fixes/arm/fixes (6fba5cbd323e MAINTAINERS: Update FREESCALE=
 SOC DRIVERS and QUICC ENGINE LIBRARY)
Merging davinci-current/davinci/for-current (6613476e225e Linux 6.8-rc1)
Merging drivers-memory-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging sophgo-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging m68k-current/for-linus (21b9e722ad28 m68k: cmpxchg: Fix return valu=
e for default case in __arch_xchg())
Merging powerpc-fixes/fixes (8b7f59de92ac selftests/powerpc: Fix build with=
 USERCFLAGS set)
Merging s390-fixes/fixes (33bd8d153c33 s390: Keep inittext section writable)
Merging net/main (14ab4792ee12 net/tcp: Disable TCP-AO static key after RCU=
 grace period)
Merging bpf/master (b9e7fc0aeda7 igc: Fix double reset adapter triggered fr=
om a single taprio cmd)
Merging ipsec/master (89a2aefe4b08 xfrm: call xfrm_dev_policy_delete when k=
ill policy)
Merging netfilter/main (14ab4792ee12 net/tcp: Disable TCP-AO static key aft=
er RCU grace period)
Merging ipvs/main (c22921df777d netfilter: iptables: Fix potential null-ptr=
-deref in ip6table_nat_table_init().)
Merging wireless/for-next (a47f3320bb4b wifi: ath12k: fix soft lockup on su=
spend)
Merging wpan/master (b8ec0dc3845f net: mac802154: Fix racy device stats upd=
ates by DEV_STATS_INC() and DEV_STATS_ADD())
Merging rdma-fixes/for-rc (8400291e289e Linux 6.11-rc1)
Merging sound-current/for-linus (478689b5990d ALSA: hda: Conditionally use =
snooping for AMD HDMI)
Merging sound-asoc-fixes/for-linus (93afd028fb5f ASoC: cs42l43: Cache shutt=
er IRQ control pointers)
Merging regmap-fixes/for-linus (c2429cc2c731 Merge remote-tracking branch '=
regmap/for-6.10' into regmap-linus)
Merging regulator-fixes/for-linus (8400291e289e Linux 6.11-rc1)
Merging spi-fixes/for-linus (e4c4638b6a10 spi: spidev: Add missing spi_devi=
ce_id for bh2228fv)
Merging pci-current/for-linus (5560a612c20d PCI: pciehp: Retain Power Indic=
ator bits for userspace indicators)
Merging driver-core.current/driver-core-linus (15fffc6a5624 driver core: Fi=
x uevent_show() vs driver detach race)
Merging tty.current/tty-linus (6e20753da6bc tty: vt: conmakehash: cope with=
 abs_srctree no longer in env)
Merging usb.current/usb-linus (b1dad2f09138 usb: typec: tipd: Delete extra =
semi-colon)
Merging usb-serial-fixes/usb-linus (00af4f3dda14 USB: serial: debug: do not=
 echo input by default)
Merging phy/fixes (3a07703a5230 phy: exynos5-usbdrd: fix error code in prob=
e())
Merging staging.current/staging-linus (8400291e289e Linux 6.11-rc1)
Merging iio-fixes/fixes-togreg (de80af5c2ffd iio: adc: ads1119: Fix IRQ fla=
gs)
Merging counter-current/counter-current (8400291e289e Linux 6.11-rc1)
Merging char-misc.current/char-misc-linus (ffcf2eb4bfa2 spmi: pmic-arb: add=
 missing newline in dev_err format strings)
Merging soundwire-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging thunderbolt-fixes/fixes (ab3de2c7ec91 thunderbolt: Fix memory leaks=
 in {port|retimer}_sb_regs_write())
Merging input-current/for-linus (684890a0185d Input: adc-joystick - fix opt=
ional value handling)
Merging crypto-current/master (df1e9791998a hwrng: core - remove (un)regist=
er_miscdev())
Merging vfio-fixes/for-linus (5a88a3f67e37 vfio/pci: Init the count variabl=
e in collecting hot-reset devices)
Merging kselftest-fixes/fixes (170c966cbe27 selftests: ksft: Fix finished()=
 helper exit code on skipped tests)
Merging dmaengine-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (b27d8946b5ed mtd: rawnand: rockchip: ensure NV=
DDR timings are rejected)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (e2ed53694e53 Merge tag 'tags/fixes-media-uvc-2=
0230722' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.g=
it)
Merging reset-fixes/reset/fixes (ab35896730a5 reset: hisilicon: hi6220: add=
 missing MODULE_DESCRIPTION() macro)
Merging mips-fixes/mips-fixes (8400291e289e Linux 6.11-rc1)
Merging at91-fixes/at91-fixes (1613e604df0c Linux 6.10-rc1)
Merging omap-fixes/fixes (0c3836482481 Linux 6.10)
Merging kvm-fixes/master (1773014a9759 Merge branch 'kvm-fixes' into HEAD)
Merging kvms390-fixes/master (4c6abb7f7b34 KVM: s390: fix LPSWEY handling)
Merging hwmon-fixes/hwmon (bd907ec07c7c hwmon: (asus-ec-sensors) remove VRM=
 temp X570-E GAMING)
Merging nvdimm-fixes/libnvdimm-fixes (33908660e814 ACPI: NFIT: Fix incorrec=
t calculation of idt size)
Merging cxl-fixes/fixes (a0f39d51dbf7 cxl: documentation: add missing files=
 to cxl driver-api)
Merging dma-mapping-fixes/for-linus (75961ffb5cb3 swiotlb: initialise restr=
icted pool list_head when SWIOTLB_DYNAMIC=3Dy)
Merging drivers-x86-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging samsung-krzk-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging pinctrl-samsung-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging devicetree-fixes/dt/linus (e1cf752ede8e dt-bindings: eeprom: at25: =
add fujitsu,mb85rs256 compatible)
Merging dt-krzk-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging scsi-fixes/fixes (f874d7210d88 scsi: sd: Keep the discard mode stab=
le)
Merging drm-fixes/drm-fixes (27ce65f65258 Revert "nouveau: rip out busy fen=
ce waits")
Merging drm-intel-fixes/for-linux-next-fixes (5b5115726601 drm/i915: Fix po=
ssible int overflow in skl_ddi_calculate_wrpll())
Merging mmc-fixes/fixes (9374ae912dbb mmc: mtk-sd: receive cmd8 data when h=
s400 tuning fail)
Merging rtc-fixes/rtc-fixes (1613e604df0c Linux 6.10-rc1)
Merging gnss-fixes/gnss-linus (8400291e289e Linux 6.11-rc1)
Merging hyperv-fixes/hyperv-fixes (3b85a2eacd3d Documentation: hyperv: Add =
overview of Confidential Computing VM support)
Merging soc-fsl-fixes/fix (06c2afb862f9 Linux 6.5-rc1)
Merging risc-v-fixes/fixes (3b6564427aea riscv: Fix linear mapping checks f=
or non-contiguous memory regions)
Merging riscv-dt-fixes/riscv-dt-fixes (8400291e289e Linux 6.11-rc1)
Merging riscv-soc-fixes/riscv-soc-fixes (8400291e289e Linux 6.11-rc1)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (a3e18a540541 Merge tag 'xfs-6.10-fixes-3' of git:/=
/git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging gpio-brgl-fixes/gpio/for-current (8400291e289e Linux 6.11-rc1)
Merging gpio-intel-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging pinctrl-intel-fixes/fixes (a366e46da10d pinctrl: meteorlake: Add Ar=
row Lake-H/U ACPI ID)
Merging auxdisplay-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging kunit-fixes/kunit-fixes (8400291e289e Linux 6.11-rc1)
Merging memblock-fixes/fixes (8043832e2a12 memblock: use numa_valid_node() =
helper to check for invalid node ID)
Merging renesas-fixes/fixes (8c987693dc2d ARM: dts: renesas: rcar-gen2: Add=
 missing #interrupt-cells to DA9063 nodes)
Merging perf-current/perf-tools (d27087c76e3c perf docs: Document cross com=
pilation)
Merging efi-fixes/urgent (ae835a96d72c x86/efistub: Revert to heap allocate=
d boot_params for PE entrypoint)
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (d6cca7631a4b power: supply: qcom_battmgr: Igno=
re extra __le32 in info payload)
Merging uml-fixes/fixes (73a23d771033 um: harddog: fix modular build)
Merging iommufd-fixes/for-rc (8400291e289e Linux 6.11-rc1)
Merging rust-fixes/rust-fixes (0ba521d6948e rust: macros: indent list item =
in `module!`'s docs)
Merging w1-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging pmdomain-fixes/fixes (ddab91f4b2de pmdomain: qcom: rpmhpd: Skip ret=
ention level for Power Domains)
Merging i2c-host-fixes/i2c/i2c-host-fixes (8400291e289e Linux 6.11-rc1)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (39a3396558fb clk: thead: fix dependency on clk=
_ignore_unused)
Merging pwrseq-fixes/pwrseq/for-current (8400291e289e Linux 6.11-rc1)
Merging thead-dt-fixes/thead-dt-fixes (8400291e289e Linux 6.11-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (62b45bab010d drm/test: fix the=
 gem shmem test to map the sg table.)
Merging mm-stable/mm-stable (8400291e289e Linux 6.11-rc1)
Merging mm-nonmm-stable/mm-nonmm-stable (8400291e289e Linux 6.11-rc1)
Merging mm/mm-everything (497fb6003421 foo)
Merging kbuild/for-next (1099ea6f4263 kbuild: clean up code duplication in =
cmd_fdtoverlay)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (7320ad972510 perf mem: Add -T/--data-type opt=
ion to report subcommand)
Merging compiler-attributes/compiler-attributes (8400291e289e Linux 6.11-rc=
1)
Merging dma-mapping/for-next (94ede2a3e913 profiling: remove stale percpu f=
lip buffer variables)
Merging asm-generic/master (a73df08ebb5a syscalls: fix syscall macros for n=
ewfstat/newfstatat)
CONFLICT (content): Merge conflict in arch/alpha/include/asm/io.h
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (ba954cad0ce7 Merge branches 'clkdev', 'fixes' and 'mi=
sc' into for-next)
Merging arm64/for-next/core (36639013b346 arm64: mm: Fix lockless walks wit=
h static and dynamic page-table folding)
Merging arm-perf/for-next/perf (42bebc7cca79 perf: add missing MODULE_DESCR=
IPTION() macros)
Merging arm-soc/for-next (285d9f79f0e5 Merge branch 'soc/arm' into for-next)
Merging amlogic/for-next (0c6580c514ec Merge branch 'v6.11/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (73feb9cd46f1 ARM: dts: aspeed: System1: Updates to=
 BMC board)
Merging at91/at91-next (1cdb1c9626a4 Merge branch 'at91-defconfig' into at9=
1-next)
Merging broadcom/next (350006650b29 Merge branch 'soc/next' into next)
Merging davinci/davinci/for-next (6613476e225e Linux 6.8-rc1)
Merging drivers-memory/for-next (23d22b0fe6a1 memory: emif: Use of_property=
_read_bool())
Merging imx-mxs/for-next (145b73c51732 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (5920acd88b52 Merge branch 'v6.11-next/dts64' int=
o for-next)
Merging mvebu/for-next (ffd0d7df6bdb Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (2a693870ef0d Merge branch 'omap-for-v6.12/soc' into =
omap-reset)
Merging qcom/for-next (335ac87eb2f6 Merge branches 'arm32-for-6.12', 'arm64=
-defconfig-fixes-for-6.11', 'arm64-fixes-for-6.11', 'arm64-for-6.12', 'clk-=
fixes-for-6.11', 'clk-for-6.12', 'drivers-fixes-for-6.11' and 'drivers-for-=
6.12' into for-next)
$ git reset --hard HEAD^
Merging next-20240801 version of qcom
Merging renesas/next (3f3b7f43c49a Merge branches 'renesas-arm-defconfig-fo=
r-v6.12' and 'renesas-dts-for-v6.12' into renesas-next)
Merging reset/reset/next (c1267e1afae6 arm64: dts: renesas: rz-smarc: Repla=
ce fixed regulator for USB VBUS)
Merging rockchip/for-next (140f87999691 Merge branch 'v6.11-armsoc/dtsfixes=
' into for-next)
Merging samsung-krzk/for-next (166203ab290c Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (94ede2a3e913 profiling: remove stale percpu fl=
ip buffer variables)
Merging sophgo/for-next (d9773e09addd riscv: dts: sophgo: Add i2c device su=
pport for sg2042)
Merging stm32/stm32-next (1eafc48af859 arm64: stm32: enable scmi regulator =
for stm32)
Merging sunxi/sunxi/for-next (2873085a8cd5 arm64: dts: allwinner: h700: Add=
 Anbernic RG35XX-SP)
Merging tee/next (cd88a296582c Merge branch 'optee_notif_wait_timeout_for_v=
6.11' into next)
Merging tegra/for-next (5211d93c551f Merge branch for-6.11/arm64/defconfig =
into for-next)
Merging thead-dt/thead-dt-for-next (32121e158449 riscv: dts: thead: add bas=
ic spi node)
Merging ti/ti-next (137d9e76ae0b Merge tag 'ti-k3-dt-for-v6.11-part2' into =
ti-k3-dts-next)
Merging xilinx/for-next (0c559f8a91de drivers: soc: xilinx: add the missing=
 kfree in xlnx_add_cb_for_suspend())
Merging clk/clk-next (1bfc59d9f5ba Merge branch 'clk-bindings' into clk-nex=
t)
Merging clk-imx/for-next (466da3d2d967 clk: imx: composite-7ulp: Use NULL i=
nstead of 0)
Merging clk-renesas/renesas-clk (42b54d52ecb7 clk: renesas: Add RZ/V2H(P) C=
PG driver)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (c0438fbbedb6 Merge branch 'loongarch-kvm'=
 into loongarch-next)
Merging m68k/for-next (21b9e722ad28 m68k: cmpxchg: Fix return value for def=
ault case in __arch_xchg())
Merging m68knommu/for-next (de9c2c66ad8e Linux 6.11-rc2)
Merging microblaze/next (d829e7ee6354 microblaze: Export xmb_manager functi=
ons)
Merging mips/mips-next (8400291e289e Linux 6.11-rc1)
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (d173d4d9e831 parisc: Improve monotonic clock_ge=
ttime() resolution on SMP machines)
Merging powerpc/next (9ff0251b2eb5 Merge branch 'topic/ppc-kvm' into next)
Merging soc-fsl/next (fb9c384625dd bus: fsl-mc: fsl-mc-allocator: Drop a wr=
ite-only variable)
Merging risc-v/for-next (dc1c8034e31b minmax: simplify min()/max()/clamp() =
implementation)
Merging riscv-dt/riscv-dt-for-next (8400291e289e Linux 6.11-rc1)
Merging riscv-soc/riscv-soc-for-next (8400291e289e Linux 6.11-rc1)
Merging s390/for-next (f24ef6ed4928 Merge branch 'fixes' into for-next)
Merging sh/for-next (8fe76a1c2264 sh: push-switch: Add missing MODULE_DESCR=
IPTION() macro)
Merging sparc/for-next (a3da15389112 sparc64: Fix prototype warnings in hib=
ernate.c)
Merging uml/next (98ff534ec2cd um: vector: always reset vp->opened)
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging bcachefs/for-next (c84469634e82 bcachefs: quota_reserve_range() -> =
for_each_btree_key_in_subvolume_upto)
Merging pidfd/for-next (a901a3568fd2 Merge tag 'iomap-6.5-merge-1' of git:/=
/git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging fscrypt/for-next (256abd8e550c Linux 6.10-rc7)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (787822ab0887 Merge branch 'for-next-next-v6.11-2024=
0802' into for-next-20240802)
Merging ceph/master (31634d7597d8 ceph: force sending a cap update msg back=
 to MDS for revoke op)
Merging cifs/for-next (cecb49e3594c smb3: fix setting SecurityFlags when en=
cryption is required)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging dlm/next (89b01913dc73 dlm: add rcu_barrier before destroy kmem cac=
he)
Merging erofs/dev (8c09c0984a79 erofs: simplify readdir operation)
Merging exfat/dev (89fc548767a2 exfat: fix potential deadlock on __exfat_ge=
t_dentry_set)
Merging exportfs/exportfs-next (0c3836482481 Linux 6.10)
Merging ext3/for_next (85f22bb5d2c2 Merge UDF consistency fixes.)
Merging ext4/dev (8400291e289e Linux 6.11-rc1)
Merging f2fs/dev (dc1c8034e31b minmax: simplify min()/max()/clamp() impleme=
ntation)
Merging fsverity/for-next (256abd8e550c Linux 6.10-rc7)
Merging fuse/for-next (529395d2ae64 virtio-fs: add multi-queue support)
Merging gfs2/for-next (6706415bf9f3 Merge tag 'gfs2-v6.10-rc1-fixes' of git=
://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2)
Merging jfs/jfs-next (d0fa70aca54c jfs: don't walk off the end of ealist)
Merging ksmbd/ksmbd-for-next (933069701c1b Merge tag '6.11-rc-smb3-server-f=
ixes' of git://git.samba.org/ksmbd)
Merging nfs/linux-next (de9c2c66ad8e Linux 6.11-rc2)
Merging nfs-anna/linux-next (b9fae9f06d84 SUNRPC: Fixup gss_status tracepoi=
nt error output)
Merging nfsd/nfsd-next (4a1536f14ee8 svcrdma: Handle device removal outside=
 of the CM event handler)
Merging ntfs3/master (8400291e289e Linux 6.11-rc1)
Merging orangefs/for-next (53e4efa470d5 orangefs: fix out-of-bounds fsid ac=
cess)
Merging overlayfs/overlayfs-next (004b8d1491b4 ovl: fix encoding fid for lo=
wer only root)
Merging ubifs/next (92a286e90203 ubi: Fix ubi_init() ubiblock_exit() sectio=
n mismatch)
Merging v9fs/9p-next (2211561723a6 9p: Enable multipage folios)
Merging v9fs-ericvh/ericvh/for-next (0c3836482481 Linux 6.10)
Merging xfs/for-next (7bf888fa26e8 xfs: convert comma to semicolon)
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
Merging vfs-brauner/vfs.all (cb0433302c1e Merge branch 'vfs.netfs' into vfs=
.all)
Merging vfs/for-next (a38297e3fb01 Linux 6.9)
Merging fs-next (b6b3ab6bae73 Merge branch 'vfs.all' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/vfs/vfs.git)
Merging printk/for-next (b18703ea7157 Merge branch 'rework/write-atomic' in=
to for-next)
Merging pci/next (79b01efa89b2 Merge branch 'pci/controller/affinity')
Merging pstore/for-next/pstore (9b3c13c9ea4e pstore: platform: add missing =
MODULE_DESCRIPTION() macro)
Merging hid/for-next (b17000228451 Merge branch 'for-6.12/wacom' into for-n=
ext)
Merging i2c/i2c/for-next (f17c06c6608a i2c: Fix conditional for substitutin=
g empty ACPI functions)
Merging i2c-host/i2c/i2c-host (8400291e289e Linux 6.11-rc1)
Merging i3c/i3c/next (24168c5e6dfb dt-bindings: i3c: add header for generic=
 I3C flags)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (9a7ad7611852 hwmon: (lm92) Update documen=
tation)
Merging jc_docs/docs-next (8663dd38a7ba docs/zh_CN: fix a broken reference)
Merging v4l-dvb/master (8400291e289e Linux 6.11-rc1)
Merging v4l-dvb-next/master (ba5c778cab1d media: rc: remove unused tx_resol=
ution field)
Merging pm/linux-next (5a4e6abbb58a Merge branch 'pm-cpufreq' into linux-ne=
xt)
  0f127178892e ("cpufreq: powerpc: add missing MODULE_DESCRIPTION() macros")
Merging cpufreq-arm/cpufreq/arm/linux-next (dca2ef2b7d91 cpufreq: spear: Us=
e of_property_for_each_u32() instead of open coding)
Merging cpupower/cpupower (8400291e289e Linux 6.11-rc1)
Merging devfreq/devfreq-next (1d143dde7679 PM / devfreq: exynos: Use Use de=
vm_clk_get_enabled() helpers)
Merging pmdomain/next (67ce905f5f72 mdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (8400291e289e Linux 6.11-rc1)
Merging thermal/thermal/linux-next (7eeb114a635a dt-bindings: thermal: conv=
ert hisilicon-thermal.txt to dt-schema)
Merging rdma/for-next (60dc7fcafea8 RDMA/siw: Remove NETDEV_GOING_DOWN even=
t handler)
Merging net-next/main (3608d6aca5e7 Merge branch 'dsa-en7581' into main)
  c4b28e5699d2 ("net: pse-pd: tps23881: Fix the device ID check")
Merging bpf-next/for-next (3d650ab5e7d9 selftests/bpf: Fix a btf_dump selft=
est failure)
Merging ipsec-next/master (8e0c0ec9b7dc Merge branch 'ethernet-convert-from=
-tasklet-to-bh-workqueue')
Merging mlx5-next/mlx5-next (8400291e289e Linux 6.11-rc1)
Merging netfilter-next/main (ac26327635d6 Merge branch 'fixes-for-stm32-dwm=
ac-driver-fails-to-probe')
Merging ipvs-next/main (ac26327635d6 Merge branch 'fixes-for-stm32-dwmac-dr=
iver-fails-to-probe')
Merging bluetooth/master (2360f368524b Bluetooth: hci_sync: avoid dup filte=
ring when passive scanning with adv monitor)
Merging wireless-next/for-next (420a549395c2 wifi: brcmsmac: clean up unnec=
essary current_ampdu_cnt and related checks)
Merging wpan-next/master (9187210eee7d Merge tag 'net-next-6.9' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging wpan-staging/staging (9187210eee7d Merge tag 'net-next-6.9' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mtd/mtd/next (78a0b13f5744 Merge tag 'nand/for-6.11' into mtd/next)
Merging nand/nand/next (a503f91a3645 mtd: rawnand: lpx32xx: Fix dma_request=
_chan() error checks)
Merging spi-nor/spi-nor/next (95b9c9a7777d mtd: spi-nor: micron-st: Add n25=
q064a WP support)
Merging crypto/master (e0d3b845a1b1 crypto: iaa - Fix potential use after f=
ree bug)
Merging drm/drm-next (8400291e289e Linux 6.11-rc1)
Merging drm-exynos/for-linux-next (627a24f5f25d Merge tag 'amd-drm-fixes-6.=
11-2024-07-18' of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
Merging drm-misc/for-linux-next (21e97d3ca814 drm/panel-edp: Fix HKC MB116A=
N01 name)
CONFLICT (content): Merge conflict in drivers/gpu/drm/ast/ast_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/v3d/v3d_sched.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/v3d/v3d_submit.c
Merging amdgpu/drm-next (c9bfc37f085a drm/amd/display: Add new enable and d=
isable functions for DCN35)
Merging drm-intel/for-linux-next (c0e0bde2c7e6 drm/i915: Use backlight powe=
r constants)
Merging drm-tegra/for-next (2429b3c529da drm/tegra: Avoid potential 32-bit =
integer overflow)
Merging drm-msm/msm-next (fe34394ecdad dt-bindings: display/msm: dsi-contro=
ller-main: Add SM7150)
Merging drm-msm-lumag/msm-next-lumag (399af57ccca2 dt-bindings: display/msm=
/gpu: fix the schema being not applied)
Merging drm-xe/drm-xe-next (2009e808bc3e drm/xe/xe2: Introduce performance =
changes)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_vm.c
Merging etnaviv/etnaviv/next (704d3d60fec4 drm/etnaviv: don't block schedul=
er when GPU is still active)
Merging fbdev/for-next (8b05b12e86ff fbdev/hpfb: Fix an error handling path=
 in hpfb_dio_probe())
Merging regmap/for-next (b18d17d1a97b Merge branch 'regmap-linus' into regm=
ap-next)
Merging sound/for-next (a48fee68a8fa ALSA: pcm_timer: use snd_pcm_direction=
_name())
Merging ieee1394/for-next (cd1bf52f94eb firewire: ohci: use static inline f=
unctions to serialize data of IT DMA)
Merging sound-asoc/for-next (cd24d1aa84ae Merge remote-tracking branch 'aso=
c/for-6.12' into asoc-next)
Merging modules/modules-next (61842868de13 module: create weak dependecies)
Merging input/next (63f92f11385d Input: tsc2004/5 - use guard notation when=
 acquiring mutexes/locks)
Merging block/for-next (168f25d97311 Merge branch 'for-6.12/block' into for=
-next)
Merging device-mapper/for-next (7f1c4909a821 dm vdo: fix a minor formatting=
 issue in vdo.rst)
Merging libata/for-next (b40824500eaa ata: libata: Remove ata_noop_qc_prep(=
))
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (538076ce6b8d mmc: Merge branch fixes into next)
Merging mfd/for-mfd-next (d94fc0f04121 dt-bindings: mfd: mediatek: Add code=
c property for MT6357 PMIC)
Merging backlight/for-backlight-next (fea88a13a5d1 backlight: l4f00242t03: =
Add check for spi_setup)
Merging battery/for-next (be6299c6e55e power: supply: sysfs: use power_supp=
ly_property_is_writeable())
Merging regulator/for-next (b03695d95213 regulator: Use of_property_read_bo=
ol())
Merging security/next (924e19c39e8f lsm: Refactor return value of LSM hook =
inode_copy_up_xattr)
Merging apparmor/apparmor-next (8400291e289e Linux 6.11-rc1)
Merging integrity/next-integrity (fbf06cee6087 ima: fix wrong zero-assignme=
nt during securityfs dentry remove)
Merging selinux/next (fc328c869c41 selinux: refactor code to return ERR_PTR=
 in selinux_netlbl_sock_genattr)
Merging smack/next (e86cac0acdb1 smack: unix sockets: fix accept()ed socket=
 label)
Merging tomoyo/master (dc1c8034e31b minmax: simplify min()/max()/clamp() im=
plementation)
Merging tpmdd/next (b4c635360613 KEYS: Remove unused declarations)
Merging watchdog/master (63d097d46799 dt-bindings: watchdog: dlg,da9062-wat=
chdog: Drop blank space)
Merging iommu/next (fca5b78511e9 iommu: Restore lost return in iommu_report=
_device_fault())
Merging audit/next (8400291e289e Linux 6.11-rc1)
Merging devicetree/for-next (b31b9fb57878 dt-bindings: hwmon: Document TI T=
PS546D24)
Merging dt-krzk/for-next (8400291e289e Linux 6.11-rc1)
Merging mailbox/for-next (a8bd68e4329f mailbox: mtk-cmdq: Move devm_mbox_co=
ntroller_register() after devm_pm_runtime_enable())
Merging spi/for-next (51181a73934f Merge remote-tracking branch 'spi/for-6.=
12' into spi-next)
Merging tip/master (435dfff07e5b Merge branch into tip/master: 'x86/timers')
Merging clockevents/timers/drivers/next (b7625d67eb1a Merge tag 'timers-v6.=
11-rc1' of https://git.linaro.org/people/daniel.lezcano/linux into timers/c=
ore)
Merging edac/edac-for-next (090786479325 Merge ras/edac-misc into for-next)
Merging ftrace/for-next (656a95786db8 Merge ring-buffer/for-next)
Merging rcu/next (02219caa92b5 Merge branches 'doc.2024.06.06a', 'fixes.202=
4.07.04a', 'mb.2024.06.28a', 'nocb.2024.06.03a', 'rcu-tasks.2024.06.06a', '=
rcutorture.2024.06.06a' and 'srcu.2024.06.18a' into HEAD)
Merging paulmck/non-rcu/next (8122d6e11bd8 Merge branches 'cmpxchg.2024.07.=
04a', 'kcsan.2024.06.06a', 'lkmm.2024.06.06a', 'nolibc.2024.06.30a' and 'to=
rture.2024.05.30b' into HEAD)
Merging kvm/next (1773014a9759 Merge branch 'kvm-fixes' into HEAD)
Merging kvm-arm/next (bb032b2352c3 Merge branch kvm-arm64/docs into kvmarm/=
next)
Merging kvms390/next (7816e58967d0 kvm: s390: Reject memory region operatio=
ns for ucontrol VMs)
Merging kvm-ppc/topic/ppc-kvm (ca8dad041516 KVM: PPC: add missing MODULE_DE=
SCRIPTION() macros)
Merging kvm-riscv/riscv_kvm_next (dd4a799bcc13 KVM: riscv: selftests: Fix c=
ompile error)
Merging kvm-x86/next (332d2c1d713e crypto: ccp: Add the SNP_VLEK_LOAD comma=
nd)
Merging xen-tip/linux-next (4c006734898a x86/xen: fix memblock_reserve() us=
age on PVH)
Merging percpu/for-next (2d9ad81ef935 Merge branch 'for-6.8-fixes' into for=
-next)
Merging workqueues/for-next (bc1d825a3334 workqueue: Remove incorrect "WARN=
_ON_ONCE(!list_empty(&worker->entry));" from dying worker)
Merging sched-ext/for-next (0df340ceae2e Merge branch 'sched/core' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/tip/tip into for-6.12)
Merging drivers-x86/for-next (8400291e289e Linux 6.11-rc1)
Merging chrome-platform/for-next (de9c2c66ad8e Linux 6.11-rc2)
Merging chrome-platform-firmware/for-firmware-next (8400291e289e Linux 6.11=
-rc1)
Merging hsi/for-next (f02cfe695047 HSI: ssi_protocol: Remove unused linux/g=
pio.h)
Merging leds-lj/for-leds-next (a0864cf32044 leds: flash: leds-qcom-flash: L=
imit LED current based on thermal condition)
Merging ipmi/for-next (19a01155ddfe ipmi: Drop explicit initialization of s=
truct i2c_device_id::driver_data to 0)
Merging driver-core/driver-core-next (bfa54a793ba7 driver core: bus: Fix do=
uble free in driver API bus_register())
Merging usb/usb-next (d483f034f032 usb: dwc2: Skip clock gating on Broadcom=
 SoCs)
Merging thunderbolt/next (8400291e289e Linux 6.11-rc1)
Merging usb-serial/usb-next (da74a5100a2b USB: serial: drop driver owner in=
itialization)
Merging tty/tty-next (2108aa2a01d8 dt-bindings: serial: renesas: Document R=
Z/G2M v3.0 (r8a774a3) scif)
Merging char-misc/char-misc-next (5c4efc60551c cxl: Use of_property_ access=
or functions)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (2e5657aa5966 hwtracing: use for_each_endpoint_of_no=
de())
Merging fastrpc/for-next (8400291e289e Linux 6.11-rc1)
Merging fpga/for-next (3a0fa8e97d30 fpga: altera-fpga2sdram: remove unused =
struct 'prop_map')
Merging icc/icc-next (226e58b20975 Merge branch 'icc-rpmh-qos' into icc-nex=
t)
Merging iio/togreg (6140a92cd086 iio: frequency: adf4377: add adf4378 suppo=
rt)
Merging phy-next/next (0f20e326e723 phy: ti: phy-j721e-wiz: convert comma t=
o semicolon)
Merging soundwire/next (663229e24255 soundwire: bus: clean up probe warning=
s)
Merging extcon/extcon-next (e508f2606c0b extcon: Add LC824206XA microUSB sw=
itch driver)
Merging gnss/gnss-next (8400291e289e Linux 6.11-rc1)
Merging vfio/next (0756bec2e45b vfio-mdev: add missing MODULE_DESCRIPTION()=
 macros)
Merging w1/for-next (e940ff286ec4 w1: ds2482: Drop explicit initialization =
of struct i2c_device_id::driver_data to 0)
Merging spmi/spmi-next (a8f4aa75f885 spmi: pmic-arb: add missing newline in=
 dev_err format strings)
Merging staging/staging-next (5aa0018a93bf staging: rtl8192e: remove duplic=
ate macros from rtllib.h)
Merging counter-next/counter-next (8400291e289e Linux 6.11-rc1)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (44c026a73be8 Linux 6.4-rc3)
Merging dmaengine/next (8400291e289e Linux 6.11-rc1)
Merging cgroup/for-next (563ea1f5f851 Documentation: Fix the compilation er=
rors in union_find.rst)
Merging scsi/for-next (7c632fc3ce64 Merge branch '6.11/scsi-queue' into 6.1=
1/scsi-fixes)
Merging scsi-mkp/for-next (5f36bd89a994 Merge patch series "smartpqi update=
s")
Merging vhost/linux-next (d820e8fcea38 net: virtio: unify code to init stat=
s)
Merging rpmsg/for-next (8749919defb8 remoteproc: imx_rproc: Merge TCML/U)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (b034a90b2745 gpio: Use of_property_present=
())
Merging gpio-intel/for-next (1613e604df0c Linux 6.10-rc1)
Merging pinctrl/for-next (d21fe1e9a6a4 pinctrl: pinconf-generic: Add suppor=
t for "input-schmitt-microvolt" property)
Merging pinctrl-intel/for-next (8400291e289e Linux 6.11-rc1)
Merging pinctrl-renesas/renesas-pinctrl (f73f63b24491 pinctrl: renesas: rzg=
2l: Use dev_err_probe())
Merging pinctrl-samsung/for-next (aa85d4533869 pinctrl: samsung: Use of_pro=
perty_present())
Merging pwm/pwm/for-next (d6a56f3bb650 pwm: lp3943: Use of_property_count_u=
32_elems() to get property length)
Merging ktest/for-next (07283c1873a4 ktest: force $buildonly =3D 1 for 'mak=
e_warnings_file' test type)
Merging kselftest/next (f0a1ffa6f977 selftest: acct: Add selftest for the a=
cct() syscall)
Merging kunit/test (8400291e289e Linux 6.11-rc1)
Merging kunit-next/kunit (8400291e289e Linux 6.11-rc1)
Merging livepatching/for-next (9871e6af43db Merge branch 'for-6.11/sysfs-pa=
tch-replace' into for-next)
Merging rtc/rtc-next (efa9c5be2cae rtc: stm32: add new st,stm32mp25-rtc com=
patible and check RIF configuration)
Merging nvdimm/libnvdimm-for-next (b0d478e34dbf testing: nvdimm: Add MODULE=
_DESCRIPTION() macros)
Merging at24/at24/for-next (8400291e289e Linux 6.11-rc1)
Merging ntb/ntb-next (92aee2f6d156 NTB: ntb_transport: fix all kernel-doc w=
arnings)
Merging seccomp/for-next/seccomp (f0c508faea64 selftests/seccomp: check tha=
t a zombie leader doesn't affect others)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (9b6e704955fa slimbus: generate MODULE_ALIAS() fro=
m MODULE_DEVICE_TABLE())
Merging nvmem/for-next (8400291e289e Linux 6.11-rc1)
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
Merging memblock/for-next (f56de2214554 tools/testing: abstract two init.h =
into common include directory)
CONFLICT (rename/delete): tools/testing/radix-tree/linux/init.h renamed to =
tools/testing/shared/linux/init.h in HEAD, but deleted in memblock/for-next.
$ git rm -f tools/testing/shared/linux/init.h
Merging cxl/next (a0328b397f33 cxl/core/pci: Move reading of control regist=
er to immediately before usage)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (4a2ebb082297 efi: Replace efi_memory_attributes_table_t 0=
-sized array with flexible array)
Merging unicode/for-next (68318904a775 unicode: add MODULE_DESCRIPTION() ma=
cros)
Merging slab/slab/for-next (a371d558e6f3 mm, slub: do not call do_slab_free=
 for kfence object)
Merging random/master (c86927f528a8 selftests/vDSO: don't #include sodium h=
eader in chacha test)
Merging landlock/next (8400291e289e Linux 6.11-rc1)
Merging rust/rust-next (8400291e289e Linux 6.11-rc1)
Merging sysctl/sysctl-next (acc154691fc7 sysctl: Warn on an empty procname =
element)
Merging execve/for-next/execve (b6f5ee4d5301 execve: Move KUnit tests to te=
sts/ subdirectory)
Merging bitmap/bitmap-for-next (a11e9c76cfc6 nodemask: Switch from inline t=
o __always_inline)
CONFLICT (content): Merge conflict in lib/test_bits.c
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (cd1351051f43 Merge branch 'for-linus/hardening'=
 into for-next/kspp)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (8400291e289e Linux 6.11-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (8400291e289e Linux 6.11-rc1)
Merging turbostat/next (75879bd898ee tools/power turbostat: fix GCC9 build =
regression)
Merging pwrseq/pwrseq/for-next (8400291e289e Linux 6.11-rc1)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/5=TG2gaOdclrQx2NbaDqZ8N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmawV5cACgkQAVBC80lX
0GySXQgApGfM5+B3FpKc1H4vIERuhrkz+BprcMbJ7wcyILsyqHm1/3EHE4x7uFEK
uRT6eQIuDG3i6IChxYzI1GpBC8Ov4XpiBoKs5J50b7eeOL+TqZLlehIvnWa22LJM
G2PPNVX60YTZbyaWrQCJAyPICIM7UozlQTnuSMlIbHeLk5vVhUgmM4TBjMlu4HkY
b7b8NO7SBxOgFXnyUw3SSuT06igFmjhMJtD6tc8+DCQ8NY+jgczcFpyAcX1mgqGr
w3PmYjqOJNQYmwHpykfH8/Z8YV6VyeCaW1S+FqnFNljo8Oc9VpB7facxsmE4+NzQ
Mht04naGe1QaNGMvmsUoCSW066IgWQ==
=1qQM
-----END PGP SIGNATURE-----

--Sig_/5=TG2gaOdclrQx2NbaDqZ8N--

