Return-Path: <linux-next+bounces-2185-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B68CB8BC7CE
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 08:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB4561C211BC
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 06:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF104DA06;
	Mon,  6 May 2024 06:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="U1ay69fP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD4E4D9EC;
	Mon,  6 May 2024 06:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714978172; cv=none; b=SxtYyy+op8VzJu6CJNB0wmnevD+RflQ9x6AytT7yfeBHAAdJuehFqB9uIBrJBo/DKFqj4fP9e8rop9CFV8qKWkZcc9bdN0U5QDrkMzvWVU74w1DSizkoGJos4iPq0QoXgXhcwWjLjlCi8K55DgyvsJ7TgJzEXBpNeGOBVzD9BDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714978172; c=relaxed/simple;
	bh=tuy+YIv1qNhKlBs0ZFpXbj2IhBxplDGhZQTMMmrHTVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=s5/9sEg/YHqPCPxSEwE/TiP71W9yq2Ym2jOFPC8ftnuV8AVEiHFnqFF8j0otwRwLzQ0eXqBrKeoKBAB+uUPdyliDj4AyxRWlGegBIGPywtRZ+tI18ZoIAct2hcLJg64e+rS88Fi7fA5b6KuEt6ihlN5J9aL1jkJB2k2AaKFP5WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=U1ay69fP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1714978163;
	bh=HnsP8i5RVr3A2FWjylijYhIanbKj4tX9OMgAEO5p9Z8=;
	h=Date:From:To:Cc:Subject:From;
	b=U1ay69fP6bG7BU7Hg5nrigX9pwBz1RH2d+Ci5bWSa4cwdwVDKVNFvsMseNXR3CUEV
	 vJpMRcxaQQF+Moa6XX+Mw3hl6EKdOpjMdfTlkTc0Caw7rCD0vwrQxYUclxs5Z7bcPF
	 1YRmYbt8H/gQzWFN8Zk8GvT3JMC+vUBB+H/j6geEsk7IFWSoQoASclEZq8GfCsaLu7
	 5QqjPCRUVH4MUJDSjnhV+O/u3y2hXzrvbKeM7Yh5xS8r5qNmqPwPVhl0zbIfjzH8to
	 fAk1rO208ZyT6uotx17JPVjrd2h9Qd3vD4zj+6K8F/boJMuKmZpqM2lWq0C8IuIr2d
	 lvMOfCltLJ7XA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VXsTH4hXkz4wc3;
	Mon,  6 May 2024 16:49:23 +1000 (AEST)
Date: Mon, 6 May 2024 16:49:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 6
Message-ID: <20240506164923.667eb38b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+QqbqgZZuQJbWPa2fpEIB2F";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+QqbqgZZuQJbWPa2fpEIB2F
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20240503:

The mm tree lost its build failure.

The arm tree lost its build failure.

The vfs-brauner tree gained a conflict against Linus' tree.

The v4l-dvb-next tree lost its build failure but gained another for
which I applied a patch.

The dmi tree lost its build failure.

The net-next tree gained a conflict against the kbuild tree.

The drm-msm tree gained a conflict against the kbuild tree.

The drm-xe tree gained a conflict against the drm-intel tree.

The rust tree gained a conflict against the kbuild tree.

