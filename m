Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86F3A31657A
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 12:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbhBJLpT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 06:45:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbhBJLnL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Feb 2021 06:43:11 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92BB4C061788;
        Wed, 10 Feb 2021 03:42:30 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DbHtV62mHz9rx8;
        Wed, 10 Feb 2021 22:42:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612957347;
        bh=1Ixhf1h2vVYbogyfpfiaaf7diP1X+mTaw2LcreA8Qeg=;
        h=Date:From:To:Cc:Subject:From;
        b=taZJuS0B3VVPJy/2lGK6aZHwHzIfhYLMYwbu4CZssn7sHq+rh9CN9i6wSVoWCGB4u
         hCE3eQAm1gA+fpmQIIXF1hEQ9BrZ/09bGlNlFn7Oh+aeaGBR3dYRfA1sPOU8nuYLj5
         Z/2PDDDgTf/KhrJtmafJaq9mIri7jwEU9j6nAI6OQF1F7DmFPYgN0Us0i1jApIjXyV
         3G1dB8TExE20fD6T7o8h3CvHRHc67e3nuUuvxoy+Xq5frCtpzAxHCardPQ7wmlxtHN
         MyIyYsx15BdamM2eHkZvymA0C33MrJKvH/WVmCMMSjtirzo0cO+/8QubBELeWktQGE
         glAWSZHUC6jpA==
Date:   Wed, 10 Feb 2021 22:42:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 10
Message-ID: <20210210224220.28657128@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_7.x4Pe/pBGhDDp0wi_+dTr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_7.x4Pe/pBGhDDp0wi_+dTr
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210209:

The powerpc tree still had its build failure in the allyesconfig for
which I applied a supplied patch.

The v4l-dvb tree gained a build failure so I used the version from
next-20210209.

The rdma tree gained a conflict against Linus' tree.

The drm-misc tree gained a build failure so I used the version from
next-20210209.

The amdgpu tree lost its build failure.

The modules tree sill had its build failure for which I reverted a commit.

The tip tree still had its boot failure so I reverted a commit.

The kvm tree lost its build failure.

The driver-core tree gained a build failure for which I applied a
fix patch.

The iomem-mmap-vs-gup tree gained a build failure due to an interaction
with the kvm tree for which I applied a merge fix patch.

