Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E74242F4413
	for <lists+linux-next@lfdr.de>; Wed, 13 Jan 2021 06:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725536AbhAMFsP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Jan 2021 00:48:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbhAMFsP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Jan 2021 00:48:15 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF64C061786;
        Tue, 12 Jan 2021 21:47:34 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DFxKw2P1Fz9sWC;
        Wed, 13 Jan 2021 16:47:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610516852;
        bh=4uaAWfVKoSqXeamGP0idspC02AiCb3B/7xmOn1w/wvU=;
        h=Date:From:To:Cc:Subject:From;
        b=nQdHeeBfIv4Jhr14K5mMQvna88VLWUIHpNDjA8iLZvMY14H6XN9PJ1r/WsHFj5Y1o
         P3EUukkeke9rNkrlmFlq1Ih+0BhtMH9GxsZTM10Pd2CC7kde/D/XHBtKwyMhMATdta
         drk8ge0XYYHqnxnpZ6CuPqzRgoWK5AjOJye3avJYlfYO+zESMwJKNX6K4SwWL7IkbJ
         pmKvuu+Xs0DdZAQotRyVZd/9Wl1XIrkPpg2v2WwgSd2IQDzUbFhbuRsiexIFVtRO8i
         kF+M0gezMRDW+sEX2MS1Ai/jWu6ZF/V4WuiLx8auj9BA9iBbqf2mEulr5rCGlAIozp
         fiB04FUHNPfhA==
Date:   Wed, 13 Jan 2021 16:47:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 13
Message-ID: <20210113164731.7f7feb36@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h4pKbr5Q4VZ+xFTcCm1qLOF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/h4pKbr5Q4VZ+xFTcCm1qLOF
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210112:

New tree: iomem-mmap-vs-gup

The drm tree still had its build failure so I used the version from
next-20210107.

The drm-intel tree gained a build failure from merging the drm tree,
so I have used the version from next-20210108.

The drm-misc tree still had its build failure from merging the drm tree,
so I have used the version from next-20210107.

I reverted a commit from the iomem-mmap-vs-gup tree that caused a boot
failure on PowerPC.

