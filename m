Return-Path: <linux-next+bounces-2356-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A98618C9882
	for <lists+linux-next@lfdr.de>; Mon, 20 May 2024 05:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B14431C20C11
	for <lists+linux-next@lfdr.de>; Mon, 20 May 2024 03:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E59ADF51;
	Mon, 20 May 2024 03:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KZwRq6tH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9685B666;
	Mon, 20 May 2024 03:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716176940; cv=none; b=jSxDUUgsYihI8qOFSl5sujAR+8odjdSA34G7rTQv1jkSG5KDFGy1TEBq5xc40ci/4HaX1sLUSPZR/6UiLqhoyaZcR9AZV6e0xcK9bGGPFo8pb+WgX4UiUptiOF/NZhxwv8Bzcwe1DdxZelI5zvildeBYTcxLT8UA+LDkrHMLxIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716176940; c=relaxed/simple;
	bh=fqXKQLEi1XjtsIa4KHTRAJbieperIEZZV8cr6zKujW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JiOuWsLxCUYg48laTUDecEdIAruAErnFVT6BCx+meaj5OKHHCvlv/HHxYao3UTR2rJIbNBf37bFSJ6fsu/b+1578nwfH6+YHYOvcunyooFRWoACO/12Qd3Ol1it9Nd6nm396EiCs9zX+8xJ0nHS+KqkamsugO06LZ0M0xuueVus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KZwRq6tH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716176935;
	bh=N0nNw5zAUSnt40f8ppo6/P5SauiDDXiMt4YVjfirJUQ=;
	h=Date:From:To:Cc:Subject:From;
	b=KZwRq6tHVH/oeFl47g4Dqq4NK35GaJ7GHpuyFYo6XusZP7zq2Kxz9g5p2x44gkJnF
	 /X0HXiVm2VoU9Y3SqwHtKLmBxi35uMMKsUki5BPZGfC8yPYLxrOyYeLJXchFCEsZqi
	 4JEtVII7rNJcOtC8UnQV9O9YKWJHqZFgna14Qu/obLI/yUkzqkQUeb/ww5TFIYuBS1
	 TQmPVPAyA3YpUwFmCl6nu4/XlEHyw8IViNDUq+yYqjmCiFAnoflvOqKk3+/j2rAs5w
	 lS8pDTaGfmbOeQ56AtYaJPZyEf76g+ChIRgiFBXEERD5TW9Rj7i7PzlMQEuURH/xh0
	 YEPFzgD3VtFcw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VjNpZ72Qqz4wcR;
	Mon, 20 May 2024 13:48:54 +1000 (AEST)
Date: Mon, 20 May 2024 13:48:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 20
Message-ID: <20240520134854.4f47a426@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AgrrvSDYocpOK_IWUkrpuq5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AgrrvSDYocpOK_IWUkrpuq5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Do not add any work intended for v6.11 to your linux-next included
branches until after v6.10-rc1 has been released.

Changes since 20240517:

The tip tree gained a conflict against the kbuild tree.

The refactor-heap tree still had its conflicts against the block tree
for which I dropped the refactor-heap tree.