Non-merge commits (relative to Linus' tree): 10384
 10232 files changed, 718413 insertions(+), 256326 deletions(-)

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

I am currently merging 373 trees (counting Linus' and 103 trees of bug
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
Merging origin/master (dd5a440a31fa Linux 6.9-rc7)
Merging fixes/fixes (2dde18cd1d8f Linux 6.5)
Merging mm-hotfixes/mm-hotfixes-unstable (39f6e51dddbb XArray: Set the mark=
s correctly when splitting an entry)
Merging kbuild-current/fixes (89e5462bb5ae kconfig: Fix typo HEIGTH to HEIG=
HT)
Merging arc-current/for-curr (e67572cd2204 Linux 6.9-rc6)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (50449ca66cc5 arm64: hibernate: Fix leve=
l3 translation fault in swsusp_save())
Merging arm-soc-fixes/arm/fixes (e845bcc8cfda Merge tag 'riscv-soc-fixes-fo=
r-v6.9-rc6' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux =
into arm/fixes)
Merging davinci-current/davinci/for-current (6613476e225e Linux 6.8-rc1)
Merging drivers-memory-fixes/fixes (4cece7649650 Linux 6.9-rc1)
Merging sophgo-fixes/fixes (4cece7649650 Linux 6.9-rc1)
Merging m68k-current/for-linus (e8a7824856de m68k: defconfig: Update defcon=
figs for v6.8-rc1)
Merging powerpc-fixes/fixes (49a940dbdc31 powerpc/pseries/iommu: LPAR panic=
s during boot up with a frozen PE)
Merging s390-fixes/fixes (7bbe449d0bdb s390/paes: Reestablish retry loop in=
 paes)
Merging fscrypt-current/for-current (4cece7649650 Linux 6.9-rc1)
Merging fsverity-current/for-current (4cece7649650 Linux 6.9-rc1)
Merging net/main (fa870b45b08a MAINTAINERS: update cxgb4 and cxgb3 network =
drivers maintainer)
Merging bpf/master (3e9bc0472b91 Merge branch 'bpf: Add BPF_PROG_TYPE_CGROU=
P_SKB attach type enforcement in BPF_LINK_CREATE')
Merging ipsec/master (b6d2e438e16c xfrm: Correct spelling mistake in xfrm.h=
 comment)
Merging netfilter/main (8a2e4d37afb8 s390/qeth: Fix kernel panic after sett=
ing hsuid)
Merging ipvs/main (8a2e4d37afb8 s390/qeth: Fix kernel panic after setting h=
suid)
Merging wireless/for-next (838c7b8f1f27 wifi: nl80211: Avoid address calcul=
ations via out of bounds array indexing)
Merging wpan/master (b85ea95d0864 Linux 6.7-rc1)
Merging rdma-fixes/for-rc (ed30a4a51bb1 Linux 6.9-rc5)
Merging sound-current/for-linus (fdb3f29dfe0d ALSA: hda/realtek: Fix build =
error without CONFIG_PM)
Merging sound-asoc-fixes/for-linus (09068d624c49 ASoC: amd: acp: fix for ac=
p platform device creation failure)
Merging regmap-fixes/for-linus (fec50db7033e Linux 6.9-rc3)
Merging regulator-fixes/for-linus (d1ef160b45a0 regulator: rtq2208: Fix the=
 BUCK ramp_delay range to maximum of 16mVstep/us)
Merging spi-fixes/for-linus (52b62e7a5d4f spi: stm32: enable controller bef=
ore asserting CS)
Merging pci-current/for-linus (2e0239d47d75 PCI/ASPM: Clarify that pcie_asp=
m=3Doff means leave ASPM untouched)
Merging driver-core.current/driver-core-linus (ed30a4a51bb1 Linux 6.9-rc5)
Merging tty.current/tty-linus (8492bd91aa05 serial: sc16is7xx: fix bug in s=
c16is7xx_set_baud() when using prescaler)
Merging usb.current/usb-linus (ae11f04b452b usb: typec: tcpm: Check for por=
t partner validity before consuming it)
Merging usb-serial-fixes/usb-linus (582ee2f9d268 USB: serial: option: add T=
elit FN920C04 rmnet compositions)
Merging phy/fixes (bf6e4ee5c436 phy: ti: tusb1210: Resolve charger-det cras=
h if charger psy is unregistered)
Merging staging.current/staging-linus (39cd87c4eb2b Linux 6.9-rc2)
Merging iio-fixes/fixes-togreg (4f11dc1b7fd2 iio: pressure: bmp280: Fix BMP=
580 temperature reading)
Merging counter-current/counter-current (39cd87c4eb2b Linux 6.9-rc2)
Merging char-misc.current/char-misc-linus (98241a774db4 slimbus: qcom-ngd-c=
trl: Add timeout for wait operation)
Merging soundwire-fixes/fixes (e67572cd2204 Linux 6.9-rc6)
Merging thunderbolt-fixes/fixes (e67572cd2204 Linux 6.9-rc6)
Merging input-current/for-linus (0537c8eef4f6 Input: amimouse - mark driver=
 struct with __refdata to prevent section mismatch)
Merging crypto-current/master (5a7e89d3315d crypto: iaa - Fix nr_cpus < nr_=
iaa case)
Merging vfio-fixes/for-linus (4ea95c04fa6b vfio: Drop vfio_file_iommu_group=
() stub to fudge around a KVM wart)
Merging kselftest-fixes/fixes (72d7cb5c190b selftests/harness: Prevent infi=
nite loop due to Assert in FIXTURE_TEARDOWN)
Merging dmaengine-fixes/fixes (e67572cd2204 Linux 6.9-rc6)
Merging backlight-fixes/for-backlight-fixes (6613476e225e Linux 6.8-rc1)
Merging mtd-fixes/mtd/fixes (d2d73a6dd173 mtd: limit OTP NVMEM cell parse t=
o non-NAND devices)
Merging mfd-fixes/for-mfd-fixes (6613476e225e Linux 6.8-rc1)
Merging v4l-dvb-fixes/fixes (d353c3c34af0 media: mediatek: vcodec: support =
36 bits physical address)
Merging reset-fixes/reset/fixes (4a6756f56bcf reset: Fix crash when freeing=
 non-existent optional resets)
Merging mips-fixes/mips-fixes (0bbac3facb5d Linux 6.9-rc4)
Merging at91-fixes/at91-fixes (1fe5e0a31e62 ARM: dts: microchip: at91-sama7=
g54_curiosity: Replace regulator-suspend-voltage with the valid property)
Merging omap-fixes/fixes (9b6a51aab5f5 ARM: dts: Fix occasional boot hang f=
or am3 usb)
Merging kvm-fixes/master (16c20208b9c2 Merge tag 'kvmarm-fixes-6.9-2' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvms390-fixes/master (175f2f5bcdfc KVM: s390: Check kvm pointer whe=
n testing KVM_CAP_S390_HPAGE_1M)
Merging hwmon-fixes/hwmon (d02abd57e794 hwmon: (corsair-cpro) Protect ccp->=
wait_input_report with a spinlock)
Merging nvdimm-fixes/libnvdimm-fixes (33908660e814 ACPI: NFIT: Fix incorrec=
t calculation of idt size)
Merging cxl-fixes/fixes (5d211c709059 cxl: Fix cxl_endpoint_get_perf_coordi=
nate() support for RCH)
Merging btrfs-fixes/next-fixes (dd11e0f129c3 Merge branch 'misc-6.9' into n=
ext-fixes)
Merging vfs-fixes/fixes (aa23317d0268 qibfs: fix dentry leak)
Merging dma-mapping-fixes/for-linus (75961ffb5cb3 swiotlb: initialise restr=
icted pool list_head when SWIOTLB_DYNAMIC=3Dy)
Merging drivers-x86-fixes/fixes (515a3c3a5489 platform/x86: ISST: Add Grand=
 Ridge to HPM CPU list)
Merging samsung-krzk-fixes/fixes (4cece7649650 Linux 6.9-rc1)
Merging pinctrl-samsung-fixes/fixes (4cece7649650 Linux 6.9-rc1)
Merging devicetree-fixes/dt/linus (dab6bc78e981 of: module: add buffer over=
flow check in of_modalias())
Merging dt-krzk-fixes/fixes (4cece7649650 Linux 6.9-rc1)
Merging scsi-fixes/fixes (961990efc608 scsi: sd: Only print updates to perm=
anent stream count)
Merging drm-fixes/drm-fixes (09e10499ee6a Merge tag 'drm-misc-fixes-2024-05=
-02' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (e67572cd2204 Linux 6.9-rc6)
Merging mmc-fixes/fixes (e027e72ecc16 mmc: moxart: fix handling of sgm->con=
sumed, otherwise WARN_ON triggers)
Merging rtc-fixes/rtc-fixes (4cece7649650 Linux 6.9-rc1)
Merging gnss-fixes/gnss-linus (0bbac3facb5d Linux 6.9-rc4)
Merging hyperv-fixes/hyperv-fixes (fb836d64a2ea hv/vmbus_drv: rename hv_acp=
i_init() to vmbus_init())
Merging soc-fsl-fixes/fix (06c2afb862f9 Linux 6.5-rc1)
Merging risc-v-fixes/fixes (6beb6bc5a81e Merge patch series "RISC-V: Test t=
h.sxstatus.MAEE bit before enabling MAEE")
Merging riscv-dt-fixes/riscv-dt-fixes (e0503d47e93d riscv: dts: starfive: v=
isionfive 2: Remove non-existing I2S hardware)
Merging riscv-soc-fixes/riscv-soc-fixes (3aa20d1f7bcb firmware: microchip: =
clarify that sizes and addresses are in hex)
Merging fpga-fixes/fixes (54435d1f21b3 fpga: dfl-pci: add PCI subdevice ID =
for Intel D5005 card)
Merging spdx/spdx-linus (4cece7649650 Linux 6.9-rc1)
Merging gpio-brgl-fixes/gpio/for-current (e67572cd2204 Linux 6.9-rc6)
Merging gpio-intel-fixes/fixes (7d045025a24b gpio: tangier: Use correct typ=
e for the IRQ chip data)
Merging pinctrl-intel-fixes/fixes (5d10a157ebe0 pinctrl: baytrail: Add pinc=
onf group for uart3)
Merging auxdisplay-fixes/fixes (4cece7649650 Linux 6.9-rc1)
Merging erofs-fixes/fixes (7af2ae1b1531 erofs: reliably distinguish block b=
ased and fscache mode)
Merging kunit-fixes/kunit-fixes (cfedfb24c9dd kunit: configs: Enable CONFIG=
_DAMON_DBGFS_DEPRECATED for --alltests)
Merging memblock-fixes/fixes (592447f6cb3c memblock tests: fix undefined re=
ference to `BIT')
Merging nfsd-fixes/nfsd-fixes (18180a4550d0 NFSD: Fix nfsd4_encode_fattr4()=
 crasher)
Merging renesas-fixes/fixes (8c987693dc2d ARM: dts: renesas: rcar-gen2: Add=
 missing #interrupt-cells to DA9063 nodes)
Merging perf-current/perf-tools (1cebd7f74976 tools/include: Sync arm64 asm=
/cputype.h with the kernel sources)
Merging efi-fixes/urgent (1c5a1627f481 efi/unaccepted: touch soft lockup du=
ring memory accept)
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (1e0fb1136461 power: supply: mt6360_charger: Fi=
x of_match for usb-otg-vbus regulator)
Merging uml-fixes/fixes (73a23d771033 um: harddog: fix modular build)
Merging iommufd-fixes/for-rc (2760c51b8040 iommufd: Add config needed for i=
ommufd_fail_nth)
Merging rust-fixes/rust-fixes (e67572cd2204 Linux 6.9-rc6)
Merging v9fs-fixes/fixes/next (d05dcfdf5e16  fs/9p: mitigate inode collisio=
ns)
Merging w1-fixes/fixes (4cece7649650 Linux 6.9-rc1)
Merging pmdomain-fixes/fixes (670c900f6964 pmdomain: ti-sci: Fix duplicate =
PD referrals)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging i2c-host-fixes/i2c/i2c-host-fixes (18f109e5edc8 i2c: cadence: Avoid=
 fifo clear after start)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (aacb99de1099 clk: samsung: Revert "clk: Use de=
vice_get_match_data()")
Merging drm-misc-fixes/for-linux-next-fixes (08001033121d drm/meson: dw-hdm=
i: add bandgap setting for g12)
Merging mm-stable/mm-stable (72801513b2bf mm: set pageblock_order to HPAGE_=
PMD_ORDER in case with !CONFIG_HUGETLB_PAGE but THP enabled)
Merging mm-nonmm-stable/mm-nonmm-stable (e02577872ff5 crash: add prefix for=
 crash dumping messages)
Merging mm/mm-everything (ebacef4eb695 foo)
Merging kbuild/for-next (1af0ac1bcdb0 kbuild: buildtar: install riscv compr=
essed images as vmlinuz)
Merging clang-format/clang-format (5a205c6a9f79 clang-format: Update with v=
6.7-rc4's `for_each` macro list)
Merging perf/perf-tools-next (77a70f80751d perf vendor events amd: Add Zen =
5 mapping)
Merging compiler-attributes/compiler-attributes (2993eb7a8d34 Compiler Attr=
ibutes: counted_by: fixup clang URL)
Merging dma-mapping/for-next (c93f261dfc39 Documentation/core-api: add swio=
tlb documentation)
Merging asm-generic/master (8823fff36eb5 Merge branch 'alpha-cleanup-6.9' i=
nto asm-generic)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (431dd6281857 Merge branches 'amba', 'cfi', 'clkdev', =
'fixes' and 'misc' into for-next)
Merging arm64/for-next/core (02a5cc61de06 Merge branches 'for-next/acpi', '=
for-next/kbuild', 'for-next/misc', 'for-next/mm', 'for-next/perf', 'for-nex=
t/selftests' and 'for-next/tlbi' into for-next/core)
Merging arm-perf/for-next/perf (410e471f8746 arm64: Add USER_STACKTRACE sup=
port)
Merging arm-soc/for-next (fa8870d46ddf soc: document merges)
Merging amlogic/for-next (e30237bd4f71 Merge branch 'v6.10/defconfig' into =
for-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (c44211af1aa9 ARM: dts: aspeed: Add ASRock E3C256D4=
I BMC)
Merging at91/at91-next (fa8e55345b64 Merge branch 'microchip-dt64' into at9=
1-next)
Merging broadcom/next (3d83aa97a6f7 Merge branch 'devicetree/next' into nex=
t)
Merging davinci/davinci/for-next (6613476e225e Linux 6.8-rc1)
Merging drivers-memory/for-next (bf11908757ee memory: mtk-smi: fix module a=
utoloading)
Merging imx-mxs/for-next (8c4bf8c96748 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (7f6f45a762c3 Merge branches 'v6.9-next/soc' and =
'v6.9-next/dts64' into for-next)
  7c9faab9d28f ("arm64: dts: mediatek: mt8183-pico6: Fix bluetooth node")
Merging mvebu/for-next (da8e8356f594 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (5856330c3d56 Merge branch 'drivers-ti-sysc-for-v6.10=
' into for-next)
Merging qcom/for-next (b43b8fcbb87a Merge branches 'arm32-for-6.10', 'arm64=
-defconfig-for-6.10', 'arm64-fixes-for-6.9', 'arm64-for-6.10', 'clk-fixes-f=
or-6.9', 'clk-for-6.10', 'drivers-fixes-for-6.9' and 'drivers-for-6.10' int=
o for-next)
Merging renesas/next (1e2995ef0bb8 Merge branch 'renesas-dts-for-v6.10' int=
o renesas-next)
Merging reset/reset/next (6d89df61650d reset: ti-sci: Convert to platform r=
emove callback returning void)
Merging rockchip/for-next (160b088184ec Merge branch 'v6.10-clk/next' into =
for-next)
Merging samsung-krzk/for-next (f599b6538b60 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (146928437fcb Merge tags 'scmi-updates-6.10' an=
d 'ffa-updates-6.10' of git://git.kernel.org/pub/scm/linux/kernel/git/sudee=
p.holla/linux into for-linux-next)
Merging sophgo/for-next (1eba0b61be72 riscv: dts: sophgo: add reserved memo=
ry node for CV1800B)
Merging stm32/stm32-next (dccdbccb7045 arm64: dts: st: correct masks for GI=
C PPI interrupts on stm32mp25)
Merging sunxi/sunxi/for-next (547c853141d1 Merge branch 'sunxi/dt-for-6.10'=
 into sunxi/for-next)
Merging tee/next (60757f1264a2 Merge branch 'tee_ts_for_v6.10' into next)
Merging tegra/for-next (2fd759c1796c Merge branch for-6.10/arm64/defconfig =
into for-next)
Merging ti/ti-next (f532f2375771 Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (2dc107360e22 dts: zynqmp: add properties for TCM i=
n remoteproc)
Merging clk/clk-next (804e3d8b695b Merge branch 'clk-binding' into clk-next)
Merging clk-imx/for-next (f5072cffb35c clk: imx: imx8mp: Convert to platfor=
m remove callback returning void)
Merging clk-renesas/renesas-clk (5add5ebc4e35 clk: renesas: r9a08g045: Add =
support for power domains)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (511b5b342cce LoongArch: KVM: Add mmio tra=
ce events support)
Merging m68k/for-next (bd622532f7b3 m68k: amiga: Use str_plural() to fix Co=
ccinelle warning)
Merging m68knommu/for-next (2595108e5842 m68k: Avoid CONFIG_COLDFIRE switch=
 in uapi header)
Merging microblaze/next (58d647506c92 microblaze: Remove early printk call =
from cpuinfo-static.c)
Merging mips/mips-next (07e6a6d7f1d9 MIPS: Take in account load hazards for=
 HI/LO restoring)
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (487fa28fa8b6 parisc: Define sigset_t in parisc =
uapi header)
Merging powerpc/next (1fcd25473337 MAINTAINERS: MMU GATHER: Update Aneesh's=
 address)
Merging powerpc-kdump-hotplug/topic/kdump-hotplug (849599b702ef powerpc/cra=
sh: add crash memory hotplug support)
Merging soc-fsl/next (fb9c384625dd bus: fsl-mc: fsl-mc-allocator: Drop a wr=
ite-only variable)
Merging risc-v/for-next (0a16a1728790 riscv: select ARCH_HAS_FAST_MULTIPLIE=
R)
CONFLICT (content): Merge conflict in Documentation/rust/arch-support.rst
Merging riscv-dt/riscv-dt-for-next (8fd63d81a760 riscv: dts: microchip: add=
 pac1934 power-monitor to icicle)
CONFLICT (content): Merge conflict in arch/riscv/Makefile
Merging riscv-soc/riscv-soc-for-next (16d9122246cc Merge branch 'riscv-conf=
ig' into riscv-soc-for-next)
Merging s390/for-next (63f922a4c63f Merge branch 'features-revert' into for=
-next)
Merging sh/for-next (21b8651502d5 sh: boot: Add proper forward declarations)
Merging sparc/for-next (48d85acdaa52 sparc: chmc: Convert to platform remov=
e callback returning void)
Merging uml/next (919e3ece7f5a um: virtio_uml: Convert to platform remove c=
allback returning void)
CONFLICT (content): Merge conflict in arch/um/include/shared/um_malloc.h
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging bcachefs/for-next (bab182cf6a98 bcachefs: Move nocow unlock to bch2=
_write_endio())
Merging pidfd/for-next (a901a3568fd2 Merge tag 'iomap-6.5-merge-1' of git:/=
/git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging fscrypt/for-next (8c62f31eddb7 fscrypt: shrink the size of struct f=
scrypt_inode_info slightly)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (d49e9f686546 Merge branch 'for-next-next-v6.9-20240=
503' into for-next-20240503)
Merging ceph/master (d3e046930679 MAINTAINERS: remove myself as a Reviewer =
for Ceph)
Merging cifs/for-next (ae4f73e84cb1 smb: smb2pdu.h: Avoid -Wflex-array-memb=
er-not-at-end warnings)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging erofs/dev (b351756059e3 erofs: derive fsid from on-disk UUID for .s=
tatfs() if possible)
Merging exfat/dev (f19257997d9c exfat: zero the reserved fields of file and=
 stream extension dentries)
Merging exportfs/exportfs-next (e8f897f4afef Linux 6.8)
Merging ext3/for_next (e6b4c0a8589b Merge ext2 Kconfig cleanup.)
Merging ext4/dev (0ecae5410ab5 ext4: initialize sbi->s_freeclusters_counter=
 and sbi->s_dirtyclusters_counter before use in kunit test)
Merging f2fs/dev (3763f9effcdc f2fs: use helper to print zone condition)
Merging fsverity/for-next (ee5814dddefb fsverity: use register_sysctl_init(=
) to avoid kmemleak warning)
Merging fuse/for-next (fa7e19337908 fuse: Add initial support for fs-verity)
Merging gfs2/for-next (50fabd42cb2f gfs2: Convert gfs2_aspace_writepage() t=
o use a folio)
Merging jfs/jfs-next (e42e29cc4423 Revert "jfs: fix shift-out-of-bounds in =
dbJoin")
Merging ksmbd/ksmbd-for-next (691aae4f36f9 ksmbd: do not grant v2 lease if =
parent lease key and epoch are not set)
Merging nfs/linux-next (24457f1be29f nfs: Handle error of rpc_proc_register=
() in nfs_net_init().)
Merging nfs-anna/linux-next (57331a59ac0d NFSv4.1: Use the nfs_client's rpc=
 timeouts for backchannel)
Merging nfsd/nfsd-next (7d3d6536ca8a nfsd: set security label during create=
 operations)
Merging ntfs3/master (24f6f5020b0b fs/ntfs3: Mark volume as dirty if xattr =
is broken)
Merging orangefs/for-next (9bf93dcfc453 Julia Lawall reported this null poi=
nter dereference, this should fix it.)
Merging overlayfs/overlayfs-next (096802748ea1 ovl: remove upper umask hand=
ling from ovl_create_upper())
Merging ubifs/next (b8a77b9a5f9c mtd: ubi: fix NVMEM over UBI volumes on 32=
-bit systems)
Merging v9fs/9p-next (2a0505cdd8c8 9p: remove SLAB_MEM_SPREAD flag usage)
Merging v9fs-ericvh/ericvh/for-next (4cece7649650 Linux 6.9-rc1)
Merging xfs/for-next (25576c5420e6 xfs: simplify iext overflow checking and=
 upgrade)
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
Merging vfs-brauner/vfs.all (bf0a67a23c55 Merge branch 'vfs.netfs' into vfs=
.all)
CONFLICT (content): Merge conflict in fs/btrfs/disk-io.c
CONFLICT (content): Merge conflict in fs/tracefs/inode.c
Merging vfs/for-next (7c98f7cb8fda remove call_{read,write}_iter() function=
s)
Merging printk/for-next (a2b4cab9da77 Merge branch 'for-6.10' into for-next)
Merging pci/next (ccd0bdb57e31 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (9dd12ed95c2d pstore/blk: replace deprecated=
 strncpy with strscpy)
Merging hid/for-next (d82775b90601 Merge branch 'for-6.10/sony' into for-ne=
xt)
Merging i2c/i2c/for-next (5deb5b56bccb i2c: smbus: fix NULL function pointe=
r dereference)
Merging i2c-host/i2c/i2c-host (61e05bad821c i2c: designware: Replace MODULE=
_ALIAS() with MODULE_DEVICE_TABLE())
Merging i3c/i3c/next (8f06fb458539 i3c: Make i3c_bus_type const)
Merging dmi/dmi-for-next (0ef11f604503 firmware: dmi: Stop decoding on brok=
en entry)
Merging hwmon-staging/hwmon-next (45bf8305fb2e hwmon: (max6639) Use regmap)
Merging jc_docs/docs-next (404b444fbb3d Merge branch 'docs-mw' into docs-ne=
xt)
Merging v4l-dvb/master (4a7d735191de media: dw2102: fix coding style issues)
Merging v4l-dvb-next/master (8a09bb1be67a media: intel/ipu6: Don't re-alloc=
ate memory for firmware)
Applying: media: intel/ipu6: explicitly include vmalloc.h
Merging pm/linux-next (058b3af4882a Merge branches 'acpica', 'acpi-scan' an=
d 'acpi-resource' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (fde234239d16 dt-bindings: cpufr=
eq: cpufreq-qcom-hw: Add SM4450 compatibles)
Merging cpupower/cpupower (55f9f60852ef tools/power/cpupower: Fix Pstate fr=
equency reporting on AMD Family 1Ah CPUs)
Merging devfreq/devfreq-next (6f3c0cfe2aa5 PM / devfreq: rk3399_dmc: Conver=
t to platform remove callback returning void)
Merging pmdomain/next (d88ea3034096 pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (4cece7649650 Linux 6.9-rc1)
Merging thermal/thermal/linux-next (734b5def91b5 thermal/drivers/loongson2:=
 Add Loongson-2K2000 support)
Merging dlm/next (7b72ab2c6a46 dlm: return -ENOMEM if ls_recover_buf fails)
Merging rdma/for-next (e4e40a87024c RDMA/ipoib: Remove NULL check before de=
v_{put, hold})
Merging net-next/main (cdc74c9d06e7 Merge branch 'gve-queue-api')
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/mv=
m/Makefile
CONFLICT (content): Merge conflict in drivers/of/property.c
CONFLICT (content): Merge conflict in include/linux/slab.h
Merging bpf-next/for-next (a9e7715ce8b3 libbpf: Avoid casts from pointers t=
o enums in bpf_tracing.h)
Merging ipsec-next/master (dcf280ea0aad Merge remote branch 'xfrm: Introduc=
e direction attribute for SA')
Merging mlx5-next/mlx5-next (d727d27db536 RDMA/mlx5: Expose register c0 for=
 RDMA device)
Merging netfilter-next/main (ed1f164038b5 Merge git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net)
Merging ipvs-next/main (ed1f164038b5 Merge git://git.kernel.org/pub/scm/lin=
ux/kernel/git/netdev/net)
Merging bluetooth/master (f7bbc1e0ec8f Bluetooth: hci_conn: Use __counted_b=
y() and avoid -Wfamnae warning)
  0438daa3384a ("Bluetooth: qca: fix info leak when fetching board id")
  3da8bd8c636d ("Bluetooth: qca: fix wcn3991 device address check")
  438fcfbffd50 ("Bluetooth: qca: fix NVM configuration parsing")
  540587c30a7b ("Bluetooth: HCI: Fix potential null-ptr-deref")
  639fb017762b ("Bluetooth: msft: fix slab-use-after-free in msft_do_close(=
)")
  a757a088c27b ("arm64: dts: mediatek: mt8183-pico6: Fix bluetooth node")
  a7632943b8d8 ("Bluetooth: qca: fix firmware check error path")
  acef4e6d383c ("Bluetooth: qca: generalise device address check")
  bf6e892b6fd5 ("Bluetooth: l2cap: fix null-ptr-deref in l2cap_chan_timeout=
")
  ce5e3554beb7 ("Bluetooth: Fix use-after-free bugs caused by sco_sock_time=
out")
  e3631691e44b ("Bluetooth: qca: fix info leak when fetching fw build id")
  f905ae0be4b7 ("Bluetooth: qca: add missing firmware sanity checks")
CONFLICT (content): Merge conflict in drivers/bluetooth/btqca.c
CONFLICT (content): Merge conflict in drivers/bluetooth/btqca.h
CONFLICT (content): Merge conflict in net/bluetooth/l2cap_core.c
Merging wireless-next/for-next (f1c26960b6af Merge tag 'ath-next-20240502' =
of git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath)
Merging wpan-next/master (9187210eee7d Merge tag 'net-next-6.9' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging wpan-staging/staging (9187210eee7d Merge tag 'net-next-6.9' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mtd/mtd/next (6277967d872e mtd: mchp23k256: drop unneeded MODULE_AL=
IAS)
Merging nand/nand/next (6819db94e1cd mtd: rawnand: hynix: fixed typo)
Merging spi-nor/spi-nor/next (c84b3925c7d6 mtd: spi-nor: replace unnecessar=
y div64_u64() with div_u64())
Merging crypto/master (6117af863659 crypto: hisilicon/sec2 - fix for regist=
er offset)
Merging drm/drm-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-2024-05-02'=
 of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
  28d21e3e66c5 ("drm/xe/vm: prevent UAF in rebind_work_func()")
  8e1d1905951d ("drm/amdgpu: Fix VRAM memory accounting")
  b528cac6deaa ("drm/amd/display: Handle Y carry-over in VCP X.Y calculatio=
n")
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/compat-i915-header=
s/i915_drv.h
Merging drm-exynos/for-linux-next (2236a61bd491 Merge tag 'mediatek-drm-nex=
t-6.10' of https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/lin=
ux into drm-next)
Merging drm-misc/for-linux-next (be3f3042391d drm: zynqmp_dpsub: Always reg=
ister bridge)
Merging amdgpu/drm-next (b0923d5d80fa drm/amdgpu: remove ip dump reg_count =
variable)
  04790139c59a ("drm/amdgpu: fix doorbell regression")
  2b6c4a4b7ae5 ("drm/amd/display: Ensure that dmcub support flag is set for=
 DCN20")
  35df442d813d ("drm/amd/display: Disable seamless boot on 128b/132b encodi=
ng")
  6aa96aa8ffbe ("drm/amd/display: Fix DC mode screen flickering on DCN321")
  771c75ad0bd2 ("drm/amd/display: Allocate zero bw after bw alloc enable")
  81f3d3c9a037 ("drm/amd/display: Fix incorrect DSC instance for MST")
  8acb83689258 ("drm/amd/display: Atom Integrated System Info v2_2 for DCN3=
5")
  a89a05e3ca3e ("drm/amdkfd: Flush the process wq before creating a kfd_pro=
cess")
  b9f5fcef7280 ("drm/amd/display: Add VCO speed parameter for DCN31 FPU")
  c83ad4c3f943 ("drm/amd/display: Add dtbclk access to dcn315")
  d17846a096b3 ("drm/amd/display: Disable panel replay by default for now")
  ffda7081489b ("drm/amdgpu: once more fix the call oder in amdgpu_ttm_move=
() v2")
Merging drm-intel/for-linux-next (ca5d5ecbb90d drm/xe/bmg: Enable the displ=
ay support)
Merging drm-tegra/for-next (2429b3c529da drm/tegra: Avoid potential 32-bit =
integer overflow)
Merging drm-msm/msm-next (104e548a7c97 drm/msm/mdp4: use drmm-managed alloc=
ation for mdp4_plane)
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/Makefile
Merging drm-msm-lumag/msm-next-lumag (104e548a7c97 drm/msm/mdp4: use drmm-m=
anaged allocation for mdp4_plane)
Merging drm-xe/drm-xe-next (e9c190b9b8e7 drm/xe: Demote CCS_MODE info to de=
bug only)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_device.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_vm.c
Merging etnaviv/etnaviv/next (b735ee173f84 drm/etnaviv: Restore some id val=
ues)
Merging fbdev/for-next (ce4a7ae84a58 fbdev: offb: replace of_node_put with =
__free(device_node))
Merging regmap/for-next (991b5e2aad87 regmap: kunit: Fix an NULL vs IS_ERR(=
) check)
Merging sound/for-next (e7aeb238026c ALSA: aoa: soundbus: i2sbus: pcm: use =
'time_left' variable with wait_for_completion_timeout())
Merging ieee1394/for-next (6b0b708f12d1 firewire: core: add tracepoint even=
t for handling bus reset)
Merging sound-asoc/for-next (3785e220fd42 Merge remote-tracking branch 'aso=
c/for-6.10' into asoc-next)
Merging modules/modules-next (493abdac43bf bpf: remove CONFIG_BPF_JIT depen=
dency on CONFIG_MODULES of)
CONFLICT (content): Merge conflict in arch/powerpc/mm/mem.c
CONFLICT (content): Merge conflict in kernel/module/main.c
Merging input/next (7b4e0b39182c Input: cyapa - add missing input core lock=
ing to suspend/resume functions)
Merging block/for-next (7153772abb58 Merge branch 'for-6.10/block' into for=
-next)
CONFLICT (content): Merge conflict in io_uring/io_uring.c
CONFLICT (content): Merge conflict in io_uring/rw.c
Applying: fix up for "mm: switch mm->get_unmapped_area() to a flag"
Merging device-mapper/for-next (83637d9017b2 dm-crypt: don't set WQ_CPU_INT=
ENSIVE for WQ_UNBOUND crypt_queue)
Merging libata/for-next (9e6938e14ea5 ata: libata-core: Remove ata_exec_int=
ernal_sg())
Merging pcmcia/pcmcia-next (ccae53aa8aa2 pcmcia: cs: make pcmcia_socket_cla=
ss constant)
Merging mmc/next (35eea0defb6e mmc: renesas_sdhi: Add compatible string for=
 RZ/G2L family, RZ/G3S, and RZ/V2M SoCs)
Merging mfd/for-mfd-next (7fcb2977c0b5 dt-bindings: mfd: Convert lp873x.txt=
 to json-schema)
CONFLICT (content): Merge conflict in drivers/mfd/intel-lpss-pci.c
Merging backlight/for-backlight-next (4da294108e38 backlight: sky81452-back=
light: Remove unnecessary call to of_node_get())
Merging battery/for-next (50f0ff7c8cc4 power: supply: bq27xxx: Move health =
reading out of update loop)
Merging regulator/for-next (d3ff4628b912 Merge remote-tracking branch 'regu=
lator/for-6.10' into regulator-next)
Merging security/next (67889688e05b MAINTAINERS: update the LSM file list)
Merging apparmor/apparmor-next (8ead196be219 apparmor: Fix memory leak in u=
npack_profile())
Merging integrity/next-integrity (9fa8e7625008 ima: add crypto agility supp=
ort for template-hash algorithm)
Merging selinux/next (4b60f3cd1134 Automated merge of 'dev' into 'next')
Merging smack/next (69b6d71052b5 Smack: use init_task_smack() in smack_cred=
_transfer())
Merging tomoyo/master (0bb80ecc33a8 Linux 6.6-rc1)
Merging tpmdd/next (152585665f0f docs: trusted-encrypted: add DCP as new tr=
ust source)
  71dd2201bdef ("MAINTAINERS: Update URL's for KEYS/KEYRINGS_INTEGRITY and =
TPM DEVICE DRIVER")
Merging watchdog/master (413bf4e857fd watchdog: sa1100: Fix PTR_ERR_OR_ZERO=
() vs NULL check in sa1100dog_probe())
Merging iommu/next (ef6e717d93c7 Merge branches 'arm/renesas', 'x86/amd', '=
core' and 'x86/vt-d' into next)
CONFLICT (content): Merge conflict in drivers/acpi/scan.c
CONFLICT (content): Merge conflict in drivers/iommu/amd/amd_iommu.h
Merging audit/next (4cece7649650 Linux 6.9-rc1)
Merging devicetree/for-next (649bad67d4b1 dt-bindings: PCI: microchip: incr=
ease number of items in ranges property)
CONFLICT (content): Merge conflict in drivers/of/dynamic.c
CONFLICT (content): Merge conflict in drivers/of/property.c
Merging dt-krzk/for-next (3d679a406f3a Merge branch 'next/dt64' into for-ne=
xt)
Merging mailbox/for-next (0ac39d85a741 mailbox: zynqmp: Enable Bufferless I=
PI usage on Versal-based SOC's)
Merging spi/for-next (7f17199c1f36 Merge remote-tracking branch 'spi/for-6.=
10' into spi-next)
Merging tip/master (7de3d344c432 Merge branch into tip/master: 'x86/timers')
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/st/stm32mp251.dtsi
Merging clockevents/timers/drivers/next (8248ca30ef89 clocksource/drivers/t=
imer-riscv: Clear timer interrupt on timer initialization)
Merging edac/edac-for-next (03db22b93a01 Merge ras/edac-urgent into for-nex=
t)
Merging ftrace/for-next (7604256cecef tracing: Add __string_src() helper to=
 help compilers not to get confused)
Merging rcu/rcu/next (e7d6f9dff52c rcu/nocb: Remove buggy bypass lock conte=
ntion mitigation)
CONFLICT (content): Merge conflict in arch/Kconfig
Merging kvm/next (a96cb3bf390e Merge x86 bugfixes from Linux 6.9-rc3)
CONFLICT (content): Merge conflict in arch/x86/kvm/svm/svm.c
Applying: fixup for "KVM: VMX: Move posted interrupt descriptor out of VMX =
code"
Merging kvm-arm/next (b63b7db624b3 Merge branch kvm-arm64/misc-6.10 into kv=
marm-master/next)
Merging kvms390/next (39cd87c4eb2b Linux 6.9-rc2)
Merging kvm-ppc/topic/ppc-kvm (41bccc98fb79 Linux 6.8-rc2)
Merging kvm-riscv/riscv_kvm_next (5ef2f3d4e747 KVM: riscv: selftests: Add c=
ommandline option for SBI PMU test)
Merging kvm-x86/next (d91a9cc16417 Merge branches 'fixes', 'generic', 'misc=
', 'mmu', 'selftests', 'selftests_utils' and 'vmx')
CONFLICT (content): Merge conflict in tools/testing/selftests/kvm/aarch64/p=
sci_test.c
Merging xen-tip/linux-next (802600ebdf23 x86/xen: return a sane initial api=
c id when running as PV guest)
Merging percpu/for-next (2d9ad81ef935 Merge branch 'for-6.8-fixes' into for=
-next)
Merging workqueues/for-next (24283babc61f Merge branch 'for-6.9-fixes' into=
 for-next)
Merging drivers-x86/for-next (76f09e22027f platform/x86: ISST: Support SST-=
BF and SST-TF per level)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging chrome-platform/for-next (2fbe479c0024 platform/chrome: cros_ec: Ha=
ndle events during suspend after resume completion)
Merging chrome-platform-firmware/for-firmware-next (7f20f21c22aa firmware: =
google: cbmem: drop driver owner initialization)
Merging hsi/for-next (c076486b6a28 HSI: omap_ssi_port: Convert to platform =
remove callback returning void)
Merging leds-lj/for-leds-next (f2994f5341e0 leds: mt6370: Remove unused fie=
ld 'reg_cfgs' from 'struct mt6370_priv')
Merging ipmi/for-next (999dff3c1393 ipmi: kcs_bmc_npcm7xx: Convert to platf=
orm remove callback returning void)
Merging driver-core/driver-core-next (e5019b14230a Merge 6.9-rc5 into drive=
r-core-next)
Merging usb/usb-next (b3e40fc85735 USB: usb_parse_endpoint: ignore reserved=
 bits)
CONFLICT (content): Merge conflict in drivers/usb/dwc3/core.c
Merging thunderbolt/next (a3dc6d82de9b thunderbolt: Correct trace output of=
 firmware connection manager packets)
Merging usb-serial/usb-next (39cd87c4eb2b Linux 6.9-rc2)
Merging tty/tty-next (6bd23e0c2bb6 tty: add the option to have a tty reject=
 a new ldisc)
CONFLICT (content): Merge conflict in include/linux/kfifo.h
CONFLICT (content): Merge conflict in lib/kfifo.c
Merging char-misc/char-misc-next (1565fce99bd0 Merge tag 'iio-for-6.10b-tak=
e2' of https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into char-=
misc-next)
Merging accel/habanalabs-next (576d7cc5a9e2 accel: constify the struct devi=
ce_type usage)
Merging coresight/next (9b47d9982d1d hwtracing: hisi_ptt: Assign parent for=
 event_source device)
Merging fastrpc/for-next (4cece7649650 Linux 6.9-rc1)
Merging fpga/for-next (b7c0e1ecee40 fpga: region: add owner module and take=
 its refcount)
Merging icc/icc-next (230d05b1179f interconnect: qcom: qcm2290: Fix mas_sno=
c_bimc QoS port assignment)
Merging iio/togreg (827dca312970 iio: temperature: mcp9600: Fix temperature=
 reading for negative values)
Merging phy-next/next (960b3f023d3b dt-bindings: phy: qcom,usb-snps-femto-v=
2: use correct fallback for sc8180x)
Merging soundwire/next (a0df7e04eab0 soundwire: intel_ace2.x: add support f=
or DOAISE property)
Merging extcon/extcon-next (abe83c4e5e4f extcon: realtek: Remove unused of_=
gpio.h)
Merging gnss/gnss-next (0bbac3facb5d Linux 6.9-rc4)
Merging vfio/next (bb208810b1ab vfio/qat: Add vfio_pci driver for Intel QAT=
 SR-IOV VF devices)
Merging w1/for-next (cde37a5bdb0e w1: gpio: Don't use "proxy" headers)
Merging spmi/spmi-next (3bb8cd556eae spmi: pmic-arb: Add multi bus support)
Merging staging/staging-next (eb563dc752d3 staging: pi433: Remove unused dr=
iver)
Merging counter-next/counter-next (89d5d9e95008 counter: Don't use "proxy" =
headers)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (44c026a73be8 Linux 6.4-rc3)
Merging dmaengine/next (28059ddbee0e MAINTAINERS: Update role for IDXD driv=
er)
Merging cgroup/for-next (8f6d24a5db2a selftests/cgroup: fix uninitialized v=
ariables in test_zswap.c)
Merging scsi/for-next (8c5220c43ba0 Merge branch 'fixes' into for-next)
CONFLICT (content): Merge conflict in block/blk-settings.c
CONFLICT (content): Merge conflict in include/linux/blkdev.h
Merging scsi-mkp/for-next (aca061774bc4 scsi: mpi3mr: Fix some kernel-doc w=
arnings in scsi_bsg_mpi3mr.h)
Merging vhost/linux-next (88199634e516 vduse: enable Virtio-net device type)
CONFLICT (content): Merge conflict in drivers/virtio/virtio_mem.c
Merging rpmsg/for-next (0496190c4d42 Merge branches 'rproc-next' and 'rpmsg=
-next' into for-next)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (5539287ca656 gpio: brcmstb: add support fo=
r gpio-ranges)
Merging gpio-intel/for-next (ecc4b1418e23 gpio: Add Intel Granite Rapids-D =
vGPIO driver)
Merging pinctrl/for-next (077895d14a6b Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (5d10a157ebe0 pinctrl: baytrail: Add pinconf=
 group for uart3)
Merging pinctrl-renesas/renesas-pinctrl (cd27553b0dee pinctrl: renesas: rzg=
2l: Limit 2.5V power supply to Ethernet interfaces)
Merging pinctrl-samsung/for-next (e5b3732a9654 pinctrl: samsung: drop redun=
dant drvdata assignment)
Merging pwm/pwm/for-next (b664fc60d7f8 dt-bindings: pwm: snps,dw-apb-timers=
: Do not require pwm-cells twice)
Merging ktest/for-next (07283c1873a4 ktest: force $buildonly =3D 1 for 'mak=
e_warnings_file' test type)
Merging kselftest/next (70bfefe4252d selftests: default to host arch for LL=
VM builds)
CONFLICT (content): Merge conflict in tools/testing/selftests/mm/soft-dirty=
.c
Merging kunit/test (4cece7649650 Linux 6.9-rc1)
Merging kunit-next/kunit (2168e528f867 kunit: bail out early in __kunit_tes=
t_suites_init() if there are no suites to test)
Merging livepatching/for-next (602bf1830798 Merge branch 'for-6.7' into for=
-next)
Merging rtc/rtc-next (1c431b92e21b dt-bindings: rtc: convert trivial device=
s into dtschema)
Merging nvdimm/libnvdimm-for-next (41147b006be2 dax: remove redundant assig=
nment to variable rc)
Merging at24/at24/for-next (4cece7649650 Linux 6.9-rc1)
Merging ntb/ntb-next (9341b37ec17a ntb_perf: Fix printk format)
Merging seccomp/for-next/seccomp (39cd87c4eb2b Linux 6.9-rc2)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (b12bd525ca6e slimbus: qcom-ngd-ctrl: Add timeout =
for wait operation)
  5e8e32f81813 ("slimbus: qcom-ngd-ctrl: Reduce auto suspend delay")
  772be93c1c24 ("slimbus: qcom-ctrl: fix module autoloading")
  b12bd525ca6e ("slimbus: qcom-ngd-ctrl: Add timeout for wait operation")
  f6c637ffe528 ("slimbus: Convert to platform remove callback returning voi=
d")
Merging nvmem/for-next (9e29a1dba59b nvmem: meson-mx-efuse: Remove nvmem_de=
vice from efuse struct)
  04075398ec4f ("nvmem: lpc18xx_eeprom: Convert to platform remove callback=
 returning void")
  2ce7240c076f ("dt-bindings: nvmem: Add compatible for SC8280XP")
  3575d48e5d2f ("nvmem: layouts: sl28vpd: drop driver owner initialization")
  995b22c48ed0 ("nvmem: layouts: onie-tlv: drop driver owner initialization=
")
  9e29a1dba59b ("nvmem: meson-mx-efuse: Remove nvmem_device from efuse stru=
ct")
  af868167a709 ("dt-bindings: nvmem: qcom,spmi-sdam: update maintainer")
  e428f11ae8fb ("nvmem: layouts: store owner from modules with nvmem_layout=
_driver_register()")
  e5630036dab1 ("dt-bindings: nvmem: Add compatible for sm8450, sm8550 and =
sm8650")
  ea8f9ec2bbb7 ("nvmem: core: switch to use device_add_groups()")
  fbd0d725d4fa ("nvmem: sprd: fix module autoloading")
  fc7d05b8e427 ("nvmem: sc27xx: fix module autoloading")
Merging xarray/main (2a15de80dd0f idr: fix param name in idr_alloc_cyclic()=
 doc)
Merging hyperv/hyperv-next (f2580a907e5c x86/hyperv: Use Hyper-V entropy to=
 seed guest random number generator)
Merging auxdisplay/for-next (93ee235f55d3 auxdisplay: charlcd: Don't rebuil=
d when CONFIG_PANEL_BOOT_MESSAGE=3Dy)
Merging kgdb/kgdb/for-next (b2aba15ad6f9 serial: kgdboc: Fix NMI-safety pro=
blems from keyboard reset code)
Merging hmm/hmm (6613476e225e Linux 6.8-rc1)
Merging cfi/cfi/next (06c2afb862f9 Linux 6.5-rc1)
Merging mhi/mhi-next (48f98496b1de bus: mhi: host: pci_generic: Add generic=
 edl_trigger to allow devices to enter EDL mode)
Merging memblock/for-next (e5d1fdecfaf8 mm/memblock: remove empty dummy ent=
ry)
Merging cxl/next (d99f13843237 cxl/cper: Remove duplicated GUID defines)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (4b2543f7e1e6 efi: libstub: only free priv.runtime_map whe=
n allocated)
Merging unicode/for-next (0131c1f3cce7 unicode: make utf8 test count static)
Merging slab/slab/for-next (4a8dd3b3d550 Merge branch 'slab/for-6.10/cleanu=
p' into slab/for-next)
Merging random/master (7b1bcd6b50a6 virt: vmgenid: add support for devicetr=
ee bindings)
CONFLICT (content): Merge conflict in drivers/virt/vmgenid.c
Merging landlock/next (d6a07bb3c18c MAINTAINERS: Add G=C3=BCnther Noack as =
Landlock reviewer)
Merging rust/rust-next (56f64b370612 rust: upgrade to Rust 1.78.0)
CONFLICT (content): Merge conflict in rust/Makefile
Merging sysctl/sysctl-next (a35dd3a786f5 sysctl: drop now unnecessary out-o=
f-bounds check)
Merging execve/for-next/execve (10e29251be0e binfmt_elf_fdpic: fix /proc/<p=
id>/auxv)
Merging bitmap/bitmap-for-next (2eb411f428b8 MAINTAINERS: add BITOPS API re=
cord)
Merging hte/for-next (297f26dbf870 hte: tegra-194: Convert to platform remo=
ve callback returning void)
Merging kspp/for-next/kspp (0e148d3cca0d stackleak: Use a copy of the ctl_t=
able argument)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (0adab2b6b733 tools/nolibc: add support for uname(2))
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (4cece7649650 Linux 6.9-rc1)
Merging turbostat/next (6b9cd589464f tools/power turbostat: version 2024.04=
.27)
Merging refactor-heap/refactor-heap (940c306fd779 bcachefs: Remove heap-rel=
ated macros and switch to generic min_heap)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/+QqbqgZZuQJbWPa2fpEIB2F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY4fXMACgkQAVBC80lX
0Gz3LAf+PHUrmeU0O8Gsm0kSNf3xS6O8AU1blE7Ja2EfQrMazv6EWkY78STV4ltS
54PNxCQWuughK5XIvQYQiLKI/xbzhHgCcUfdVTVzlsq10/IIC/U7X3kq2pUx0C90
6Cn1aCpZ0PAjeYPO+uJISL4cYI8nNeaIIUb9jJWe1i7swyO2MUtHkAj060l48OhL
sZl6Jg/ypRkQd95PVadmZ9BnpJysPo2LCsei9e2UEMoExmNdjPFc/CUWlPCbgUqw
b6XSu+OVuBIyAledvX4FyPPpYclLlVOlM3AeXyBoCNu6OghYpqzw7N6dTwxxLHQL
Ue5mutOq/dHsPUNhuw3EDAAX2qtu3Q==
=2tYy
-----END PGP SIGNATURE-----

--Sig_/+QqbqgZZuQJbWPa2fpEIB2F--

