Return-Path: <linux-next+bounces-797-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB2083858A
	for <lists+linux-next@lfdr.de>; Tue, 23 Jan 2024 03:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BA5B284693
	for <lists+linux-next@lfdr.de>; Tue, 23 Jan 2024 02:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B1C4F88E;
	Tue, 23 Jan 2024 02:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MDlWHWgf"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4744F886;
	Tue, 23 Jan 2024 02:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705976979; cv=none; b=GgeESwIzkBU3M6+5o4L5rv+upIJnwkVizvsSnzowcLJwVkKHw1ndZkYTwOAgboJZZCHbkxj9+XzjF+dMeWIq9xFLHjL6dxcRFTuIo+xvGOP8+u6ZnwCMLJrW7t0dsMvrWIzOEhzcaW9hD5bGBD3Xq292UDDbcutr8fwBQpmxh58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705976979; c=relaxed/simple;
	bh=VsbIkcfJ4hy/PpjIq7sqcTmxQJAYNkXVCXXIpUXPAd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YOHb1/U02WNe2W/QzQ4Uiyj6IicHT65rs7VCC+dg5HC23ZOok3oU3OaiySMF+QsZFSDK9gSiY3I3iOZT7Bp2QzqtlEU/tEzLMTcLEP98IprJ4b0aIsPLxtqedEkdvcNsovOMU/n5n0a0G58Hn3luy1D09G8scofJqaStmKgVtEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MDlWHWgf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1705976971;
	bh=PYsBcBTQHJQS5hnKUaVlEt2YbV0Ts+BzQ4sTn7nre9o=;
	h=Date:From:To:Cc:Subject:From;
	b=MDlWHWgf6COnr/rsO1Nvxv9AP3IatqVfSDg61j87/FUlG2lxDw29cM8125osDhqlo
	 N4BMKsU+tPIjddUnww4eFqD7vt6d1JL7pYIqYzmgvkMYXmyLwkbLeSGI5DOhTMvftS
	 7FtaA/yzv3B9uY1+IG/J+K/RuLs1vrnFgcbz+1x+rHTaZtTmmC+pSsHLGTP4aHAWsr
	 jul2R0VFABlYocrzutFUroIbyHaTvx2YCTS77ajy+jy+PqmrzlRMGL4drb6sRHzcEm
	 EEijuFqbza6PM4M0XjoiWIg2NsdpnZ33PAFjnJrFgUoZ7xPTXqAcQajYE2YJSbNly3
	 BjJ/DwOPI2TpQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TJrdQ73Jqz4yNb;
	Tue, 23 Jan 2024 13:29:30 +1100 (AEDT)
Date: Tue, 23 Jan 2024 13:29:29 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 23
Message-ID: <20240123132929.7cb6ea4c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ICL1ocFmxZ9F8eeMVGlUHQE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ICL1ocFmxZ9F8eeMVGlUHQE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

News: there will be no linux-next release on Friday

Changes since 20240122:

The vfs-brauner tree gained a build failure so I used the version from
next-20240122.

