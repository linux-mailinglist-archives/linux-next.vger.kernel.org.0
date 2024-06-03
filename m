Return-Path: <linux-next+bounces-2450-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 059C28D7A78
	for <lists+linux-next@lfdr.de>; Mon,  3 Jun 2024 05:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 027401C20893
	for <lists+linux-next@lfdr.de>; Mon,  3 Jun 2024 03:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A201CBE6F;
	Mon,  3 Jun 2024 03:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tiumXL/m"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F363AD5E;
	Mon,  3 Jun 2024 03:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717385612; cv=none; b=J4RAuYk84S87epV2SsqjkuLEIGFJ/s8u7sKWhQuAJP5JLfCKCsQkPQgjfFvRs9GCuGYL1sg6wV+Jheq+5S+FOxMNFgBSKd8vZ0KJQ9md+S4GmezfeZ5Pnr+qXx45wAxBa0NNWzi8+uW7SuEbR5D955o38WBJV0IUv3WvykspPoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717385612; c=relaxed/simple;
	bh=NCrWKwRNf3vZ4GO8aXuBEuVUJmZWTqyfSKjCJSmtWn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nLB0gHGB7MrY8WjP2Vucda+pEBmVoNGe2ELhdFK/NB+oRPs5VdpTG0OgDYash13WOcZH+4ItJ/XdN+COyWOeaNHGFlR63D3UwKt27yam9D6YarV0xj6A7Y56j9AsBrLwLgJtsL+nN2+Ymrb02AiIH1fs97nrb7Y0vTANcFimE/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tiumXL/m; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717385605;
	bh=p1Sp+hAx+Q4dtoTRgSrH+YCseqyqeLEvAbO6YQkRCrI=;
	h=Date:From:To:Cc:Subject:From;
	b=tiumXL/mS0Kg8UCWlmNgIDwYz95tzCNLUnNoUV9IvOu4iaEtbwNtn1C9mslIyT1Pa
	 Zgt83mVCXaf4HSNlDZfF3epGmr1p+XptLYBsGwkLnGqc74/lLvIh6dhqRTIiLNBY5x
	 lLbY3jOEIRqT0+i9LgwlIvejwfIg+wcfvUry3Ale2eRiTLmDZs74z4DPBFKN3oTgJ+
	 PI8N+6guUPjE7+vdyIzsze05Y8Hg+lZj14HsRsj6w7KcEpoull2ymYUde62r1qg1Z2
	 O/K3AcgIW9nbXsQ7U1Lx30bNp2HybjVCrzOKKBPoAoGZABmI1cmWtH9gjMy6k5jo9w
	 wuN8LBx3YhU2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VszpF5Qwsz4wcv;
	Mon,  3 Jun 2024 13:33:25 +1000 (AEST)
Date: Mon, 3 Jun 2024 13:33:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 3
Message-ID: <20240603133251.248d6c2d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qaa.TVr+/ESPwwr.IGvYaDQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qaa.TVr+/ESPwwr.IGvYaDQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20240531:

Removed tree: powerpc-kdump-hotplug	finished with

The pci tree gained a conflict against the pci-current tree.

The i2c tree lost its build failure.

The net-next tree still had its build failure for which I reverted a commit.

The wireless-next tree gained a conflict against the wireless tree.

The drm-misc tree lost its build failure.

The slab tree gained a conflict against Linus' tree.

