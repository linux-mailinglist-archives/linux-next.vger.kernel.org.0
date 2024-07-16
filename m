Return-Path: <linux-next+bounces-3028-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7C19320D0
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 08:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FDDC1C211FB
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 06:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D8B1CD31;
	Tue, 16 Jul 2024 06:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ERJ2+xx+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C20196;
	Tue, 16 Jul 2024 06:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721113167; cv=none; b=HpsH9MQaNvznS7oiQKENk0pdJAyx5VFOC0b8Ko+cnNKYf9K7pD2aHNBTJq8SdsqwHWFuWKylUIoiNfdv8e6WTHQmXiWoy8IE91EYkINEeeCFmteT8XuUpOMeHypVxr8EDQhPwrPvmX1H8YKCW0HDxyNusxSYFaMgcNSA3h6Sm0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721113167; c=relaxed/simple;
	bh=+HYkCOZ10LVxVleWVZZZlJeQwoeTgIT1BW+77MQ8smE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XPz6Ny0yW10gMaG0evgDLhfLlSMJ6ZwSvJH7j1W7xERHVDo3qWVd30Xo8Cj7TlRvWPf9INtyeBVL2kcBxEQn58hBuCiguXYDenKhVVgYXDj69+gLwdN43PPJ5NEtrAGsgbpv60YyEgLn/cuezLYxvsuRDpux0lMfi96F2Ai4T+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ERJ2+xx+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721113161;
	bh=edRsErHzFZuAEE96g8CiWw0aYopq9188HH9lqatP1s0=;
	h=Date:From:To:Cc:Subject:From;
	b=ERJ2+xx++3UNprDsKhZZ6w44XJmxz0Ob5Fr4l6UZlP3vs9M0S3hRDEe3zOVHX9S/F
	 nZo1Jpa9WDQ1zJDabDDSzSA+RfGdINkNEsaCRVPhN7WHr5TjYb276kvrO8IC3b5Cjr
	 eFi+F4fHxGM2whFInHzjbO7tcUzyn4RlO46DmF49mxuzcFrLvowXIlPXkh4FA0+Y89
	 XgawF2IK3RRsRM4RZVqe10tiHAG/5WEkHLhWuo0lEM9hRffuAJjjOBdZow/7n3THTJ
	 Ft0KQZ3Dv3Ss6NJp4f52gm+bCkll7+PPfu2TPGZCF8k0kUs0AfKHeFlBrKlb4cKfF+
	 O/Oe/CBsj8asg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WNVL134Mrz4w2R;
	Tue, 16 Jul 2024 16:59:21 +1000 (AEST)
Date: Tue, 16 Jul 2024 16:59:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 16
Message-ID: <20240716165920.0c7a4a1f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MADWFsi7Nq5RyZlGKJDerLl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MADWFsi7Nq5RyZlGKJDerLl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Please do not add any material destibed for v6.12 to your linux-next
included branches until after v6.11-rc1 has been released.

Changes since 20240715:

The clk tree gained a build failure so I used the version from
next-20240715.

The ksmbd tree lost its build failure.