Non-merge commits (relative to Linus' tree): 2333
 2515 files changed, 106801 insertions(+), 36883 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There are also quilt-import.log and merge.log
files in the Next directory.  Between each merge, the tree was built
with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
multi_v7_defconfig for arm and a native build of tools/perf. After
the final fixups (if any), I do an x86_64 modules_install followed by
builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
and sparc64 defconfig and htmldocs. And finally, a simple boot test
of the powerpc pseries_le_defconfig kernel in qemu (with and without
kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 331 trees (counting Linus' and 85 trees of bug
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
Merging origin/master (e609571b5ffa Merge tag 'nfs-for-5.11-2' of git://git=
.linux-nfs.org/projects/trondmy/linux-nfs)
Merging fixes/fixes (e71ba9452f0b Linux 5.11-rc2)
Merging kbuild-current/fixes (5625dcfbbcf8 Documentation: kbuild: Fix secti=
on reference)
Merging arc-current/for-curr (7c53f6b671f4 Linux 5.11-rc3)
Merging arm-current/fixes (e64ab473ddda ARM: 9034/1: __div64_32(): straight=
en up inline asm constraints)
Merging arm64-fixes/for-next/fixes (d78050ee3544 arm64: Remove arm64_dma32_=
phys_limit and its uses)
Merging arm-soc-fixes/arm/fixes (bac717171971 ARM: picoxcell: fix missing i=
nterrupt-parent properties)
Merging drivers-memory-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging m68k-current/for-linus (2ae92e8b9b7e MAINTAINERS: Update m68k Mac e=
ntry)
Merging powerpc-fixes/fixes (3ce47d95b734 powerpc: Handle .text.{hot,unlike=
ly}.* in linker script)
Merging s390-fixes/fixes (a1a322a62dba s390/vfio-ap: clean up vfio_ap resou=
rces when KVM pointer invalidated)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (1ee527a79fa6 Merge branch 'skb-frag-kmap_atomic-fixes')
Merging bpf/master (b8d52264df85 libbpf: Allow loading empty BTFs)
Merging ipsec/master (da64ae2d35d3 xfrm: Fix wraparound in xfrm_policy_addr=
_delta())
Merging netfilter/master (869f4fdaf4ca netfilter: nf_nat: Fix memleak in nf=
_nat_init)
Merging ipvs/master (869f4fdaf4ca netfilter: nf_nat: Fix memleak in nf_nat_=
init)
Merging wireless-drivers/master (6279d812eab6 Merge tag 'net-5.11-rc3-2' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging mac80211/master (51d62f2f2c50 cfg80211: Save the regulatory domain =
with a lock)
Merging rdma-fixes/for-rc (f2bc3af6353c RDMA/ocrdma: Fix use after free in =
ocrdma_dealloc_ucontext_pd())
Merging sound-current/for-linus (20c7842ed837 ALSA: hda/hdmi - enable runti=
me pm for CI AMD display audio)
Merging sound-asoc-fixes/for-linus (d82284841e36 Merge remote-tracking bran=
ch 'asoc/for-5.11' into asoc-linus)
Merging regmap-fixes/for-linus (72962ebcdd45 Merge remote-tracking branch '=
regmap/for-5.11' into regmap-linus)
Merging regulator-fixes/for-linus (14da16efa6f9 Merge remote-tracking branc=
h 'regulator/for-5.11' into regulator-linus)
Merging spi-fixes/for-linus (7c53f6b671f4 Linux 5.11-rc3)
Merging pci-current/for-linus (7c53f6b671f4 Linux 5.11-rc3)
Merging driver-core.current/driver-core-linus (895bee270863 Revert "driver =
core: Reorder devices on successful probe")
Merging tty.current/tty-linus (54ca955b5a40 serial: mvebu-uart: fix tx lost=
 characters at power off)
Merging usb.current/usb-linus (4e0dcf62ab4c usb: gadget: aspeed: fix stop d=
ma register setting.)
Merging usb-gadget-fixes/fixes (129aa9734559 usb: raw-gadget: fix memory le=
ak in gadget_setup)
Merging usb-serial-fixes/usb-linus (7c53f6b671f4 Linux 5.11-rc3)
Merging usb-chipidea-fixes/for-usb-fixes (491b1bea0004 MAINTAINERS: update =
Peter Chen's email address)
Merging phy/fixes (d092bd911049 phy: mediatek: allow compile-testing the ds=
i phy)
Merging staging.current/staging-linus (7c53f6b671f4 Linux 5.11-rc3)
Merging char-misc.current/char-misc-linus (f970d1d01af8 Merge tag 'phy-fixe=
s-5.11' of git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy into=
 char-misc-next)
Merging soundwire-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging thunderbolt-fixes/fixes (c14556fc0c7c thunderbolt: Drop duplicated =
0x prefix from format string)
Merging input-current/for-linus (5d06f72dc29c Input: ariel-pwrbutton - remo=
ve unused variable ariel_pwrbutton_id_table)
Merging crypto-current/master (382811940303 crypto: omap-sham - Fix link er=
ror without crypto-engine)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (e4eccb853664 vfio/pci: Bypass IGD init in cas=
e of -ENODEV)
Merging kselftest-fixes/fixes (7a6eb7c34a78 selftests: Skip BPF seftests by=
 default)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (7c53f6b671f4 Linux 5.11-rc3)
Merging backlight-fixes/for-backlight-fixes (bbf5c979011a Linux 5.9)
Merging mtd-fixes/mtd/fixes (4883a60c17ed mtd: rawnand: gpmi: fix dst bit o=
ffset when extracting raw payload)
Merging mfd-fixes/for-mfd-fixes (bbf5c979011a Linux 5.9)
Merging v4l-dvb-fixes/fixes (95e9295daa84 media: Revert "media: videobuf2: =
Fix length check for single plane dmabuf queueing")
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (698222457465 MIPS: Fix malformed NT_FILE and=
 NT_SIGINFO in 32bit coredumps)
Merging at91-fixes/at91-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging omap-fixes/fixes (181739822cf6 ARM: dts; gta04: SPI panel chip sele=
ct is active low)
Merging kvm-fixes/master (872f36eb0b0f KVM: x86: __kvm_vcpu_halt can be sta=
tic)
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (84e261553e6f hwmon: (amd_energy) fix allocation =
of hwmon_channel_info config)
Merging nvdimm-fixes/libnvdimm-fixes (88b67edd7247 dax: Fix compilation for=
 CONFIG_DAX && !CONFIG_FS_DAX)
Merging btrfs-fixes/next-fixes (aabcb2003928 Merge branch 'misc-5.11' into =
next-fixes)
Merging vfs-fixes/fixes (94602b67b8b6 iov_iter: fix the uaccess area in cop=
y_compat_iovec_from_user)
Merging dma-mapping-fixes/for-linus (892fc9f6835e dma-pool: Fix an uninitia=
lized variable bug in atomic_pool_expand())
Merging i3c-fixes/i3c/fixes (291b5c9870fc i3c/master/mipi-i3c-hci: Fix posi=
tion of __maybe_unused in i3c_hci_of_match)
Merging drivers-x86-fixes/fixes (5b569302520a platform/x86: amd-pmc: Fix CO=
NFIG_DEBUG_FS check)
Merging samsung-krzk-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging pinctrl-samsung-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging devicetree-fixes/dt/linus (2b8f061a4f50 dt-bindings: Drop redundant=
 maxItems/items)
Merging scsi-fixes/fixes (eeb1b55b6e25 scsi: ufs: Fix tm request when non-f=
atal error happens)
Merging drm-fixes/drm-fixes (7c53f6b671f4 Linux 5.11-rc3)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (984cadea032b drm/i915: Allow =
the sysadmin to override security mitigations)
Merging mmc-fixes/fixes (1a3ed0dc3594 mmc: sdhci-xenon: fix 1.8v regulator =
stabilization)
Merging rtc-fixes/rtc-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging gnss-fixes/gnss-linus (7c53f6b671f4 Linux 5.11-rc3)
Merging hyperv-fixes/hyperv-fixes (ad0a6bad4475 x86/hyperv: check cpu mask =
after interrupt has been disabled)
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (0ea02c737752 riscv: Drop a duplicated PAGE_KERN=
EL_EXEC)
Merging pidfd-fixes/fixes (a409ed156a90 Merge tag 'gpio-v5.11-1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio)
Merging fpga-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging spdx/spdx-linus (5c8fe583cce5 Linux 5.11-rc1)
Merging gpio-intel-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging pinctrl-intel-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging erofs-fixes/fixes (a30573b3cdc7 erofs: fix setting up pcluster for =
temporary pages)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (65a4e5299739 kunit: tool: Force the use of=
 the 'tty' console for UML)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (b9bc36704cca ARM, xtensa: highmem: avoid clob=
bering non-page aligned memory reservations)
Merging drm-misc-fixes/for-linux-next-fixes (bb52cb0dec8d drm/ttm: make the=
 pool shrinker lock a mutex)
Merging kspp-gustavo/for-next/kspp (36f9ff9e03de lib: Fix fall-through warn=
ings for Clang)
Merging kbuild/for-next (a76082b037f5 Makefile: use smaller dictionary size=
 for xz module compression)
Merging compiler-attributes/compiler-attributes (196793946264 Compiler Attr=
ibutes: remove CONFIG_ENABLE_MUST_CHECK)
Merging dma-mapping/for-next (f726c72d6c05 dma-mapping: benchmark: check th=
e validity of dma mask bits)
Merging asm-generic/master (2c85ebc57b3e Linux 5.10)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (ecbbb88727ae Merge branch 'devel-stable' into for-nex=
t)
Merging arm64/for-next/core (694a1c0adebe iommu/vt-d: Fix duplicate include=
d linux/dma-map-ops.h)
Merging arm-perf/for-next/perf (881b0520504a perf/imx_ddr: Add system PMU i=
dentifier for userspace)
Merging arm-soc/for-next (9b28a2eacfe4 soc: document merges)
Merging actions/for-next (a501abf8d8cb Merge branch 'v5.12/soc' into for-ne=
xt)
Merging amlogic/for-next (60f232d3c04a Merge branch 'v5.12/dt64' into tmp/a=
ml-rebuild)
Merging aspeed/for-next (41707a524026 Merge branches 'soc-for-v5.11' and 'd=
efconfig-for-v5.11' into for-next)
Merging at91/at91-next (3e3d5e8a7d73 Merge branches 'at91-soc' and 'at91-de=
fconfig' into at91-next)
Merging drivers-memory/for-next (81053f0e95da Merge branch 'for-v5.12/tegra=
-mc' into for-next)
Merging imx-mxs/for-next (25f2978650f0 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (b2a8f6ce4bdc Merge branch 'for_5.11/drivers-soc' int=
o next)
Merging mediatek/for-next (727bfb2c55b0 Merge branch 'v5.10-next/soc' into =
for-next)
Merging mvebu/for-next (dc14300bb67b Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (792952314166 Merge branch 'omap-for-v5.11/dt' into f=
or-next)
Merging qcom/for-next (b69b63bfed82 Merge branches 'arm64-defconfig-for-5.1=
2', 'arm64-for-5.12', 'drivers-for-5.12' and 'dts-for-5.12' into for-next)
Merging raspberrypi/for-next (e10bb7f95cba ARM: dts: bcm2711: Use compatibl=
e string for BCM2711 DSI1)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (ffb284986e56 Merge branch 'renesas-arm-dt-for-v5.12' =
into renesas-next)
Merging reset/reset/next (f2ad9bfd4dda dt-bindings: reset: convert Hisilico=
n reset controller bindings to json-schema)
Merging rockchip/for-next (06f4ae178437 Merge branch 'v5.12-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (a867287e9066 Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (dd63baa9d43f Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging stm32/stm32-next (814fddb955f8 ARM: multi_v7_defconfig: enable STM3=
2 dfsdm audio support)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/con=
nector/usb-connector.yaml
Merging sunxi/sunxi/for-next (2e76c5b3726d Merge branches 'sunxi/clk-for-5.=
12', 'sunxi/drivers-for-5.12' and 'sunxi/dt-for-5.12' into sunxi/for-next)
Merging tegra/for-next (b11a0dfbd316 Merge branch for-5.11/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (bdd87ad73d64 Merge branch 'ti-k3-maintainer-n=
ext' into ti-k3-next)
Merging clk/clk-next (5c8fe583cce5 Linux 5.11-rc1)
Merging clk-renesas/renesas-clk (c706121386fe dt-bindings: clock: renesas: =
rcar-usb2-clock-sel: Add support for RZ/G2 M/N/H)
Merging clk-samsung/for-next (44a9e78f9242 clk: samsung: Prevent potential =
endless loop in the PLL ops)
Merging csky/linux-next (f0bbf052ae46 csky: Reconstruct VDSO framework)
Merging h8300/h8300-next (8808515be0ed h8300: Replace <linux/clk-provider.h=
> by <linux/of_clk.h>)
Merging ia64/next (c331649e6371 ia64: Use libata instead of the legacy ide =
driver in defconfigs)
Merging m68k/for-next (2ae92e8b9b7e MAINTAINERS: Update m68k Mac entry)
Merging m68knommu/for-next (7c53f6b671f4 Linux 5.11-rc3)
Merging microblaze/next (57ddf08642f0 microblaze: do not select TRACING_SUP=
PORT directly)
Merging mips/mips-next (99b40ced9ef6 MIPS: bitops: Fix reference to ffz loc=
ation)
Merging nds32/next (54bde873682b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (d8398bf840f8 openrisc: add local64.h to fix blk-=
iocost build)
Merging parisc-hd/for-next (2c85ebc57b3e Linux 5.10)
Merging powerpc/next (e71ba9452f0b Linux 5.11-rc2)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e95f287deed2 soc: fsl: handle RCPM errata A-008646 on=
 SoC LS1021A)
Merging risc-v/for-next (ef9511eaf8bc riscv: Add support for function error=
 injection)
Merging s390/for-next (744ae0e8c508 Merge branch 'fixes' into for-next)
Merging sh/for-next (b89bc060b53e sh/intc: Restore devm_ioremap() alignment)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (1fb1abc83636 um: Fix build w/o CONFIG_PM_SLEEP)
Merging xtensa/xtensa-for-next (7b79eba1d0d1 xtensa: fix spelling mistake i=
n Kconfig "wont" -> "won't")
Merging fscrypt/master (a14d0b676491 fscrypt: allow deleting files with uns=
upported encryption policy)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (897a0546b4a0 Merge branch 'for-next-next-v5.11-2021=
0112' into for-next-20210112)
Merging ceph/master (4972cf605f8a libceph, ceph: disambiguate ceph_connecti=
on_operations handlers)
Merging cifs/for-next (236237ab6de1 cifs: check pointer before freeing)
Merging configfs/for-next (65cdb4a214c0 configfs: fix kernel-doc markup iss=
ue)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (d8b3df8b1048 erofs: avoid using generic_block_bmap)
Merging exfat/dev (4b7bc2c32cba exfat: improve performance of exfat_free_cl=
uster when using dirsync mount option)
Merging ext3/for_next (d15cd626d7a4 Pull inotify memcg accounting patch.)
Merging ext4/dev (5a3b590d4b2d ext4: don't leak old mountpoint samples)
CONFLICT (content): Merge conflict in fs/ext4/super.c
Merging f2fs/dev (b9f76004363d f2fs: fix null page reference in redirty_blo=
cks)
Merging fsverity/fsverity (bde493349025 fs-verity: move structs needed for =
file signing to UAPI header)
Merging fuse/for-next (5d069dbe8aaf fuse: fix bad inode)
Merging jfs/jfs-next (3bef198f1b17 JFS: more checks for invalid superblock)
Merging nfs/linux-next (896567ee7f17 NFS: nfs_igrab_and_active must first r=
eference the superblock)
Merging nfs-anna/linux-next (11392155f2bd NFS: Disable READ_PLUS by default)
CONFLICT (content): Merge conflict in fs/nfs/nfs4proc.c
Merging nfsd/nfsd-next (c3213d260a23 SUNRPC: Fix oops in the rpc_xdr_buf ev=
ent class)
Merging cel/cel-next (51b2ee7d006a nfsd4: readdirplus shouldn't return pare=
nt of export)
Merging orangefs/for-next (c1048828c3db orangefs: add splice file operation=
s)
Merging overlayfs/overlayfs-next (459c7c565ac3 ovl: unprivieged mounts)
Merging ubifs/next (b80a974b8c58 ubifs: ubifs_dump_node: Dump all branches =
of the index node)
Merging v9fs/9p-next (324a158fe535 fs: 9p: add generic splice_write file op=
eration)
Merging xfs/for-next (e82226138b20 xfs: remove xfs_buf_t typedef)
Merging zonefs/for-next (4f8b848788f7 zonefs: select CONFIG_CRC32)
Merging iomap/iomap-for-next (1a31182edd00 iomap: Call inode_dio_end() befo=
re generic_write_sync())
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (8d1ddb5e7937 fcntl: Fix potential deadlock i=
n send_sig{io, urg}())
Merging vfs/for-next (5cc02325880f Merge branches 'fixes', 'work.sparc', 'w=
ork.sparc32', 'work.elf-compat', 'work.recursive_removal', 'work.misc' and =
'work.d_name' into for-next)
CONFLICT (content): Merge conflict in arch/Kconfig
Merging printk/for-next (0459d46d8a44 Merge branch 'for-5.11-null-console-f=
ixup' into for-next)
Merging pci/next (7c53f6b671f4 Linux 5.11-rc3)
Merging pstore/for-next/pstore (26fecbf7602d pstore: Move kmsg_bytes defaul=
t into Kconfig)
Merging hid/for-next (8cd7ce929f88 Merge branch 'for-5.11/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (fc6d87ffc318 Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (5c8fe583cce5 Linux 5.11-rc1)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (d1f7b079ce5b hwmon: (aspeed-pwm-tacho) Sw=
itch to using the new API kobj_to_dev())
Merging jc_docs/docs-next (419b1d4ed1cb doc/zh_CN: add mips ingenic-tcu.rst=
 translation)
Merging v4l-dvb/master (d497fcdab029 media: aspeed: fix error return code i=
n aspeed_video_setup_video())
Merging v4l-dvb-next/master (d0a9fffedca1 docs: fs: api-summary.rst: get ri=
d of kernel-doc include)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_dp_helper.c
CONFLICT (content): Merge conflict in Documentation/dev-tools/kasan.rst
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (8cbb6cfa9b8e Merge branch 'acpi-scan' into linux-nex=
t)
Merging cpufreq-arm/cpufreq/arm/linux-next (c8bb45205438 Merge branch 'cpuf=
req/scmi' into cpufreq/arm/linux-next)
Merging cpupower/cpupower (fb7791e213a6 cpupower: add Makefile dependencies=
 for install targets)
Merging devfreq/devfreq-next (ec894883de53 PM / devfreq: Replace devfreq->d=
ev.parent as dev in devfreq_add_device)
Merging opp/opp/linux-next (0e1d9ca1766f opp: Call the missing clk_put() on=
 error)
Merging thermal/thermal/linux-next (6250d904ae1d thermal/core: Remove point=
less thermal_zone_device_reset() function)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (4f19d071f9be fs: dlm: check on existing node address)
Merging swiotlb/linux-next (e998879d4fb7 x86,swiotlb: Adjust SWIOTLB bounce=
 buffer size for SEV guests)
Merging rdma/for-next (661f385961f0 RDMA/siw: Fix handling of zero-sized Re=
ad and Receive Queues.)
Merging net-next/master (c73a45965dd5 net: mvpp2: prs: improve ipv4 parse f=
low)
Merging bpf-next/for-next (28a8add64181 bpf: Fix a verifier message for all=
oc size helper arg)
Merging ipsec-next/master (18f976960bca xfrm: interface: enable TSO on xfrm=
 interfaces)
Merging mlx5-next/mlx5-next (5c8fe583cce5 Linux 5.11-rc1)
Merging netfilter-next/master (09b5b5fb3902 ppp: clean up endianness conver=
sions)
Merging ipvs-next/master (09b5b5fb3902 ppp: clean up endianness conversions)
Merging wireless-drivers-next/master (dc5771dfb27d Merge ath-next from git:=
//git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
Merging bluetooth/master (ad3a9c0ec2d2 Bluetooth: hci_qca: Wait for SSR com=
pletion during suspend)
Merging mac80211-next/master (3db1a3fa9880 Merge tag 'staging-5.11-rc1' of =
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging)
Merging gfs2/for-next (6c7c04f7bc18 gfs2: Fix invalid block size message)
Merging mtd/mtd/next (341e4faf9cad mtd: remove redundant assignment to poin=
ter eb)
Merging nand/nand/next (3d557b24bc82 mtd: parsers: afs: Fix freeing the par=
t name memory in failure)
Merging spi-nor/spi-nor/next (7c53f6b671f4 Linux 5.11-rc3)
Merging crypto/master (622aae879c1d crypto: vmx - Move extern declarations =
into header file)
Merging drm/drm-next (cb3cfbf79aff Merge tag 'drm-misc-next-2021-01-06' of =
git://anongit.freedesktop.org/drm/drm-misc into drm-next)
$ git reset --hard HEAD^
Merging next-20210107 version of drm
Merging amdgpu/drm-next (7b2992e67b23 MAINTAINERS: update radeon/amdgpu/amd=
kfd git trees)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm_mst_types.c
Merging drm-intel/for-linux-next (cce73665eae2 drm/i915/dg1: Update voltage=
 swing tables for DP)
$ git reset --hard HEAD^
Merging next-20210108 version of drm-intel
Merging drm-tegra/drm/tegra/for-next (bf3a3cdcad40 drm/tegra: sor: Disable =
clocks on error in tegra_sor_init())
Merging drm-misc/for-linux-next (af20724c6863 drm/vkms: Add information abo=
ut module options)
$ git reset --hard HEAD^
Merging next-20210107 version of drm-misc
Merging drm-msm/msm-next (00fd44a1a470 drm/msm: Only enable A6xx LLCC code =
on A6xx)
Merging imx-drm/imx-drm/next (82581fcf070b drm/modes: add non-OF stub for o=
f_get_drm_display_mode)
Merging etnaviv/etnaviv/next (4612bad5701e drm/etnaviv: Add lockdep annotat=
ions for context lock)
Merging regmap/for-next (72962ebcdd45 Merge remote-tracking branch 'regmap/=
for-5.11' into regmap-linus)
Merging sound/for-next (75b1a8f9d62e ALSA: Convert strlcpy to strscpy when =
return value is unused)
Merging sound-asoc/for-next (0fa2e44bb1d7 Merge remote-tracking branch 'aso=
c/for-5.12' into asoc-next)
Merging modules/modules-next (38dc717e9715 module: delay kobject uevent unt=
il after module init call)
Merging input/next (2f6aa61d87e7 Input: omap4-keypad - implement errata che=
ck for lost key-up events)
Merging block/for-next (a9f7c7a1f408 Merge branch 'for-5.12/io_uring' into =
for-next)
Merging device-mapper/for-next (17ffc193cdc6 dm integrity: fix the maximum =
number of arguments)
Merging pcmcia/pcmcia-next (4ce6b242b78d pcmcia: Switch to using the new AP=
I kobj_to_dev())
Merging mmc/next (e242441db343 mmc: sdhci-msm: Actually set the actual cloc=
k)
Merging mfd/for-mfd-next (2fc3f48ad711 mfd: mcp-sa11x0: Use DIV_ROUND_UP to=
 calculate rw_timeout)
Merging backlight/for-backlight-next (789eb04b6c56 backlight: pwm_bl: Fix i=
nterpolation)
Merging battery/for-next (cd900f181ad6 power/supply: Add ltc4162-l-charger)
Merging regulator/for-next (9b873f1ee931 Merge remote-tracking branch 'regu=
lator/for-5.12' into regulator-next)
Merging security/next-testing (9dcd47fc1f7d Merge branch 'fixes-v5.10' into=
 next-testing)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (207cdd565dfc ima: Don't modify file descr=
iptor mode on the fly)
Merging keys/keys-next (6b8945603d05 certs: Replace K{U,G}IDT_INIT() with G=
LOBAL_ROOT_{U,G}ID)
Merging safesetid/safesetid-next (03ca0ec13892 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (e0de8a9aebd0 selinux: mark selinux_xfrm_refcount as _=
_read_mostly)
Merging smack/next (9b0072e2b2b5 security/smack: remove unused varible 'rc')
Merging tomoyo/master (dea8dcf2a9fa Merge tag 'for-5.11/dm-fix' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging tpmdd/next (2a6f7a28785c keys: Update comment for restrict_link_by_=
key_or_keyring_chain)
Merging watchdog/master (7c53f6b671f4 Linux 5.11-rc3)
Merging iommu/next (4dd6ce478003 iommu: Fix a check in iommu_check_bind_dat=
a())
Merging audit/next (a1b861faa684 kernel/audit: convert comma to semicolon)
Merging devicetree/for-next (4b52be0ce6ad dt-bindings: Remove plain text OF=
 graph binding)
Merging mailbox/mailbox-for-next (5a6338cce9f4 mailbox: arm_mhuv2: Add driv=
er)
Merging spi/for-next (af22c972b39e Merge remote-tracking branch 'spi/for-5.=
12' into spi-next)
Merging tip/auto-latest (83e7ef80f52d Merge branch 'perf/kprobes')
Merging clockevents/timers/drivers/next (8ae954caf49a clocksource/drivers/s=
h_cmt: Fix potential deadlock when calling runtime PM)
Merging edac/edac-for-next (f2a34093730f Merge branch 'edac-misc' into edac=
-for-next)
Merging irqchip/irq/irqchip-next (599b3063adf4 irqchip/mips-cpu: Set IPI do=
main parent chip)
Merging ftrace/for-next (f6a694665f13 tracing: Offload eval map updates to =
a work queue)
Merging rcu/rcu/next (f81f6edb74f2 rcu: Remove spurious instrumentation_end=
() in rcu_nmi_enter())
Merging kvm/next (872f36eb0b0f KVM: x86: __kvm_vcpu_halt can be static)
Merging kvm-arm/next (45ba7b195a36 arm64: cpufeature: remove non-exist CONF=
IG_KVM_ARM_HOST)
Merging kvm-ppc/kvm-ppc-next (dc924b062488 KVM: SVM: check CR4 changes agai=
nst vcpu->arch)
Merging kvms390/next (50a05be484cb KVM: s390: track synchronous pfault even=
ts in kvm_stat)
Merging xen-tip/linux-next (6190c0ccaf5d xen: Kconfig: remove X86_64 depend=
s from XEN_512GB)
Merging percpu/for-next (7dd3050a0194 Merge branch 'for-5.12' into for-next)
Merging workqueues/for-next (ac87f8ff6cf1 workqueue: Kick a worker based on=
 the actual activation of delayed works)
Merging drivers-x86/for-next (fc00bc8ac1da platform/surface: Add Surface AC=
PI Notify driver)
Merging chrome-platform/for-next (6ae9b5ffcaeb platform/chrome: cros_ec_typ=
ec: Tolerate unrecognized mux flags)
Merging hsi/for-next (aa57e77b3d28 HSI: Fix PM usage counter unbalance in s=
si_hw_init)
Merging leds/for-next (9a5ad5c5b2d2 leds: trigger: fix potential deadlock w=
ith libata)
Merging ipmi/for-next (dea8dcf2a9fa Merge tag 'for-5.11/dm-fix' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging driver-core/driver-core-next (3ac6e56c325e Revert "drivers: core: D=
etach device from power domain on shutdown")
Merging usb/usb-next (a66a7d48f34a Merge 5.11-rc3 into usb-next)
Merging usb-gadget/next (b2c586eb07ef usb: dwc2: Fix INTR OUT transfers in =
DDMA mode.)
Merging usb-serial/usb-next (161a582bd1d8 USB: serial: mos7720: improve OOM=
-handling in read_mos_reg())
Merging usb-chipidea-next/for-usb-next (62e140c241bd usb: cdnsp: fixes unde=
fined reference to cdns_remove)
Merging phy-next/next (5c8fe583cce5 Linux 5.11-rc1)
Merging tty/tty-next (c9cd57bf57fd tty: Protect disc_data in n_tty_close an=
d n_tty_flush_buffer)
Merging char-misc/char-misc-next (591afd6e5a50 Merge 5.11-rc3 into char-mis=
c-next)
CONFLICT (content): Merge conflict in scripts/mod/file2alias.c
CONFLICT (content): Merge conflict in scripts/mod/devicetable-offsets.c
CONFLICT (content): Merge conflict in include/linux/mod_devicetable.h
Merging extcon/extcon-next (226d336c1c75 extcon: max8997: Add CHGINS and CH=
GRM interrupt handling)
Merging soundwire/next (235ae89b6676 soundwire: intel: Use kzalloc for allo=
cating only one thing)
Merging thunderbolt/next (fdb0887c5a87 thunderbolt: Start lane initializati=
on after sleep)
Merging vfio/next (bdfae1c9a913 vfio/type1: Add vfio_group_iommu_domain())
Merging staging/staging-next (3dba1da360da Merge 5.11-rc3 into staging-next)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (23145465c5b0 Merge branch 'icc-msm8939' into icc-next)
Merging dmaengine/next (1f0a16f04113 dmaengine: owl-dma: Fix a resource lea=
k in the remove function)
Merging cgroup/for-next (2d18e54dd866 cgroup: Fix memory leak when parsing =
multiple source parameters)
Merging scsi/for-next (eeb1b55b6e25 scsi: ufs: Fix tm request when non-fata=
l error happens)
Merging scsi-mkp/for-next (91b1b640b834 scsi: storvsc: Validate length of i=
ncoming packet in storvsc_on_channel_callback())
Merging vhost/linux-next (e13a6915a03f vhost/vsock: add IOTLB API support)
Merging rpmsg/for-next (7cb4f293777e Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (64e6066e16b8 gpio: rcar: Add R-Car V3U (R8=
A779A0) support)
Merging gpio-intel/for-next (2a8a3f09d9b1 gpio: wcove: convert comma to sem=
icolon)
Merging pinctrl/for-next (6d92949813bb Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0e793a4e2834 pinctrl: tigerlake: Add Alder =
Lake-P ACPI ID)
Merging pinctrl-renesas/renesas-pinctrl (6dd169fc201d pinctrl: renesas: che=
cker: Restrict checks to Renesas platforms)
Merging pinctrl-samsung/for-next (5c8fe583cce5 Linux 5.11-rc1)
Merging pwm/for-next (6eefb79d6f5b pwm: sun4i: Remove erroneous else branch)
Merging userns/for-next (95ebabde382c capabilities: Don't allow writing amb=
iguous v3 file capabilities)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (df00d0298902 selftests/vDSO: fix -Wformat warning i=
n vdso_test_correctness)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (59fc1e476962 Merge branch 'for-5.10/flive-pa=
tching' into for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (1bf3e6cce830 rtc: opal: set range)
Merging nvdimm/libnvdimm-for-next (127c3d2e7e8a Merge branch 'for-5.11/dax'=
 into for-5.11/libnvdimm)
Merging at24/at24/for-next (5c8fe583cce5 Linux 5.11-rc1)
Merging ntb/ntb-next (5c8fe583cce5 Linux 5.11-rc1)
Merging seccomp/for-next/seccomp (2c07343abd89 selftests/seccomp: Update ke=
rnel config)
Merging kspp/for-next/kspp (1354b8946c46 arm64: allow LTO to be selected)
Merging gnss/gnss-next (45d5996e034c gnss: drop stray semicolons)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (5c8fe583cce5 Linux 5.11-rc1)
Merging nvmem/for-next (40f592233f78 nvmem: imx-iim: Use of_device_get_matc=
h_data())
Merging xarray/main (80c1dbebf308 XArray: Fix splitting to non-zero orders)
Merging hyperv/hyperv-next (aa7fb666092d Drivers: hv: vmbus: Add /sys/bus/v=
mbus/hibernation)
Merging auxdisplay/auxdisplay (351dcacc6d77 auxdisplay: panel: Remove redun=
dant charlcd_ops structures)
Merging kgdb/kgdb/for-next (d081a6e35316 kdb: Fix pager search for multi-li=
ne strings)
Merging pidfd/for-next (cb5021ca622f kthread: remove comments about old _do=
_fork() helper)
Merging hmm/hmm (3650b228f83a Linux 5.10-rc1)
Merging fpga/for-next (e41d4c011706 fpga: dfl: fme: Constify static attribu=
te_group structs)
Merging kunit/test (e71ba9452f0b Linux 5.11-rc2)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (5de15b610f78 mtd: hyperbus: add Renesas RPC-IF driver)
Merging kunit-next/kunit (e71ba9452f0b Linux 5.11-rc2)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (e6ca384d3b09 mhi: pci_generic: Fix shared MSI vector =
support)
Merging notifications/notifications-pipe-core (841a0dfa5113 watch_queue: sa=
mple: Display mount tree change notifications)
CONFLICT (content): Merge conflict in include/uapi/asm-generic/unistd.h
CONFLICT (content): Merge conflict in arch/xtensa/kernel/syscalls/syscall.t=
bl
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_64.tbl
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_32.tbl
CONFLICT (content): Merge conflict in arch/sparc/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/sh/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/s390/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/powerpc/kernel/syscalls/syscall.=
tbl
CONFLICT (content): Merge conflict in arch/parisc/kernel/syscalls/syscall.t=
bl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_o32=
.tbl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_n64=
.tbl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_n32=
.tbl
CONFLICT (content): Merge conflict in arch/microblaze/kernel/syscalls/sysca=
ll.tbl
CONFLICT (content): Merge conflict in arch/m68k/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/ia64/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/arm64/include/asm/unistd32.h
CONFLICT (content): Merge conflict in arch/arm64/include/asm/unistd.h
CONFLICT (content): Merge conflict in arch/arm/tools/syscall.tbl
CONFLICT (content): Merge conflict in arch/alpha/kernel/syscalls/syscall.tbl
Merging memblock/for-next (5bdba520c1b3 mm: memblock: drop __init from memb=
lock functions to make it inline)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging iomem-mmap-vs-gup/topic/iomem-mmap-vs-gup (85482fbab59e PCI: Revoke=
 mappings like devmem)
Merging akpm-current/current (27c287b41659 ubsan: disable unsigned-overflow=
 check for i386)
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (0bcc02448468 secretmem-test-add-basic-selftest-for-mem=
fd_secret2-fix)
Applying: Revert "PCI: Revoke mappings like devmem"

--Sig_/h4pKbr5Q4VZ+xFTcCm1qLOF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/+iXMACgkQAVBC80lX
0Gxw1Af/dFHduyRj/BhSn19JpwJnbKnjvQwXxIcdo6e5ytbOMR2RJDQpXlyexgeR
CLGt65KC2/sJugkAmWb7+QKTtvnZdtdAaRzVQKjrZBiQle6boZ0O5prVrqNZvn/s
4a2jQ/ySQgBx3BLKAkn+cbFq6TukjXBnVBIlyyJ6ryIVKwl3l2BScXphw7FXvVH8
ktamlGDRWhn5nv13THl3NHNYc7IAiD+65zcAl/Ga8jhCFiUChZNwb4KkHebhNY31
iRahnJGDUIS/od49td7RHDidt2za/G2051TbbvF8/bkX05hhDasA55XA/w17iwTQ
2SjUJ5b6pYvw7gYM0Cs9RjN6Ch/hKA==
=dI7W
-----END PGP SIGNATURE-----

--Sig_/h4pKbr5Q4VZ+xFTcCm1qLOF--