Non-merge commits (relative to Linus' tree): 9388
 9361 files changed, 377298 insertions(+), 264441 deletions(-)

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

I am currently merging 333 trees (counting Linus' and 87 trees of bug
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
Merging origin/master (e0756cfc7d7c Merge tag 'trace-v5.11-rc7' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging fixes/fixes (e71ba9452f0b Linux 5.11-rc2)
Merging kbuild-current/fixes (efe6e3068067 kallsyms: fix nonconverging kall=
syms table with lld)
Merging arc-current/for-curr (7c53f6b671f4 Linux 5.11-rc3)
Merging arm-current/fixes (4d62e81b60d4 ARM: kexec: fix oops after TLB are =
invalidated)
Merging arm64-fixes/for-next/fixes (22cd5edb2d9c arm64: Use simpler arithme=
tics for the linear map macros)
Merging arm-soc-fixes/arm/fixes (d30337da8677 ARM: at91: use proper asm syn=
tax in pm_suspend)
Merging drivers-memory-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging m68k-current/for-linus (2ae92e8b9b7e MAINTAINERS: Update m68k Mac e=
ntry)
Merging powerpc-fixes/fixes (24321ac668e4 powerpc/64/signal: Fix regression=
 in __kernel_sigtramp_rt64() semantics)
Merging s390-fixes/fixes (92bf22614b21 Linux 5.11-rc7)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (6bbc088d6ebf Merge branch 'bridge-mrp')
Merging bpf/master (6183f4d3a0a2 bpf: Check for integer overflow when using=
 roundup_pow_of_two())
Merging ipsec/master (da64ae2d35d3 xfrm: Fix wraparound in xfrm_policy_addr=
_delta())
Merging netfilter/master (664899e85c13 netfilter: nftables: relax check for=
 stateful expressions in set definition)
Merging ipvs/master (44a674d6f798 Merge tag 'mlx5-fixes-2021-01-26' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/saeed/linux)
Merging wireless-drivers/master (93a1d4791c10 mt76: dma: fix a possible mem=
ory leak in mt76_add_fragment())
Merging mac80211/master (b3d2c7b876d4 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/pablo/nf)
Merging rdma-fixes/for-rc (1048ba83fb1c Linux 5.11-rc6)
Merging sound-current/for-linus (4841b8e6318a ALSA: hda/realtek: modify EAP=
D in the ALC886)
Merging sound-asoc-fixes/for-linus (b03549d77628 Merge remote-tracking bran=
ch 'asoc/for-5.11' into asoc-linus)
Merging regmap-fixes/for-linus (19c329f68089 Linux 5.11-rc4)
Merging regulator-fixes/for-linus (1b6c3cc3b388 Merge remote-tracking branc=
h 'regulator/for-5.11' into regulator-linus)
Merging spi-fixes/for-linus (0ea4eb8b1472 Merge remote-tracking branch 'spi=
/for-5.11' into spi-linus)
Merging pci-current/for-linus (7e69d07d7c3c Revert "PCI/ASPM: Save/restore =
L1SS Capability for suspend/resume")
Merging driver-core.current/driver-core-linus (6ee1d745b7c9 Linux 5.11-rc5)
Merging tty.current/tty-linus (6ee1d745b7c9 Linux 5.11-rc5)
Merging usb.current/usb-linus (92bf22614b21 Linux 5.11-rc7)
Merging usb-gadget-fixes/fixes (129aa9734559 usb: raw-gadget: fix memory le=
ak in gadget_setup)
Merging usb-serial-fixes/usb-linus (92bf22614b21 Linux 5.11-rc7)
Merging usb-chipidea-fixes/for-usb-fixes (491b1bea0004 MAINTAINERS: update =
Peter Chen's email address)
Merging phy/fixes (9a8b9434c60f phy: mediatek: Add missing MODULE_DEVICE_TA=
BLE())
Merging staging.current/staging-linus (6ee1d745b7c9 Linux 5.11-rc5)
Merging char-misc.current/char-misc-linus (6ee1d745b7c9 Linux 5.11-rc5)
Merging soundwire-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging thunderbolt-fixes/fixes (92bf22614b21 Linux 5.11-rc7)
Merging input-current/for-linus (9bbd77d5bbc9 Input: xpad - sync supported =
devices with fork on GitHub)
Merging crypto-current/master (4f6543f28bb0 crypto: marvel/cesa - Fix tdma =
descriptor on 64-bit)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (e4eccb853664 vfio/pci: Bypass IGD init in cas=
e of -ENODEV)
Merging kselftest-fixes/fixes (7a6eb7c34a78 selftests: Skip BPF seftests by=
 default)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (b6c14d7a8380 dmaengine dw: Revert "dmaengine=
: dw: Enable runtime PM")
Merging backlight-fixes/for-backlight-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging mtd-fixes/mtd/fixes (b135b3358d73 mtd: rawnand: omap: Use BCH priva=
te fields in the specific OOB layout)
Merging mfd-fixes/for-mfd-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging v4l-dvb-fixes/fixes (ef357e02b6c4 media: rockchip: rkisp1: extend u=
api array sizes)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (7b490a8ab0f2 MIPS: OCTEON: fix unreachable c=
ode in octeon_irq_init_ciu)
Merging at91-fixes/at91-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging omap-fixes/fixes (9bbce32a20d6 ARM: dts: am33xx: add aliases for mm=
c interfaces)
Merging kvm-fixes/master (031b91a5fe6f KVM: x86: Set so called 'reserved CR=
3 bits in LM mask' at vCPU reset)
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (4008bc7d3953 hwmon: (dell-smm) Add XPS 15 L502X =
to fan control blacklist)
Merging nvdimm-fixes/libnvdimm-fixes (7018c897c2f2 libnvdimm/dimm: Avoid ra=
ce between probe and available_slots_show())
Merging btrfs-fixes/next-fixes (8655ef25f7e5 Merge branch 'misc-5.11' into =
next-fixes)
Merging vfs-fixes/fixes (d36a1dd9f77a dump_common_audit_data(): fix racy ac=
cesses to ->d_name)
Merging dma-mapping-fixes/for-linus (d17405d52bac dma-mapping: benchmark: f=
ix kernel crash when dma_map_single fails)
Merging i3c-fixes/i3c/fixes (291b5c9870fc i3c/master/mipi-i3c-hci: Fix posi=
tion of __maybe_unused in i3c_hci_of_match)
Merging drivers-x86-fixes/fixes (215164bfb714 platform/x86: dell-wmi-sysman=
: fix a NULL pointer dereference)
Merging samsung-krzk-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging pinctrl-samsung-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging devicetree-fixes/dt/linus (32ada6b0980d dt-bindings: Cleanup standa=
rd unit properties)
Merging scsi-fixes/fixes (f852c596f2ee scsi: scsi_debug: Fix a memory leak)
Merging drm-fixes/drm-fixes (92bf22614b21 Linux 5.11-rc7)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (2f51312bebb7 drm/i915/tgl+: M=
ake sure TypeC FIA is powered up when initializing it)
Merging mmc-fixes/fixes (d7fb9c242095 mmc: sdhci-pltfm: Fix linking err for=
 sdhci-brcmstb)
Merging rtc-fixes/rtc-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging gnss-fixes/gnss-linus (7c53f6b671f4 Linux 5.11-rc3)
Merging hyperv-fixes/hyperv-fixes (fff7b5e6ee63 x86/hyperv: Initialize cloc=
kevents after LAPIC is initialized)
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (de5f4b8f634b RISC-V: Define MAXPHYSMEM_1GB only=
 for RV32)
Merging pidfd-fixes/fixes (a409ed156a90 Merge tag 'gpio-v5.11-1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio)
Merging fpga-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging spdx/spdx-linus (6ee1d745b7c9 Linux 5.11-rc5)
Merging gpio-brgl-fixes/gpio/for-current (92bf22614b21 Linux 5.11-rc7)
Merging gpio-intel-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging pinctrl-intel-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging erofs-fixes/fixes (a30573b3cdc7 erofs: fix setting up pcluster for =
temporary pages)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (2b8fdbbf1c61 kunit: tool: move kunitconfig=
 parsing into __init__, make it optional)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (17cbe03872be mm/memblock: Fix typo in comment=
 of memblock_phys_alloc_try_nid())
Merging cel-fixes/for-rc (bad4c6eb5eaa SUNRPC: Fix NFS READs that start at =
non-page-aligned offsets)
Merging drm-misc-fixes/for-linux-next-fixes (873e5bb9fbd9 drm/dp_mst: Don't=
 report ports connected if nothing is attached to them)
Merging kspp-gustavo/for-next/kspp (36f9ff9e03de lib: Fix fall-through warn=
ings for Clang)
Merging kbuild/for-next (49362029a00b kbuild: LD_VERSION redenomination)
Merging compiler-attributes/compiler-attributes (19c329f68089 Linux 5.11-rc=
4)
Merging dma-mapping/for-next (fdcd02a641e2 media: uvcvideo: Use dma_alloc_n=
oncontiguos API)
Merging asm-generic/master (38489db09b10 Merge branch 'asm-generic-fixes' i=
nto asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (171db91076f3 Merge branch 'devel-stable' into for-nex=
t)
Merging arm64/for-next/core (9a4ea3c788f3 Merge branches 'for-next/cosmetic=
', 'for-next/crypto', 'for-next/errata', 'for-next/faultaround', 'for-next/=
from-tip/irq/urgent', 'for-next/kexec', 'for-next/misc', 'for-next/mm', 'fo=
r-next/perf', 'for-next/random', 'for-next/rng', 'for-next/selftests', 'for=
-next/stacktrace', 'for-next/topology' and 'for-next/vdso' into for-next/co=
re)
Merging arm-perf/for-next/perf (f0c140481d1b perf: Constify static struct a=
ttribute_group)
Merging arm-soc/for-next (a37e26c27ff0 Merge branch 'arm/drivers' into for-=
next)
CONFLICT (content): Merge conflict in arch/arm/Kconfig.debug
Merging actions/for-next (006828d706fd Merge branch 'v5.12/defconfig' into =
for-next)
Merging amlogic/for-next (9bef1c3d66dd Merge branch 'v5.12/soc' into tmp/am=
l-rebuild)
Merging aspeed/for-next (41707a524026 Merge branches 'soc-for-v5.11' and 'd=
efconfig-for-v5.11' into for-next)
Merging at91/at91-next (aae49663c4b4 Merge branch 'at91-defconfig' into at9=
1-next)
Merging drivers-memory/for-next (5c289c7fae29 Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (7535d59c5f11 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (9d2e21ed98a2 Merge branch 'for_5.12/drivers-soc' int=
o next)
Merging mediatek/for-next (e6468af3b590 Merge branch 'v5.11-next/soc' into =
for-next)
Merging mvebu/for-next (8e03d45cb7de Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (01e73147cbf8 Merge branch 'fixes' into for-next)
Merging qcom/for-next (d79b47c59576 Merge branches 'arm64-defconfig-for-5.1=
2', 'arm64-for-5.12', 'defconfig-for-5.12', 'drivers-for-5.12' and 'dts-for=
-5.12' into for-next)
Merging raspberrypi/for-next (fbdcf1d20126 ARM: dts: bcm2711: Add the CEC i=
nterrupt controller)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (fc6f32116126 Merge branches 'renesas-arm-dt-for-v5.12=
' and 'renesas-drivers-for-v5.12' into renesas-next)
Merging reset/reset/next (d17655759b3f reset: Add devm_reset_control_get_op=
tional_exclusive_released())
Merging rockchip/for-next (38051549ac38 Merge branch 'v5.12-clk/next' into =
for-next)
Merging samsung-krzk/for-next (da2f247fcbf4 Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (61556703b610 Merge tag 'for-linus-5.11-rc7' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/rw/uml)
Merging stm32/stm32-next (a9c92a9671d7 ARM: dts: stm32: add #clock-cells pr=
operty to usbphyc node on stm32mp151)
Merging sunxi/sunxi/for-next (a352e9e72aa3 Merge branch 'sunxi/dt-for-5.12-=
late' into sunxi/for-next)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun8i-reference-des=
ign-tablet.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun8i-r16-parrot.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun8i-r16-bananapi-=
m2m.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun8i-a33-sinlinx-s=
ina33.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun8i-a33-olinuxino=
.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun6i-reference-des=
ign-tablet.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun6i-a31s-yones-to=
ptech-bs1078-v2.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun6i-a31s-sinovoip=
-bpi-m2.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun6i-a31s-sina31s-=
core.dtsi
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun6i-a31s-primo81.=
dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun6i-a31-mele-a100=
0g-quad.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun6i-a31-m9.dts
CONFLICT (content): Merge conflict in arch/arm/boot/dts/sun6i-a31-hummingbi=
rd.dts
Merging tegra/for-next (b62f4a3fbb22 Merge branch for-5.12/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (e37eac10bb5d Merge branch 'ti-k3-dts-next' in=
to ti-k3-next)
Merging clk/clk-next (4a323a5617d4 Merge branch 'clk-imx' into clk-next)
Merging clk-renesas/renesas-clk (24ece96554a9 clk: renesas: cpg-mssr: Fix f=
ormatting issues for 'smstpcr_saved's documentation)
Merging clk-samsung/for-next (44a9e78f9242 clk: samsung: Prevent potential =
endless loop in the PLL ops)
Merging csky/linux-next (9d986b01feb9 csky: use free_initmem_default() in f=
ree_initmem())
Merging h8300/h8300-next (8808515be0ed h8300: Replace <linux/clk-provider.h=
> by <linux/of_clk.h>)
Merging m68k/for-next (c396dd2ec5bb macintosh/adb-iop: Use big-endian autop=
oll mask)
Merging m68knommu/for-next (c1fb1bf64bb6 m68k: let clk_enable() return imme=
diately if clk is NULL)
Merging microblaze/next (57ddf08642f0 microblaze: do not select TRACING_SUP=
PORT directly)
Merging mips/mips-next (ea4a1ea4c8f4 Revert "MIPS: microMIPS: Fix the judgm=
ent of mm_jr16_op and mm_jalr_op")
CONFLICT (content): Merge conflict in .mailmap
Merging nds32/next (54bde873682b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (2261352157a9 Merge remote-tracking branch 'openr=
isc/or1k-5.11-fixes' into or1k-5.12-updates)
Merging parisc-hd/for-next (5680f50cd93c parisc: Replace test_ti_thread_fla=
g() with test_tsk_thread_flag())
Merging powerpc/next (e7eb919057c3 powerpc/64s: Handle program checks in wr=
ong endian during early boot)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e95f287deed2 soc: fsl: handle RCPM errata A-008646 on=
 SoC LS1021A)
Merging risc-v/for-next (36c3d86ac4e7 arch_numa: fix common code printing o=
f phys_addr_t)
CONFLICT (content): Merge conflict in drivers/soc/Makefile
CONFLICT (content): Merge conflict in drivers/soc/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/mm/Makefile
Merging s390/for-next (f6f3e92ad91d Merge branch 'features' into for-next)
Merging sh/for-next (b89bc060b53e sh/intc: Restore devm_ioremap() alignment)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (7f3414226b58 um: time: fix initialization in time-t=
ravel mode)
Merging xtensa/xtensa-for-next (7b79eba1d0d1 xtensa: fix spelling mistake i=
n Kconfig "wont" -> "won't")
Merging pidfd/for-next (f69e8091c4a2 xfs: remove the possibly unused mp var=
iable in xfs_file_compat_ioctl)
CONFLICT (content): Merge conflict in fs/overlayfs/inode.c
CONFLICT (content): Merge conflict in fs/overlayfs/copy_up.c
CONFLICT (content): Merge conflict in fs/ecryptfs/inode.c
Merging fscrypt/master (a14d0b676491 fscrypt: allow deleting files with uns=
upported encryption policy)
Merging fscache/fscache-next (1229f2c6f188 fscache: rectify minor kernel-do=
c issues)
CONFLICT (content): Merge conflict in include/linux/fs.h
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (b819c055721d Merge branch 'for-next-next-v5.11-2021=
0204' into for-next-20210204)
Merging ceph/master (9d5ae6f3c50a libceph: fix "Boolean result is used in b=
itwise operation" warning)
Merging cifs/for-next (abd4af47d3fb cifs: fix dfs-links)
Merging configfs/for-next (65cdb4a214c0 configfs: fix kernel-doc markup iss=
ue)
Merging ecryptfs/next (902af369942f ecryptfs: use DEFINE_MUTEX() for mutex =
lock)
Merging erofs/dev (d8b3df8b1048 erofs: avoid using generic_block_bmap)
Merging exfat/dev (61dd9f0b09e0 exfat: improve performance of exfat_free_cl=
uster when using dirsync mount option)
Merging ext3/for_next (c5b8ccc3da76 Pull udf & isofs UID/GID parsing fixes.)
Merging ext4/dev (b5776e7524af ext4: fix potential htree index checksum cor=
ruption)
Merging f2fs/dev (d50dfc0c7df7 f2fs: don't grab superblock freeze for flush=
/ckpt thread)
CONFLICT (content): Merge conflict in fs/f2fs/file.c
CONFLICT (content): Merge conflict in fs/f2fs/acl.c
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (5d069dbe8aaf fuse: fix bad inode)
Merging jfs/jfs-next (093e0687c5ba jfs: turn diLog(), dataLog() and txLog()=
 into void functions)
Merging nfs/linux-next (92bf22614b21 Linux 5.11-rc7)
Merging nfs-anna/linux-next (848fdd62399c NFS: Don't set NFS_INO_INVALID_XA=
TTR if there is no xattr cache)
Merging nfsd/nfsd-next (c3213d260a23 SUNRPC: Fix oops in the rpc_xdr_buf ev=
ent class)
Merging cel/for-next (428a23d2bf0c nfsd: skip some unnecessary stats in the=
 v4 case)
Merging orangefs/for-next (c1048828c3db orangefs: add splice file operation=
s)
Merging overlayfs/overlayfs-next (d46b7cd68336 ovl: plumb through flush met=
hod)
Merging ubifs/next (b80a974b8c58 ubifs: ubifs_dump_node: Dump all branches =
of the index node)
Merging v9fs/9p-next (324a158fe535 fs: 9p: add generic splice_write file op=
eration)
Merging xfs/for-next (8e8794b91988 xfs: fix rst syntax error in admin guide)
CONFLICT (content): Merge conflict in fs/xfs/xfs_ioctl.c
CONFLICT (content): Merge conflict in fs/xfs/xfs_inode.c
Merging zonefs/for-next (6716b125b339 zonefs: add tracepoints for file oper=
ations)
Merging iomap/iomap-for-next (ed1128c2d0c8 xfs: reduce exclusive locking on=
 unaligned dio)
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (cc4a3f885e8f fcntl: make F_GETOWN(EX) return=
 0 on dead owner task)
Merging vfs/for-next (f012556f37ff Merge branch 'work.sendfile' into for-ne=
xt)
CONFLICT (content): Merge conflict in fs/namei.c
CONFLICT (content): Merge conflict in fs/coredump.c
CONFLICT (content): Merge conflict in arch/Kconfig
Merging printk/for-next (fdaae9394da4 Merge branch 'printk-rework' into for=
-next)
Merging pci/next (ed3a5d46747a Merge branch 'remotes/lorenzo/pci/misc')
Merging pstore/for-next/pstore (26fecbf7602d pstore: Move kmsg_bytes defaul=
t into Kconfig)
Merging hid/for-next (d1c956c7c95f Merge branch 'for-5.11/upstream-fixes' i=
nto for-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging i2c/i2c/for-next (77363f8520dc Merge branch 'i2c/for-5.12' into i2c=
/for-next)
Merging i3c/i3c/next (5c34b8e7e8bb i3c: master: dw: Drop redundant disec ca=
ll)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (996dc09c8e77 hwmon: (pmbus/max31785) Supp=
ort revision "B")
Merging jc_docs/docs-next (1e013ff7cb54 docs: Document cross-referencing us=
ing relative path)
Merging v4l-dvb/master (7f03d9fefcc5 media: i2c: Kconfig: Make MAX9271 a mo=
dule)
$ git reset --hard HEAD^
Merging next-20210209 version of v4l-dvb
Merging v4l-dvb-next/master (d0a9fffedca1 docs: fs: api-summary.rst: get ri=
d of kernel-doc include)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_dp_helper.c
CONFLICT (content): Merge conflict in Documentation/dev-tools/kasan.rst
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (32890f947002 Merge branch 'pm-devfreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (7114ebffd330 cpufreq: remove ta=
ngo driver)
Merging cpupower/cpupower (3a3ecfdb605c cpupower: Add cpuid cap flag for MS=
R_AMD_HWCR support)
Merging devfreq/devfreq-next (fc1745c0e40c PM / devfreq: rk3399_dmc: Remove=
 unneeded semicolon)
Merging opp/opp/linux-next (86ad9a24f21e PM / devfreq: Add required OPPs su=
pport to passive governor)
Merging thermal/thermal/linux-next (7a583405f24b thermal: power allocator: =
fail binding for non-power actor devices)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (4f19d071f9be fs: dlm: check on existing node address)
Merging swiotlb/linux-next (e998879d4fb7 x86,swiotlb: Adjust SWIOTLB bounce=
 buffer size for SEV guests)
Merging rdma/for-next (a14e3caaaa72 RDMA/qedr: Remove in_irq() usage from d=
ebug output)
CONFLICT (content): Merge conflict in drivers/infiniband/sw/rxe/rxe_net.c
Merging net-next/master (74784ee0b935 Merge branch '100GbE' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/tnguy/next-queue)
Merging bpf-next/for-next (ee5cc0363ea0 Merge branch 'kbuild/resolve_btfids=
: Invoke resolve_btfids')
CONFLICT (content): Merge conflict in net/ipv4/tcp.c
Merging ipsec-next/master (4ac7a6eecbec xfrm: Return the correct errno code)
Merging mlx5-next/mlx5-next (ab0da5a57188 net/mlx5: Expose ifc bits for que=
ry modify header)
Merging netfilter-next/master (fc1a8db3d560 Merge branch 'master' of git://=
git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-next)
Merging ipvs-next/master (a61e4b60761f Merge branch 'net-dsa-hellcreek-add-=
taprio-offloading')
Merging wireless-drivers-next/master (7dd56ea45a66 brcmfmac: add support fo=
r CQM RSSI notifications)
Merging bluetooth/master (55c0bd77479b Bluetooth: hci_qca: Fixed issue duri=
ng suspend)
Merging mac80211-next/master (4d469ec8ec05 Merge branch '1GbE' of git://git=
.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue)
Merging gfs2/for-next (866eef48d802 gfs2: Add trusted xattr support)
Merging mtd/mtd/next (106a3ec368fd mtd: st_spi_fsm: convert comma to semico=
lon)
Merging nand/nand/next (073abfa7ea9a mtd: rawnand: intel: Fix an error hand=
ling path in 'ebu_dma_start()')
Merging spi-nor/spi-nor/next (75386810d3a6 mtd: spi-nor: sst: Add support f=
or Global Unlock on sst26vf)
Merging crypto/master (63b8ee4f548c crypto: crypto4xx - Avoid linking failu=
re with HW_RANDOM=3Dm)
Merging drm/drm-next (4c3a3292730c drm/amd/display: fix unused variable war=
ning)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_breadcr=
umbs.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/gen7_rendercl=
ear.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dp=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_di=
splay.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dd=
i.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu11/si=
enna_cichlid_ppt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu11/na=
vi10_ppt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu11/ar=
cturus_ppt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/amdgpu_s=
mu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/inc/smu_v11_0.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/inc/amdgpu_smu=
.h
Merging drm-misc/for-linux-next (4b8878eefa0a drm/dp_mst: Don't cache EDIDs=
 for physical ports)
$ git reset --hard HEAD^
Merging next-20210209 version of drm-misc
CONFLICT (content): Merge conflict in drivers/gpu/drm/ttm/ttm_pool.c
[master 0993670f45e2] next-20210209/drm-misc
Merging amdgpu/drm-next (ebeff894af66 drm/amdgpu: enable DPM_FLAG_MAY_SKIP_=
RESUME and DPM_FLAG_SMART_SUSPEND flags (v2))
Merging drm-intel/for-linux-next (7a6c6243b44a drm/i915: Reject 446-480MHz =
HDMI clock on GLK)
Merging drm-tegra/drm/tegra/for-next (dcdfe2712b68 drm/tegra: Fix reference=
 leak when pm_runtime_get_sync() fails)
Merging drm-msm/msm-next (182b4a2d2513 drm/msm/dp: Add a missing semi-colon)
Merging imx-drm/imx-drm/next (82581fcf070b drm/modes: add non-OF stub for o=
f_get_drm_display_mode)
Merging etnaviv/etnaviv/next (7d614ab2f205 drm/etnaviv: fix NULL check befo=
re some freeing functions is not needed)
Merging regmap/for-next (aa3233086b48 Merge remote-tracking branch 'regmap/=
for-5.12' into regmap-next)
Merging sound/for-next (5427c7d6296e ALSA: hda: intel-dsp-config: Add SND_I=
NTEL_BYT_PREFER_SOF Kconfig option)
Merging sound-asoc/for-next (ec33d9f6eb54 Merge remote-tracking branch 'aso=
c/for-5.12' into asoc-next)
Merging modules/modules-next (367948220fce module: remove EXPORT_UNUSED_SYM=
BOL*)
Applying: Revert "module: remove EXPORT_UNUSED_SYMBOL*"
Merging input/next (7a6a53b2b1a3 Input: iqs5xx - initialize an uninitialize=
d variable)
Merging block/for-next (00a5f7d51236 Merge branch 'for-5.12/io_uring' into =
for-next)
CONFLICT (content): Merge conflict in lib/iov_iter.c
CONFLICT (content): Merge conflict in fs/iomap/direct-io.c
CONFLICT (content): Merge conflict in Documentation/filesystems/porting.rst
Applying: block: bio: fix up for bi_disk removal
Applying: block: btrfs: another fix up for bi_disk removal
Merging device-mapper/for-next (d9928ac5eba5 dm writecache: use bdev_nr_sec=
tors() instead of open-coded equivalent)
Merging pcmcia/pcmcia-next (4ce6b242b78d pcmcia: Switch to using the new AP=
I kobj_to_dev())
Merging mmc/next (0c1a3e8b2e98 mmc: wbsd: Use new tasklet API)
Merging mfd/for-mfd-next (26783d74cc6a mfd: wm831x-auxadc: Prevent use afte=
r free in wm831x_auxadc_read_irq())
Merging backlight/for-backlight-next (4a98e5ef88f8 backlight: sky81452-back=
light: Convert comma to semicolon)
Merging battery/for-next (a72acc56f3e9 power-supply: use kobj_to_dev())
Merging regulator/for-next (8159774c7fc9 Merge remote-tracking branch 'regu=
lator/for-5.12' into regulator-next)
Merging security/next-testing (9dcd47fc1f7d Merge branch 'fixes-v5.10' into=
 next-testing)
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (96acc833dec8 ima: Free IMA measurement bu=
ffer after kexec syscall)
CONFLICT (content): Merge conflict in security/integrity/ima/ima_policy.c
CONFLICT (content): Merge conflict in security/integrity/ima/ima_main.c
CONFLICT (content): Merge conflict in security/integrity/ima/ima_api.c
Merging keys/keys-next (5bcd72358a7d Merge branch 'keys-cve-2020-26541' int=
o keys-next)
Merging safesetid/safesetid-next (03ca0ec13892 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (365982aba1f2 fs: anon_inodes: rephrase to appropriate=
 kernel-doc)
Merging smack/next (7ef4c19d245f smackfs: restrict bytes count in smackfs w=
rite functions)
Merging tomoyo/master (f1bdf414e7dd usb: usbip: vhci_hcd: add printk() for =
debug)
Merging tpmdd/next (5cb9c551cb13 tpm_tis: Clean up locality release)
Merging watchdog/master (a4f3407c4160 watchdog: qcom: Remove incorrect usag=
e of QCOM_WDT_ENABLE_IRQ)
Merging iommu/next (1a4a1b1a5926 Merge branches 'arm/renesas', 'arm/smmu', =
'x86/amd', 'x86/vt-d' and 'core' into next)
Merging audit/next (127c8c5f0589 audit: Make audit_filter_syscall() return =
void)
Merging devicetree/for-next (eb90b4f8fb8b Merge branch 'dt/dtc-sync' into d=
t/next)
CONFLICT (content): Merge conflict in scripts/Makefile.lib
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/net=
/ti,k3-am654-cpsw-nuss.yaml
Merging mailbox/mailbox-for-next (5a6338cce9f4 mailbox: arm_mhuv2: Add driv=
er)
Merging spi/for-next (1615a9ef6bf5 Merge remote-tracking branch 'spi/for-5.=
12' into spi-next)
Merging tip/auto-latest (a7e0bdf1b07e Merge branch 'irq/urgent')
Applying: Revert "sched/topology: Make sched_init_numa() use a set for the =
deduplicating sort"
Merging clockevents/timers/drivers/next (8ae954caf49a clocksource/drivers/s=
h_cmt: Fix potential deadlock when calling runtime PM)
Merging edac/edac-for-next (faf042d15093 Merge branch 'edac-amd64' into eda=
c-for-next)
Merging irqchip/irq/irqchip-next (c1f664d2400e irqchip/loongson-pch-msi: Us=
e bitmap_zalloc() to allocate bitmap)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/int=
errupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
Merging ftrace/for-next (4b9091e1c194 kernel: trace: preemptirq_delay_test:=
 add cpu affinity)
Merging rcu/rcu/next (8e6a68bd0202 torture: Allow 1G of memory for torture.=
sh kvfree testing)
Merging kvm/next (9294b8a12585 Documentation: kvm: fix warning)
CONFLICT (content): Merge conflict in arch/x86/kvm/x86.c
Merging kvm-arm/next (c102ea4351a5 Merge branch 'kvm-arm64/pmu-debug-fixes-=
5.11' into kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (dc924b062488 KVM: SVM: check CR4 changes agai=
nst vcpu->arch)
Merging kvms390/next (50a05be484cb KVM: s390: track synchronous pfault even=
ts in kvm_stat)
Merging xen-tip/linux-next (2e92493637a0 x86/xen: avoid warning in Xen pv g=
uest with CONFIG_AMD_MEM_ENCRYPT enabled)
Merging percpu/for-next (7dd3050a0194 Merge branch 'for-5.12' into for-next)
Merging workqueues/for-next (e9ad2eb3d9ae workqueue: Use %s instead of func=
tion name)
Merging drivers-x86/for-next (e310cbf31977 Merge remote-tracking branch 'in=
tel-speed-select/intel-sst' into review-hans)
CONFLICT (content): Merge conflict in drivers/platform/x86/ideapad-laptop.c
CONFLICT (modify/delete): drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c delete=
d in HEAD and modified in drivers-x86/for-next. Version drivers-x86/for-nex=
t of drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c left in tree.
CONFLICT (modify/delete): drivers/gpu/drm/gma500/mdfld_output.c deleted in =
HEAD and modified in drivers-x86/for-next. Version drivers-x86/for-next of =
drivers/gpu/drm/gma500/mdfld_output.c left in tree.
CONFLICT (modify/delete): drivers/gpu/drm/gma500/mdfld_dsi_output.c deleted=
 in HEAD and modified in drivers-x86/for-next. Version drivers-x86/for-next=
 of drivers/gpu/drm/gma500/mdfld_dsi_output.c left in tree.
CONFLICT (modify/delete): drivers/gpu/drm/gma500/mdfld_device.c deleted in =
HEAD and modified in drivers-x86/for-next. Version drivers-x86/for-next of =
drivers/gpu/drm/gma500/mdfld_device.c left in tree.
CONFLICT (content): Merge conflict in drivers/gpu/drm/gma500/Kconfig
$ git rm -f drivers/gpu/drm/gma500/mdfld_device.c drivers/gpu/drm/gma500/md=
fld_dsi_output.c drivers/gpu/drm/gma500/mdfld_output.c drivers/gpu/drm/gma5=
00/tc35876x-dsi-lvds.c
Merging chrome-platform/for-next (b4b06c977295 platform/chrome: cros_ec_typ=
es: Support disconnect events without partners)
Merging hsi/for-next (aa57e77b3d28 HSI: Fix PM usage counter unbalance in s=
si_hw_init)
Merging leds/for-next (d86464527681 leds: gpio: Set max brightness to 1)
Merging ipmi/for-next (fc26067c7417 ipmi: remove open coded version of SMBu=
s block write)
Merging driver-core/driver-core-next (3c9ea42802a1 clk: Mark fwnodes when t=
heir clock provider is added/removed)
Merging usb/usb-next (0a25669ba8a2 Merge tag 'thunderbolt-for-v5.12-rc1' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb=
-next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/usb=
/qcom,dwc3.yaml
Merging usb-gadget/next (b2c586eb07ef usb: dwc2: Fix INTR OUT transfers in =
DDMA mode.)
Merging usb-serial/usb-next (1542d1324be1 USB: serial: drop bogus to_usb_se=
rial_port() checks)
Merging usb-chipidea-next/for-usb-next (1ee18ded86ec usb: cdnsp: Removes so=
me useless trace events)
Merging tty/tty-next (a157270fbf37 serial: core: Remove BUG_ON(in_interrupt=
()) check)
CONFLICT (content): Merge conflict in include/linux/tty.h
Merging char-misc/char-misc-next (0566752c3e86 uapi: map_to_7segment: Updat=
e example in documentation)
CONFLICT (content): Merge conflict in scripts/mod/file2alias.c
CONFLICT (content): Merge conflict in scripts/mod/devicetable-offsets.c
CONFLICT (content): Merge conflict in include/linux/mod_devicetable.h
CONFLICT (modify/delete): drivers/tty/n_tracesink.c deleted in char-misc/ch=
ar-misc-next and modified in HEAD. Version HEAD of drivers/tty/n_tracesink.=
c left in tree.
CONFLICT (modify/delete): drivers/tty/n_tracerouter.c deleted in char-misc/=
char-misc-next and modified in HEAD. Version HEAD of drivers/tty/n_tracerou=
ter.c left in tree.
$ git rm -f drivers/tty/n_tracerouter.c drivers/tty/n_tracesink.c
Merging extcon/extcon-next (bd30a35764e1 extcon: sm5502: Detect OTG when US=
B_ID is connected to ground)
Merging phy-next/next (d68f2cb09597 phy: cpcap-usb: Simplify bool conversio=
n)
Merging soundwire/next (6d7a1ff71cbb soundwire: bus: clarify dev_err/dbg de=
vice references)
Merging thunderbolt/next (c6da62a219d0 thunderbolt: Add support for native =
USB4 _OSC)
Merging vfio/next (76adb20f924f Merge branch 'v5.12/vfio/next-vaddr' into v=
5.12/vfio/next)
Merging staging/staging-next (6953026f2109 staging: rtl8712: Remove multipl=
e blank lines)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (6715ea06ced4 Merge branch 'icc-sdx55' into icc-next)
Merging dmaengine/next (eda38ce482b2 dmaengine: dw-axi-dmac: remove redunda=
nt null check on desc)
Merging cgroup/for-next (00bfa16052cd Merge branch 'for-5.11-fixes' into fo=
r-next)
Merging scsi/for-next (307e69053eb3 Merge branch 'misc' into for-next)
CONFLICT (modify/delete): drivers/scsi/gdth.c deleted in scsi/for-next and =
modified in HEAD. Version HEAD of drivers/scsi/gdth.c left in tree.
$ git rm -f drivers/scsi/gdth.c
Merging scsi-mkp/for-next (d39bfd0686fd scsi: iscsi: Drop session lock in i=
scsi_session_chkready())
Merging vhost/linux-next (590874fffa4e virtio_net: Fix fall-through warning=
s for Clang)
Merging rpmsg/for-next (d9ff3a5789cb Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (04d5e3bf0aa7 gpio: gpio-xilinx: Add check =
if width exceeds 32)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/toshiba/tmpv7708-=
rm-mbrc.dts
Merging gpio-intel/for-next (c5318e248f52 gpio: msic: Drop driver from Make=
file)
Merging pinctrl/for-next (d3e0c0572caf Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0e793a4e2834 pinctrl: tigerlake: Add Alder =
Lake-P ACPI ID)
Merging pinctrl-renesas/renesas-pinctrl (a5cda861ed57 pinctrl: renesas: r8a=
779a0: Add TPU pins, groups and functions)
Merging pinctrl-samsung/for-next (5c8fe583cce5 Linux 5.11-rc1)
Merging pwm/for-next (a2bc9b21fd3f pwm: Remove ZTE ZX driver)
Merging userns/for-next (95ebabde382c capabilities: Don't allow writing amb=
iguous v3 file capabilities)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (e0c0840a46db selftests/seccomp: Accept any valid fd=
 in user_notification_addfd)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (81840f21d416 Merge branch 'for-5.12/doc' int=
o for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (7d6bec2868f6 rtc: s3c: quiet maybe-unused variable wa=
rning)
Merging nvdimm/libnvdimm-for-next (127c3d2e7e8a Merge branch 'for-5.11/dax'=
 into for-5.11/libnvdimm)
Merging at24/at24/for-next (5366c48f327e dt-bindings: eeprom: at24: Documen=
t ROHM BR24G01)
Merging ntb/ntb-next (5c8fe583cce5 Linux 5.11-rc1)
Merging seccomp/for-next/seccomp (2c07343abd89 selftests/seccomp: Update ke=
rnel config)
Merging kspp/for-next/kspp (112b6a8e038d arm64: allow LTO to be selected)
CONFLICT (content): Merge conflict in include/asm-generic/vmlinux.lds.h
Merging gnss/gnss-next (45d5996e034c gnss: drop stray semicolons)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (0320ed0a8236 drivers: slimbus: Fix word resposibl=
e -> responsible in slimbus.h)
CONFLICT (content): Merge conflict in drivers/nvmem/Kconfig
Merging nvmem/for-next (667fbb3fcde1 nvmem: qcom-spmi-sdam: Fix uninitializ=
ed pdev pointer)
Merging xarray/main (80c1dbebf308 XArray: Fix splitting to non-zero orders)
Merging hyperv/hyperv-next (9c9e1c68259d iommu/hyperv: setup an IO-APIC IRQ=
 remapping domain for root partition)
Merging auxdisplay/auxdisplay (b45616445a6e auxdisplay: Fix duplicate CHARL=
CD config symbol)
Merging kgdb/kgdb/for-next (93f7a6d818de kdb: Make memory allocations more =
robust)
Merging hmm/hmm (3650b228f83a Linux 5.10-rc1)
Merging fpga/for-next (e41d4c011706 fpga: dfl: fme: Constify static attribu=
te_group structs)
Merging kunit/test (e71ba9452f0b Linux 5.11-rc2)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (5de15b610f78 mtd: hyperbus: add Renesas RPC-IF driver)
Merging kunit-next/kunit (7af29141a31a kunit: tool: fix unintentional state=
fulness in run_kernel())
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (026c5b1ec29c bus: mhi: pci_generic: Increase num of e=
lements in hw event ring)
Merging memblock/for-next (097d43d85704 mm: memblock: remove return value o=
f memblock_free_all())
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging iomem-mmap-vs-gup/topic/iomem-mmap-vs-gup (74b30195395c sysfs: Supp=
ort zapping of binary attr mmaps)
Applying: mm: fixup for follow_pte() API change
Merging oprofile-removal/oprofile/removal (be65de6b03aa fs: Remove dcookies=
 support)
Applying: linux-next: build failure after merge of the powerpc tree
Applying: of: irq: make a stub for of_irq_parse_one()
Merging akpm-current/current (2d512dbe38ed initramfs-panic-with-memory-info=
rmation-fix)
CONFLICT (content): Merge conflict in include/linux/pagemap.h
CONFLICT (content): Merge conflict in fs/hugetlbfs/inode.c
CONFLICT (content): Merge conflict in fs/btrfs/file.c
Applying: fs/ramfs/inode.c: update inode_operations.tmpfile
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (18bff6d82bfa MIPS: make userspace mapping young by def=
ault)

--Sig_/_7.x4Pe/pBGhDDp0wi_+dTr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAjxpwACgkQAVBC80lX
0Gw5qAf/dahPpQykx4RiwLXdzZYG4e9+wLhWVf7wAQbrWVvufZ+RqyHXeXdeSSt5
Fm0Tbr3WKporJLt8e7C/oC4ut5GGfyfbqDXVdzSh/CWE5clB1aEA5EMo9+DxdbP3
XZCgCqxyUKZyktIs+ILpDKXkveWdLAIOk2wQyV/zwp6Y98t9wLLI/wRfoLTv4rXa
xwTWymYiy3DUgZmSAPDzCQP6B2Zk0fnY5MbkZ7MpBcFKNVe8FXsb9f879do6RKv0
wgnHZTiZjcmf/e3GIXPx0CRczRP3+qFSRM/2JT11aFpFbBMY/5Nnu96k5teSyx6x
g2rgOnhUdBW2RxhwsA1hMdEGyH+wXw==
=vgPG
-----END PGP SIGNATURE-----

--Sig_/_7.x4Pe/pBGhDDp0wi_+dTr--