Non-merge commits (relative to Linus' tree): 11593
 12002 files changed, 852284 insertions(+), 222436 deletions(-)

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
Merging origin/master (3e7819886281 Merge tag 'for-6.11/block-20240710' of =
git://git.kernel.dk/linux)
Merging fixes/fixes (2dde18cd1d8f Linux 6.5)
Merging mm-hotfixes/mm-hotfixes-unstable (4567e3d5af8a mm: huge_memory: use=
 !CONFIG_64BIT to relax huge page alignment on 32 bit machines)
Merging vfs-brauner-fixes/vfs.fixes (0570730c1630 hfsplus: fix uninit-value=
 in copy_name)
Merging fscrypt-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging fsverity-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging btrfs-fixes/next-fixes (c27ee729aea5 Merge branch 'misc-6.10' into =
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
Merging fs-current (0ef4bcd6e2c6 Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging kbuild-current/fixes (0c3836482481 Linux 6.10)
Merging arc-current/for-curr (e67572cd2204 Linux 6.9-rc6)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (ecc54006f158 arm64: Clear the initial I=
D map correctly before remapping)
Merging arm-soc-fixes/arm/fixes (6fba5cbd323e MAINTAINERS: Update FREESCALE=
 SOC DRIVERS and QUICC ENGINE LIBRARY)
Merging davinci-current/davinci/for-current (6613476e225e Linux 6.8-rc1)
Merging drivers-memory-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging sophgo-fixes/fixes (90f6cc7f8e07 riscv: dts: sophgo: disable write-=
protection for milkv duo)
Merging m68k-current/for-linus (21b9e722ad28 m68k: cmpxchg: Fix return valu=
e for default case in __arch_xchg())
Merging powerpc-fixes/fixes (8b7f59de92ac selftests/powerpc: Fix build with=
 USERCFLAGS set)
Merging s390-fixes/fixes (b3a58f3b90f5 s390/dasd: Fix invalid dereferencing=
 of indirect CCW data pointer)
Merging net/main (0a1868b93fad net: bridge: mst: Check vlan state for egres=
s decision)
Merging bpf/master (528dd46d0fc3 Merge tag 'net-6.10-rc8-2' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ipsec/master (89a2aefe4b08 xfrm: call xfrm_dev_policy_delete when k=
ill policy)
Merging netfilter/main (cff3bd012a95 netfilter: nf_tables: prefer nft_chain=
_validate)
Merging ipvs/main (cff3bd012a95 netfilter: nf_tables: prefer nft_chain_vali=
date)
Merging wireless/for-next (4130c67cd123 wifi: iwlwifi: mvm: check vif for N=
ULL/ERR_PTR before dereference)
Merging wpan/master (b8ec0dc3845f net: mac802154: Fix racy device stats upd=
ates by DEV_STATS_INC() and DEV_STATS_ADD())
Merging rdma-fixes/for-rc (f2661062f16b Linux 6.10-rc5)
Merging sound-current/for-linus (97b10a77b150 Merge tag 'asoc-v6.11' of htt=
ps://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus)
Merging sound-asoc-fixes/for-linus (680e126ec040 firmware: cs_dsp: Use strn=
len() on name fields in V1 wmfw files)
Merging regmap-fixes/for-linus (76f19626bd35 regmap: add missing MODULE_DES=
CRIPTION() macros)
Merging regulator-fixes/for-linus (f2661062f16b Linux 6.10-rc5)
Merging spi-fixes/for-linus (c8bd922d924b spi: mux: set ctlr->bits_per_word=
_mask)
Merging pci-current/for-linus (1613e604df0c Linux 6.10-rc1)
Merging driver-core.current/driver-core-linus (6ba59ff42279 Linux 6.10-rc4)
Merging tty.current/tty-linus (2ac33975abda serial: qcom-geni: do not kill =
the machine on fifo underrun)
Merging usb.current/usb-linus (70c8e3944063 Merge tag 'usb-serial-6.10-rc8'=
 of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial int=
o usb-linus)
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
Merging input-current/for-linus (a23e19669324 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (a5d8922ab2ae crypto: qat - fix linking error=
s when PCI_IOV is disabled)
Merging vfio-fixes/for-linus (5a88a3f67e37 vfio/pci: Init the count variabl=
e in collecting hot-reset devices)
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
Merging omap-fixes/fixes (0c3836482481 Linux 6.10)
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
Merging drivers-x86-fixes/fixes (b6e02c6b0377 platform/x86: toshiba_acpi: F=
ix array out-of-bounds access)
Merging samsung-krzk-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging pinctrl-samsung-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging devicetree-fixes/dt/linus (2cf6b7d15a28 of/irq: Disable "interrupt-=
map" parsing for PASEMI Nemo)
Merging dt-krzk-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging scsi-fixes/fixes (7a6bbc2829d4 scsi: sd: Do not repeat the starting=
 disk message)
Merging drm-fixes/drm-fixes (8b68788bebd3 Merge tag 'amd-drm-fixes-6.10-202=
4-07-11' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (f36139c756a9 i915/perf: Remov=
e code to update PWR_CLK_STATE for gen12)
Merging mmc-fixes/fixes (16198eef11c1 mmc: davinci_mmc: Prevent transmitted=
 data size from exceeding sgm's length)
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
Merging i2c-host-fixes/i2c/i2c-host-fixes (ea5ea84c9d35 i2c: rcar: ensure G=
en3+ reset does not disturb local targets)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (10f84de27bd0 Merge tag 'qcom-clk-fixes-for-6.1=
0' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into clk-f=
ixes)
Merging pwrseq-fixes/pwrseq/for-current (83a7eefedc9b Linux 6.10-rc3)
Merging thead-dt-fixes/thead-dt-fixes (256abd8e550c Linux 6.10-rc7)
Merging drm-misc-fixes/for-linux-next-fixes (d60c429610a1 drm: panel-orient=
ation-quirks: Add quirk for OrangePi Neo)
Merging mm-stable/mm-stable (92c177748477 mm: memcg1: convert charge move f=
lags to unsigned long long)
CONFLICT (content): Merge conflict in mm/hugetlb.c
Merging mm-nonmm-stable/mm-nonmm-stable (0fe2356434e1 tsacct: replace strnc=
py() with strscpy())
CONFLICT (content): Merge conflict in fs/bcachefs/clock.c
CONFLICT (content): Merge conflict in include/linux/interrupt.h
Merging mm/mm-everything (ca798d3aaa14 foo)
Merging kbuild/for-next (99fe2efd838b kbuild: Create INSTALL_PATH directory=
 if it does not exist)
Merging clang-format/clang-format (5a205c6a9f79 clang-format: Update with v=
6.7-rc4's `for_each` macro list)
Merging perf/perf-tools-next (7a2fb5619cc1 perf trace: Fix iteration of sys=
call ids in syscalltbl->entries)
Merging compiler-attributes/compiler-attributes (2993eb7a8d34 Compiler Attr=
ibutes: counted_by: fixup clang URL)
Merging dma-mapping/for-next (b69bdba5a37e swiotlb: fix kernel-doc descript=
ion for swiotlb_del_transient)
Merging asm-generic/master (1a7b7326d587 vmlinux.lds.h: catch .bss..L* sect=
ions into BSS"))
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (b5e352609497 Merge branches 'clkdev', 'fixes' and 'mi=
sc' into for-next)
Merging arm64/for-next/core (4f3a6c4de7d9 Merge branch 'for-next/vcpu-hotpl=
ug' into for-next/core)
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
Merging broadcom/next (4caff16b6e00 Merge branch 'devicetree-arm64/next' in=
to next)
Merging davinci/davinci/for-next (6613476e225e Linux 6.8-rc1)
Merging drivers-memory/for-next (815cc7715ab1 dt-bindings: memory: fsl: rep=
lace maintainer)
Merging imx-mxs/for-next (145b73c51732 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (1613e604df0c Linux 6.10-rc1)
Merging mvebu/for-next (ffd0d7df6bdb Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (0c3836482481 Linux 6.10)
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
Merging samsung-krzk/for-next (ac4932a01cdd Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (eaaeef9e62f9 Merge tags 'scmi-updates-6.11', '=
ffa-updates-6.11', 'vexpress-updates-6.11' and 'juno-updates-6.11' of ssh:/=
/gitolite.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-l=
inux-next)
Merging sophgo/for-next (1613e604df0c Linux 6.10-rc1)
Merging stm32/stm32-next (1eafc48af859 arm64: stm32: enable scmi regulator =
for stm32)
Merging sunxi/sunxi/for-next (181755017a8b Merge branch 'sunxi/drivers-for-=
6.11' into sunxi/for-next)
Merging tee/next (cd88a296582c Merge branch 'optee_notif_wait_timeout_for_v=
6.11' into next)
Merging tegra/for-next (5211d93c551f Merge branch for-6.11/arm64/defconfig =
into for-next)
Merging thead-dt/thead-dt-for-next (256abd8e550c Linux 6.10-rc7)
Merging ti/ti-next (fd1d9729723b Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (41aa58501753 Merge branch 'zynqmp/soc' into for-ne=
xt)
Merging clk/clk-next (820bdec74d0f Merge branches 'clk-qcom', 'clk-rockchip=
', 'clk-sophgo' and 'clk-thead' into clk-next)
CONFLICT (content): Merge conflict in MAINTAINERS
$ git reset --hard HEAD^
Merging next-20240715 version of clk
CONFLICT (content): Merge conflict in MAINTAINERS
[master ede56651afff] next-20240715/clk
Merging clk-imx/for-next (466da3d2d967 clk: imx: composite-7ulp: Use NULL i=
nstead of 0)
Merging clk-renesas/renesas-clk (c7e58843d1e4 clk: renesas: r9a08g045: Add =
clock, reset and power domain support for I2C)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (e47db58e1f33 Merge branch 'loongarch-kvm'=
 into loongarch-next)
CONFLICT (content): Merge conflict in arch/loongarch/include/uapi/asm/unist=
d.h
CONFLICT (content): Merge conflict in tools/perf/arch/loongarch/util/Build
Applying: fixup for "LoongArch: Define __ARCH_WANT_NEW_STAT in unistd.h"
Merging m68k/for-next (21b9e722ad28 m68k: cmpxchg: Fix return value for def=
ault case in __arch_xchg())
Merging m68knommu/for-next (256abd8e550c Linux 6.10-rc7)
Merging microblaze/next (1613e604df0c Linux 6.10-rc1)
Merging mips/mips-next (bb2d63500b5c MIPS: config: Add ip30_defconfig)
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (2fd4e52e442c parisc: Use max() to calculate par=
isc_tlb_flush_threshold)
Merging powerpc/next (90e812ac40c4 Documentation/powerpc: Mention 40x is re=
moved)
CONFLICT (content): Merge conflict in arch/powerpc/mm/nohash/Makefile
Merging soc-fsl/next (fb9c384625dd bus: fsl-mc: fsl-mc-allocator: Drop a wr=
ite-only variable)
Merging risc-v/for-next (6ad8735994b8 riscv: set trap vector earlier)
CONFLICT (content): Merge conflict in arch/riscv/kernel/patch.c
Merging riscv-dt/riscv-dt-for-next (2904244a8c46 riscv: dts: starfive: add =
PCIe dts configuration for JH7110)
Merging riscv-soc/riscv-soc-for-next (c813ef3c5f6c MAINTAINERS: drop riscv =
list from cache controllers)
Merging s390/for-next (4ba43086ca02 Merge branch 'features' into for-next)
Merging sh/for-next (b8252943a189 sh: Kconfig: Drop CONFIG_MEMORY_{HOTPLUG,=
HOTREMOVE})
Merging sparc/for-next (a3da15389112 sparc64: Fix prototype warnings in hib=
ernate.c)
Merging uml/next (98ff534ec2cd um: vector: always reset vp->opened)
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging bcachefs/for-next (efb2018e4d23 bcachefs: Kill bch2_assert_btree_no=
des_not_locked())
Merging pidfd/for-next (a901a3568fd2 Merge tag 'iomap-6.5-merge-1' of git:/=
/git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging fscrypt/for-next (256abd8e550c Linux 6.10-rc7)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (f78f0ef23908 Merge branch 'for-next-next-v6.10-2024=
0711' into for-next-20240711)
CONFLICT (content): Merge conflict in fs/btrfs/inode.c
[fs-next 3bae1352733e] Merge branch 'for-next' of git://git.kernel.org/pub/=
scm/linux/kernel/git/kdave/linux.git
Merging ceph/master (359bc01d2ecc libceph: fix crush_choose_firstn() kernel=
-doc warnings)
Merging cifs/for-next (0c3836482481 Linux 6.10)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging dlm/next (89b01913dc73 dlm: add rcu_barrier before destroy kmem cac=
he)
Merging erofs/dev (a3c10bed330b erofs: silence uninitialized variable warni=
ng in z_erofs_scan_folio())
Merging exfat/dev (89fc548767a2 exfat: fix potential deadlock on __exfat_ge=
t_dentry_set)
Merging exportfs/exportfs-next (e8f897f4afef Linux 6.8)
Merging ext3/for_next (85f22bb5d2c2 Merge UDF consistency fixes.)
Merging ext4/dev (f9ca51596bbf ext4: make sure the first directory block is=
 not a hole)
Merging f2fs/dev (bed6b0317441 f2fs: clean up addrs_per_{inode,block}())
Merging fsverity/for-next (256abd8e550c Linux 6.10-rc7)
Merging fuse/for-next (529395d2ae64 virtio-fs: add multi-queue support)
Merging gfs2/for-next (f75efefb6db3 gfs2: Clean up glock demote logic)
Merging jfs/jfs-next (d0fa70aca54c jfs: don't walk off the end of ealist)
Merging ksmbd/ksmbd-for-next (d484d621d40f ksmbd: add durable scavenger tim=
er)
Merging nfs/linux-next (0c3836482481 Linux 6.10)
Merging nfs-anna/linux-next (d4a5aacff04d SUNRPC: Fixup gss_status tracepoi=
nt error output)
Merging nfsd/nfsd-next (769d20028f45 nfsd: nfsd_file_lease_notifier_call ge=
ts a file_lease as an argument)
Merging ntfs3/master (911daf695a74 fs/ntfs3: Fix formatting, change comment=
s, renaming)
Merging orangefs/for-next (53e4efa470d5 orangefs: fix out-of-bounds fsid ac=
cess)
Merging overlayfs/overlayfs-next (004b8d1491b4 ovl: fix encoding fid for lo=
wer only root)
Merging ubifs/next (054fd1598445 ubifs: add check for crypto_shash_tfm_dige=
st)
Merging v9fs/9p-next (2211561723a6 9p: Enable multipage folios)
Merging v9fs-ericvh/ericvh/for-next (1613e604df0c Linux 6.10-rc1)
Merging xfs/for-next (2bf6e353542d xfs: fix rtalloc rotoring when delalloc =
is in use)
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
CONFLICT (content): Merge conflict in fs/internal.h
[fs-next 3e1c04514a9c] Merge branch 'vfs.all' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/vfs/vfs.git
Merging vfs/for-next (a38297e3fb01 Linux 6.9)
Merging fs-next (3e1c04514a9c Merge branch 'vfs.all' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/vfs/vfs.git)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/unistd.h
CONFLICT (content): Merge conflict in arch/arm64/include/asm/unistd32.h
CONFLICT (content): Merge conflict in fs/bcachefs/clock.c
CONFLICT (content): Merge conflict in fs/nfs/nfstrace.h
CONFLICT (content): Merge conflict in fs/nfs/write.c
Applying: fixup for "fs/xattr: add *at family syscalls"
Applying: fixup for "nfs: pass explicit offset/count to trace events"
Merging printk/for-next (07c2ab22a8da Merge branch 'for-6.11' into for-next)
Merging pci/next (ea4516b2b250 Merge branch 'pci/misc')
CONFLICT (content): Merge conflict in drivers/pci/pci.c
Merging pstore/for-next/pstore (9b3c13c9ea4e pstore: platform: add missing =
MODULE_DESCRIPTION() macro)
Merging hid/for-next (b4ca7746f854 Merge branch 'for-6.11/trivial' into for=
-next)
CONFLICT (content): Merge conflict in include/linux/hid_bpf.h
Merging i2c/i2c/for-next (a42e966451e2 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i2c-host/i2c/i2c-host (ab1c7ea48f6e dt-bindings: i2c: amlogic,meson=
6-i2c: add optional power-domains)
Merging i3c/i3c/next (e06704e3f513 i3c: master: Enhance i3c_bus_type visibi=
lity for device searching & event monitoring)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (1ea3fd1eb986 hwmon: (max6697) Fix swapped=
 temp{1,8} critical alarms)
Merging jc_docs/docs-next (de5bc76fb6ce Merge branch 'docs-mw' into docs-ne=
xt)
Merging v4l-dvb/master (5d5f67b3b23f media: atomisp: Fix spelling mistakes =
in sh_css_sp.c)
Merging v4l-dvb-next/master (68a72104cbcf media: raspberrypi: Switch to rem=
ove_new)
Merging pm/linux-next (218ca41f1f26 Merge branch 'thermal' into linux-next)
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
Merging rdma/for-next (887cd308fd46 IB/hfi1: Constify struct flag_table)
Merging net-next/main (51b35d4f9d88 Merge git://git.kernel.org/pub/scm/linu=
x/kernel/git/netdev/net)
CONFLICT (content): Merge conflict in arch/riscv/net/bpf_jit_comp64.c
Applying: HID: bpf: Fix up build
Merging bpf-next/for-next (69cf87304dcb Merge branch '200GbE' of git://git.=
kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue)
Merging ipsec-next/master (d5b60c6517d2 Merge  branch 'Support IPsec crypto=
 offload for IPv6 ESP and IPv4 UDP-encapsulated ESP data paths')
Merging mlx5-next/mlx5-next (b339e0a39dc3 RDMA/mlx5: Add Qcounters req_tran=
sport_retries_exceeded/req_rnr_retries_exceeded)
Merging netfilter-next/main (ac26327635d6 Merge branch 'fixes-for-stm32-dwm=
ac-driver-fails-to-probe')
Merging ipvs-next/main (ac26327635d6 Merge branch 'fixes-for-stm32-dwmac-dr=
iver-fails-to-probe')
Merging bluetooth/master (23e88450bb04 Bluetooth: btmtk: Mark all stub func=
tions as inline)
Merging wireless-next/for-next (338a93cf4a18 net: mctp-i2c: invalidate flow=
s immediately on TX errors)
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
Merging crypto/master (df1e9791998a hwrng: core - remove (un)register_miscd=
ev())
Merging drm/drm-next (c58c39163a7e drm/omap: Restrict compile testing to PA=
GE_SIZE less than 64KB)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_migrate.c
Merging drm-exynos/for-linux-next (221009347844 drm/exynos/vidi: convert to=
 struct drm_edid)
Merging drm-misc/for-linux-next (1fe1c66274fb drm/v3d: Fix Indirect Dispatc=
h configuration for V3D 7.1.6 and later)
Merging amdgpu/drm-next (7bbae44cf1bd drm/amd/display: fix doc entry for bb=
_from_dmub)
Merging drm-intel/for-linux-next (c58c39163a7e drm/omap: Restrict compile t=
esting to PAGE_SIZE less than 64KB)
Merging drm-tegra/for-next (2429b3c529da drm/tegra: Avoid potential 32-bit =
integer overflow)
Merging drm-msm/msm-next (fe34394ecdad dt-bindings: display/msm: dsi-contro=
ller-main: Add SM7150)
Merging drm-msm-lumag/msm-next-lumag (399af57ccca2 dt-bindings: display/msm=
/gpu: fix the schema being not applied)
Merging drm-xe/drm-xe-next (45d30c828c61 drm/xe/vf: Track writes to inacces=
sible registers from VF)
Merging etnaviv/etnaviv/next (704d3d60fec4 drm/etnaviv: don't block schedul=
er when GPU is still active)
Merging fbdev/for-next (8b5ea9029b03 fbdev: viafb: Make I2C terminology mor=
e inclusive)
Merging regmap/for-next (254378529414 Merge remote-tracking branch 'regmap/=
for-6.11' into regmap-next)
Merging sound/for-next (97b10a77b150 Merge tag 'asoc-v6.11' of https://git.=
kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus)
Merging ieee1394/for-next (06dcc4c9baa9 firewire: core: move copy_port_stat=
us() helper function to TP_fast_assign() block)
Merging sound-asoc/for-next (c51cba475560 Fix the unbalanced pm_runtime_ena=
ble in wcd937x-sdw)
Merging modules/modules-next (61842868de13 module: create weak dependecies)
Merging input/next (5d33d04e0c20 MAINTAINERS: update entry for Yealink driv=
er)
Merging block/for-next (56c58a3865ab Merge branch 'for-6.11/block' into for=
-next)
Merging device-mapper/for-next (14dcc3cb5ec2 dm: Constify struct dm_block_v=
alidator)
Merging libata/for-next (6739fad42af2 dt-bindings: ata: ahci-fsl-qoriq: add=
 fsl,ls1046a-ahci and fsl,ls1012a-ahci)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (b85e02185397 MAINTAINERS: add 's32@nxp.com' as relevant m=
ailing list for 'sdhci-esdhc-imx' driver)
Merging mfd/for-mfd-next (c298391abf65 mfd: timberdale: Attach device prope=
rties to TSC2007 board info)
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
Merging tpmdd/next (6e9a602077a4 tpm_tis_spi: add missing attpm20p SPI devi=
ce ID entry)
Merging watchdog/master (022ec3b59c01 dt-bindings: watchdog: renesas,wdt: D=
ocument RZ/G3S support)
Merging iommu/next (8b6c32e831ef Merge branch 'iommu/iommufd/paging-domain-=
alloc' into iommu/next)
Merging audit/next (1613e604df0c Linux 6.10-rc1)
Merging devicetree/for-next (76be2f9823b1 dt-bindings: timer: sprd-timer: c=
onvert to YAML)
CONFLICT (content): Merge conflict in scripts/Makefile.lib
Merging dt-krzk/for-next (828f810f69f3 Merge branch 'next/dt64' into for-ne=
xt)
Merging mailbox/for-next (0e2a9a03106c mailbox: Add support for QTI CPUCP m=
ailbox controller)
Merging spi/for-next (a3b9bd570f9b Merge remote-tracking branch 'spi/for-6.=
11' into spi-next)
Merging tip/master (c1cbeb826124 Merge branch into tip/master: 'x86/vmware')
CONFLICT (content): Merge conflict in arch/x86/include/asm/cpufeatures.h
CONFLICT (content): Merge conflict in include/linux/cacheinfo.h
Merging clockevents/timers/drivers/next (8b77f4b8dc81 clocksource/drivers/r=
ealtek: Add timer driver for rtl-otto platforms)
  0d8d1bd925c8 ("dt-bindings: timer: renesas,tmu: Add R-Car Gen2 support")
  4f2fd59b7d26 ("dt-bindings: timer: Add SOPHGO SG2002 clint")
  8b77f4b8dc81 ("clocksource/drivers/realtek: Add timer driver for rtl-otto=
 platforms")
  9957722a200c ("dt-bindings: timer: renesas,tmu: Add RZ/G1 support")
  b24868b81231 ("dt-bindings: timer: renesas,tmu: Add R-Mobile APE6 support=
")
  ba39e42e9acd ("clocksource/driver/arm_global_timer: Remove unnecessary =
=E2=80=980=E2=80=99 values from err")
  cd6d60a0faa6 ("clocksource/drivers/mips-gic-timer: Correct sched_clock wi=
dth")
  d9a7f85412a9 ("clocksource/drivers/arm_arch_timer: Remove unnecessary =E2=
=80=980=E2=80=99 values from irq")
  e207ae12f08e ("dt-bindings: timer: Add schema for realtek,otto-timer")
  ec601554e3eb ("clocksource/drivers/sh_cmt: Address race condition for clo=
ck events")
  fa957fbdf44c ("clocksource/drivers/mips-gic-timer: Refine rating computat=
ion")
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
Merging kvm/next (27e6a24a4cf3 mm, virt: merge AS_UNMOVABLE and AS_INACCESS=
IBLE)
CONFLICT (content): Merge conflict in arch/x86/include/asm/sev-common.h
Merging kvm-arm/next (bb032b2352c3 Merge branch kvm-arm64/docs into kvmarm/=
next)
Merging kvms390/next (7816e58967d0 kvm: s390: Reject memory region operatio=
ns for ucontrol VMs)
Merging kvm-ppc/topic/ppc-kvm (ca8dad041516 KVM: PPC: add missing MODULE_DE=
SCRIPTION() macros)
Merging kvm-riscv/riscv_kvm_next (e325618349cd RISC-V: KVM: Redirect AMO lo=
ad/store access fault traps to guest)
CONFLICT (content): Merge conflict in tools/perf/arch/riscv/util/Build
Merging kvm-x86/next (771df9ffadb8 Merge branch 'static_calls')
Merging xen-tip/linux-next (9fe6a8c5b247 x86/xen: remove deprecated xen_nop=
vspin boot parameter)
Merging percpu/for-next (2d9ad81ef935 Merge branch 'for-6.8-fixes' into for=
-next)
Merging workqueues/for-next (aa8684755a28 workqueue: Remove unneeded lockde=
p_assert_cpus_held())
Merging sched-ext/for-next (8bb30798fd6e sched_ext: Fixes incorrect type in=
 bpf_scx_init())
Merging drivers-x86/for-next (cae25f9905b1 Docs/admin-guide: Remove pmf lef=
tover reference from the index)
Merging chrome-platform/for-next (4baf1cc54433 power: supply: cros_charge-c=
ontrol: Fix signedness bug in charge_behaviour_store())
CONFLICT (content): Merge conflict in MAINTAINERS
Merging chrome-platform-firmware/for-firmware-next (fc2c1d716d4a firmware: =
google: add missing MODULE_DESCRIPTION() macros)
Merging hsi/for-next (f02cfe695047 HSI: ssi_protocol: Remove unused linux/g=
pio.h)
Merging leds-lj/for-leds-next (b0eed397623f leds: leds-lp5569: Enable chip =
after chip configuration)
Merging ipmi/for-next (19a01155ddfe ipmi: Drop explicit initialization of s=
truct i2c_device_id::driver_data to 0)
Merging driver-core/driver-core-next (e777798e67d9 sysfs/cpu: Make crash_ho=
tplug attribute world-readable)
CONFLICT (content): Merge conflict in drivers/fsi/fsi-occ.c
CONFLICT (content): Merge conflict in drivers/reset/reset-meson-audio-arb.c
Applying: net: ethernet: rtsn: Fix up for remove() coversion to return void
Applying: drm: Fix up STM LVDS driver for void remove() conversion
Applying: fix up for "platform: Make platform_driver::remove() return void"
Merging usb/usb-next (b72749301112 kselftest: devices: Add test to detect d=
evice error logs)
Merging thunderbolt/next (49056c95df44 thunderbolt: debugfs: Use FIELD_GET(=
))
Merging usb-serial/usb-next (df8c0b8a03e8 USB: serial: garmin_gps: use stru=
ct_size() to allocate pkt)
Merging tty/tty-next (17199dfccd4b Documentation: kernel-parameters: Add DE=
VNAME:0.0 format for serial ports)
CONFLICT (content): Merge conflict in drivers/tty/serial/imx.c
Merging char-misc/char-misc-next (31643d84b8c3 binder: fix hang of unregist=
ered readers)
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
CONFLICT (content): Merge conflict in MAINTAINERS
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
Merging staging/staging-next (104e004739ef staging: rtl8723bs: Remove const=
ant result function CheckNegative())
Merging counter-next/counter-next (7b47e79eac4c Merge tag 'ib-mfd-counter-v=
5.11' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd into co=
unter-next)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (44c026a73be8 Linux 6.4-rc3)
Merging dmaengine/next (b8ec9dba02a7 dt-bindings: fsl-qdma: fix interrupts =
'if' check logic)
Merging cgroup/for-next (acd2e2b11907 Merge branch 'for-6.11' into for-next)
Merging scsi/for-next (96a28221664f Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (3911af778f20 scsi: ufs: core: Fix deadlock durin=
g RTC update)
Merging vhost/linux-next (9f4af6f7188e virtio_pci_modern: remove admin queu=
e serialization lock)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging rpmsg/for-next (d87dbfd31796 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (dfda97e37de4 gpio: mc33880: Convert comma =
to semicolon)
Merging gpio-intel/for-next (1613e604df0c Linux 6.10-rc1)
Merging pinctrl/for-next (11eaac6e8e72 Merge tag 'renesas-pinctrl-for-v6.11=
-tag3' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drive=
rs into devel)
Merging pinctrl-intel/for-next (1613e604df0c Linux 6.10-rc1)
Merging pinctrl-renesas/renesas-pinctrl (2453e858e945 pinctrl: renesas: rzg=
2l: Support output enable on RZ/G2L)
Merging pinctrl-samsung/for-next (1613e604df0c Linux 6.10-rc1)
Merging pwm/pwm/for-next (240b129d597c pwm: axi-pwmgen: add .max_register t=
o regmap)
Merging ktest/for-next (07283c1873a4 ktest: force $buildonly =3D 1 for 'mak=
e_warnings_file' test type)
Merging kselftest/next (bb408dae9e73 selftests: ifs: verify IFS ARRAY BIST =
functionality)
Merging kunit/test (1613e604df0c Linux 6.10-rc1)
Merging kunit-next/kunit (ebf51e460e48 kunit: Introduce KUNIT_ASSERT_MEMEQ =
and KUNIT_ASSERT_MEMNEQ macros)
Merging livepatching/for-next (9871e6af43db Merge branch 'for-6.11/sysfs-pa=
tch-replace' into for-next)
Merging rtc/rtc-next (efa9c5be2cae rtc: stm32: add new st,stm32mp25-rtc com=
patible and check RIF configuration)
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
Merging cxl/next (56478475560b Merge branch 'for-6.11/xor_fixes' into cxl-f=
or-next)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (4a2ebb082297 efi: Replace efi_memory_attributes_table_t 0=
-sized array with flexible array)
Merging unicode/for-next (68318904a775 unicode: add MODULE_DESCRIPTION() ma=
cros)
Merging slab/slab/for-next (436381eaf2a4 Merge branch 'slab/for-6.11/bucket=
s' into slab/for-next)
Merging random/master (41c321692608 selftests/vDSO: add tests for vgetrando=
m)
CONFLICT (content): Merge conflict in mm/rmap.c
CONFLICT (content): Merge conflict in tools/testing/selftests/mm/Makefile
Merging landlock/next (395a02d04ed4 landlock: Use bit-fields for storing ha=
ndled layer access masks)
Merging rust/rust-next (b12634111123 docs: rust: quick-start: add section o=
n Linux distributions)
CONFLICT (content): Merge conflict in rust/bindings/bindings_helper.h
Merging sysctl/sysctl-next (acc154691fc7 sysctl: Warn on an empty procname =
element)
Merging execve/for-next/execve (21f931083060 exec: Avoid pathological argc,=
 envc, and bprm->p values)
Merging bitmap/bitmap-for-next (fb9086e95ad8 riscv: Remove unnecessary int =
cast in variable_fls())
CONFLICT (content): Merge conflict in include/linux/cpumask.h
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (cd2e84ddbf86 Merge branch 'for-next/hardening' =
into for-next/kspp)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (1613e604df0c Linux 6.10-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (136a8066676e iommufd: Put constants for all the u=
API enums)
Merging turbostat/next (478a01016c08 tools/power turbostat: Fix typo in tur=
bostat.8)
Merging pwrseq/pwrseq/for-next (50b040ef3732 PCI/pwrctl: only call of_platf=
orm_populate() if CONFIG_OF is enabled)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/MADWFsi7Nq5RyZlGKJDerLl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaWGkgACgkQAVBC80lX
0GyOdAf/ehcQk8RDGoPYfLqhI/wsJBae/juIyoSwPEZxEPMBaRXc87IYeMdQPMw7
OLVHsckYJehM1SPeP/3xGz6cmtaCf/cJxva1gjOvIF/Z9CmCEWJmWJlfch4zCVIG
DLALN8gz67sVtHRkjX1Qtqcr6C5gy0w3+oZkUAGfbPfaQrwF0eF1qwjXZMdkQGbK
nJhjE53fuLcWsoIPPUe8aIhmqpH+LoZjyx/xspkN11Az8QajEl+9J94eWbHbNlDn
qcQ+KjQwvZSmH+cE8HLW1tThpBx/1REW5EwPu9aicIoKOL08KSOViA7DLWvlMZD5
24W3ERxzKWftDxUyRDc0x8y5rT9RKw==
=J0nF
-----END PGP SIGNATURE-----

--Sig_/MADWFsi7Nq5RyZlGKJDerLl--

