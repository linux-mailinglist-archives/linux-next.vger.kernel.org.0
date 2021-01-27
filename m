Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88420305E8E
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 15:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234391AbhA0OpX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 09:45:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234539AbhA0OpE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Jan 2021 09:45:04 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68FC0C061574;
        Wed, 27 Jan 2021 06:44:23 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQmZq6FT2z9sSs;
        Thu, 28 Jan 2021 01:44:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611758659;
        bh=4jow5lWnd74krtDhQ7yPukGVJjYUjauwsieiw9BnErQ=;
        h=Date:From:To:Cc:Subject:From;
        b=jZDo4li+BW8fBPO0yrKwcbVEzrNhC+uLyxmvglhNjG9JOmFMiSUhvqlbUWw6Ru+Lu
         KkK6rwNnq9J3oCuMcfscWfrZz+MVpREe/lxfF88iOihZYY2JmJbOsv424g+k/HjIp9
         NvvzP7rBdQ9Mz3g5JkvN1MFWzELjXuPVXzOHH7sFrEoZVIPZJl0IjbAewVycnV0x3m
         Elop299OO3SS75WaLQWy78PEVfSHKQzXbxLVXU8COZxxzFjFidT5Gs65xYW2uRKu+8
         0DtYLve9Nbu65ZeZ3g9SO4pTE0REU7t6M9qnZkdba0VwEfjqh4AcN0zAOWNsn6R81S
         HoLMc4TQ9/FvQ==