Non-merge commits (relative to Linus' tree): 3211
 3362 files changed, 433429 insertions(+), 58866 deletions(-)

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
Merging origin/master (eb6a9339efeb Merge tag 'mm-nonmm-stable-2024-05-19-1=
1-56' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm)
Merging fixes/fixes (2dde18cd1d8f Linux 6.5)
Merging mm-hotfixes/mm-hotfixes-unstable (9ff3ffc369ed mm/vmalloc: fix vmal=
loc which may return null if called with __GFP_NOFAIL)
Merging kbuild-current/fixes (89e5462bb5ae kconfig: Fix typo HEIGTH to HEIG=
HT)
Merging arc-current/for-curr (e67572cd2204 Linux 6.9-rc6)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (50449ca66cc5 arm64: hibernate: Fix leve=
l3 translation fault in swsusp_save())
Merging arm-soc-fixes/arm/fixes (5549d1e39989 Merge tag 'qcom-arm64-fixes-f=
or-6.9-2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux int=
o arm/fixes)
Merging davinci-current/davinci/for-current (6613476e225e Linux 6.8-rc1)
Merging drivers-memory-fixes/fixes (4cece7649650 Linux 6.9-rc1)
Merging sophgo-fixes/fixes (4cece7649650 Linux 6.9-rc1)
Merging m68k-current/for-linus (ec8c8266373f m68k: defconfig: Update defcon=
figs for v6.9-rc1)
Merging powerpc-fixes/fixes (49a940dbdc31 powerpc/pseries/iommu: LPAR panic=
s during boot up with a frozen PE)
Merging s390-fixes/fixes (d65e1a0f305b Merge tag 's390-6.10-1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/s390/linux)
Merging fscrypt-current/for-current (4cece7649650 Linux 6.9-rc1)
Merging fsverity-current/for-current (4cece7649650 Linux 6.9-rc1)
Merging net/main (4b377b4868ef kprobe/ftrace: fix build error due to bad fu=
nction definition)
Merging bpf/master (4b377b4868ef kprobe/ftrace: fix build error due to bad =
function definition)
Merging ipsec/master (b6d2e438e16c xfrm: Correct spelling mistake in xfrm.h=
 comment)
Merging netfilter/main (621cde16e49b Merge git://git.kernel.org/pub/scm/lin=
ux/kernel/git/netdev/net-next)
Merging ipvs/main (a26ff37e624d net: fix out-of-bounds access in ops_init)
Merging wireless/for-next (838c7b8f1f27 wifi: nl80211: Avoid address calcul=
ations via out of bounds array indexing)
Merging wpan/master (07aa33988ad9 mac802154: fix time calculation in ieee80=
2154_configure_durations())
Merging rdma-fixes/for-rc (ed30a4a51bb1 Linux 6.9-rc5)
Merging sound-current/for-linus (5005ccd91b9e ALSA: usb-audio: Fix for samp=
ling rates support for Mbox3)
Merging sound-asoc-fixes/for-linus (225468b9f96f Merge remote-tracking bran=
ch 'asoc/for-6.9' into asoc-linus)
Merging regmap-fixes/for-linus (7ba822189e60 regmap: kunit: Fix array overf=
low in stride() test)
Merging regulator-fixes/for-linus (9bc443ee2d2d Merge remote-tracking branc=
h 'regulator/for-6.9' into regulator-linus)
Merging spi-fixes/for-linus (ef13561d2b16 spi: microchip-core-qspi: fix set=
ting spi bus clock rate)
Merging pci-current/for-linus (f3d049b35b01 PCI/ASPM: Restore parent state =
to parent, child state to child)
Merging driver-core.current/driver-core-linus (ed30a4a51bb1 Linux 6.9-rc5)
Merging tty.current/tty-linus (8492bd91aa05 serial: sc16is7xx: fix bug in s=
c16is7xx_set_baud() when using prescaler)
Merging usb.current/usb-linus (dd5a440a31fa Linux 6.9-rc7)
Merging usb-serial-fixes/usb-linus (dd5a440a31fa Linux 6.9-rc7)
Merging phy/fixes (bf6e4ee5c436 phy: ti: tusb1210: Resolve charger-det cras=
h if charger psy is unregistered)
Merging staging.current/staging-linus (39cd87c4eb2b Linux 6.9-rc2)
Merging iio-fixes/fixes-togreg (bb198e29fe75 iio: dac: ad5592r: fix tempera=
ture channel scaling value)
Merging counter-current/counter-current (39cd87c4eb2b Linux 6.9-rc2)
Merging char-misc.current/char-misc-linus (008ab3c53bc4 speakup: Fix sizeof=
() vs ARRAY_SIZE() bug)
Merging soundwire-fixes/fixes (e67572cd2204 Linux 6.9-rc6)
Merging thunderbolt-fixes/fixes (a38297e3fb01 Linux 6.9)
Merging input-current/for-linus (0537c8eef4f6 Input: amimouse - mark driver=
 struct with __refdata to prevent section mismatch)
Merging crypto-current/master (c6ab5c915da4 crypto: ecc - Prevent ecc_digit=
s_from_bytes from reading too many bytes)
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
Merging kvm-fixes/master (0a9c28bec202 Merge tag 'kvm-s390-master-6.9-1' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux into HEAD)
Merging kvms390-fixes/master (175f2f5bcdfc KVM: s390: Check kvm pointer whe=
n testing KVM_CAP_S390_HPAGE_1M)
Merging hwmon-fixes/hwmon (26e8383b116d hwmon: (pmbus/ucd9000) Increase del=
ay from 250 to 500us)
Merging nvdimm-fixes/libnvdimm-fixes (33908660e814 ACPI: NFIT: Fix incorrec=
t calculation of idt size)
Merging cxl-fixes/fixes (5d211c709059 cxl: Fix cxl_endpoint_get_perf_coordi=
nate() support for RCH)
Merging btrfs-fixes/next-fixes (039b2b6e9d07 Merge branch 'misc-6.10' into =
next-fixes)
Merging vfs-fixes/fixes (aa23317d0268 qibfs: fix dentry leak)
Merging dma-mapping-fixes/for-linus (75961ffb5cb3 swiotlb: initialise restr=
icted pool list_head when SWIOTLB_DYNAMIC=3Dy)
Merging drivers-x86-fixes/fixes (a38297e3fb01 Linux 6.9)
Merging samsung-krzk-fixes/fixes (4cece7649650 Linux 6.9-rc1)
Merging pinctrl-samsung-fixes/fixes (4cece7649650 Linux 6.9-rc1)
Merging devicetree-fixes/dt/linus (de164a7f1924 nios2: Only use built-in de=
vicetree blob if configured to do so)
Merging dt-krzk-fixes/fixes (4cece7649650 Linux 6.9-rc1)
Merging scsi-fixes/fixes (961990efc608 scsi: sd: Only print updates to perm=
anent stream count)
Merging drm-fixes/drm-fixes (a38297e3fb01 Linux 6.9)
Merging drm-intel-fixes/for-linux-next-fixes (43b26bdd2ee5 drm/i915/bios: F=
ix parsing backlight BDB data)
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
Merging gpio-brgl-fixes/gpio/for-current (a38297e3fb01 Linux 6.9)
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
Merging iommufd-fixes/for-rc (dd5a440a31fa Linux 6.9-rc7)
Merging rust-fixes/rust-fixes (e67572cd2204 Linux 6.9-rc6)
Merging v9fs-fixes/fixes/next (a38297e3fb01 Linux 6.9)
Merging w1-fixes/fixes (4cece7649650 Linux 6.9-rc1)
Merging pmdomain-fixes/fixes (670c900f6964 pmdomain: ti-sci: Fix duplicate =
PD referrals)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging i2c-host-fixes/i2c/i2c-host-fixes (55750148e559 i2c: synquacer: Fix=
 an error handling path in synquacer_i2c_probe())
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (aacb99de1099 clk: samsung: Revert "clk: Use de=
vice_get_match_data()")
Merging drm-misc-fixes/for-linux-next-fixes (520fb7f183e9 drm/tests/buddy: =
stop using PAGE_SIZE)
Merging mm-stable/mm-stable (76edc534cc28 memcg, oom: cleanup unused memcg_=
oom_gfp_mask and memcg_oom_order)
Merging mm-nonmm-stable/mm-nonmm-stable (5cbcb62dddf5 fs/proc: fix softlock=
up in __read_vmcore)
Merging mm/mm-everything (529891be5997 foo)
CONFLICT (content): Merge conflict in tools/testing/selftests/kselftest_har=
ness.h
Merging kbuild/for-next (0450d2083be6 Merge tag '6.10-rc-smb-fix' of git://=
git.samba.org/sfrench/cifs-2.6)
Merging clang-format/clang-format (5a205c6a9f79 clang-format: Update with v=
6.7-rc4's `for_each` macro list)
Merging perf/perf-tools-next (ea558c86248b tools lib subcmd: Show parent op=
tions in help)
Merging compiler-attributes/compiler-attributes (2993eb7a8d34 Compiler Attr=
ibutes: counted_by: fixup clang URL)
Merging dma-mapping/for-next (a6016aac5252 dma: fix DMA sync for drivers no=
t calling dma_set_mask*())
CONFLICT (content): Merge conflict in net/core/page_pool.c
Merging asm-generic/master (02af68767d27 Merge branch 'alpha-cleanup-6.9' i=
nto asm-generic)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (64ae2326dd77 Merge branches 'amba', 'cfi', 'clkdev', =
'fixes' and 'misc' into for-next)
Merging arm64/for-next/core (a4c5a457c610 perf/arm-dmc620: Fix lockdep asse=
rt in ->event_init())
Merging arm-perf/for-next/perf (410e471f8746 arm64: Add USER_STACKTRACE sup=
port)
Merging arm-soc/for-next (1e3dd71e2587 Merge branch 'soc/defconfig' into fo=
r-next)
Merging amlogic/for-next (e30237bd4f71 Merge branch 'v6.10/defconfig' into =
for-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (c44211af1aa9 ARM: dts: aspeed: Add ASRock E3C256D4=
I BMC)
Merging at91/at91-next (fa8e55345b64 Merge branch 'microchip-dt64' into at9=
1-next)
Merging broadcom/next (06902980d07a Merge branch 'devicetree/next' into nex=
t)
Merging davinci/davinci/for-next (6613476e225e Linux 6.8-rc1)
Merging drivers-memory/for-next (bf11908757ee memory: mtk-smi: fix module a=
utoloading)
Merging imx-mxs/for-next (8c4bf8c96748 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (4cece7649650 Linux 6.9-rc1)
Merging mvebu/for-next (da8e8356f594 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (5856330c3d56 Merge branch 'drivers-ti-sysc-for-v6.10=
' into for-next)
Merging qcom/for-next (7468eb6710ce Merge branches 'arm32-for-6.10', 'arm64=
-defconfig-for-6.10', 'arm64-fixes-for-6.9', 'arm64-for-6.10', 'clk-fixes-f=
or-6.9', 'clk-for-6.10', 'drivers-fixes-for-6.9' and 'drivers-for-6.10' int=
o for-next)
Merging renesas/next (1e2995ef0bb8 Merge branch 'renesas-dts-for-v6.10' int=
o renesas-next)
Merging reset/reset/next (6d89df61650d reset: ti-sci: Convert to platform r=
emove callback returning void)
Merging rockchip/for-next (160b088184ec Merge branch 'v6.10-clk/next' into =
for-next)
Merging samsung-krzk/for-next (a9c32618cd2a Merge branch 'next/clk' into fo=
r-next)
Merging scmi/for-linux-next (02ba7b5a731a Merge branch 'for-next/vexpress/u=
pdates' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux=
 into for-linux-next)
Merging sophgo/for-next (1eba0b61be72 riscv: dts: sophgo: add reserved memo=
ry node for CV1800B)
Merging stm32/stm32-next (dccdbccb7045 arm64: dts: st: correct masks for GI=
C PPI interrupts on stm32mp25)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/st/stm32mp251.dtsi
Merging sunxi/sunxi/for-next (547c853141d1 Merge branch 'sunxi/dt-for-6.10'=
 into sunxi/for-next)
Merging tee/next (60757f1264a2 Merge branch 'tee_ts_for_v6.10' into next)
Merging tegra/for-next (2fd759c1796c Merge branch for-6.10/arm64/defconfig =
into for-next)
Merging ti/ti-next (f532f2375771 Merge branch 'ti-k3-dts-next' into ti-next)
Merging xilinx/for-next (3bdc4c661d47 Merge branch 'zynqmp/soc' into for-ne=
xt)
Merging clk/clk-next (03be434863b9 Merge branches 'clk-microchip', 'clk-sam=
sung' and 'clk-qcom' into clk-next)
Merging clk-imx/for-next (f5072cffb35c clk: imx: imx8mp: Convert to platfor=
m remove callback returning void)
Merging clk-renesas/renesas-clk (5add5ebc4e35 clk: renesas: r9a08g045: Add =
support for power domains)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (9cc1df421f00 LoongArch: Update Loongson-3=
 default config file)
CONFLICT (content): Merge conflict in arch/loongarch/kernel/irq.c
Merging m68k/for-next (ec8c8266373f m68k: defconfig: Update defconfigs for =
v6.9-rc1)
Merging m68knommu/for-next (a5044ce7d1d9 m68k: Avoid CONFIG_COLDFIRE switch=
 in uapi header)
Merging microblaze/next (58d647506c92 microblaze: Remove early printk call =
from cpuinfo-static.c)
Merging mips/mips-next (07e6a6d7f1d9 MIPS: Take in account load hazards for=
 HI/LO restoring)
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (bbf5c979011a Linux 5.9)
Merging powerpc/next (61700f816e6f powerpc/fadump: Fix section mismatch war=
ning)
Merging powerpc-kdump-hotplug/topic/kdump-hotplug (9803af291162 powerpc/cra=
sh: remove unnecessary NULL check before kvfree())
Merging soc-fsl/next (fb9c384625dd bus: fsl-mc: fsl-mc-allocator: Drop a wr=
ite-only variable)
Merging risc-v/for-next (92cce91949a4 riscv: defconfig: Enable CONFIG_CLK_S=
OPHGO_CV1800)
CONFLICT (content): Merge conflict in Documentation/rust/arch-support.rst
CONFLICT (content): Merge conflict in arch/riscv/Makefile
CONFLICT (content): Merge conflict in include/uapi/linux/prctl.h
CONFLICT (content): Merge conflict in kernel/sys.c
Merging riscv-dt/riscv-dt-for-next (1c80d50bb697 riscv: dts: microchip: add=
 pac1934 power-monitor to icicle)
Merging riscv-soc/riscv-soc-for-next (16d9122246cc Merge branch 'riscv-conf=
ig' into riscv-soc-for-next)
Merging s390/for-next (c1248638f8c3 s390/zcrypt: Use kvcalloc() instead of =
kvmalloc_array())
CONFLICT (content): Merge conflict in scripts/Makefile.vdsoinst
Merging sh/for-next (efe976b7eecf sh: setup: Add missing forward declaratio=
n for sh_fdt_init())
Merging sparc/for-next (1c9e709cde80 sparc/leon: Remove on-stack cpumask va=
r)
Merging uml/next (919e3ece7f5a um: virtio_uml: Convert to platform remove c=
allback returning void)
CONFLICT (content): Merge conflict in arch/um/include/shared/um_malloc.h
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging bcachefs/for-next (dcb8f1e8fc29 bcachefs: set FMODE_CAN_ODIRECT ins=
tead of a dummy direct_IO method)
Merging pidfd/for-next (a901a3568fd2 Merge tag 'iomap-6.5-merge-1' of git:/=
/git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging fscrypt/for-next (7f016edaa0f3 fscrypt: try to avoid refing parent =
dentry in fscrypt_file_open)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (7b79c81bbd20 Merge branch 'for-next-next-v6.10-2024=
0515' into for-next-20240515)
Merging ceph/master (d3e046930679 MAINTAINERS: remove myself as a Reviewer =
for Ceph)
Merging cifs/for-next (0450d2083be6 Merge tag '6.10-rc-smb-fix' of git://gi=
t.samba.org/sfrench/cifs-2.6)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging erofs/dev (5587a8172eb6 z_erofs_pcluster_begin(): don't bother with=
 rounding position down)
Merging exfat/dev (f19257997d9c exfat: zero the reserved fields of file and=
 stream extension dentries)
Merging exportfs/exportfs-next (e8f897f4afef Linux 6.8)
Merging ext3/for_next (82172cca18b2 Merge isofs Makefile cleanup.)
Merging ext4/dev (c6a6c9694aad ext4: fix error pointer dereference in ext4_=
mb_load_buddy_gfp())
Merging f2fs/dev (16409fdbb882 f2fs: initialize last_block_in_bio variable)
Merging fsverity/for-next (ee5814dddefb fsverity: use register_sysctl_init(=
) to avoid kmemleak warning)
Merging fuse/for-next (529395d2ae64 virtio-fs: add multi-queue support)
Merging gfs2/for-next (c1c53c26e338 gfs2: make timeout values more explicit)
Merging jfs/jfs-next (e42e29cc4423 Revert "jfs: fix shift-out-of-bounds in =
dbJoin")
Merging ksmbd/ksmbd-for-next (c91ecba9e421 ksmbd: avoid to send duplicate o=
plock break notifications)
Merging nfs/linux-next (24457f1be29f nfs: Handle error of rpc_proc_register=
() in nfs_net_init().)
Merging nfs-anna/linux-next (57331a59ac0d NFSv4.1: Use the nfs_client's rpc=
 timeouts for backchannel)
Merging nfsd/nfsd-next (8d915bbf3926 NFSD: Force all NFSv4.2 COPY requests =
to be synchronous)
Merging ntfs3/master (24f6f5020b0b fs/ntfs3: Mark volume as dirty if xattr =
is broken)
Merging orangefs/for-next (53e4efa470d5 orangefs: fix out-of-bounds fsid ac=
cess)
Merging overlayfs/overlayfs-next (e9229c18dae3 ovl: remove duplicate includ=
ed header)
Merging ubifs/next (af9a8730ddb6 jffs2: Fix potential illegal address acces=
s in jffs2_free_inode)
Merging v9fs/9p-next (25ef7dc83ebe net/9p: fix uninit-value in p9_client_rp=
c())
Merging v9fs-ericvh/ericvh/for-next (a38297e3fb01 Linux 6.9)
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
Merging vfs-brauner/vfs.all (584bbf439d0f Merge branch 'vfs.iomap' into vfs=
.all)
CONFLICT (content): Merge conflict in include/linux/fs.h
Merging vfs/for-next (39d57a87e672 Merge branch 'work.bdev' into for-next)
CONFLICT (content): Merge conflict in block/blk-core.c
CONFLICT (content): Merge conflict in block/ioctl.c
CONFLICT (content): Merge conflict in fs/btrfs/disk-io.c
CONFLICT (content): Merge conflict in io_uring/rw.c
Applying: fix up for "bdev: move ->bd_has_subit_bio to ->__bd_flags"
Merging printk/for-next (596ffa476e20 Merge branch 'for-6.10' into for-next)
Merging pci/next (7ecf13fd35fe Merge branch 'pci/misc')
Merging pstore/for-next/pstore (9dd12ed95c2d pstore/blk: replace deprecated=
 strncpy with strscpy)
Merging hid/for-next (14ee3d12f37b Merge branch 'for-6.10/hid-bpf' into for=
-next)
Merging i2c/i2c/for-next (24a9d78e808c Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i2c-host/i2c/i2c-host (61e05bad821c i2c: designware: Replace MODULE=
_ALIAS() with MODULE_DEVICE_TABLE())
Merging i3c/i3c/next (acec16dbb338 i3c: dw: Add hot-join support.)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (5fbf8734fb36 hwmon: (nzxt-kraken3) Bail o=
ut for unsupported device variants)
Merging jc_docs/docs-next (955e15969c1d Merge branch 'docs-mw' into docs-ne=
xt)
Merging v4l-dvb/master (8771b7f31b7f media: bcm2835-unicam: Depend on COMMO=
N_CLK)
Merging v4l-dvb-next/master (8771b7f31b7f media: bcm2835-unicam: Depend on =
COMMON_CLK)
Merging pm/linux-next (bbfa78f51501 Merge branch 'thermal-core' into linux-=
next)
Merging cpufreq-arm/cpufreq/arm/linux-next (fde234239d16 dt-bindings: cpufr=
eq: cpufreq-qcom-hw: Add SM4450 compatibles)
Merging cpupower/cpupower (55f9f60852ef tools/power/cpupower: Fix Pstate fr=
equency reporting on AMD Family 1Ah CPUs)
Merging devfreq/devfreq-next (ccad360a2d41 PM / devfreq: exynos: Use DEFINE=
_SIMPLE_DEV_PM_OPS for PM functions)
Merging pmdomain/next (d88ea3034096 pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (4cece7649650 Linux 6.9-rc1)
Merging thermal/thermal/linux-next (69b08420b697 thermal: renesas: rcar: Ad=
d dependency on OF)
Merging dlm/next (7b72ab2c6a46 dlm: return -ENOMEM if ls_recover_buf fails)
Merging rdma/for-next (9c0731832d3b RDMA/cma: Fix kmemleak in rdma_core obs=
erved during blktests nvme/rdma use siw)
Merging net-next/main (4b377b4868ef kprobe/ftrace: fix build error due to b=
ad function definition)
Merging bpf-next/for-next (5c1672705a1a net: revert partially applied PHY t=
opology series)
Merging ipsec-next/master (dcf280ea0aad Merge remote branch 'xfrm: Introduc=
e direction attribute for SA')
Merging mlx5-next/mlx5-next (d727d27db536 RDMA/mlx5: Expose register c0 for=
 RDMA device)
Merging netfilter-next/main (5c1672705a1a net: revert partially applied PHY=
 topology series)
Merging ipvs-next/main (5c1672705a1a net: revert partially applied PHY topo=
logy series)
Merging bluetooth/master (287da9035b2e Bluetooth: btintel: Refactor btintel=
_set_ppag())
Merging wireless-next/for-next (1d60eabb8269 wifi: mwl8k: initialize cmd->a=
ddr[] properly)
Merging wpan-next/master (9187210eee7d Merge tag 'net-next-6.9' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging wpan-staging/staging (9187210eee7d Merge tag 'net-next-6.9' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mtd/mtd/next (6277967d872e mtd: mchp23k256: drop unneeded MODULE_AL=
IAS)
Merging nand/nand/next (6819db94e1cd mtd: rawnand: hynix: fixed typo)
Merging spi-nor/spi-nor/next (c84b3925c7d6 mtd: spi-nor: replace unnecessar=
y div64_u64() with div_u64())
Merging crypto/master (13909a0c8897 crypto: atmel-sha204a - provide the otp=
 content)
Merging drm/drm-next (5a5a10d9db77 drm/buddy: Fix the warn on's during forc=
e merge)
Merging drm-exynos/for-linux-next (7a5bdb7ca1b4 drm/exynos: hdmi: report sa=
fe 640x480 mode as a fallback when no EDID found)
Merging drm-misc/for-linux-next (20da948e3a80 drm/bridge: adv7511: Attach n=
ext bridge without creating connector)
Merging amdgpu/drm-next (062a7ce676e0 drm/amdgpu: fix ACA no query result a=
fter gpu reset)
Merging drm-intel/for-linux-next (11abdbc22b1a drm/i915: pass dev_priv expl=
icitly to CURSURFLIVE)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_vb=
t_defs.h
Merging drm-tegra/for-next (2429b3c529da drm/tegra: Avoid potential 32-bit =
integer overflow)
Merging drm-msm/msm-next (b587f413ca47 drm/msm/gen_header: allow skipping t=
he validation)
Merging drm-msm-lumag/msm-next-lumag (104e548a7c97 drm/msm/mdp4: use drmm-m=
anaged allocation for mdp4_plane)
Merging drm-xe/drm-xe-next (844f3228d225 drm/xe: Replace RING_START_UDW by =
u64 RING_START)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_device.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_vm.c
Merging etnaviv/etnaviv/next (e843e87abb90 drm/etnaviv: Disable SH_EU clock=
 gating on VIPNano-Si+)
Merging fbdev/for-next (a38297e3fb01 Linux 6.9)
Merging regmap/for-next (7ba822189e60 regmap: kunit: Fix array overflow in =
stride() test)
Merging sound/for-next (5005ccd91b9e ALSA: usb-audio: Fix for sampling rate=
s support for Mbox3)
Merging ieee1394/for-next (21151fd8f0ea firewire: obsolete usage of *-objs =
in Makefile for KUnit test)
Merging sound-asoc/for-next (225468b9f96f Merge remote-tracking branch 'aso=
c/for-6.9' into asoc-linus)
Merging modules/modules-next (2c9e5d4a0082 bpf: remove CONFIG_BPF_JIT depen=
dency on CONFIG_MODULES of)
Merging input/next (c1307f8a152a Input: try trimming too long modalias stri=
ngs)
Merging block/for-next (04d3822ddfd1 Merge branch 'block-6.10' into for-nex=
t)
CONFLICT (content): Merge conflict in drivers/of/property.c
Merging device-mapper/for-next (8b21ac87d550 dm-delay: remove timer_lock)
Merging libata/for-next (d4a89339f17c ata: pata_legacy: make legacy_exit() =
work again)
Merging pcmcia/pcmcia-next (ccae53aa8aa2 pcmcia: cs: make pcmcia_socket_cla=
ss constant)
Merging mmc/next (35eea0defb6e mmc: renesas_sdhi: Add compatible string for=
 RZ/G2L family, RZ/G3S, and RZ/V2M SoCs)
Merging mfd/for-mfd-next (1482489b5196 dt-bindings: mfd: Use full path to o=
ther schemas)
CONFLICT (content): Merge conflict in drivers/mfd/intel-lpss-pci.c
Merging backlight/for-backlight-next (1fd949f653ee backlight: sky81452-back=
light: Remove unnecessary call to of_node_get())
Merging battery/for-next (55f7073f6f59 dt-bindings: power: supply: max8903:=
 specify flt-gpios as input)
Merging regulator/for-next (9bc443ee2d2d Merge remote-tracking branch 'regu=
lator/for-6.9' into regulator-linus)
Merging security/next (dd80c7465029 MAINTAINERS: repair file entry in SECUR=
ITY SUBSYSTEM)
Merging apparmor/apparmor-next (3dd384108d53 apparmor: fix possible NULL po=
inter dereference)
Merging integrity/next-integrity (9fa8e7625008 ima: add crypto agility supp=
ort for template-hash algorithm)
Merging selinux/next (4b60f3cd1134 Automated merge of 'dev' into 'next')
Merging smack/next (69b6d71052b5 Smack: use init_task_smack() in smack_cred=
_transfer())
Merging tomoyo/master (0bb80ecc33a8 Linux 6.6-rc1)
Merging tpmdd/next (b16a6ccf7cca tpm: Disable TCG_TPM2_HMAC by default)
Merging watchdog/master (c45b8cfc6d5c watchdog: LENOVO_SE10_WDT should depe=
nd on X86 && DMI)
Merging iommu/next (2bd5059c6cc0 Merge branches 'arm/renesas', 'arm/smmu', =
'x86/amd', 'core' and 'x86/vt-d' into next)
Merging audit/next (4cece7649650 Linux 6.9-rc1)
Merging devicetree/for-next (d976c6f4b32c of: property: Add fw_devlink supp=
ort for interrupt-map property)
Merging dt-krzk/for-next (3d679a406f3a Merge branch 'next/dt64' into for-ne=
xt)
Merging mailbox/for-next (0ac39d85a741 mailbox: zynqmp: Enable Bufferless I=
PI usage on Versal-based SOC's)
Merging spi/for-next (e958cffa42df Merge remote-tracking branch 'spi/for-6.=
10' into spi-next)
Merging tip/master (6a1102a72a29 Merge branch into tip/master: 'x86/percpu')
Merging clockevents/timers/drivers/next (2030a7e11f16 clocksource/drivers/a=
rm_arch_timer: Mark hisi_161010101_oem_info const)
Merging edac/edac-for-next (ab80b31cd7b2 Merge ras/edac-urgent into for-nex=
t)
Merging ftrace/for-next (fde0aeca5926 Merge user-events/for-next)
Merging rcu/rcu/next (0e9b1d2b0560 Merge branches 'cmpxchg.2024.05.11a', 'k=
csan.2024.05.07a', 'lkmm.2024.05.06a', 'rcu-merge.2024.05.01a' and 'tsc.202=
4.04.09c' into HEAD)
Merging kvm/next (6f627b425378 KVM: SVM: Add module parameter to enable SEV=
-SNP)
Merging kvm-arm/next (eaa46a28d596 Merge branch kvm-arm64/mpidr-reset into =
kvmarm-master/next)
Merging kvms390/next (39cd87c4eb2b Linux 6.9-rc2)
Merging kvm-ppc/topic/ppc-kvm (b52e8cd3f835 KVM: PPC: Book3S HV nestedv2: F=
ix an error handling path in gs_msg_ops_kvmhv_nestedv2_config_fill_info())
Merging kvm-riscv/riscv_kvm_next (5ef2f3d4e747 KVM: riscv: selftests: Add c=
ommandline option for SBI PMU test)
Merging kvm-x86/next (d91a9cc16417 Merge branches 'fixes', 'generic', 'misc=
', 'mmu', 'selftests', 'selftests_utils' and 'vmx')
Merging xen-tip/linux-next (89af61fb8f0f xen/xenbus: Use *-y instead of *-o=
bjs in Makefile)
Merging percpu/for-next (2d9ad81ef935 Merge branch 'for-6.8-fixes' into for=
-next)
Merging workqueues/for-next (24283babc61f Merge branch 'for-6.9-fixes' into=
 for-next)
Merging drivers-x86/for-next (2513563edc98 platform/x86: Add new MeeGoPad A=
NX7428 Type-C Cross Switch driver)
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
Merging driver-core/driver-core-next (880a746fa3ea device property: Fix a t=
ypo in the description of device_get_child_node_count())
Merging usb/usb-next (51474ab44abf drm/bridge: aux-hpd-bridge: correct devm=
_drm_dp_hpd_bridge_add() stub)
Merging thunderbolt/next (a3dc6d82de9b thunderbolt: Correct trace output of=
 firmware connection manager packets)
Merging usb-serial/usb-next (39cd87c4eb2b Linux 6.9-rc2)
Merging tty/tty-next (e21de1455a72 serial: Clear UPF_DEAD before calling tt=
y_port_register_device_attr_serdev())
CONFLICT (content): Merge conflict in include/linux/kfifo.h
CONFLICT (content): Merge conflict in lib/kfifo.c
Merging char-misc/char-misc-next (f5b335dc025c misc: ntsync: mark driver as=
 "broken" to prevent from building)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
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
Merging extcon/extcon-next (3e8e45b65d9f extcon: adc-jack: Document missing=
 struct members)
Merging gnss/gnss-next (0bbac3facb5d Linux 6.9-rc4)
Merging vfio/next (cbb325e77fbe vfio/pci: Restore zero affected bus reset d=
evices warning)
Merging w1/for-next (cde37a5bdb0e w1: gpio: Don't use "proxy" headers)
Merging spmi/spmi-next (4cece7649650 Linux 6.9-rc1)
Merging staging/staging-next (eb563dc752d3 staging: pi433: Remove unused dr=
iver)
Merging counter-next/counter-next (89d5d9e95008 counter: Don't use "proxy" =
headers)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (44c026a73be8 Linux 6.4-rc3)
Merging dmaengine/next (28059ddbee0e MAINTAINERS: Update role for IDXD driv=
er)
Merging cgroup/for-next (21c38a3bd4ee cgroup/rstat: add cgroup_rstat_cpu_lo=
ck helpers and tracepoints)
Merging scsi/for-next (9ba1fbe2ed0c Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (e4f5f8298cf6 scsi: mpt3sas: Add missing kerneldo=
c parameter descriptions)
Merging vhost/linux-next (c9d853a05402 virtio: vdpa: vDPA driver for Marvel=
l OCTEON DPU devices)
CONFLICT (content): Merge conflict in drivers/net/virtio_net.c
CONFLICT (content): Merge conflict in drivers/virtio/virtio_mem.c
CONFLICT (content): Merge conflict in drivers/virtio/virtio_ring.c
Merging rpmsg/for-next (c8d8f841e95b Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (7f45fe2ea3b8 gpio: nuvoton: Fix sgpio irq =
handle error)
Merging gpio-intel/for-next (ecc4b1418e23 gpio: Add Intel Granite Rapids-D =
vGPIO driver)
Merging pinctrl/for-next (9429f847dd72 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (5d10a157ebe0 pinctrl: baytrail: Add pinconf=
 group for uart3)
Merging pinctrl-renesas/renesas-pinctrl (cd27553b0dee pinctrl: renesas: rzg=
2l: Limit 2.5V power supply to Ethernet interfaces)
Merging pinctrl-samsung/for-next (e5b3732a9654 pinctrl: samsung: drop redun=
dant drvdata assignment)
Merging pwm/pwm/for-next (4817118f257e pwm: pca9685: Drop explicit initiali=
zation of struct i2c_device_id::driver_data to 0)
Merging ktest/for-next (07283c1873a4 ktest: force $buildonly =3D 1 for 'mak=
e_warnings_file' test type)
Merging kselftest/next (31a59b76b978 Revert "selftests/cgroup: Drop define =
_GNU_SOURCE")
Merging kunit/test (4cece7649650 Linux 6.9-rc1)
Merging kunit-next/kunit (5496b9b77d74 kunit: bail out early in __kunit_tes=
t_suites_init() if there are no suites to test)
Merging livepatching/for-next (73a98bc5a947 Merge branch 'for-6.10' into fo=
r-next)
Merging rtc/rtc-next (1c431b92e21b dt-bindings: rtc: convert trivial device=
s into dtschema)
Merging nvdimm/libnvdimm-for-next (41147b006be2 dax: remove redundant assig=
nment to variable rc)
Merging at24/at24/for-next (4cece7649650 Linux 6.9-rc1)
Merging ntb/ntb-next (9341b37ec17a ntb_perf: Fix printk format)
Merging seccomp/for-next/seccomp (e406737b1110 seccomp: Constify sysctl sub=
helpers)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (4cece7649650 Linux 6.9-rc1)
Merging nvmem/for-next (4cece7649650 Linux 6.9-rc1)
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
Merging efi/next (15aa8fb852f9 x86/efistub: Omit physical KASLR when memory=
 reservations exist)
Merging unicode/for-next (0131c1f3cce7 unicode: make utf8 test count static)
Merging slab/slab/for-next (4a8dd3b3d550 Merge branch 'slab/for-6.10/cleanu=
p' into slab/for-next)
Merging random/master (f5730cffbbaa virt: vmgenid: add support for devicetr=
ee bindings)
Merging landlock/next (38a04f741569 selftests/landlock: Add layout1.refer_m=
ount_root)
Merging rust/rust-next (97ab3e8eec0c rust: alloc: fix dangling pointer in V=
ecExt<T>::reserve())
Merging sysctl/sysctl-next (a35dd3a786f5 sysctl: drop now unnecessary out-o=
f-bounds check)
Merging execve/for-next/execve (4bbf9c3b53e6 fs/coredump: Enable dynamic co=
nfiguration of max file note size)
Merging bitmap/bitmap-for-next (5671dca241b9 usercopy: Don't use "proxy" he=
aders)
Merging hte/for-next (297f26dbf870 hte: tegra-194: Convert to platform remo=
ve callback returning void)
Merging kspp/for-next/kspp (ae1a863bcdbd kunit/fortify: Fix memcmp() test t=
o be amplitude agnostic)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (0adab2b6b733 tools/nolibc: add support for uname(2))
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (4cece7649650 Linux 6.9-rc1)
Merging turbostat/next (256d218ec6ae tools/power turbostat: version 2024.05=
.10)
Merging refactor-heap/refactor-heap (940c306fd779 bcachefs: Remove heap-rel=
ated macros and switch to generic min_heap)
CONFLICT (content): Merge conflict in drivers/md/bcache/bset.c
CONFLICT (content): Merge conflict in drivers/md/bcache/bset.h
CONFLICT (content): Merge conflict in drivers/md/bcache/btree.c
CONFLICT (content): Merge conflict in drivers/md/bcache/writeback.c
$ git merge --abort
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/AgrrvSDYocpOK_IWUkrpuq5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZKyCYACgkQAVBC80lX
0GwiuQf/TH6NHifWu3ZXGY0yUJn0QqR5apye9doA8E0emmHz83tfx5w2HSCqGj4S
2DwYEtYh8buN6OUF1FORLDEkxZzh1nBztLT54QaQZTMsn3XCgq0rbddNBmIplDfH
raRUHcvjMq8husxXL5eJbNq5bYLm+SwUGSFRxKxD7JLeY+GNlN9aYSqf2FCCCTry
lG0YoR5l7whfr7liG12lJqsIaUisV/lNKdvCiMfAzwTA53dsUQ/yEr4sLbCsGbtn
BLWo/J7uBRUjdY5o7lS7Fw21grbhjViwnd5ocnDRJH9GUKnWUqMi/pIOwT+Ygy4z
aD/VeGiQz27qCL53Plg+90dN7AhlRQ==
=t7Z1
-----END PGP SIGNATURE-----

--Sig_/AgrrvSDYocpOK_IWUkrpuq5--