Non-merge commits (relative to Linus' tree): 2672
 2798 files changed, 401180 insertions(+), 49115 deletions(-)

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
Merging origin/master (a693b9c95abd Merge tag 'x86-urgent-2024-06-02' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging fixes/fixes (2dde18cd1d8f Linux 6.5)
Merging mm-hotfixes/mm-hotfixes-unstable (07a7fae658d4 mm: fix xyz_noprof f=
unctions calling profiled functions)
Merging vfs-brauner-fixes/vfs.fixes (a82c13d29985 Merge patch series "cache=
files: some bugfixes and cleanups for ondemand requests")
Merging fscrypt-current/for-current (4cece7649650 Linux 6.9-rc1)
Merging fsverity-current/for-current (4cece7649650 Linux 6.9-rc1)
Merging btrfs-fixes/next-fixes (150e675638f2 Merge branch 'misc-6.10' into =
next-fixes)
Merging vfs-fixes/fixes (bba1f6758a9e lirc: rc_dev_get_from_fd(): fix file =
leak)
Merging erofs-fixes/fixes (7af2ae1b1531 erofs: reliably distinguish block b=
ased and fscache mode)
Merging nfsd-fixes/nfsd-fixes (8d915bbf3926 NFSD: Force all NFSv4.2 COPY re=
quests to be synchronous)
Merging v9fs-fixes/fixes/next (1613e604df0c Linux 6.10-rc1)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging fs-current (41a988827390 Merge branch 'fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/viro/vfs.git)
Merging kbuild-current/fixes (1b1c9f0fd3fb dt-bindings: kbuild: Fix dt_bind=
ing_check on unconfigured build)
Merging arc-current/for-curr (e67572cd2204 Linux 6.9-rc6)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (50449ca66cc5 arm64: hibernate: Fix leve=
l3 translation fault in swsusp_save())
Merging arm-soc-fixes/arm/fixes (5549d1e39989 Merge tag 'qcom-arm64-fixes-f=
or-6.9-2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux int=
o arm/fixes)
Merging davinci-current/davinci/for-current (6613476e225e Linux 6.8-rc1)
Merging drivers-memory-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging sophgo-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging m68k-current/for-linus (ec8c8266373f m68k: defconfig: Update defcon=
figs for v6.9-rc1)
Merging powerpc-fixes/fixes (be2fc65d66e0 powerpc: Limit ARCH_HAS_KERNEL_FP=
U_SUPPORT to PPC64)
Merging s390-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging net/main (33700a0c9b56 net/tcp: Don't consider TCP_CLOSE in TCP_AO_=
ESTABLISHED)
Merging bpf/master (7d0b3953f6d8 libbpf: don't close(-1) in multi-uprobe fe=
ature detector)
Merging ipsec/master (96f887a612e4 net: esp: cleanup esp_output_tail_tcp() =
in case of unsupported ESPINTCP)
Merging netfilter/main (13c7c941e729 netdev: add qstat for csum complete)
Merging ipvs/main (13c7c941e729 netdev: add qstat for csum complete)
Merging wireless/for-next (819bda58e77b wifi: rtlwifi: Ignore IEEE80211_CON=
F_CHANGE_RETRY_LIMITS)
Merging wpan/master (07aa33988ad9 mac802154: fix time calculation in ieee80=
2154_configure_durations())
Merging rdma-fixes/for-rc (05301cb42a55 RDMA/rxe: Fix responder length chec=
king for UD request packets)
Merging sound-current/for-linus (55fac50ea46f ALSA: seq: ump: Fix missing S=
ystem Reset message handling)
Merging sound-asoc-fixes/for-linus (c85578e73013 ASoC: SOF: ipc4-topology: =
Fix nhlt configuration blob)
Merging regmap-fixes/for-linus (611b7eb19d0a regmap-i2c: Subtract reg size =
from max_write)
Merging regulator-fixes/for-linus (72b6a2d65068 regulator: rtq2208: Fix inv=
alid memory access when devm_of_regulator_put_matches is called)
Merging spi-fixes/for-linus (95d7c452a265 spi: stm32: Don't warn about spur=
ious interrupts)
Merging pci-current/for-linus (e6d1cd96b33c PCI: Revert the cfg_access_lock=
 lockdep mechanism)
Merging driver-core.current/driver-core-linus (1613e604df0c Linux 6.10-rc1)
Merging tty.current/tty-linus (83814698cf48 Merge tag 'powerpc-6.10-2' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging usb.current/usb-linus (1613e604df0c Linux 6.10-rc1)
Merging usb-serial-fixes/usb-linus (dd5a440a31fa Linux 6.9-rc7)
Merging phy/fixes (1613e604df0c Linux 6.10-rc1)
Merging staging.current/staging-linus (1613e604df0c Linux 6.10-rc1)
Merging iio-fixes/fixes-togreg (0c9b60531f77 iio: adc: ad7173: Fix sampling=
 frequency setting)
Merging counter-current/counter-current (1613e604df0c Linux 6.10-rc1)
Merging char-misc.current/char-misc-linus (1613e604df0c Linux 6.10-rc1)
Merging soundwire-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging thunderbolt-fixes/fixes (985cfe501b74 thunderbolt: debugfs: Fix mar=
gin debugfs node creation condition)
Merging input-current/for-linus (a69ce592cbe0 Input: elantech - fix touchpa=
d state on resume for Lenovo N24)
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
Merging kvm-fixes/master (0a9c28bec202 Merge tag 'kvm-s390-master-6.9-1' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
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
Merging drivers-x86-fixes/fixes (305005261379 platform/x86: touchscreen_dmi=
: Add info for the EZpad 6s Pro)
Merging samsung-krzk-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging pinctrl-samsung-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging devicetree-fixes/dt/linus (e7985f43609c of: property: Fix fw_devlin=
k handling of interrupt-map)
Merging dt-krzk-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging scsi-fixes/fixes (d53b681ce9ca scsi: ufs: mcq: Fix error output and=
 clean up ufshcd_mcq_abort())
Merging drm-fixes/drm-fixes (a2ce3f7752bf Merge tag 'drm-misc-fixes-2024-05=
-30' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes)
Merging drm-intel-fixes/for-linux-next-fixes (75800e2e4203 drm/i915: Fix au=
dio component initialization)
Merging mmc-fixes/fixes (e027e72ecc16 mmc: moxart: fix handling of sgm->con=
sumed, otherwise WARN_ON triggers)
Merging rtc-fixes/rtc-fixes (4cece7649650 Linux 6.9-rc1)
Merging gnss-fixes/gnss-linus (0bbac3facb5d Linux 6.9-rc4)
Merging hyperv-fixes/hyperv-fixes (a0b134032e6c Documentation: hyperv: Impr=
ove synic and interrupt handling description)
Merging soc-fsl-fixes/fix (06c2afb862f9 Linux 6.5-rc1)
Merging risc-v-fixes/fixes (7932b172ac7e Revert "riscv: mm: accelerate page=
fault when badaccess")
Merging riscv-dt-fixes/riscv-dt-fixes (2c917b55d665 riscv: dts: canaan: Dis=
able I/O devices unless used)
Merging riscv-soc-fixes/riscv-soc-fixes (1613e604df0c Linux 6.10-rc1)
Merging fpga-fixes/fixes (54435d1f21b3 fpga: dfl-pci: add PCI subdevice ID =
for Intel D5005 card)
Merging spdx/spdx-linus (c760b3725e52 Merge tag 'mm-nonmm-stable-2024-05-22=
-17-30' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm)
Merging gpio-brgl-fixes/gpio/for-current (1613e604df0c Linux 6.10-rc1)
Merging gpio-intel-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging pinctrl-intel-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging auxdisplay-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging kunit-fixes/kunit-fixes (1613e604df0c Linux 6.10-rc1)
Merging memblock-fixes/fixes (e0eec24e2e19 memblock: make memblock_set_node=
() also warn about use of MAX_NUMNODES)
Merging renesas-fixes/fixes (8c987693dc2d ARM: dts: renesas: rcar-gen2: Add=
 missing #interrupt-cells to DA9063 nodes)
Merging perf-current/perf-tools (4f1b067359ac Revert "perf parse-events: Pr=
efer sysfs/JSON hardware events over legacy")
Merging efi-fixes/urgent (1c5a1627f481 efi/unaccepted: touch soft lockup du=
ring memory accept)
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging uml-fixes/fixes (73a23d771033 um: harddog: fix modular build)
Merging iommufd-fixes/for-rc (dd5a440a31fa Linux 6.9-rc7)
Merging rust-fixes/rust-fixes (1613e604df0c Linux 6.10-rc1)
Merging w1-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging pmdomain-fixes/fixes (e8dc41afca16 pmdomain: imx: gpcv2: Add delay =
after power up handshake)
Merging i2c-host-fixes/i2c/i2c-host-fixes (6d69b6c12fce Merge tag 'nfs-for-=
6.10-1' of git://git.linux-nfs.org/projects/trondmy/linux-nfs)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (2607133196c3 clk: sifive: Do not register clkd=
evs for PRCI clocks)
Merging drm-misc-fixes/for-linux-next-fixes (bb1953588068 drm/msm: remove p=
ython 3.9 dependency for compiling msm)
Merging mm-stable/mm-stable (1613e604df0c Linux 6.10-rc1)
Merging mm-nonmm-stable/mm-nonmm-stable (1613e604df0c Linux 6.10-rc1)
Merging mm/mm-everything (306dde9ce5c9 foo)
Merging kbuild/for-next (1b1c9f0fd3fb dt-bindings: kbuild: Fix dt_binding_c=
heck on unconfigured build)
Merging clang-format/clang-format (5a205c6a9f79 clang-format: Update with v=
6.7-rc4's `for_each` macro list)
Merging perf/perf-tools-next (af7520163400 perf top: Allow filters on event=
s)
Merging compiler-attributes/compiler-attributes (2993eb7a8d34 Compiler Attr=
ibutes: counted_by: fixup clang URL)
Merging dma-mapping/for-next (82d71b53d7e7 Documentation/core-api: correct =
reference to SWIOTLB_DYNAMIC)
Merging asm-generic/master (02af68767d27 Merge branch 'alpha-cleanup-6.9' i=
nto asm-generic)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (95968f411042 Merge branch 'clkdev' into for-next)
Merging arm64/for-next/core (e92bee9f861b arm64/fpsimd: Avoid erroneous eli=
de of user state reload)
Merging arm-perf/for-next/perf (410e471f8746 arm64: Add USER_STACKTRACE sup=
port)
Merging arm-soc/for-next (1e3dd71e2587 Merge branch 'soc/defconfig' into fo=
r-next)
Merging amlogic/for-next (456f4f5e6e6d Merge branch 'v6.11/arm64-dt' into f=
or-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (c44211af1aa9 ARM: dts: aspeed: Add ASRock E3C256D4=
I BMC)
Merging at91/at91-next (fa8e55345b64 Merge branch 'microchip-dt64' into at9=
1-next)
Merging broadcom/next (06902980d07a Merge branch 'devicetree/next' into nex=
t)
Merging davinci/davinci/for-next (6613476e225e Linux 6.8-rc1)
Merging drivers-memory/for-next (1613e604df0c Linux 6.10-rc1)
Merging imx-mxs/for-next (8c4bf8c96748 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (6d71fef71cd7 arm64: dts: mediatek: mt7986a: bpi-=
r3: Convert to sugar syntax)
Merging mvebu/for-next (da8e8356f594 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (5856330c3d56 Merge branch 'drivers-ti-sysc-for-v6.10=
' into for-next)
Merging qcom/for-next (95f497286713 Merge branches 'arm32-for-6.11', 'arm64=
-defconfig-for-6.11', 'arm64-fixes-for-6.10', 'arm64-for-6.11', 'clk-fixes-=
for-6.10', 'clk-for-6.11' and 'drivers-for-6.11' into for-next)
Merging renesas/next (852c50b833be Merge branches 'renesas-arm-defconfig-fo=
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
Merging stm32/stm32-next (dccdbccb7045 arm64: dts: st: correct masks for GI=
C PPI interrupts on stm32mp25)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/st/stm32mp251.dtsi
Merging sunxi/sunxi/for-next (1123b5f0a935 Merge branch 'sunxi/dt-for-6.11'=
 into sunxi/for-next)
Merging tee/next (cd88a296582c Merge branch 'optee_notif_wait_timeout_for_v=
6.11' into next)
Merging tegra/for-next (2fd759c1796c Merge branch for-6.10/arm64/defconfig =
into for-next)
Merging ti/ti-next (f532f2375771 Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (3bdc4c661d47 Merge branch 'zynqmp/soc' into for-ne=
xt)
Merging clk/clk-next (e1c1038e7387 Merge branch 'clk-fixes' into clk-next)
Merging clk-imx/for-next (f5072cffb35c clk: imx: imx8mp: Convert to platfor=
m remove callback returning void)
Merging clk-renesas/renesas-clk (5add5ebc4e35 clk: renesas: r9a08g045: Add =
support for power domains)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (4f5fc9b26986 LoongArch: Fix GMAC's phy-mo=
de definitions in dts)
Merging m68k/for-next (ec8c8266373f m68k: defconfig: Update defconfigs for =
v6.9-rc1)
Merging m68knommu/for-next (1613e604df0c Linux 6.10-rc1)
Merging microblaze/next (32cf1deb9c04 MICROBLAZE kc705 2017.4 full with cpu=
-reg fix NEW with reserved memory)
Merging mips/mips-next (1613e604df0c Linux 6.10-rc1)
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (bbf5c979011a Linux 5.9)
Merging powerpc/next (1613e604df0c Linux 6.10-rc1)
Merging soc-fsl/next (fb9c384625dd bus: fsl-mc: fsl-mc-allocator: Drop a wr=
ite-only variable)
Merging risc-v/for-next (1613e604df0c Linux 6.10-rc1)
Merging riscv-dt/riscv-dt-for-next (8e675c37e066 riscv: dts: thead: th1520:=
 Add PMU event node)
Merging riscv-soc/riscv-soc-for-next (1613e604df0c Linux 6.10-rc1)
Merging s390/for-next (c1248638f8c3 s390/zcrypt: Use kvcalloc() instead of =
kvmalloc_array())
Merging sh/for-next (1613e604df0c Linux 6.10-rc1)
Merging sparc/for-next (1c9e709cde80 sparc/leon: Remove on-stack cpumask va=
r)
Merging uml/next (919e3ece7f5a um: virtio_uml: Convert to platform remove c=
allback returning void)
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging bcachefs/for-next (ae6595227d92 bcachefs: Eytzinger accumulation fo=
r accounting keys)
Merging pidfd/for-next (a901a3568fd2 Merge tag 'iomap-6.5-merge-1' of git:/=
/git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging fscrypt/for-next (7f016edaa0f3 fscrypt: try to avoid refing parent =
dentry in fscrypt_file_open)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (aa0d3341f6f2 Merge branch 'for-next-next-v6.10-2024=
0529' into for-next-20240529)
Merging ceph/master (93a2221c9c1a doc: ceph: update userspace command to ge=
t CephFS metadata)
Merging cifs/for-next (89be4025b0db Merge tag '6.10-rc1-smb3-client-fixes' =
of git://git.samba.org/sfrench/cifs-2.6)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging erofs/dev (1613e604df0c Linux 6.10-rc1)
Merging exfat/dev (878387af4105 exfat: handle idmapped mounts)
Merging exportfs/exportfs-next (e8f897f4afef Linux 6.8)
Merging ext3/for_next (82172cca18b2 Merge isofs Makefile cleanup.)
Merging ext4/dev (c6a6c9694aad ext4: fix error pointer dereference in ext4_=
mb_load_buddy_gfp())
Merging f2fs/dev (72ece20127a3 Merge tag 'f2fs-for-6.10.rc1' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs)
Merging fsverity/for-next (ee5814dddefb fsverity: use register_sysctl_init(=
) to avoid kmemleak warning)
Merging fuse/for-next (529395d2ae64 virtio-fs: add multi-queue support)
Merging gfs2/for-next (713f8834389f gfs2: Get rid of demote_ok checks)
Merging jfs/jfs-next (ee6817e72d4e jfs: Remove use of folio error flag)
Merging ksmbd/ksmbd-for-next (6c8b1a2dca0b Merge tag '6.10-rc-ksmbd-server-=
fixes' of git://git.samba.org/ksmbd)
Merging nfs/linux-next (99bc9f2eb3f7 NFS: add barriers when testing for NFS=
_FSDATA_BLOCKED)
Merging nfs-anna/linux-next (57331a59ac0d NFSv4.1: Use the nfs_client's rpc=
 timeouts for backchannel)
Merging nfsd/nfsd-next (445021b1fb9a svcrdma: Handle ADDR_CHANGE CM event p=
roperly)
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
Merging vfs-brauner/vfs.all (9e20a230d484 Merge branch 'vfs.module.descript=
ion' into vfs.all)
Merging vfs/for-next (a38297e3fb01 Linux 6.9)
Merging fs-next (0551392533c7 Merge branch 'vfs.all' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/vfs/vfs.git)
Merging printk/for-next (f3760c80d06a Merge branch 'rework/write-atomic' in=
to for-next)
CONFLICT (content): Merge conflict in include/linux/printk.h
CONFLICT (content): Merge conflict in include/linux/serial_core.h
Merging pci/next (3f7563262863 Merge branch 'pci/controller/tegra194')
CONFLICT (content): Merge conflict in drivers/pci/pci.c
Merging pstore/for-next/pstore (9dd12ed95c2d pstore/blk: replace deprecated=
 strncpy with strscpy)
Merging hid/for-next (719800478543 Merge branch 'for-6.9/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (ec23dafe4ed1 Merge tag 'i2c-host-6.10-pt2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux into i2c/for-me=
rgewindow)
Merging i2c-host/i2c/i2c-host (a6b250149c79 i2c: synquacer: Remove a clk re=
ference from struct synquacer_i2c)
  a6b250149c79 ("i2c: synquacer: Remove a clk reference from struct synquac=
er_i2c")
Merging i3c/i3c/next (1d08326020fb i3c: dw: Add hot-join support.)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (f1de23611316 hwmon: (max31827) Add PEC su=
pport)
Merging jc_docs/docs-next (cd706ca28a0a Merge branch 'docs-mw' into docs-ne=
xt)
Merging v4l-dvb/master (8771b7f31b7f media: bcm2835-unicam: Depend on COMMO=
N_CLK)
Merging v4l-dvb-next/master (8771b7f31b7f media: bcm2835-unicam: Depend on =
COMMON_CLK)
Merging pm/linux-next (edddc097b540 Merge branch 'thermal-core' into linux-=
next)
Merging cpufreq-arm/cpufreq/arm/linux-next (10e0a8f83294 cpufreq: longhaul:=
 Fix kernel-doc param for longhaul_setstate)
Merging cpupower/cpupower (43cad521c6d2 tools/power/cpupower: Fix Pstate fr=
equency reporting on AMD Family 1Ah CPUs)
Merging devfreq/devfreq-next (ccad360a2d41 PM / devfreq: exynos: Use DEFINE=
_SIMPLE_DEV_PM_OPS for PM functions)
Merging pmdomain/next (e8dc41afca16 pmdomain: imx: gpcv2: Add delay after p=
ower up handshake)
Merging opp/opp/linux-next (d86a2f080068 OPP: Fix missing cleanup on error =
in _opp_attach_genpd())
Merging thermal/thermal/linux-next (69b08420b697 thermal: renesas: rcar: Ad=
d dependency on OF)
Merging dlm/next (fa0b54f17afe dlm: move recover idr to xarray datastructur=
e)
Merging rdma/for-next (2d0e7ba468ea RDMA/efa: Properly handle unexpected AQ=
 completions)
Merging net-next/main (b5c089880723 af_unix: Remove dead code in unix_strea=
m_read_generic().)
Applying: Revert "ethernet: octeontx2: avoid linking objects into multiple =
modules"
Merging bpf-next/for-next (531876c80004 libbpf: keep FD_CLOEXEC flag when d=
up()'ing FD)
Merging ipsec-next/master (5233a55a5254 mISDN: remove unused struct 'bf_ctx=
')
Merging mlx5-next/mlx5-next (1613e604df0c Linux 6.10-rc1)
Merging netfilter-next/main (5c1672705a1a net: revert partially applied PHY=
 topology series)
Merging ipvs-next/main (5c1672705a1a net: revert partially applied PHY topo=
logy series)
Merging bluetooth/master (3c376f35eb13 Bluetooth: Use sizeof(*pointer) inst=
ead of sizeof(type))
Merging wireless-next/for-next (5bcd9a0a5995 wifi: brcm80211: remove unused=
 structs)
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
Merging drm/drm-next (1613e604df0c Linux 6.10-rc1)
Merging drm-exynos/for-linux-next (fb6e82e968ca drm/exynos: hdmi: report sa=
fe 640x480 mode as a fallback when no EDID found)
Merging drm-misc/for-linux-next (539d33b57838 drm/komeda: remove unused str=
uct 'gamma_curve_segment')
Merging amdgpu/drm-next (f8718c482572 drm/amd/display: Move 'struct scaler_=
data' off stack)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu13/sm=
u_v13_0_4_ppt.c
Merging drm-intel/for-linux-next (cef26c248110 MAINTAINERS: update i915 and=
 xe entries for include/drm/intel)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_vb=
t_defs.h
Merging drm-tegra/for-next (2429b3c529da drm/tegra: Avoid potential 32-bit =
integer overflow)
Merging drm-msm/msm-next (b587f413ca47 drm/msm/gen_header: allow skipping t=
he validation)
Merging drm-msm-lumag/msm-next-lumag (104e548a7c97 drm/msm/mdp4: use drmm-m=
anaged allocation for mdp4_plane)
Merging drm-xe/drm-xe-next (877517f2dcba drm/xe: Add kernel-doc to some xe_=
lrc interfaces)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_devcoredump.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_device.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_pci.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_vm.c
Merging etnaviv/etnaviv/next (e843e87abb90 drm/etnaviv: Disable SH_EU clock=
 gating on VIPNano-Si+)
Merging fbdev/for-next (a38297e3fb01 Linux 6.9)
Merging regmap/for-next (611b7eb19d0a regmap-i2c: Subtract reg size from ma=
x_write)
Merging sound/for-next (55fac50ea46f ALSA: seq: ump: Fix missing System Res=
et message handling)
Merging ieee1394/for-next (a38297e3fb01 Linux 6.9)
Merging sound-asoc/for-next (c85578e73013 ASoC: SOF: ipc4-topology: Fix nhl=
t configuration blob)
Merging modules/modules-next (2c9e5d4a0082 bpf: remove CONFIG_BPF_JIT depen=
dency on CONFIG_MODULES of)
Merging input/next (6f47c7ae8c7a Merge tag 'v6.9' into next)
Merging block/for-next (b5cca5417e5f Merge branch 'for-6.11/io_uring' into =
for-next)
Merging device-mapper/for-next (825d8bbd2f32 dm: always manage discard supp=
ort in terms of max_hw_discard_sectors)
Merging libata/for-next (a4e5862b1bf8 Merge remote-tracking branch 'libata/=
for-6.11' into HEAD)
Merging pcmcia/pcmcia-next (ccae53aa8aa2 pcmcia: cs: make pcmcia_socket_cla=
ss constant)
Merging mmc/next (35eea0defb6e mmc: renesas_sdhi: Add compatible string for=
 RZ/G2L family, RZ/G3S, and RZ/V2M SoCs)
Merging mfd/for-mfd-next (ebcd1453f15e mfd: intel-lpss: Rename SPI intel_lp=
ss_platform_info structs)
Merging backlight/for-backlight-next (b72755f5b577 backlight: Add new lm350=
9 backlight driver)
Merging battery/for-next (ebacfa1f09c1 power: supply: Drop explicit initial=
ization of struct i2c_device_id::driver_data to 0)
Merging regulator/for-next (72b6a2d65068 regulator: rtq2208: Fix invalid me=
mory access when devm_of_regulator_put_matches is called)
Merging security/next (1613e604df0c Linux 6.10-rc1)
Merging apparmor/apparmor-next (3dd384108d53 apparmor: fix possible NULL po=
inter dereference)
Merging integrity/next-integrity (9fa8e7625008 ima: add crypto agility supp=
ort for template-hash algorithm)
Merging selinux/next (1613e604df0c Linux 6.10-rc1)
Merging smack/next (69b6d71052b5 Smack: use init_task_smack() in smack_cred=
_transfer())
Merging tomoyo/master (1613e604df0c Linux 6.10-rc1)
Merging tpmdd/next (e0cce98fe279 Merge tag 'tpmdd-next-6.10-rc2' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd)
Merging watchdog/master (83814698cf48 Merge tag 'powerpc-6.10-2' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging iommu/next (2bd5059c6cc0 Merge branches 'arm/renesas', 'arm/smmu', =
'x86/amd', 'core' and 'x86/vt-d' into next)
Merging audit/next (1613e604df0c Linux 6.10-rc1)
Merging devicetree/for-next (596c29f3c8de of/fdt: avoid re-parsing '#{addre=
ss,size}-cells' in of_fdt_limit_memory)
Merging dt-krzk/for-next (1613e604df0c Linux 6.10-rc1)
Merging mailbox/for-next (10b98582bc76 dt-bindings: mailbox: qcom-ipcc: Doc=
ument the SDX75 IPCC)
Merging spi/for-next (95d7c452a265 spi: stm32: Don't warn about spurious in=
terrupts)
Merging tip/master (e29f5ab977b6 Merge branch into tip/master: 'x86/percpu')
Merging clockevents/timers/drivers/next (2030a7e11f16 clocksource/drivers/a=
rm_arch_timer: Mark hisi_161010101_oem_info const)
Merging edac/edac-for-next (123b15863550 EDAC, i10nm: make skx_common.o a s=
eparate module)
Merging ftrace/for-next (fde0aeca5926 Merge user-events/for-next)
Merging rcu/next (8dbd92a1950e rcu: Fix rcu_barrier() VS post CPUHP_TEARDOW=
N_CPU invocation)
Merging paulmck/non-rcu/next (aa451ad3bd81 Merge branches 'cmpxchg.2024.05.=
30b', 'kcsan.2024.05.30b', 'lkmm.2024.05.30b', 'torture.2024.05.30b' and 't=
sc.2024.05.27a' into HEAD)
Merging kvm/next (6f627b425378 KVM: SVM: Add module parameter to enable SEV=
-SNP)
Merging kvm-arm/next (eaa46a28d596 Merge branch kvm-arm64/mpidr-reset into =
kvmarm-master/next)
Merging kvms390/next (39cd87c4eb2b Linux 6.9-rc2)
Merging kvm-ppc/topic/ppc-kvm (c6482eb8d937 KVM: PPC: Book3S HV nestedv2: A=
dd support for reading VPA counters for pseries guests)
Merging kvm-riscv/riscv_kvm_next (c66f3b40b17d RISC-V: KVM: Fix incorrect r=
eg_subtype labels in kvm_riscv_vcpu_set_reg_isa_ext function)
Merging kvm-x86/next (d91a9cc16417 Merge branches 'fixes', 'generic', 'misc=
', 'mmu', 'selftests', 'selftests_utils' and 'vmx')
Merging xen-tip/linux-next (a3607581cd49 drivers/xen: Improve the late XenS=
tore init protocol)
Merging percpu/for-next (2d9ad81ef935 Merge branch 'for-6.8-fixes' into for=
-next)
Merging workqueues/for-next (2a1b02bcba78 workqueue: Refactor worker ID for=
matting and make wq_worker_comm() use full ID string)
Merging drivers-x86/for-next (996ad4129810 platform/x86: dell-pc: Implement=
 platform_profile)
Merging chrome-platform/for-next (e8665a172378 hwmon: add ChromeOS EC drive=
r)
Merging chrome-platform-firmware/for-firmware-next (1613e604df0c Linux 6.10=
-rc1)
Merging hsi/for-next (f02cfe695047 HSI: ssi_protocol: Remove unused linux/g=
pio.h)
Merging leds-lj/for-leds-next (005408af25d5 leds: trigger: Add new LED Inpu=
t events trigger)
Merging ipmi/for-next (999dff3c1393 ipmi: kcs_bmc_npcm7xx: Convert to platf=
orm remove callback returning void)
Merging driver-core/driver-core-next (1613e604df0c Linux 6.10-rc1)
Merging usb/usb-next (1613e604df0c Linux 6.10-rc1)
Merging thunderbolt/next (3c34a29159df thunderbolt: Mention Thunderbolt/USB=
4 debugging tools in Kconfig)
Merging usb-serial/usb-next (39cd87c4eb2b Linux 6.9-rc2)
Merging tty/tty-next (83814698cf48 Merge tag 'powerpc-6.10-2' of git://git.=
kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging char-misc/char-misc-next (1613e604df0c Linux 6.10-rc1)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (9b47d9982d1d hwtracing: hisi_ptt: Assign parent for=
 event_source device)
Merging fastrpc/for-next (a16833330e2f misc: fastrpc: Use memdup_user())
Merging fpga/for-next (b7c0e1ecee40 fpga: region: add owner module and take=
 its refcount)
Merging icc/icc-next (230d05b1179f interconnect: qcom: qcm2290: Fix mas_sno=
c_bimc QoS port assignment)
Merging iio/togreg (15895709c7dc iio: imu: bmi323: Use iio read_acpi_mount_=
matrix() helper)
CONFLICT (content): Merge conflict in drivers/iio/pressure/bmp280-core.c
Merging phy-next/next (1613e604df0c Linux 6.10-rc1)
Merging soundwire/next (1613e604df0c Linux 6.10-rc1)
Merging extcon/extcon-next (3e8e45b65d9f extcon: adc-jack: Document missing=
 struct members)
Merging gnss/gnss-next (0bbac3facb5d Linux 6.9-rc4)
Merging vfio/next (cbb325e77fbe vfio/pci: Restore zero affected bus reset d=
evices warning)
Merging w1/for-next (26bf5fc86033 w1: Drop allocation error message)
Merging spmi/spmi-next (1613e604df0c Linux 6.10-rc1)
Merging staging/staging-next (1613e604df0c Linux 6.10-rc1)
Merging counter-next/counter-next (1613e604df0c Linux 6.10-rc1)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (44c026a73be8 Linux 6.4-rc3)
Merging dmaengine/next (1613e604df0c Linux 6.10-rc1)
Merging cgroup/for-next (018ee567def3 cgroup/cpuset: Reduce the lock protec=
ting CS_SCHED_LOAD_BALANCE)
Merging scsi/for-next (d53b681ce9ca scsi: ufs: mcq: Fix error output and cl=
ean up ufshcd_mcq_abort())
Merging scsi-mkp/for-next (e8a1d87b7983 scsi: ufs: mcq: Convert MCQ_CFG_n t=
o an inline function)
Merging vhost/linux-next (c8fae27d141a virtio-pci: Check if is_avq is NULL)
Merging rpmsg/for-next (d7faf9a16886 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (2ba4746b418d gpiolib: cdev: Cleanup kfifo_=
out() error handling)
Merging gpio-intel/for-next (1613e604df0c Linux 6.10-rc1)
Merging pinctrl/for-next (517b3757b780 pinctrl: core: reset gpio_device in =
loop in pinctrl_pins_show())
Merging pinctrl-intel/for-next (1613e604df0c Linux 6.10-rc1)
Merging pinctrl-renesas/renesas-pinctrl (c45c3f5f9593 pinctrl: renesas: Use=
 scope based of_node_put() cleanups)
Merging pinctrl-samsung/for-next (1613e604df0c Linux 6.10-rc1)
Merging pwm/pwm/for-next (5628b6db0071 dt-bindings: pwm: fsl-ftm: Convert t=
o yaml format)
Merging ktest/for-next (07283c1873a4 ktest: force $buildonly =3D 1 for 'mak=
e_warnings_file' test type)
Merging kselftest/next (1613e604df0c Linux 6.10-rc1)
Merging kunit/test (1613e604df0c Linux 6.10-rc1)
Merging kunit-next/kunit (2c7afc2a880c kunit: Cover 'assert.c' with tests)
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
Merging auxdisplay/for-next (91d0e8d07ce5 auxdisplay: linedisp: Support con=
figuring the boot message)
Merging kgdb/kgdb/for-next (b2aba15ad6f9 serial: kgdboc: Fix NMI-safety pro=
blems from keyboard reset code)
Merging hmm/hmm (6613476e225e Linux 6.8-rc1)
Merging cfi/cfi/next (06c2afb862f9 Linux 6.5-rc1)
Merging mhi/mhi-next (48f98496b1de bus: mhi: host: pci_generic: Add generic=
 edl_trigger to allow devices to enter EDL mode)
Merging memblock/for-next (e5d1fdecfaf8 mm/memblock: remove empty dummy ent=
ry)
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
Merging sysctl/sysctl-next (a35dd3a786f5 sysctl: drop now unnecessary out-o=
f-bounds check)
Merging execve/for-next/execve (4bbf9c3b53e6 fs/coredump: Enable dynamic co=
nfiguration of max file note size)
Merging bitmap/bitmap-for-next (3d053947e400 lib: bitmap: add missing MODUL=
E_DESCRIPTION() macros)
Merging hte/for-next (297f26dbf870 hte: tegra-194: Convert to platform remo=
ve callback returning void)
Merging kspp/for-next/kspp (99a6087dfdc6 kunit/fortify: Remove __kmalloc_no=
de() test)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (1613e604df0c Linux 6.10-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (4cece7649650 Linux 6.9-rc1)
Merging turbostat/next (256d218ec6ae tools/power turbostat: version 2024.05=
.10)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/qaa.TVr+/ESPwwr.IGvYaDQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZdOYUACgkQAVBC80lX
0Gzi+gf/Tfo7uM61+rOPBNwLlIgD8y29MYkRWzaGDb5MnY8N1ahtxXwkp/kSsS5y
tDQcvZppX5SHlPVZfRppLLeA3NhzLUR6E55DvWLs1baqL7Kwg6jTFnxeo7aYkbC0
pYdezQHDGurEahQ+F8FQqE7mk2z8nH9bR+ZThP4gYl4ygLplPAsGfGnUM215C7Ke
lagG62owmn4mB2k56tvSX/q6DSdDcPTLtIRRIB/zxvwGORe0C2yvegT4SyyLWkvM
kRqfehZc1jJcKe92Q3QYNC5BPwjgp9NQb+cUsh/kT52oPPgyrO5tszsXPkg9t/aW
iKXGjRnGKFnYjWmcUtNw7gynAPnDVA==
=cd+G
-----END PGP SIGNATURE-----

--Sig_/qaa.TVr+/ESPwwr.IGvYaDQ--