Non-merge commits (relative to Linus' tree): 971
 1210 files changed, 36757 insertions(+), 43230 deletions(-)

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

I am currently merging 371 trees (counting Linus' and 104 trees of bug
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
Merging origin/master (5d9248eed480 Merge tag 'for-6.8-rc1-tag' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging fixes/fixes (2dde18cd1d8f Linux 6.5)
Merging mm-hotfixes/mm-hotfixes-unstable (e73c62516e03 MAINTAINERS: supplem=
ent of zswap maintainers update)
Merging kbuild-current/fixes (e5075d8ec564 Merge tag 'riscv-for-linus-6.8-m=
w4' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging arc-current/for-curr (861deac3b092 Linux 6.7-rc7)
Merging arm-current/fixes (f54e8634d136 ARM: 9330/1: davinci: also select P=
INCTRL)
Merging arm64-fixes/for-next/fixes (3c0696076aad arm64: mm: Always make sw-=
dirty PTEs hw-dirty in pte_modify)
Merging arm-soc-fixes/arm/fixes (643fe70e7bcd ARM: sun9i: smp: fix return c=
ode check of of_property_match_string)
Merging davinci-current/davinci/for-current (6613476e225e Linux 6.8-rc1)
Merging drivers-memory-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging tee-fixes/fixes (ceaa837f96ad Linux 6.2-rc8)
Merging m68k-current/for-linus (6b9c045b0602 m68k: defconfig: Update defcon=
figs for v6.7-rc1)
Merging powerpc-fixes/fixes (18f14afe2816 powerpc/64s: Increase default sta=
ck size to 32KB)
Merging s390-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging sparc/master (2d2b17d08bfc sparc: Unbreak the build)
Merging fscrypt-current/for-current (4bcf6f827a79 fscrypt: check for NULL k=
eyring in fscrypt_put_master_key_activeref())
Merging fsverity-current/for-current (a075bacde257 fsverity: don't drop pag=
ecache at end of FS_IOC_ENABLE_VERITY)
Merging net/main (13e788deb734 net/rds: Fix UBSAN: array-index-out-of-bound=
s in rds_cmsg_recv)
Merging bpf/master (13e788deb734 net/rds: Fix UBSAN: array-index-out-of-bou=
nds in rds_cmsg_recv)
Merging ipsec/master (1982a2a02c91 xfrm: Clear low order bits of ->flowi4_t=
os in decode_session4().)
Merging netfilter/main (d6938c1c76c6 ipvs: avoid stat macros calls from pre=
emptible context)
Merging ipvs/main (b29be0ca8e81 netfilter: nft_immediate: drop chain refere=
nce counter on error)
Merging wireless/for-next (bcbc84af1183 wifi: mac80211: fix race condition =
on enabling fast-xmit)
Merging wpan/master (b85ea95d0864 Linux 6.7-rc1)
Merging rdma-fixes/for-rc (a39b6ac3781d Linux 6.7-rc5)
Merging sound-current/for-linus (1513664f3402 ALSA: hda/realtek: fix mute/m=
icmute LEDs for HP ZBook Power)
Merging sound-asoc-fixes/for-linus (c481016bb4f8 ASoC: qcom: sc8280xp: limi=
t speaker volumes)
Merging regmap-fixes/for-linus (8b921545ddc6 Merge remote-tracking branch '=
regmap/for-6.7' into regmap-linus)
Merging regulator-fixes/for-linus (b3cbdcc19181 regulator: pwm-regulator: M=
anage boot-on with disabled PWM channels)
Merging spi-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging pci-current/for-linus (6613476e225e Linux 6.8-rc1)
Merging driver-core.current/driver-core-linus (6613476e225e Linux 6.8-rc1)
Merging tty.current/tty-linus (6613476e225e Linux 6.8-rc1)
Merging usb.current/usb-linus (6613476e225e Linux 6.8-rc1)
Merging usb-serial-fixes/usb-linus (610a9b8f49fb Linux 6.7-rc8)
Merging phy/fixes (6613476e225e Linux 6.8-rc1)
Merging staging.current/staging-linus (6613476e225e Linux 6.8-rc1)
Merging iio-fixes/fixes-togreg (9c46e3a5232d iio: adc: ad7091r8: Fix error =
code in ad7091r8_gpio_setup())
Merging counter-current/counter-current (a39b6ac3781d Linux 6.7-rc5)
Merging char-misc.current/char-misc-linus (6613476e225e Linux 6.8-rc1)
Merging soundwire-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging thunderbolt-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging input-current/for-linus (180a8f12c21f Input: goodix - accept ACPI r=
esources with gpio_count =3D=3D 3 && gpio_int_idx =3D=3D 0)
Merging crypto-current/master (9aedd10fe384 crypto: ahash - Set using_shash=
 for cloned ahash wrapper over shash)
Merging vfio-fixes/for-linus (4ea95c04fa6b vfio: Drop vfio_file_iommu_group=
() stub to fudge around a KVM wart)
Merging kselftest-fixes/fixes (6c8c9d6e1bce selftests/livepatch: fix and re=
factor new dmesg message code)
Merging modules-fixes/modules-linus (f412eef03938 Documentation: livepatch:=
 module-elf-format: Remove local klp_modinfo definition)
Merging dmaengine-fixes/fixes (0650006a93a2 dmaengine: fsl-qdma: Remove a u=
seless devm_kfree())
Merging backlight-fixes/for-backlight-fixes (88603b6dc419 Linux 6.2-rc2)
Merging mtd-fixes/mtd/fixes (7c1b1906229d mtd: spinand: gigadevice: Fix the=
 get ecc status issue)
Merging mfd-fixes/for-mfd-fixes (88603b6dc419 Linux 6.2-rc2)
Merging v4l-dvb-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging reset-fixes/reset/fixes (4a6756f56bcf reset: Fix crash when freeing=
 non-existent optional resets)
Merging mips-fixes/mips-fixes (f64fdde9bc77 MIPS: sgi-ip32: Fix missing pro=
totypes)
Merging at91-fixes/at91-fixes (b85ea95d0864 Linux 6.7-rc1)
Merging omap-fixes/fixes (9b6a51aab5f5 ARM: dts: Fix occasional boot hang f=
or am3 usb)
Merging kvm-fixes/master (0dd3ee311255 Linux 6.7)
Merging kvms390-fixes/master (83303a4c776c KVM: s390: fix cc for successful=
 PQAP)
Merging hwmon-fixes/hwmon (6613476e225e Linux 6.8-rc1)
Merging nvdimm-fixes/libnvdimm-fixes (33908660e814 ACPI: NFIT: Fix incorrec=
t calculation of idt size)
Merging cxl-fixes/fixes (ceb6a6f023fd Linux 6.7-rc6)
Merging btrfs-fixes/next-fixes (c94bd41cb0b6 Merge branch 'misc-6.8' into n=
ext-fixes)
Merging vfs-fixes/fixes (485053bb81c8 fix ufs_get_locked_folio() breakage)
Merging dma-mapping-fixes/for-linus (d5090484b021 swiotlb: do not try to al=
locate a TLB bigger than MAX_ORDER pages)
Merging drivers-x86-fixes/fixes (732c35ce6d48 platform/mellanox: mlxbf-pmc:=
 Fix offset calculation for crspace events)
Merging samsung-krzk-fixes/fixes (eab4f56d3e75 ARM: dts: exynos4212-tab3: a=
dd samsung,invert-vclk flag to fimd)
Merging pinctrl-samsung-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging devicetree-fixes/dt/linus (6154fb9c2134 kselftest: dt: Stop relying=
 on dirname to improve performance)
Merging dt-krzk-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging scsi-fixes/fixes (04c116e2bdfc scsi: ufs: core: Let the sq_lock pro=
tect sq_tail_slot access)
Merging drm-fixes/drm-fixes (6613476e225e Linux 6.8-rc1)
Merging drm-intel-fixes/for-linux-next-fixes (0dd3ee311255 Linux 6.7)
Merging mmc-fixes/fixes (8abf77c88929 mmc: sdhci-sprd: Fix eMMC init failur=
e after hw reset)
Merging rtc-fixes/rtc-fixes (08279468a294 rtc: sunplus: fix format string f=
or printing resource)
Merging gnss-fixes/gnss-linus (a39b6ac3781d Linux 6.7-rc5)
Merging hyperv-fixes/hyperv-fixes (564eac2860bd hv_utils: Allow implicit IC=
TIMESYNCFLAG_SYNC)
Merging soc-fsl-fixes/fix (06c2afb862f9 Linux 6.5-rc1)
Merging risc-v-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging riscv-dt-fixes/riscv-dt-fixes (a75f0b6e6f74 riscv: dts: sophgo: sep=
arate sg2042 mtime and mtimecmp to fit aclint format)
Merging riscv-soc-fixes/riscv-soc-fixes (a9d022ae8c4f Merge branch 'riscv-s=
oc-drivers-fixes' into riscv-soc-fixes)
Merging fpga-fixes/fixes (b85ea95d0864 Linux 6.7-rc1)
Merging spdx/spdx-linus (6613476e225e Linux 6.8-rc1)
Merging gpio-brgl-fixes/gpio/for-current (84aef4ed5970 gpio: eic-sprd: Clea=
r interrupt after set the interrupt type)
Merging gpio-intel-fixes/fixes (b85ea95d0864 Linux 6.7-rc1)
Merging pinctrl-intel-fixes/fixes (b85ea95d0864 Linux 6.7-rc1)
Merging erofs-fixes/fixes (2b872b0f466d erofs: Don't use certain unnecessar=
y folio_*() functions)
Merging kunit-fixes/kunit-fixes (1a9f2c776d14 Documentation: KUnit: Update =
the instructions on how to test static functions)
Merging ubifs-fixes/fixes (2241ab53cbb5 Linux 6.2-rc5)
Merging memblock-fixes/fixes (6a9531c3a880 memblock: fix crash when reserve=
d memory is not added to memory)
Merging nfsd-fixes/nfsd-fixes (1d9cabe2817e SUNRPC: use request size to ini=
tialize bio_vec in svc_udp_sendto())
Merging renesas-fixes/fixes (9eab43facdad soc: renesas: ARCH_R9A07G043 depe=
nds on !RISCV_ISA_ZICBOM)
Merging broadcom-fixes/fixes (9abf2313adc1 Linux 6.1-rc1)
Merging perf-current/perf-tools (d988c9f511af MAINTAINERS: Add Namhyung as =
tools/perf/ co-maintainer)
Merging efi-fixes/urgent (0e9ce09fde3a riscv/efistub: Tighten ELF relocatio=
n check)
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (f37669119423 power: supply: cw2015: correct ti=
me_to_empty units in sysfs)
Merging uml-fixes/fixes (73a23d771033 um: harddog: fix modular build)
Merging asahi-soc-fixes/asahi-soc/fixes (568035b01cfb Linux 6.0-rc1)
Merging iommufd-fixes/for-rc (861deac3b092 Linux 6.7-rc7)
Merging rust-fixes/rust-fixes (6613476e225e Linux 6.8-rc1)
Merging v9fs-fixes/fixes/next (2dde18cd1d8f Linux 6.5)
Merging w1-fixes/fixes (6613476e225e Linux 6.8-rc1)
Merging pmdomain-fixes/fixes (f0e4a1356466 pmdomain: renesas: r8a77980-sysc=
: CR7 must be always on)
Merging overlayfs-fixes/ovl-fixes (dc4fc2c0876f ovl: mark xwhiteouts direct=
ory with overlay.opaque=3D'x')
Merging drm-misc-fixes/for-linux-next-fixes (1a84c213146a drm/dp_mst: Separ=
ate @failing_port list in drm_dp_mst_atomic_check_mgr() comment)
Merging mm-stable/mm-stable (1b1934dbbdcf Merge tag 'docs-6.8-2' of git://g=
it.lwn.net/linux)
Merging mm-nonmm-stable/mm-nonmm-stable (1b1934dbbdcf Merge tag 'docs-6.8-2=
' of git://git.lwn.net/linux)
Merging mm/mm-everything (91f2c57fa8a6 Merge branch 'mm-nonmm-unstable' int=
o mm-everything)
Merging kbuild/for-next (bd768db42ef6 kbuild: deb-pkg: call more misc debhe=
lper commands)
Merging clang-format/clang-format (5a205c6a9f79 clang-format: Update with v=
6.7-rc4's `for_each` macro list)
Merging perf/perf-tools-next (57c8f1073f14 perf data: Minor code style alig=
nment cleanup)
Merging compiler-attributes/compiler-attributes (5d0c230f1de8 Linux 6.5-rc4)
Merging dma-mapping/for-next (7c65aa3cc072 dma-debug: fix kernel-doc warnin=
gs)
Merging asm-generic/master (d93cca2f3109 asm-generic: Fix 32 bit __generic_=
cmpxchg_local)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (8790fade1a19 Merge branches 'misc' and 'fixes' into f=
or-next)
Merging arm64/for-next/core (1b20d0486a60 arm64: Fix silcon-errata.rst form=
atting)
Merging arm-perf/for-next/perf (bb339db4d363 arm: perf: Fix ARCH=3Darm buil=
d with GCC)
Merging arm-soc/for-next (6905b2bcfacd Merge branch 'soc/dt' into for-next)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/mediatek/mt8183.d=
tsi
Merging amlogic/for-next (0dd3ee311255 Linux 6.7)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (e60f7a99d378 ARM: dts: aspeed: minerva: add sgpio =
line name)
Merging at91/at91-next (58f72e7817f1 Merge branch 'at91-dt' into at91-next)
Merging broadcom/next (62a3c97f8167 Merge branch 'devicetree/next' into nex=
t)
Merging davinci/davinci/for-next (6613476e225e Linux 6.8-rc1)
Merging drivers-memory/for-next (6613476e225e Linux 6.8-rc1)
Merging imx-mxs/for-next (4db02d61a81e Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (9802b60bd6d8 Merge branch 'v6.6-next/soc' into f=
or-next)
Merging mvebu/for-next (476887312c60 Merge branch 'mvebu/drivers' into mveb=
u/for-next)
Merging omap/for-next (3571685e5445 Merge branch 'fixes' into for-next)
Merging qcom/for-next (6613476e225e Linux 6.8-rc1)
Merging renesas/next (6251f25da3c7 Merge branch 'renesas-dts-for-v6.9' into=
 renesas-next)
Merging reset/reset/next (c3c46acd5be9 dt-bindings: reset: hisilicon,hi3660=
-reset: Drop providers and consumers from example)
Merging rockchip/for-next (3a40bdf5fbe2 Merge branch 'v6.8-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (a1c15dcb904e Merge branch 'next/clk' into fo=
r-next)
Merging scmi/for-linux-next (99f798bdfb75 Merge tags 'scmi-fixes-6.8' and '=
ffa-fixes-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holl=
a/linux into for-linux-next)
Merging stm32/stm32-next (769e4b077b2e ARM: multi_v7_defconfig: enable STM3=
2 DCMIPP media support)
Merging sunxi/sunxi/for-next (d4d29dd858bb Merge branch 'sunxi/dt-for-6.8' =
into sunxi/for-next)
Merging tee/next (84ec4fd88831 Merge branch 'tee_iov_iter_for_v6.8' into ne=
xt)
Merging tegra/for-next (5e6333ef8ea5 Merge branch for-6.8/arm/dt into for-n=
ext)
Merging ti/ti-next (6613476e225e Linux 6.8-rc1)
Merging xilinx/for-next (51586065abc6 Merge remote-tracking branch 'git/zyn=
q/soc' into for-next)
Merging clk/clk-next (4f964cfef39d Merge branch 'clk-rs9' into clk-next)
Merging clk-imx/for-next (f52f00069888 clk: imx: pll14xx: change naming of =
fvco to fout)
Merging clk-renesas/renesas-clk (515f05da372a clk: renesas: r9a08g045: Add =
clock and reset support for ETH0 and ETH1)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (b56c0bbdf40d LoongArch: KVM: Add returns =
to SIMD stubs)
Merging m68k/for-next (6b9c045b0602 m68k: defconfig: Update defconfigs for =
v6.7-rc1)
Merging m68knommu/for-next (6613476e225e Linux 6.8-rc1)
Merging microblaze/next (6613476e225e Linux 6.8-rc1)
Merging mips/mips-next (6613476e225e Linux 6.8-rc1)
Merging openrisc/for-next (c289330331eb openrisc: Remove kernel-doc marker =
from ioremap comment)
Merging parisc-hd/for-next (ba39334852d4 parisc: Show kernel unaligned memo=
ry accesses)
Merging powerpc/next (44a1aad2fe6c Merge branch 'topic/ppc-kvm' into next)
Merging soc-fsl/next (fb9c384625dd bus: fsl-mc: fsl-mc-allocator: Drop a wr=
ite-only variable)
Merging risc-v/for-next (3a6dd5f614a1 riscv: remove unneeded #include <asm-=
generic/export.h>)
Merging riscv-dt/riscv-dt-for-next (8d01f741a046 riscv: dts: starfive: jh71=
10: Add PWM node and pins configuration)
Merging riscv-soc/riscv-soc-for-next (6613476e225e Linux 6.8-rc1)
Merging s390/for-next (8eb3db95a8c8 Merge branch 'features' into for-next)
Merging sh/for-next (6613476e225e Linux 6.8-rc1)
Merging uml/next (83aec96c631e um: Mark 32bit syscall helpers as clobbering=
 memory)
Merging xtensa/xtensa-for-next (a03cd7602a09 xtensa: don't produce FDPIC ou=
tput with fdpic toolchain)
Merging bcachefs/for-next (3e44f325f6f7 bcachefs: fix incorrect usage of RE=
Q_OP_FLUSH)
Merging pidfd/for-next (a901a3568fd2 Merge tag 'iomap-6.5-merge-1' of git:/=
/git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging fscrypt/for-next (c919330dd578 f2fs: fix double free of f2fs_sb_inf=
o)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (932ab07c383e Merge branch 'for-next-next-v6.8-20240=
108' into for-next-20240108)
CONFLICT (content): Merge conflict in fs/btrfs/extent_io.c
Merging ceph/master (ded080c86b3f rbd: don't move requests to the running l=
ist on errors)
Merging cifs/for-next (160a28b5ffd8 cifs: commands that are retried should =
have replay flag set)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging ecryptfs/next (a3d78fe3e1ae fs: ecryptfs: comment typo fix)
Merging erofs/dev (aa12a790d31b erofs: make erofs_{err,info}() support NULL=
 sb parameter)
Merging exfat/dev (0991abeddefa exfat: fix zero the unwritten part for dio =
read)
Merging exportfs/exportfs-next (4213483e1c20 fs: Create a generic is_dot_do=
tdot() utility)
Merging ext3/for_next (249f374eb9b6 quota: Remove BUG_ON from dqget())
Merging ext4/dev (68da4c44b994 ext4: fix inconsistent between segment fstri=
m and full fstrim)
Merging f2fs/dev (70d201a40823 Merge tag 'f2fs-for-6.8-rc1' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs)
Merging fsverity/for-next (919dc320956e fsverity: skip PKCS#7 parser when k=
eyring is empty)
Merging fuse/for-next (3f29f1c336c0 fuse: disable FOPEN_PARALLEL_DIRECT_WRI=
TES with FUSE_DIRECT_IO_ALLOW_MMAP)
Merging gfs2/for-next (55d695cad2f6 gfs2: Fix LOOKUP_RCU support in gfs2_dr=
evalidate)
Merging jfs/jfs-next (a280c9ceeca7 jfs: Add missing set_freezable() for fre=
ezable kthread)
Merging ksmbd/ksmbd-for-next (72b0cbf6b810 smb: Fix some kernel-doc comment=
s)
Merging nfs/linux-next (052d534373b7 Merge tag 'exfat-for-6.8-rc1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat)
Merging nfs-anna/linux-next (57331a59ac0d NFSv4.1: Use the nfs_client's rpc=
 timeouts for backchannel)
Merging nfsd/nfsd-next (17419aefcbfd nfsd: rename nfsd_last_thread() to nfs=
d_destroy_serv())
Merging ntfs3/master (ddb17dc880ee fs/ntfs3: Use kvfree to free memory allo=
cated by kvmalloc)
Merging orangefs/for-next (31720a2b109b orangefs: Fix kmemleak in orangefs_=
{kernel,client}_debug_init())
Merging overlayfs/overlayfs-next (d17bb4620f90 overlayfs.rst: fix ReST form=
atting)
Merging ubifs/next (adbf4c4954e3 ubi: block: fix memleak in ubiblock_create=
())
Merging v9fs/9p-next (ff49bf186757 net: 9p: avoid freeing uninit memory in =
p9pdu_vreadf)
Merging v9fs-ericvh/ericvh/for-next (5254c0cbc92d Merge tag 'block-6.7-2023=
-12-22' of git://git.kernel.dk/linux)
Merging xfs/for-next (d61b40bf15ce xfs: fix backwards logic in xfs_bmap_all=
oc_account)
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
Merging vfs-brauner/vfs.all (ecb62356b88a Merge branch 'vfs.netfs' into vfs=
.all)
$ git reset --hard HEAD^
Merging next-20240122 version of vfs-brauner
Merging vfs/for-next (052d534373b7 Merge tag 'exfat-for-6.8-rc1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat)
Merging printk/for-next (6c3a34e38436 Merge branch 'for-6.8' into for-next)
Merging pci/next (6613476e225e Linux 6.8-rc1)
Merging pstore/for-next/pstore (24a0b5e196cf pstore: inode: Use cleanup.h f=
or struct pstore_private)
Merging hid/for-next (babc330ef109 Merge branch 'for-6.8/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (7a396820222d Merge tag 'v6.8-rc-part2-smb-client'=
 of git://git.samba.org/sfrench/cifs-2.6)
Merging i3c/i3c/next (4fa0888f6f3e i3c: document hotjoin sysfs entry)
Merging dmi/dmi-for-next (13a0ac816d22 firmware: dmi: Fortify entry point l=
ength checks)
Merging hwmon-staging/hwmon-next (cc85a2f96636 dt-bindings: hwmon: ina2xx: =
Describe ina260 chip)
Merging jc_docs/docs-next (6613476e225e Linux 6.8-rc1)
Merging v4l-dvb/master (60a031b64984 media: i2c: thp7312: select CONFIG_FW_=
LOADER)
Merging v4l-dvb-next/master (60a031b64984 media: i2c: thp7312: select CONFI=
G_FW_LOADER)
Merging pm/linux-next (6613476e225e Linux 6.8-rc1)
Merging cpufreq-arm/cpufreq/arm/linux-next (0990319a0400 cpufreq: armada-8k=
: Fix parameter type warning)
Merging cpupower/cpupower (0086ffec768b tools cpupower bench: Override CFLA=
GS assignments)
Merging devfreq/devfreq-next (aed5ed595960 PM / devfreq: Synchronize devfre=
q_monitor_[start/stop])
Merging pmdomain/next (0235c4cef0ff pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (dcfec12b6798 OPP: Rename 'rate_clk_single')
Merging thermal/thermal/linux-next (5314b1543787 thermal/drivers/exynos: Us=
e set_trips ops)
Merging dlm/next (5beebc1dda47 dlm: update format header reflect current fo=
rmat)
Merging rdma/for-next (d24b923f1d69 RDMA/bnxt_re: Fix error code in bnxt_re=
_create_cq())
Merging net-next/main (736b5545d39c Merge tag 'net-6.8-rc1' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/netdev/net)
Merging bpf-next/for-next (3fbf61207c66 Revert "mlx5 updates 2023-12-20")
Merging ipsec-next/master (3e7aeb78ab01 Merge tag 'net-next-6.8' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mlx5-next/mlx5-next (d727d27db536 RDMA/mlx5: Expose register c0 for=
 RDMA device)
Merging netfilter-next/main (a7fe0881d9b7 Merge git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net)
Merging ipvs-next/main (42a7889a1931 Merge branch 'selftests-tcp-ao')
Merging bluetooth/master (6061d66bd0e5 Bluetooth: Remove usage of the depre=
cated ida_simple_xx() API)
Merging wireless-next/for-next (3fbf61207c66 Revert "mlx5 updates 2023-12-2=
0")
Merging wpan-next/master (2373699560a7 mac802154: Avoid new associations wh=
ile disassociating)
Merging wpan-staging/staging (2373699560a7 mac802154: Avoid new association=
s while disassociating)
Merging mtd/mtd/next (98d4fda8f2d4 Merge tag 'nand/for-6.8' into mtd/next)
Merging nand/nand/next (023e6aad7e5e mtd: rawnand: s3c2410: fix Excess stru=
ct member description kernel-doc warnings)
Merging spi-nor/spi-nor/next (3c0e1dfa703c MAINTAINERS: change my mail to t=
he kernel.org one)
Merging crypto/master (b8910630c967 crypto: iaa - Account for cpu-less numa=
 nodes)
Merging drm/drm-next (6613476e225e Linux 6.8-rc1)
Merging drm-ci/topic/drm-ci (ad6bfe1b66a5 drm: ci: docs: fix build warning =
- add missing escape)
Merging drm-exynos/for-linux-next (2e40521c9ba5 drm/exynos: gsc: minor fix =
for loop iteration in gsc_runtime_resume)
Merging drm-misc/for-linux-next (1f1626ac0428 drm/ttm: fix ttm pool initial=
ization for no-dma-device drivers)
Merging amdgpu/drm-next (7055c5856aa1 Revert "drm/amd/pm: fix the high volt=
age and temperature issue")
Merging drm-intel/for-linux-next (84b5ece64477 drm/i915: Drop -Wstringop-ov=
erflow)
Merging drm-tegra/for-next (2429b3c529da drm/tegra: Avoid potential 32-bit =
integer overflow)
Merging drm-msm/msm-next (d4ca26ac4be0 drm/msm/dp: call dp_display_get_next=
_bridge() during probe)
Merging drm-msm-lumag/msm-next-lumag (d4ca26ac4be0 drm/msm/dp: call dp_disp=
lay_get_next_bridge() during probe)
Merging etnaviv/etnaviv/next (f1a925152c85 drm/etnaviv: add sensitive state=
 for PE_RT_ADDR_4_PIPE(3, 0|1) address)
Merging fbdev/for-next (79f5f3e92ab5 fbdev: stifb: Fix crash in stifb_blank=
() stifb driver)
Merging regmap/for-next (a1214cdfe92b Merge branch 'regmap-linus' into regm=
ap-next)
Merging sound/for-next (1ac1b4b79bf5 ALSA: synth: Save a few bytes of memor=
y when registering a 'snd_emux')
Merging ieee1394/for-next (dd754748f1be firewire: Convert snprintf/sprintf =
to sysfs_emit)
Merging sound-asoc/for-next (d8bce659e379 Merge remote-tracking branch 'aso=
c/for-6.9' into asoc-next)
Merging modules/modules-next (4515d08a742c kernel/module: improve documenta=
tion for try_module_get())
Merging input/next (ab30e1a93c07 Input: 88pm80x_onkey - add SPDX and drop G=
PL boilerplate)
Merging block/for-next (9bc44c51a046 Merge tag 'devicetree-for-6.8-2' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/robh/linux)
Merging device-mapper/for-next (5d6f447b07d5 MAINTAINERS: remove stale info=
 for DEVICE-MAPPER)
Merging libata/for-next (62fe40f66a40 Merge remote-tracking branch 'libata/=
for-6.8-fixes' into for-next)
Merging pcmcia/pcmcia-next (4f733de8b78a pcmcia: tcic: remove unneeded "&" =
in call to setup_timer())
Merging mmc/next (5d4021334748 mmc: xenon: Add ac5 support via bounce buffe=
r)
Merging mfd/for-mfd-next (284d16c456e5 mfd: ti_am335x_tscadc: Fix TI SoC de=
pendencies)
Merging backlight/for-backlight-next (7d84a63a39b7 backlight: hx8357: Conve=
rt to agnostic GPIO API)
Merging battery/for-next (17d49b7e47a1 power: supply: bq24190_charger: Fix =
"initializer element is not constant" error)
Merging regulator/for-next (e4fbdca2af32 Merge remote-tracking branch 'regu=
lator/for-6.9' into regulator-next)
Merging security/next (6613476e225e Linux 6.8-rc1)
Merging apparmor/apparmor-next (8ead196be219 apparmor: Fix memory leak in u=
npack_profile())
Merging integrity/next-integrity (c00f94b3a5be overlay: disable EVM)
Merging safesetid/safesetid-next (64b634830c91 LSM: SafeSetID: add setgroup=
s() testing to selftest)
Merging selinux/next (6613476e225e Linux 6.8-rc1)
Merging smack/next (3ad49d37cf57 smackfs: Prevent underflow in smk_set_cips=
o())
Merging tomoyo/master (0bb80ecc33a8 Linux 6.6-rc1)
Merging tpmdd/next (610347effc2e Merge tag 'Wstringop-overflow-for-6.8-rc2'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux)
Merging watchdog/master (9546b21ea672 watchdog: mlx_wdt: fix all kernel-doc=
 warnings)
Merging iommu/next (75f74f85a42e Merge branches 'apple/dart', 'arm/rockchip=
', 'arm/smmu', 'virtio', 'x86/vt-d', 'x86/amd' and 'core' into next)
Merging audit/next (6613476e225e Linux 6.8-rc1)
Merging devicetree/for-next (e20cd62b1f17 of: property: Make 'no port node =
found' output a debug message)
Merging dt-krzk/for-next (6613476e225e Linux 6.8-rc1)
Merging mailbox/for-next (cd795fb0c352 mailbox: mtk-cmdq: Add CMDQ driver s=
upport for mt8188)
Merging spi/for-next (d6d471cc346c Merge remote-tracking branch 'spi/for-6.=
9' into spi-next)
Merging tip/master (b0c57a7002b0 Merge branch into tip/master: 'x86/cpu')
Merging clockevents/timers/drivers/next (c0c4579d79d0 clocksource/drivers/e=
p93xx: Fix error handling during probe)
Merging edac/edac-for-next (e6e10e8939e0 Merge branch 'edac-misc' into edac=
-for-next)
Merging ftrace/for-next (4af12c95cbe8 Merge probes/for-next)
Merging rcu/rcu/next (7dfb03dd24d4 Merge branches 'doc.2023.12.13a', 'tortu=
re.2023.11.23a', 'fixes.2023.12.13a', 'rcu-tasks.2023.12.12b' and 'srcu.202=
3.12.13a' into rcu-merge.2023.12.13a)
Merging kvm/next (1c6d984f523f x86/kvm: Do not try to disable kvmclock if i=
t was not enabled)
Merging kvm-arm/next (040113fa32f2 KVM: arm64: Add missing memory barriers =
when switching to pKVM's hyp pgd)
Merging kvms390/next (10f7b1dcdfe0 KVM: s390: cpu model: Use proper define =
for facility mask size)
Merging kvm-ppc/topic/ppc-kvm (180c6b072bf3 KVM: PPC: Book3S HV nestedv2: D=
o not cancel pending decrementer exception)
Merging kvm-riscv/riscv_kvm_next (4d0e8f9a361b KVM: riscv: selftests: Add Z=
fa extension to get-reg-list test)
Merging kvm-x86/next (1c6d984f523f x86/kvm: Do not try to disable kvmclock =
if it was not enabled)
Merging xen-tip/linux-next (2d2db7d40254 xen/gntdev: Fix the abuse of under=
lying struct page in DMA-buf import)
Merging percpu/for-next (1e653a292c26 Merge branch 'for-6.8' into for-next)
Merging workqueues/for-next (7bd20b6b8718 workqueue: mark power efficient w=
orkqueue as unbounded if nohz_full enabled)
Merging drivers-x86/for-next (236f7d8034ff platform/x86/amd/pmc: Modify SMU=
 message port for latest AMD platform)
Merging chrome-platform/for-next (6613476e225e Linux 6.8-rc1)
Merging chrome-platform-firmware/for-firmware-next (6613476e225e Linux 6.8-=
rc1)
Merging hsi/for-next (fa72d143471d HSI: omap_ssi: Remove usage of the depre=
cated ida_simple_xx() API)
Merging leds/for-next (1b929c02afd3 Linux 6.2-rc1)
Merging leds-lj/for-leds-next (4289e434c46c leds: trigger: netdev: Add core=
 support for hw not supporting fallback to LED sw control)
Merging ipmi/for-next (296455ade1fd Merge tag 'char-misc-6.8-rc1' of git://=
git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc)
Merging driver-core/driver-core-next (6613476e225e Linux 6.8-rc1)
Merging usb/usb-next (6613476e225e Linux 6.8-rc1)
Merging thunderbolt/next (e8f1297ba31f thunderbolt: Fix rollback in tb_port=
_lane_bonding_enable() for lane 1)
Merging usb-serial/usb-next (a39b6ac3781d Linux 6.7-rc5)
Merging tty/tty-next (6613476e225e Linux 6.8-rc1)
Merging char-misc/char-misc-next (6613476e225e Linux 6.8-rc1)
Merging accel/habanalabs-next (a9f07790a4b2 accel/habanalabs: fix informati=
on leak in sec_attest_info())
Merging coresight/next (60e5f23dc5d6 coresight: ultrasoc-smb: Use guards to=
 cleanup)
Merging fastrpc/for-next (6613476e225e Linux 6.8-rc1)
Merging fpga/for-next (c849ecb2ae84 fpga: zynq-fpga: Convert to platform re=
move callback returning void)
Merging icc/icc-next (869b601db3b7 Merge branch 'icc-fixes' into icc-next)
Merging iio/togreg (824adc9cc314 MAINTAINERS: add IIO GTS tests)
Merging phy-next/next (6613476e225e Linux 6.8-rc1)
Merging soundwire/next (0707496ff4e4 soundwire: stream: add missing const t=
o Documentation)
Merging extcon/extcon-next (7803680964c0 extcon: qcom-spmi-misc: don't use =
kernel-doc marker for comment)
Merging gnss/gnss-next (0cbbbe09d49b gnss: ubx: add support for the reset g=
pio)
Merging vfio/next (78f70c02bdbc vfio/virtio: fix virtio-pci dependency)
Merging w1/for-next (6613476e225e Linux 6.8-rc1)
Merging spmi/spmi-next (b85ea95d0864 Linux 6.7-rc1)
Merging staging/staging-next (6613476e225e Linux 6.8-rc1)
Merging counter-next/counter-next (49ca40f8d6ce counter: linux/counter.h: f=
ix Excess kernel-doc description warning)
Merging mux/for-next (44c026a73be8 Linux 6.4-rc3)
Merging dmaengine/next (8fcc3f7dbdae dmaengine: xilinx_dma: check for inval=
id vdma interleaved parameters)
Merging cgroup/for-next (b7aaea747923 Merge branch 'for-6.8' into for-next)
Merging scsi/for-next (b829681baf2b Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (7d1ae55ffed0 scsi: MAINTAINERS: Update ibmvscsi_=
tgt maintainer)
Merging vhost/linux-next (f16d65124380 vdpa/mlx5: Add mkey leak detection)
Merging rpmsg/for-next (ff9af5732fe7 Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (3473765920ea MAINTAINERS: add Documentatio=
n/userspace-api/gpio/ to GPIO UAPI section)
Merging gpio-intel/for-next (92fc925f8386 gpio: tangier: simplify locking u=
sing cleanup helpers)
Merging pinctrl/for-next (0ef4b05e2dfb Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (ebe7f3393784 pinctrl: intel: Add Intel Mete=
or Point pin controller and GPIO support)
Merging pinctrl-renesas/renesas-pinctrl (9e5889c68d99 pinctrl: renesas: rzg=
2l: Add input enable to the Ethernet pins)
Merging pinctrl-samsung/for-next (6613476e225e Linux 6.8-rc1)
Merging pwm/pwm/for-next (6613476e225e Linux 6.8-rc1)
Merging userns/for-next (05bd6e0242b4 Merge of unpriv-ipc-sysctls-for-v6.2,=
 and fix-atomic_lock_inc_below-for-v6.2 for testing in linux-next)
Merging ktest/for-next (7dc8e24f0e09 ktest: Restore stty setting at first i=
n dodie)
Merging kselftest/next (6a71770442b5 selftests: livepatch: Test livepatchin=
g a heavily called syscall)
Merging kunit/test (6613476e225e Linux 6.8-rc1)
Merging kunit-next/kunit (6613476e225e Linux 6.8-rc1)
Merging livepatching/for-next (602bf1830798 Merge branch 'for-6.7' into for=
-next)
Merging rtc/rtc-next (14688f1a91e1 rtc: nuvoton: Compatible with NCT3015Y-R=
 and NCT3018Y-R)
Merging nvdimm/libnvdimm-for-next (a085a5eb6594 acpi/nfit: Use sysfs_emit()=
 for all attributes)
Merging at24/at24/for-next (6613476e225e Linux 6.8-rc1)
Merging ntb/ntb-next (9341b37ec17a ntb_perf: Fix printk format)
Merging seccomp/for-next/seccomp (98b1cc82c4af Linux 6.7-rc2)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (04b945e4cf81 slimbus: qcom-ngd-ctrl: Make QMI mes=
sage rules const)
Merging nvmem/for-next (b40fed138700 nvmem: include bit index in cell sysfs=
 file name)
Merging xarray/main (2a15de80dd0f idr: fix param name in idr_alloc_cyclic()=
 doc)
Merging hyperv/hyperv-next (ce9ecca0238b Linux 6.6-rc2)
Merging auxdisplay/auxdisplay (c52391fafcef auxdisplay: img-ascii-lcd: Use =
device_get_match_data())
Merging kgdb/kgdb/for-next (4f41d30cd6dc kdb: Fix a potential buffer overfl=
ow in kdb_local())
Merging hmm/hmm (0bb80ecc33a8 Linux 6.6-rc1)
Merging cfi/cfi/next (06c2afb862f9 Linux 6.5-rc1)
Merging mhi/mhi-next (01bd694ac2f6 bus: mhi: host: Drop chan lock before qu=
euing buffers)
Merging memblock/for-next (2159bd4e9057 memblock: Return NUMA_NO_NODE inste=
ad of -1 to improve code readability)
Merging cxl/next (73bf93edeeea cxl/core: use sysfs_emit() for attr's _show(=
))
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (4afa688d7141 efi: memmap: fix kernel-doc warnings)
Merging unicode/for-next (7f29d6780929 ovl: Reject mounting case-insensitiv=
e filesystems)
Merging slab/slab/for-next (98d3b6d98f80 mm/slub: make the description of s=
lab_min_objects helpful in doc)
Merging random/master (512dee0c00ad Merge tag 'x86-urgent-2023-01-04' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging landlock/next (b90e198f0297 landlock: Document IOCTL support)
Merging rust/rust-next (6b1b2326b2bc rust: sync: `CondVar` rename "wait_lis=
t" to "wait_queue_head")
Merging sysctl/sysctl-next (561429807d50 sysctl: remove struct ctl_path)
Merging execve/for-next/execve (84c39ec57d40 exec: Fix error handling in be=
gin_new_exec())
Merging bitmap/bitmap-for-next (071ad962baf5 bitmap: Step down as a reviewe=
r)
CONFLICT (content): Merge conflict in drivers/tty/serial/sc16is7xx.c
Merging hte/for-next (b85ea95d0864 Linux 6.7-rc1)
Merging kspp/for-next/kspp (a75b3809dce2 qnx4: Use get_directory_fname() in=
 qnx4_match())
Merging kspp-gustavo/for-next/kspp (a5e0ace04fbf init: Kconfig: Disable -Ws=
tringop-overflow for GCC-11)
Merging nolibc/nolibc (6613476e225e Linux 6.8-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (47f2bd2ff382 iommufd/selftest: Check the bus type=
 during probe)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/ICL1ocFmxZ9F8eeMVGlUHQE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmWvJIkACgkQAVBC80lX
0GyGrQf5AQhZRJM6Cf+rvAVYtoGY9fM0d+gy3bPHJVJrL2sUI4PPexI9A4ePjo5G
iQjX+rIAYrhUh7TbywgBPwDmcqHn1mBQsaR0DjR65oKxdzap/Ge8v2X5zJFf573b
nmH0fzNvTcx58SAUsX8gJa83JQxSl7cpaewDDNdvytqKCH59xKMwHQ1ISFU6Bvbi
tR7hpwJF+Z/LqfEBMKWtVIv9mhI+AYB3aKcVSUOQMsUiEtJ8iTzWSztt6hwk6Vj9
nbJqltPAKz04dm/xNSW2F3jZR8tsGI3BkRDdwNhKjFAzSDZmiDk0ZJq36SFSogBT
4Hc1382lTCcmzcMbDcfuM8owHvwDtg==
=Yq7J
-----END PGP SIGNATURE-----

--Sig_/ICL1ocFmxZ9F8eeMVGlUHQE--