Date:   Thu, 28 Jan 2021 01:44:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 27
Message-ID: <20210128014419.55ea9ae4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZMMdIp7N+UD6Rg5aN6xldSG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZMMdIp7N+UD6Rg5aN6xldSG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Note: the patch file has failed to upload :-(

Changes since 20210125:

New tree: fscache

The fscache tree gained a conflict against the pidfd tree.

The ecryptfs tree gained a conflict against the pidfd tree.

The block tree gained conflicts against the vfs and fscache trees.

The integrity tree gained conflicts against the pidfd tree.

The kvm-arm tree gained a conflict against the arm64 tree.

The scsi-mkp tree gained a conflict against the block tree and it still
had its build failure, so I used the version from next-20210122.

The pinctrl tree gained a build failure so I used the version from
next-20210125.

The notifications tree gained conflicts against the pidfd tree.  They were
complex and it was late, so I dropped the notifications tree for today.

The akpm-current tree gained conflicts against the btrfs, pidfd and
fscache trees.

Non-merge commits (relative to Linus' tree): 5855
 6684 files changed, 242693 insertions(+), 169050 deletions(-)

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

I am currently merging 334 trees (counting Linus' and 86 trees of bug
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
Merging origin/master (4992eb41ab1b Merge tag 'for-linus' of git://git.kern=
el.org/pub/scm/virt/kvm/kvm)
Merging fixes/fixes (e71ba9452f0b Linux 5.11-rc2)
Merging kbuild-current/fixes (cf81c3abe1b8 kconfig: mconf: fix HOSTCC call)
Merging arc-current/for-curr (7c53f6b671f4 Linux 5.11-rc3)
Merging arm-current/fixes (e64ab473ddda ARM: 9034/1: __div64_32(): straight=
en up inline asm constraints)
Merging arm64-fixes/for-next/fixes (75bd4bff300b arm64: kprobes: Fix Uexpec=
ted kernel BRK exception at EL1)
Merging arm-soc-fixes/arm/fixes (e49c24c8cd00 Merge tag 'imx-fixes-5.11-2' =
of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fi=
xes)
Merging drivers-memory-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging m68k-current/for-linus (2ae92e8b9b7e MAINTAINERS: Update m68k Mac e=
ntry)
Merging powerpc-fixes/fixes (08685be7761d powerpc/64s: fix scv entry fallba=
ck flush vs interrupt)
Merging s390-fixes/fixes (19c329f68089 Linux 5.11-rc4)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (07d46d93c9ac uapi: fix big endian definition of ipv6_rp=
l_sr_hdr)
Merging bpf/master (78031381ae9c bpf: Drop disabled LSM hooks from the slee=
pable set)
Merging ipsec/master (da64ae2d35d3 xfrm: Fix wraparound in xfrm_policy_addr=
_delta())
Merging netfilter/master (ce5379963b28 netfilter: nft_dynset: dump expressi=
ons when set definition contains no expressions)
Merging ipvs/master (c8a8ead01736 Merge git://git.kernel.org/pub/scm/linux/=
kernel/git/pablo/nf)
Merging wireless-drivers/master (0acb20a5438c mt7601u: fix kernel crash unp=
lugging the device)
Merging mac80211/master (81f153faacd0 staging: rtl8723bs: fix wireless regu=
latory API misuse)
Merging rdma-fixes/for-rc (f1b0a8ea9f12 Revert "RDMA/rxe: Remove VLAN code =
leftovers from RXE")
Merging sound-current/for-linus (4961167bf748 ALSA: hda/via: Apply the work=
around generically for Clevo machines)
Merging sound-asoc-fixes/for-linus (e986cb46e939 Merge remote-tracking bran=
ch 'asoc/for-5.11' into asoc-linus)
Merging regmap-fixes/for-linus (19c329f68089 Linux 5.11-rc4)
Merging regulator-fixes/for-linus (a3def2460583 Merge remote-tracking branc=
h 'regulator/for-5.11' into regulator-linus)
Merging spi-fixes/for-linus (9e263ad50884 Merge remote-tracking branch 'spi=
/for-5.11' into spi-linus)
Merging pci-current/for-linus (7c53f6b671f4 Linux 5.11-rc3)
Merging driver-core.current/driver-core-linus (6ee1d745b7c9 Linux 5.11-rc5)
Merging tty.current/tty-linus (6ee1d745b7c9 Linux 5.11-rc5)
Merging usb.current/usb-linus (1d69f9d901ef usb: xhci-mtk: fix unreleased b=
andwidth data)
Merging usb-gadget-fixes/fixes (129aa9734559 usb: raw-gadget: fix memory le=
ak in gadget_setup)
Merging usb-serial-fixes/usb-linus (3c4f6ecd9344 USB: serial: cp210x: add p=
id/vid for WSDA-200-USB)
Merging usb-chipidea-fixes/for-usb-fixes (491b1bea0004 MAINTAINERS: update =
Peter Chen's email address)
Merging phy/fixes (36acd5e24e30 phy: lantiq: rcu-usb2: wait after clock ena=
ble)
Merging staging.current/staging-linus (6ee1d745b7c9 Linux 5.11-rc5)
Merging char-misc.current/char-misc-linus (6ee1d745b7c9 Linux 5.11-rc5)
Merging soundwire-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging thunderbolt-fixes/fixes (6ee1d745b7c9 Linux 5.11-rc5)
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
Merging dmaengine-fixes/fixes (fed1b6a00a19 dmaengine: ti: k3-udma: Fix a r=
esource leak in an error handling path)
Merging backlight-fixes/for-backlight-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging mtd-fixes/mtd/fixes (b135b3358d73 mtd: rawnand: omap: Use BCH priva=
te fields in the specific OOB layout)
Merging mfd-fixes/for-mfd-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging v4l-dvb-fixes/fixes (e081863ab48d media: hantro: Fix reset_raw_fmt =
initialization)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (7b490a8ab0f2 MIPS: OCTEON: fix unreachable c=
ode in octeon_irq_init_ciu)
Merging at91-fixes/at91-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging omap-fixes/fixes (177d8f1f7f47 ARM: dts: omap4-droid4: Fix lost key=
pad slide interrupts for droid4)
Merging kvm-fixes/master (aed89418de9a KVM: x86: Revert "KVM: x86: Mark GPR=
s dirty when written")
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (f6aed68e8a2a hwmon: (ina2) update ti,ina2xx.yaml=
 reference in documentation)
Merging nvdimm-fixes/libnvdimm-fixes (88b67edd7247 dax: Fix compilation for=
 CONFIG_DAX && !CONFIG_FS_DAX)
Merging btrfs-fixes/next-fixes (8655ef25f7e5 Merge branch 'misc-5.11' into =
next-fixes)
Merging vfs-fixes/fixes (d36a1dd9f77a dump_common_audit_data(): fix racy ac=
cesses to ->d_name)
Merging dma-mapping-fixes/for-linus (892fc9f6835e dma-pool: Fix an uninitia=
lized variable bug in atomic_pool_expand())
Merging i3c-fixes/i3c/fixes (291b5c9870fc i3c/master/mipi-i3c-hci: Fix posi=
tion of __maybe_unused in i3c_hci_of_match)
Merging drivers-x86-fixes/fixes (67fbe02a5ceb platform/x86: hp-wmi: Disable=
 tablet-mode reporting by default)
Merging samsung-krzk-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging pinctrl-samsung-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging devicetree-fixes/dt/linus (453b67417832 dt-bindings: usb: j721e: ad=
d ranges and dma-coherent props)
Merging scsi-fixes/fixes (aa2c24e7f415 scsi: qla2xxx: Fix description for p=
arameter ql2xenforce_iocb_limit)
Merging drm-fixes/drm-fixes (06ee38dc2aab Merge tag 'amd-drm-fixes-5.11-202=
1-01-21' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (489140b5ba2e drm/i915/gt: Alw=
ays try to reserve GGTT address 0x0)
Merging mmc-fixes/fixes (1bebdd0c6529 mmc: sdhci-pltfm: Fix linking err for=
 sdhci-brcmstb)
Merging rtc-fixes/rtc-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging gnss-fixes/gnss-linus (7c53f6b671f4 Linux 5.11-rc3)
Merging hyperv-fixes/hyperv-fixes (fff7b5e6ee63 x86/hyperv: Initialize cloc=
kevents after LAPIC is initialized)
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (336e8eb2a3cf riscv: Fixup pfn_valid error with =
wrong max_mapnr)
Merging pidfd-fixes/fixes (a409ed156a90 Merge tag 'gpio-v5.11-1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio)
Merging fpga-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging spdx/spdx-linus (6ee1d745b7c9 Linux 5.11-rc5)
Merging gpio-brgl-fixes/gpio/for-current (6ee1d745b7c9 Linux 5.11-rc5)
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
Merging drm-misc-fixes/for-linux-next-fixes (f6b57101a6b3 drm/vc4: Correct =
POS1_SCL for hvs5)
Merging kspp-gustavo/for-next/kspp (36f9ff9e03de lib: Fix fall-through warn=
ings for Clang)
Merging kbuild/for-next (537896fabed1 kbuild: give the SUBLEVEL more room i=
n KERNEL_VERSION)
Merging compiler-attributes/compiler-attributes (196793946264 Compiler Attr=
ibutes: remove CONFIG_ENABLE_MUST_CHECK)
Merging dma-mapping/for-next (f726c72d6c05 dma-mapping: benchmark: check th=
e validity of dma mask bits)
Merging asm-generic/master (38489db09b10 Merge branch 'asm-generic-fixes' i=
nto asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (ecbbb88727ae Merge branch 'devel-stable' into for-nex=
t)
Merging arm64/for-next/core (3c50969f0be2 Merge branches 'for-next/from-tip=
/irq/urgent', 'for-next/misc', 'for-next/perf', 'for-next/random', 'for-nex=
t/rng', 'for-next/selftests', 'for-next/stacktrace', 'for-next/topology' an=
d 'for-next/vdso' into for-next/core)
Merging arm-perf/for-next/perf (f0c140481d1b perf: Constify static struct a=
ttribute_group)
Merging arm-soc/for-next (011238c3b942 soc: document merges)
Merging actions/for-next (a501abf8d8cb Merge branch 'v5.12/soc' into for-ne=
xt)
Merging amlogic/for-next (4bba12b1b0ed Merge branch 'v5.12/soc' into tmp/am=
l-rebuild)
Merging aspeed/for-next (41707a524026 Merge branches 'soc-for-v5.11' and 'd=
efconfig-for-v5.11' into for-next)
Merging at91/at91-next (bcd7e8ebb203 Merge branch 'at91-soc' into at91-next)
CONFLICT (content): Merge conflict in drivers/soc/atmel/soc.c
Merging drivers-memory/for-next (03bdd20e94ef Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (5df5ec0e41f3 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (c3f9aaca29c0 Merge branch 'for_5.12/drivers-soc' int=
o next)
Merging mediatek/for-next (727bfb2c55b0 Merge branch 'v5.10-next/soc' into =
for-next)
Merging mvebu/for-next (dc14300bb67b Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (43d80d4cbd96 Merge branch 'omap-for-v5.12/soc' into =
for-next)
Merging qcom/for-next (cd2d489c8c3c Merge branches 'arm64-defconfig-for-5.1=
2', 'arm64-for-5.12', 'defconfig-for-5.12', 'drivers-for-5.12' and 'dts-for=
-5.12' into for-next)
Merging raspberrypi/for-next (3a3d8f09f497 ARM: dts: bcm2711: Add the BSC i=
nterrupt controller)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (14fd8c48abd9 Merge branch 'renesas-drivers-for-v5.12'=
 into renesas-next)
Merging reset/reset/next (d17655759b3f reset: Add devm_reset_control_get_op=
tional_exclusive_released())
CONFLICT (content): Merge conflict in drivers/reset/Kconfig
Merging rockchip/for-next (573fc3d310a3 Merge branch 'v5.12-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (f9e152f18310 Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (6ee1d745b7c9 Linux 5.11-rc5)
Merging stm32/stm32-next (a9c92a9671d7 ARM: dts: stm32: add #clock-cells pr=
operty to usbphyc node on stm32mp151)
Merging sunxi/sunxi/for-next (72fa1d973d23 Merge branches 'sunxi/clk-for-5.=
12' and 'sunxi/dt-for-5.12' into sunxi/for-next)
Merging tegra/for-next (2bca419d5c54 Merge branch for-5.12/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (48d180fbefdf Merge branch 'ti-k3-dts-next' in=
to ti-k3-next)
Merging clk/clk-next (6370ad6c0e83 Merge branch 'clk-fixes' into clk-next)
Merging clk-renesas/renesas-clk (c5e91ba25a65 clk: renesas: r8a779a0: Add R=
AVB clocks)
Merging clk-samsung/for-next (44a9e78f9242 clk: samsung: Prevent potential =
endless loop in the PLL ops)
Merging csky/linux-next (717f1b1a7243 csky: Fixup pfn_valid error with wron=
g max_mapnr)
Merging h8300/h8300-next (8808515be0ed h8300: Replace <linux/clk-provider.h=
> by <linux/of_clk.h>)
Merging ia64/next (c331649e6371 ia64: Use libata instead of the legacy ide =
driver in defconfigs)
Merging m68k/for-next (c396dd2ec5bb macintosh/adb-iop: Use big-endian autop=
oll mask)
Merging m68knommu/for-next (d2680cc0301e m68k: let clk_enable() return imme=
diately if clk is NULL)
Merging microblaze/next (57ddf08642f0 microblaze: do not select TRACING_SUP=
PORT directly)
Merging mips/mips-next (50886234e846 MIPS: Add is_jr_ra_ins() to end the lo=
op early)
Merging nds32/next (54bde873682b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (2261352157a9 Merge remote-tracking branch 'openr=
isc/or1k-5.11-fixes' into or1k-5.12-updates)
Merging parisc-hd/for-next (00e35f2b0e8a parisc: Enable -mlong-calls gcc op=
tion by default when !CONFIG_MODULES)
Merging powerpc/next (e71ba9452f0b Linux 5.11-rc2)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e95f287deed2 soc: fsl: handle RCPM errata A-008646 on=
 SoC LS1021A)
Merging risc-v/for-next (a78d7f7d424d riscv: Covert to reserve_initrd_mem())
CONFLICT (content): Merge conflict in drivers/soc/Makefile
CONFLICT (content): Merge conflict in drivers/soc/Kconfig
Merging s390/for-next (3a790cc1c9ef s390: pass struct pt_regs instead of re=
gisters to syscalls)
Merging sh/for-next (b89bc060b53e sh/intc: Restore devm_ioremap() alignment)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (7f3414226b58 um: time: fix initialization in time-t=
ravel mode)
Merging xtensa/xtensa-for-next (7b79eba1d0d1 xtensa: fix spelling mistake i=
n Kconfig "wont" -> "won't")
Merging pidfd/for-next (f736d93d76d3 xfs: support idmapped mounts)
Merging fscrypt/master (a14d0b676491 fscrypt: allow deleting files with uns=
upported encryption policy)
Merging fscache/fscache-next (daa94e1d8977 NFS: Convert readpage to readahe=
ad and use netfs_readahead for fscache)
CONFLICT (content): Merge conflict in include/linux/fs.h
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (c9a490b33ff4 Merge branch 'for-next-next-v5.11-2021=
0125' into for-next-20210125)
Merging ceph/master (9d5ae6f3c50a libceph: fix "Boolean result is used in b=
itwise operation" warning)
Merging cifs/for-next (6ee1d745b7c9 Linux 5.11-rc5)
Merging configfs/for-next (65cdb4a214c0 configfs: fix kernel-doc markup iss=
ue)
Merging ecryptfs/next (0b964446c63f ecryptfs: fix uid translation for setxa=
ttr on security.capability)
CONFLICT (content): Merge conflict in fs/ecryptfs/inode.c
Merging erofs/dev (d8b3df8b1048 erofs: avoid using generic_block_bmap)
Merging exfat/dev (4b7bc2c32cba exfat: improve performance of exfat_free_cl=
uster when using dirsync mount option)
Merging ext3/for_next (8e8f048a6941 Merge udf truncate fix.)
Merging ext4/dev (e9f53353e166 ext4: remove expensive flush on fast commit)
Merging f2fs/dev (7658d46b92f2 f2fs: add ckpt_thread_ioprio sysfs node)
CONFLICT (content): Merge conflict in fs/f2fs/file.c
CONFLICT (content): Merge conflict in fs/f2fs/acl.c
Merging fsverity/fsverity (bde493349025 fs-verity: move structs needed for =
file signing to UAPI header)
Merging fuse/for-next (5d069dbe8aaf fuse: fix bad inode)
Merging jfs/jfs-next (3bef198f1b17 JFS: more checks for invalid superblock)
Merging nfs/linux-next (d29b468da4f9 pNFS/NFSv4: Improve rejection of out-o=
f-order layouts)
Merging nfs-anna/linux-next (11392155f2bd NFS: Disable READ_PLUS by default)
CONFLICT (content): Merge conflict in fs/nfs/nfs4proc.c
Merging nfsd/nfsd-next (c3213d260a23 SUNRPC: Fix oops in the rpc_xdr_buf ev=
ent class)
Merging cel/for-next (e921883035b7 nfsd: skip some unnecessary stats in the=
 v4 case)
Merging orangefs/for-next (c1048828c3db orangefs: add splice file operation=
s)
Merging overlayfs/overlayfs-next (4cfaec197262 ovl: fix dentry leak in ovl_=
get_redirect)
CONFLICT (content): Merge conflict in fs/overlayfs/inode.c
CONFLICT (content): Merge conflict in fs/overlayfs/copy_up.c
CONFLICT (content): Merge conflict in fs/ecryptfs/inode.c
Merging ubifs/next (b80a974b8c58 ubifs: ubifs_dump_node: Dump all branches =
of the index node)
Merging v9fs/9p-next (324a158fe535 fs: 9p: add generic splice_write file op=
eration)
Merging xfs/for-next (ae29e4220fd3 xfs: reduce ilock acquisitions in xfs_fi=
le_fsync)
CONFLICT (content): Merge conflict in fs/xfs/xfs_inode.c
Merging zonefs/for-next (4f8b848788f7 zonefs: select CONFIG_CRC32)
Merging iomap/iomap-for-next (213f627104da iomap: add a IOMAP_DIO_OVERWRITE=
_ONLY flag)
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (8d1ddb5e7937 fcntl: Fix potential deadlock i=
n send_sig{io, urg}())
Merging vfs/for-next (f012556f37ff Merge branch 'work.sendfile' into for-ne=
xt)
CONFLICT (content): Merge conflict in fs/namei.c
CONFLICT (content): Merge conflict in fs/coredump.c
CONFLICT (content): Merge conflict in arch/Kconfig
Merging printk/for-next (fdaae9394da4 Merge branch 'printk-rework' into for=
-next)
Merging pci/next (f9812c033ad3 Merge branch 'remotes/lorenzo/pci/misc')
Merging pstore/for-next/pstore (26fecbf7602d pstore: Move kmsg_bytes defaul=
t into Kconfig)
Merging hid/for-next (27a8dea33bc0 Merge branch 'for-5.12/doc' into for-nex=
t)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging i2c/i2c/for-next (f92aacef60f3 Merge branch 'i2c/for-5.12' into i2c=
/for-next)
Merging i3c/i3c/next (5c8fe583cce5 Linux 5.11-rc1)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (5d868b73601a hwmon: (pwm-fan) stop using =
legacy PWM functions and some cleanups)
Merging jc_docs/docs-next (3950b92f9691 selftests: kselftest_harness.h: par=
tially fix kernel-doc markups)
Merging v4l-dvb/master (803abec64ef9 media: ipu3-cio2: Add cio2-bridge to i=
pu3-cio2 driver)
Merging v4l-dvb-next/master (d0a9fffedca1 docs: fs: api-summary.rst: get ri=
d of kernel-doc include)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_dp_helper.c
CONFLICT (content): Merge conflict in Documentation/dev-tools/kasan.rst
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (feb0d85db3fd Merge branch 'pnp' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (7114ebffd330 cpufreq: remove ta=
ngo driver)
Merging cpupower/cpupower (3a3ecfdb605c cpupower: Add cpuid cap flag for MS=
R_AMD_HWCR support)
Merging devfreq/devfreq-next (ec894883de53 PM / devfreq: Replace devfreq->d=
ev.parent as dev in devfreq_add_device)
Merging opp/opp/linux-next (8d16846ab311 drm: msm: Migrate to dev_pm_opp_se=
t_opp())
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
Merging rdma/for-next (f8e9a970159c RDMA/sw/rdmavt/qp: Fix a bunch of kerne=
l-doc misdemeanours)
Merging net-next/master (285715ac9a81 bonding: add TLS dependency)
Merging bpf-next/for-next (86ce322d21eb selftests/bpf: Don't exit on failed=
 bpf_testmod unload)
CONFLICT (content): Merge conflict in net/ipv4/tcp.c
Merging ipsec-next/master (18f976960bca xfrm: interface: enable TSO on xfrm=
 interfaces)
Merging mlx5-next/mlx5-next (ab0da5a57188 net/mlx5: Expose ifc bits for que=
ry modify header)
Merging netfilter-next/master (a61e4b60761f Merge branch 'net-dsa-hellcreek=
-add-taprio-offloading')
Merging ipvs-next/master (09b5b5fb3902 ppp: clean up endianness conversions)
Merging wireless-drivers-next/master (4832bb371c41 iwl4965: do not process =
non-QOS frames on txq->sched_retry path)
Merging bluetooth/master (98d2c3e17310 Bluetooth: L2CAP: Try harder to acce=
pt device not knowing options)
Merging mac80211-next/master (a05829a7222e cfg80211: avoid holding the RTNL=
 when calling the driver)
Merging gfs2/for-next (82218943058d gfs2: keep bios separate for each journ=
al)
Merging mtd/mtd/next (341e4faf9cad mtd: remove redundant assignment to poin=
ter eb)
Merging nand/nand/next (d986effd1409 mtd: rawnand: tango: Remove the driver)
Merging spi-nor/spi-nor/next (fe6653460ee7 mtd: spi-nor: hisi-sfc: Put chil=
d node np on error path)
Merging crypto/master (65d1e3c415f6 crypto: aesni - release FPU during skci=
pher walk API calls)
Merging drm/drm-next (bc96ad6722f8 Merge tag 'v5.11-rc5' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/torvalds/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/gen7_rendercl=
ear.c
Merging amdgpu/drm-next (f06a5f700c66 drm/amd/display: Fix unused variable =
warning)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/mmhub_v2_3=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
Merging drm-intel/for-linux-next (784953a46589 drm/i915/display/vrr: Skip t=
he VRR HW state readout on DSI transcoder)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_obj=
ect.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dd=
i.c
Merging drm-tegra/drm/tegra/for-next (dcdfe2712b68 drm/tegra: Fix reference=
 leak when pm_runtime_get_sync() fails)
Merging drm-misc/for-linux-next (97ecfff41e26 drm/doc: document the type pl=
ane property)
CONFLICT (content): Merge conflict in drivers/gpu/drm/ttm/ttm_pool.c
Merging drm-msm/msm-next (00fd44a1a470 drm/msm: Only enable A6xx LLCC code =
on A6xx)
Merging imx-drm/imx-drm/next (82581fcf070b drm/modes: add non-OF stub for o=
f_get_drm_display_mode)
Merging etnaviv/etnaviv/next (7d614ab2f205 drm/etnaviv: fix NULL check befo=
re some freeing functions is not needed)
Merging regmap/for-next (aa3233086b48 Merge remote-tracking branch 'regmap/=
for-5.12' into regmap-next)
Merging sound/for-next (4f2da3324eaf Merge tag 'tags/isa-void-remove-callba=
ck' into for-next)
Merging sound-asoc/for-next (012f362fcb37 Merge remote-tracking branch 'aso=
c/for-5.12' into asoc-next)
Merging modules/modules-next (ec2a29593c83 module: harden ELF info handling)
Merging input/next (3bdffa8ffb45 Input: Add N64 controller driver)
Merging block/for-next (e0452bd1cd37 Merge branch 'for-5.12/io_uring' into =
for-next)
CONFLICT (content): Merge conflict in lib/iov_iter.c
CONFLICT (content): Merge conflict in Documentation/filesystems/porting.rst
Merging device-mapper/for-next (8fc33a0a620e dm integrity: introduce the "f=
ix_hmac" argument)
Merging pcmcia/pcmcia-next (4ce6b242b78d pcmcia: Switch to using the new AP=
I kobj_to_dev())
Merging mmc/next (bdcefe241263 Merge branch 'fixes' into next)
Merging mfd/for-mfd-next (d0e648f2186a mfd: intel-lpss: Add Intel Alder Lak=
e PCH-P PCI IDs)
Merging backlight/for-backlight-next (4a98e5ef88f8 backlight: sky81452-back=
light: Convert comma to semicolon)
Merging battery/for-next (a4bdea2004b2 power: supply: fix sbs-charger build=
, needs REGMAP_I2C)
Merging regulator/for-next (6d2d59e2ba7b Merge remote-tracking branch 'regu=
lator/for-5.12' into regulator-next)
Merging security/next-testing (9dcd47fc1f7d Merge branch 'fixes-v5.10' into=
 next-testing)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (e58bb688f2e4 Merge branch 'measure-critic=
al-data' into next-integrity)
CONFLICT (content): Merge conflict in security/integrity/ima/ima_policy.c
CONFLICT (content): Merge conflict in security/integrity/ima/ima_main.c
CONFLICT (content): Merge conflict in security/integrity/ima/ima_api.c
Merging keys/keys-next (8f0bfc25c907 watch_queue: rectify kernel-doc for in=
it_watch())
Merging safesetid/safesetid-next (03ca0ec13892 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (365982aba1f2 fs: anon_inodes: rephrase to appropriate=
 kernel-doc)
Merging smack/next (9b0072e2b2b5 security/smack: remove unused varible 'rc')
Merging tomoyo/master (dea8dcf2a9fa Merge tag 'for-5.11/dm-fix' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging tpmdd/next (225051939495 ABI: add sysfs description for tpm exports=
 of PCR registers)
Merging watchdog/master (7c53f6b671f4 Linux 5.11-rc3)
Merging iommu/next (4dd6ce478003 iommu: Fix a check in iommu_check_bind_dat=
a())
Merging audit/next (c1de44631eb5 audit: Remove leftover reference to the au=
dit_tasklet)
Merging devicetree/for-next (cb18a7979a35 dt-bindings: gpu: Convert v3d to =
json-schema)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/net=
/ti,k3-am654-cpsw-nuss.yaml
Merging mailbox/mailbox-for-next (5a6338cce9f4 mailbox: arm_mhuv2: Add driv=
er)
Merging spi/for-next (7e46ab15edba Merge remote-tracking branch 'spi/for-5.=
12' into spi-next)
Merging tip/auto-latest (d38edbe14262 Merge branch 'locking/core')
Merging clockevents/timers/drivers/next (8ae954caf49a clocksource/drivers/s=
h_cmt: Fix potential deadlock when calling runtime PM)
Merging edac/edac-for-next (faf042d15093 Merge branch 'edac-amd64' into eda=
c-for-next)
Merging irqchip/irq/irqchip-next (599b3063adf4 irqchip/mips-cpu: Set IPI do=
main parent chip)
Merging ftrace/for-next (f6a694665f13 tracing: Offload eval map updates to =
a work queue)
Merging rcu/rcu/next (efc0f28cfe21 rcu-tasks: Rectify kernel-doc for struct=
 rcu_tasks)
Merging kvm/next (7c53f6b671f4 Linux 5.11-rc3)
Merging kvm-arm/next (40fe4c5cd337 Merge branch 'kvm-arm64/rng-5.12' into k=
vmarm-master/next)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/kvm_asm.h
Merging kvm-ppc/kvm-ppc-next (dc924b062488 KVM: SVM: check CR4 changes agai=
nst vcpu->arch)
Merging kvms390/next (50a05be484cb KVM: s390: track synchronous pfault even=
ts in kvm_stat)
Merging xen-tip/linux-next (bd9dcef67ffc x86/xen: fix 'nopvspin' build erro=
r)
Merging percpu/for-next (7dd3050a0194 Merge branch 'for-5.12' into for-next)
Merging workqueues/for-next (7bf9c4a88e3e workqueue: tracing the name of th=
e workqueue instead of it's address)
Merging drivers-x86/for-next (d7cbe2773aed platform/x86: thinkpad_acpi: set=
 keyboard language)
Merging chrome-platform/for-next (4daeb395f175 platform/chrome: cros_ec: Ca=
ll interrupt bottom half at probe time)
Merging hsi/for-next (aa57e77b3d28 HSI: Fix PM usage counter unbalance in s=
si_hw_init)
Merging leds/for-next (9a5ad5c5b2d2 leds: trigger: fix potential deadlock w=
ith libata)
Merging ipmi/for-next (dea8dcf2a9fa Merge tag 'for-5.11/dm-fix' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm)
Merging driver-core/driver-core-next (072a51be8ecf Merge 5.11-rc5 into driv=
er-core-next)
Merging usb/usb-next (7cbcd008e104 usb: typec: tcpci_maxim: add terminating=
 newlines to logging)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/usb=
/qcom,dwc3.yaml
Merging usb-gadget/next (b2c586eb07ef usb: dwc2: Fix INTR OUT transfers in =
DDMA mode.)
Merging usb-serial/usb-next (55317e22391f USB: serial: xr: fix B0 handling)
Merging usb-chipidea-next/for-usb-next (4f30b9d2315f usb: cdns3: Add suppor=
t for TI's AM64 SoC)
Merging phy-next/next (71edb0b4fa0e dt-bindings: phy: qcom-qusb2: Document =
SDM660 compatible)
Merging tty/tty-next (0f8b29fabacb Merge 5.11-rc5 into tty-next)
CONFLICT (content): Merge conflict in include/linux/tty.h
Merging char-misc/char-misc-next (91ca10d6fa07 misc: bcm-vk: add ttyVK supp=
ort)
CONFLICT (content): Merge conflict in scripts/mod/file2alias.c
CONFLICT (content): Merge conflict in scripts/mod/devicetable-offsets.c
CONFLICT (content): Merge conflict in include/linux/mod_devicetable.h
Merging extcon/extcon-next (226d336c1c75 extcon: max8997: Add CHGINS and CH=
GRM interrupt handling)
Merging soundwire/next (9a0c798c7a98 soundwire: cadence: adjust verbosity i=
n response handling)
Merging thunderbolt/next (3da88be24997 thunderbolt: Add support for de-auth=
orizing devices)
Merging vfio/next (bdfae1c9a913 vfio/type1: Add vfio_group_iommu_domain())
Merging staging/staging-next (ec52736c35f2 Merge 5.11-rc5 into staging-next)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (23145465c5b0 Merge branch 'icc-msm8939' into icc-next)
Merging dmaengine/next (03d939c7e3d8 dmaengine: idxd: add module parameter =
to force disable of SVA)
Merging cgroup/for-next (00bfa16052cd Merge branch 'for-5.11-fixes' into fo=
r-next)
Merging scsi/for-next (8d254bb2d429 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (5fb6d3a6d8fe Merge branch 'sg' into 5.12/scsi-st=
aging)
CONFLICT (content): Merge conflict in drivers/scsi/sg.c
CONFLICT (modify/delete): drivers/scsi/gdth.c deleted in scsi-mkp/for-next =
and modified in HEAD. Version HEAD of drivers/scsi/gdth.c left in tree.
$ git rm -f drivers/scsi/gdth.c
$ git reset --hard HEAD^
Merging next-20210122 version of scsi-mkp
Merging vhost/linux-next (79991caf5202 vdpa_sim_net: Add support for user s=
upported devices)
Merging rpmsg/for-next (7cb4f293777e Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (1b152a81a243 gpio: mvebu: improve handling=
 of pwm zero on/off values)
Merging gpio-intel/for-next (6e13038b3392 gpio: intel-mid: Remove driver fo=
r deprecated platform)
Merging pinctrl/for-next (e79167284d62 Merge branch 'devel' into for-next)
$ git reset --hard HEAD^
Merging next-20210125 version of pinctrl
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
Merging kselftest/next (df00d0298902 selftests/vDSO: fix -Wformat warning i=
n vdso_test_correctness)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (81840f21d416 Merge branch 'for-5.12/doc' int=
o for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (15f57b3e3130 rtc: pcf2127: Run a OTP refresh if not d=
one before)
Merging nvdimm/libnvdimm-for-next (127c3d2e7e8a Merge branch 'for-5.11/dax'=
 into for-5.11/libnvdimm)
Merging at24/at24/for-next (5c8fe583cce5 Linux 5.11-rc1)
Merging ntb/ntb-next (5c8fe583cce5 Linux 5.11-rc1)
Merging seccomp/for-next/seccomp (2c07343abd89 selftests/seccomp: Update ke=
rnel config)
Merging kspp/for-next/kspp (112b6a8e038d arm64: allow LTO to be selected)
CONFLICT (content): Merge conflict in include/asm-generic/vmlinux.lds.h
Merging gnss/gnss-next (45d5996e034c gnss: drop stray semicolons)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (0320ed0a8236 drivers: slimbus: Fix word resposibl=
e -> responsible in slimbus.h)
Merging nvmem/for-next (2c36185526ad nvmem: core: skip child nodes not matc=
hing binding)
Merging xarray/main (80c1dbebf308 XArray: Fix splitting to non-zero orders)
Merging hyperv/hyperv-next (aa7fb666092d Drivers: hv: vmbus: Add /sys/bus/v=
mbus/hibernation)
Merging auxdisplay/auxdisplay (b45616445a6e auxdisplay: Fix duplicate CHARL=
CD config symbol)
Merging kgdb/kgdb/for-next (d081a6e35316 kdb: Fix pager search for multi-li=
ne strings)
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
Merging mhi/mhi-next (a8f75cb348fd mhi: core: Factorize mhi queuing)
Merging notifications/notifications-pipe-core (c824117262d8 watch_queue: sa=
mple: Display mount tree change notifications)
CONFLICT (content): Merge conflict in include/uapi/asm-generic/unistd.h
CONFLICT (content): Merge conflict in fs/namespace.c
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
CONFLICT (content): Merge conflict in arch/arm/tools/syscall.tbl
CONFLICT (content): Merge conflict in arch/alpha/kernel/syscalls/syscall.tbl
$ git merge --abort
Merging memblock/for-next (097d43d85704 mm: memblock: remove return value o=
f memblock_free_all())
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging iomem-mmap-vs-gup/topic/iomem-mmap-vs-gup (74b30195395c sysfs: Supp=
ort zapping of binary attr mmaps)
Merging oprofile-removal/oprofile/removal (227c4c936483 fs: Remove dcookies=
 support)
Merging akpm-current/current (60af37ce06f8 initramfs-panic-with-memory-info=
rmation-fix)
CONFLICT (content): Merge conflict in include/linux/pagemap.h
CONFLICT (content): Merge conflict in fs/hugetlbfs/inode.c
CONFLICT (content): Merge conflict in fs/btrfs/file.c
Applying: ramfs-support-O_TMPFILE-fix
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --a=
bort".
CONFLICT (content): Merge conflict in include/uapi/asm-generic/unistd.h
CONFLICT (content): Merge conflict in include/linux/syscalls.h
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_64.tbl
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_32.tbl
$ git rebase --continue
Merging akpm/master (b13f7cadcd89 secretmem: test: add basic selftest for m=
emfd_secret(2))

--Sig_/ZMMdIp7N+UD6Rg5aN6xldSG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmARfEMACgkQAVBC80lX
0Gz8fgf9GnfwveBN71dnNlzacYScu8GUUalC9CgfWvkQMshCv0R7HaYQw+CcMXMF
Ei0m0LG97EizQ1ZZ4MsvQKW6+n4sOoJe4NCKTI+zs3tSoPgNaCKc5isjAJbFbgRT
ur51QygifiGAReonCgW3CHg4f2Frinrh4Mq0BcdkiL/3FoOOd1one3WaX41SOVVG
rzo7iDiNod4t1CjVNmQnKLEb8RF+DHgpT308FpdBYyv+eHZW3bycWVm9mSFnzUXr
CSMBZn5VFFSj5/s57xM230Q9SASDilKrI73x2Mx0ppiRFenLlXr8B185GF1NhQpB
rYmOtI19pwYqK1kV8wuGD7w4CwJO1Q==
=Cxa3
-----END PGP SIGNATURE-----

--Sig_/ZMMdIp7N+UD6Rg5aN6xldSG--
