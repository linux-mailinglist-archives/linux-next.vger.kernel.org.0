Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 913E128C9BC
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 10:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390207AbgJMIE5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Oct 2020 04:04:57 -0400
Received: from ozlabs.org ([203.11.71.1]:35225 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389340AbgJMIEu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Oct 2020 04:04:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C9Skd48WNz9sTs;
        Tue, 13 Oct 2020 19:04:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602576281;
        bh=Ckprlgf4tslsh+SBqc7/FOj1/NDc02BHBUFa4asW5vk=;
        h=Date:From:To:Cc:Subject:From;
        b=fLu2ADhKC9XKL3Oyyn8PJgyIFPcrF2LVMCeXLD1hPRcy3PY5w+sRwYl3cMy5qQ1mD
         xFCfY76JTo4oizV8yBZX1DcdAM5bnUSrdwiy6ozWLl2GKurrEthYCjTTCSpGAmIj2i
         agkUG95rvTcxRG0rc1cPtvoPCCl9pzS8K1JCTcnOVavHbOaFc50yTjfoep93RTS7My
         2d2QbQZJFGQZgWPFyrJSd5KCtc6xHokLNxGz81zytI9CISxd1vQdy43gRlh821UABR
         I+kOPDn/AMT+UxyzoAZQm1h2dVBMCwzn4NYKZBez5h/RSQibaDHyUjdbaf9k0D/ERM
         CBGA/W9OSV40Q==
Date:   Tue, 13 Oct 2020 19:04:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 13
Message-ID: <20201013190440.221fe8ff@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KFBvBOVR6p.YpR7ND0N6gaY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/KFBvBOVR6p.YpR7ND0N6gaY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Since the merge window is open, please do not add any v5.11 material to
your linux-next included branches until after v5.10-rc1 has been released.

News: there will be no linux-next release tomorrow.

Changes since 20201012:

The fuse tree gained a conflict against Linus' tree.

The vfio tree gained a build failure so I used the version from
next-20201012.

The tip tree still had its build failure for which I applied a supplied
patch.

The akpm-current tree gained a conflict against the tip tree.

Non-merge commits (relative to Linus' tree): 13039
 12610 files changed, 701988 insertions(+), 271055 deletions(-)

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

I am currently merging 329 trees (counting Linus' and 86 trees of bug
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
Merging origin/master (13cb73490f47 Merge tag 'x86-entry-2020-10-12' of git=
://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging kbuild-current/fixes (e30d694c3381 Documentation/llvm: Fix clang ta=
rget examples)
Merging arc-current/for-curr (6364d1b41cc3 arc: include/asm: fix typos of "=
themselves")
Merging arm-current/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging arm64-fixes/for-next/fixes (39e4716caa59 crypto: arm64: Use x16 wit=
h indirect branch to bti_c)
Merging arm-soc-fixes/arm/fixes (6869f774b1cd Merge tag 'omap-for-v5.9/fixe=
s-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap i=
nto arm/fixes)
Merging uniphier-fixes/fixes (48778464bb7d Linux 5.8-rc2)
Merging drivers-memory-fixes/fixes (7ff3a2a626f7 memory: jz4780_nemc: Fix a=
n error pointer vs NULL check in probe())
Merging m68k-current/for-linus (50c5feeea0af ide/macide: Convert Mac IDE dr=
iver to platform driver)
Merging powerpc-fixes/fixes (0460534b532e powerpc/papr_scm: Limit the reada=
bility of 'perf_stats' sysfs attribute)
Merging s390-fixes/fixes (549738f15da0 Linux 5.9-rc8)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (3af5f0f5c74e net: korina: fix kfree of rx/tx descriptor=
 array)
Merging bpf/master (28802e7c0c99 net: usb: qmi_wwan: add Cellient MPL200 ca=
rd)
Merging ipsec/master (3fdd47c3b40a Merge tag 'for_linus' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/mst/vhost)
Merging netfilter/master (7b50ee3dad25 tipc: fix NULL pointer dereference i=
n tipc_named_rcv)
Merging ipvs/master (48d072c4e8cd selftests: netfilter: add time counter ch=
eck)
Merging wireless-drivers/master (df41c19abbea drivers/net/wan/hdlc_fr: Move=
 the skb_headroom check out of fr_hard_header)
CONFLICT (content): Merge conflict in net/mptcp/protocol.h
Merging mac80211/master (3fdd47c3b40a Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging rdma-fixes/for-rc (a1b8638ba132 Linux 5.9-rc7)
Merging sound-current/for-linus (f401b2c9931a Merge tag 'asoc-v5.10' of htt=
ps://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus)
Merging sound-asoc-fixes/for-linus (7ffe09eebf73 Merge remote-tracking bran=
ch 'asoc/for-5.9' into asoc-linus)
Merging regmap-fixes/for-linus (549738f15da0 Linux 5.9-rc8)
Merging regulator-fixes/for-linus (549738f15da0 Linux 5.9-rc8)
Merging spi-fixes/for-linus (d4f3a651ab82 Merge remote-tracking branch 'spi=
/for-5.9' into spi-linus)
Merging pci-current/for-linus (76a6b0b90d53 MAINTAINERS: Add Pali Roh=C3=A1=
r as aardvark PCI maintainer)
Merging driver-core.current/driver-core-linus (856deb866d16 Linux 5.9-rc5)
Merging tty.current/tty-linus (ba4f184e126b Linux 5.9-rc6)
Merging usb.current/usb-linus (549738f15da0 Linux 5.9-rc8)
Merging usb-gadget-fixes/fixes (51609fba0cca usb: dwc3: simple: add support=
 for Hikey 970)
Merging usb-serial-fixes/usb-linus (856deb866d16 Linux 5.9-rc5)
Merging usb-chipidea-fixes/ci-for-usb-stable (2d79b3360dcc usb: chipidea: c=
ore: add wakeup support for extcon)
Merging phy/fixes (850280156f64 phy: ti: am654: Fix a leak in serdes_am654_=
probe())
Merging staging.current/staging-linus (549738f15da0 Linux 5.9-rc8)
Merging char-misc.current/char-misc-linus (856deb866d16 Linux 5.9-rc5)
Merging soundwire-fixes/fixes (3fbbf2148a40 soundwire: fix double free of d=
angling pointer)
Merging thunderbolt-fixes/fixes (549738f15da0 Linux 5.9-rc8)
Merging input-current/for-linus (5fc27b098daf Input: i8042 - add nopnp quir=
k for Acer Aspire 5 A515)
Merging crypto-current/master (3093e7c16e12 X.509: Fix modular build of pub=
lic_key_sm2)
CONFLICT (content): Merge conflict in drivers/crypto/Kconfig
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (aae7a75a821a vfio/type1: Add proper error unw=
ind for vfio_iommu_replay())
Merging kselftest-fixes/fixes (aa803771a80a tools: Avoid comma separated st=
atements)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (549738f15da0 Linux 5.9-rc8)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (1afc0c89f6a1 Revert "mtd: spi-nor: Add capabil=
ity to disable flash quad mode")
Merging mfd-fixes/for-mfd-fixes (22380b65dc70 mfd: mfd-core: Ensure disable=
d devices are ignored without error)
Merging v4l-dvb-fixes/fixes (d0254f82d702 media: dt-bindings: media: imx274=
: Convert to json-schema)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (be090fa62080 MIPS: BCM47XX: Remove the needl=
ess check with the 1074K)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (8f04aea048d5 ARM: OMAP2+: Restore MPU power domai=
n if cpu_cluster_pm_enter() fails)
Merging kvm-fixes/master (e2e1a1c86bf3 Merge tag 'kvmarm-fixes-5.9-3' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into kvm-master)
Merging kvms390-fixes/master (f20d4e924b44 docs: kvm: add documentation for=
 KVM_CAP_S390_DIAG318)
Merging hwmon-fixes/hwmon (18360b33a071 hwmon: (w83627ehf) Fix a resource l=
eak in probe)
Merging nvdimm-fixes/libnvdimm-fixes (88b67edd7247 dax: Fix compilation for=
 CONFIG_DAX && !CONFIG_FS_DAX)
Merging btrfs-fixes/next-fixes (2a851de0233a Merge branch 'misc-5.9' into n=
ext-fixes)
Merging vfs-fixes/fixes (8a018eb55e3a pipe: Fix memory leaks in create_pipe=
_files())
Merging dma-mapping-fixes/for-linus (892fc9f6835e dma-pool: Fix an uninitia=
lized variable bug in atomic_pool_expand())
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (1797d588af15 platform/x86: asus-wmi: Fix S=
W_TABLET_MODE always reporting 1 on many different models)
Merging samsung-krzk-fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (bbf5c979011a Linux 5.9)
Merging devicetree-fixes/dt/linus (efe84d408bf4 scripts/dtc: only append to=
 HOST_EXTRACFLAGS instead of overwriting)
Merging scsi-fixes/fixes (bcf3a2953d36 scsi: iscsi: iscsi_tcp: Avoid holdin=
g spinlock while calling getpeername())
Merging drm-fixes/drm-fixes (dded93ffbb8c Merge tag 'amd-drm-fixes-5.9-2020=
-10-08' of git://people.freedesktop.org/~agd5f/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (bbf5c979011a Linux 5.9)
Merging mmc-fixes/fixes (4243219141b6 mmc: core: don't set limits.discard_g=
ranularity as 0)
Merging rtc-fixes/rtc-fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging gnss-fixes/gnss-linus (48778464bb7d Linux 5.8-rc2)
Merging hyperv-fixes/hyperv-fixes (911e1987efc8 Drivers: hv: vmbus: Add tim=
eout to vmbus_wait_for_unload)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (84814460eef9 riscv: Fixup bootup failure with H=
ARDENED_USERCOPY)
Merging pidfd-fixes/fixes (bda4c60d02e9 sys: Convert to the new fallthrough=
 notation)
Merging fpga-fixes/fixes (8614afd689df fpga: dfl: fix bug in port reset han=
dshake)
Merging spdx/spdx-linus (c5c553850899 scripts/spdxcheck.py: handle license =
identifiers in XML comments)
Merging gpio-intel-fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging pinctrl-intel-fixes/fixes (3488737093e7 pinctrl: cherryview: Preser=
ve CHV_PADCTRL1_INVRXTX_TXDATA flag on GPIOs)
Merging erofs-fixes/fixes (9ebcfadb0610 Linux 5.8-rc3)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (1abdd39f14b2 kunit: tool: fix display of m=
ake errors)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (5f7b81c18366 ia64: fix min_low_pfn/max_low_pf=
n build errors)
Merging drm-misc-fixes/for-linux-next-fixes (27204b99b082 drm: drm_dsc.h: f=
ix a kernel-doc markup)
Merging kspp-gustavo/for-next/kspp (736116436e5b include: jhash/signal: Fix=
 fall-through warnings for Clang)
Merging kbuild/for-next (666ddd277a19 Merge branch 'kconfig' into for-next)
Merging compiler-attributes/compiler-attributes (e5fc436f06ee sparse: use s=
tatic inline for __chk_{user,io}_ptr())
Merging dma-mapping/for-next (849facea92fa dma-direct: simplify the DMA_ATT=
R_NO_KERNEL_MAPPING handling)
Applying: xsk: Remove internal DMA headers
Merging asm-generic/master (9123e3a74ec7 Linux 5.9-rc1)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (adc5f7029376 ARM: add malloc size to decompressor kex=
ec size structure)
Merging arm64/for-next/core (d13027bb35e0 Revert "arm64: initialize per-cpu=
 offsets earlier")
Merging arm-perf/for-next/perf (887e2cff0f8d perf: arm-cmn: Fix conversion =
specifiers for node type)
Merging arm-soc/for-next (4bb6c7b93462 ARM: Document merges)
CONFLICT (modify/delete): arch/arm/mach-imx/mach-mx31moboard.c deleted in a=
rm-soc/for-next and modified in HEAD. Version HEAD of arch/arm/mach-imx/mac=
h-mx31moboard.c left in tree.
CONFLICT (modify/delete): arch/arm/mach-imx/mach-imx27_visstrim_m10.c delet=
ed in arm-soc/for-next and modified in HEAD. Version HEAD of arch/arm/mach-=
imx/mach-imx27_visstrim_m10.c left in tree.
$ git rm -f arch/arm/mach-imx/mach-imx27_visstrim_m10.c arch/arm/mach-imx/m=
ach-mx31moboard.c
Merging amlogic/for-next (ad6aebe534aa Merge branch 'v5.10/drivers' into tm=
p/aml-rebuild)
Merging aspeed/for-next (48127d01a153 Merge branch 'soc-for-v5.10' into for=
-next)
Merging at91/at91-next (d1f170f8447d Merge branches 'at91-soc' and 'at91-dt=
' into at91-next)
Merging drivers-memory/for-next (94ca85733699 memory: emif: Convert to DEFI=
NE_SHOW_ATTRIBUTE)
Merging imx-mxs/for-next (bc421f7da477 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (703dff8cb900 Merge branch 'for_5.10/drivers-soc' int=
o next)
Merging mediatek/for-next (b05dfbba9c46 Merge branch 'v5.9-next/soc' into f=
or-next)
Merging mvebu/for-next (f89c9685f6a1 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (7a159a1ad494 Merge branch 'fixes' into for-next)
Merging qcom/for-next (abea2a011c54 Merge branches 'arm64-for-5.10', 'arm64=
-defconfig-for-5.10' and 'drivers-for-5.10' into for-next)
Merging raspberrypi/for-next (4564363351e2 ARM: dts: bcm2711: Enable the di=
splay pipeline)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (1ff27687ae7e Merge branch 'renesas-fixes-for-v5.9' in=
to renesas-next)
Merging reset/reset/next (68a215164e19 reset: sti: reset-syscfg: fix struct=
 description warnings)
Merging rockchip/for-next (ba0ceb95f560 Merge branch 'v5.10-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (62315959a263 Merge branch 'next/dt' into for=
-next)
Merging scmi/for-linux-next (a1b8638ba132 Linux 5.9-rc7)
Merging sunxi/sunxi/for-next (a2e5e8054a26 Merge branch 'sunxi/dt-for-5.10'=
, remote-tracking branches 'korg/sunxi/sunxi/clk-for-5.10', 'korg/sunxi/sun=
xi/fixes-for-5.9' and 'korg/sunxi/sunxi/drivers-for-5.10' into sunxi/for-ne=
xt)
CONFLICT (add/add): Merge conflict in arch/arm64/boot/dts/allwinner/sun50i-=
a100.dtsi
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/sra=
m/allwinner,sun4i-a10-system-control.yaml
Merging tegra/for-next (9ea55312ba10 Merge branch for-5.10/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (48a78787c0f3 Merge branch 'ti-k3-dts-next' in=
to ti-k3-next)
Merging uniphier/for-next (4f8fb65af529 Merge branch 'dt64' into for-next)
Merging clk/clk-next (426eab515007 Merge branch 'clk-rockchip' into clk-nex=
t)
Merging clk-samsung/for-next (ff8e0ff9b996 clk: samsung: Use cached clk_hws=
 instead of __clk_lookup() calls)
Merging csky/linux-next (1c8499089bc6 csky: Add memory layout 2.5G(user):1.=
5G(kernel))
Merging h8300/h8300-next (8808515be0ed h8300: Replace <linux/clk-provider.h=
> by <linux/of_clk.h>)
Merging ia64/next (c331649e6371 ia64: Use libata instead of the legacy ide =
driver in defconfigs)
Merging m68k/for-next (50c5feeea0af ide/macide: Convert Mac IDE driver to p=
latform driver)
Merging m68knommu/for-next (9f5fd809d7a0 serial: mcf: add sysrq capability)
CONFLICT (content): Merge conflict in arch/m68k/Kconfig
Merging microblaze/next (4a17e8513376 microblaze: fix kbuild redundant file=
 warning)
Merging mips/mips-next (20cc5b649d99 MIPS: cpu-probe: remove MIPS_CPU_BP_GH=
IST option bit)
Merging nds32/next (54bde873682b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (55b2662ec665 openrisc: uaccess: Add user address=
 space check to access_ok)
Merging parisc-hd/for-next (fbb75b71b131 parisc/sticon: Add user font suppo=
rt)
Merging powerpc/next (a2d0230b91f7 cpufreq: powernv: Fix frame-size-overflo=
w in powernv_cpufreq_reboot_notifier)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (d97b957e32b1 soc: fsl: qe: Remove unnessesary check i=
n ucc_set_tdm_rxtx_clk)
Merging risc-v/for-next (e8d444d3e98c riscv: remove address space overrides=
 using set_fs())
CONFLICT (content): Merge conflict in arch/s390/Kconfig
CONFLICT (content): Merge conflict in arch/riscv/kernel/vmlinux.lds.S
CONFLICT (content): Merge conflict in arch/m68k/Kconfig
CONFLICT (content): Merge conflict in arch/ia64/Kconfig
Merging s390/for-next (ddadd80dc943 Merge branch 'features' into for-next)
Merging sh/for-next (b0cfc315ff38 sh: fix syscall tracing)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (f06885b3f3e3 um: vector: Add dynamic tap interfaces=
 and scripting)
Merging xtensa/xtensa-for-next (4ca4c562efb6 xtensa: uaccess: Add missing _=
_user to strncpy_from_user() prototype)
Merging fscrypt/master (5b2a828b98ec fscrypt: export fscrypt_d_revalidate())
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (d6e05fb2b680 Merge branch 'for-next-next-v5.9-20200=
923' into for-next-20200923)
CONFLICT (content): Merge conflict in fs/btrfs/dev-replace.c
Merging ceph/master (28e1581c3b4e libceph: clear con->out_msg on Policy::st=
ateful_server faults)
Merging cifs/for-next (344602068c51 SMB3.1.1: add defines for new signing n=
egotiate context)
Merging configfs/for-next (76ecfcb0852e samples: configfs: prefer pr_err() =
over bare printk(KERN_ERR)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (915f4c9358db erofs: remove unnecessary enum entries)
Merging exfat/dev (e17632ef8874 exfat: remove useless check in exfat_move_f=
ile())
Merging ext3/for_next (e44b86917b3f Pull direct IO fix from Gabriel Krisman=
.)
Merging ext4/dev (9cb3701fb599 ext4: Fix bs < ps issue reported with diorea=
d_nolock mount opt)
Merging f2fs/dev (9360ff96cd01 f2fs: handle errors of f2fs_get_meta_page_no=
fail)
Merging fsverity/fsverity (f3db0bed4583 fs-verity: use smp_load_acquire() f=
or ->i_verity_info)
Merging fuse/for-next (413daa1a3f4a fuse: connection remove fix)
CONFLICT (content): Merge conflict in fs/fuse/file.c
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (bbf5c979011a Linux 5.9)
Merging nfs-anna/linux-next (a2d24bcb97dc nfs: add missing "posix" local_lo=
ck constant table definition)
Merging nfsd/nfsd-next (856deb866d16 Linux 5.9-rc5)
Merging cel/cel-next (13a9a9d74d4d SUNRPC: Fix svc_flush_dcache())
Merging orangefs/for-next (e848643b524b orangefs: remove unnecessary assign=
ment to variable ret)
Merging overlayfs/overlayfs-next (8f6ee74c2786 ovl: rearrange ovl_can_list(=
))
Merging ubifs/next (e2a05cc7f822 ubifs: mount_ubifs: Release authentication=
 resource in error handling path)
Merging v9fs/9p-next (7ca1db21ef8e net: 9p: initialize sun_server.sun_path =
to have addr's value only when addr is valid)
Merging xfs/for-next (e5b23740db9b xfs: fix the indent in xfs_trans_mod_dqu=
ot)
Merging zonefs/for-next (48bfd5c6fac1 zonefs: document the explicit-open mo=
unt option)
Merging iomap/iomap-for-next (1a31182edd00 iomap: Call inode_dio_end() befo=
re generic_write_sync())
Merging djw-vfs/vfs-for-next (e4f9ba20d3b8 fs/xfs: Update xfs_ioctl_setattr=
_dax_invalidate())
Merging file-locks/locks-next (1ad5f100e3ba locks: Remove extra "0x" in tra=
cepoint format specifier)
Merging vfs/for-next (60fb9d4572fa Merge branches 'work.misc', 'work.sparc'=
, 'base.set_fs', 'work.csum_and_copy', 'work.quota-compat', 'compat.mount' =
and 'work.iov_iter', remote-tracking branch 'vfs/work.epoll' into for-next)
CONFLICT (content): Merge conflict in arch/s390/include/asm/checksum.h
Merging printk/for-next (ece33d6abfbc Merge branch 'for-5.10' into for-next)
Merging pci/next (18dcce7bc583 Merge branch 'remotes/lorenzo/pci/xilinx')
CONFLICT (content): Merge conflict in drivers/pci/controller/vmd.c
CONFLICT (content): Merge conflict in drivers/pci/controller/dwc/pci-imx6.c
CONFLICT (content): Merge conflict in arch/x86/kernel/apic/msi.c
Merging pstore/for-next/pstore (137c6236aeec mailmap: Add WeiXiong Liao)
CONFLICT (content): Merge conflict in .mailmap
Merging hid/for-next (f5795950202d Merge branch 'for-5.10/vivaldi' into for=
-next)
Merging i2c/i2c/for-next (48f2192f645c Merge branch 'i2c/for-5.10' into i2c=
/for-next)
Merging i3c/i3c/next (abea14bfdebb i3c: master: Fix error return in cdns_i3=
c_master_probe())
Merging dmi/dmi-for-next (a3d13a0a23ea Replace HTTP links with HTTPS ones: =
DMI/SMBIOS SUPPORT)
Merging hwmon-staging/hwmon-next (9b20aec24b8a hwmon: (pmbus/max20730) adju=
st the vout reading given voltage divider)
Merging jc_docs/docs-next (4fb220da0dd0 gpiolib: Update indentation in driv=
er.rst for code excerpts)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging v4l-dvb/master (c386e0797d26 media: dvb-frontends/drxk_hard.c: fix =
uninitialized variable warning)
Merging v4l-dvb-next/master (0d6db85131e0 Revert "media: atomisp: keep the =
ISP powered on when setting it")
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (91e0225c546b Merge branch 'pm-cpufreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (bc9b9c5ab9d8 cpufreq: qcom: Don=
't add frequencies without an OPP)
Merging cpupower/cpupower (527b7779e5ec cpupower: speed up generating git v=
ersion string)
Merging devfreq/devfreq-next (d353d1202b89 PM / devfreq: tegra30: Improve i=
nitial hardware resetting)
Merging opp/opp/linux-next (a5663c9b1e31 opp: Allow opp-level to be set to =
0)
Merging thermal/thermal/linux-next (48b458591749 thermal: core: Adding miss=
ing nlmsg_free() in thermal_genl_sampling_temp())
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (4f2b30fd9b4b fs: dlm: fix race in nodeid2con)
Merging swiotlb/linux-next (b51e627158cb swiotlb: Mark max_segment with sta=
tic keyword)
Merging rdma/for-next (1c39c16d64bc Merge branch 'dynamic_sg' into rdma.git=
 for-next)
Merging net-next/master (ccdf7fae3afa Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/bpf/bpf-next)
Merging bpf-next/master (376dcfe3a4e5 Merge branch 'bpf, sockmap: allow ver=
dict only sk_skb progs')
Merging ipsec-next/master (61e7113e48d3 Merge 'xfrm: Add compat layer')
Merging mlx5-next/mlx5-next (9d8feb460adb RDMA/mlx5: Add sw_owner_v2 bit ca=
pability)
Merging netfilter-next/master (793d5d612426 netfilter: flowtable: reduce ca=
lls to pskb_may_pull())
Merging ipvs-next/master (c2568c8c9e63 Merge branch 'net-Constify-struct-ge=
nl_small_ops')
Merging wireless-drivers-next/master (df41c19abbea drivers/net/wan/hdlc_fr:=
 Move the skb_headroom check out of fr_hard_header)
Merging bluetooth/master (44d59235ace5 Bluetooth: hci_h5: close serdev devi=
ce and free hu in h5_close)
Merging mac80211-next/master (ba6ff70a3bb7 mac80211: copy configured beacon=
 tx rate to driver)
Merging gfs2/for-next (4d53c8279a20 gfs2: call truncate_inode_pages_final f=
or address space glocks)
Merging mtd/mtd/next (6402f4ce9581 mtd: hyperbus: Fix build failure when on=
ly RPCIF_HYPERBUS is enabled)
Merging nand/nand/next (88e315d12fbb mtd: onenand: simplify the return expr=
ession of onenand_transfer_auto_oob)
Merging spi-nor/spi-nor/next (9a3422a110c8 Revert "mtd: spi-nor: Prefer asy=
nchronous probe")
Merging crypto/master (3093e7c16e12 X.509: Fix modular build of public_key_=
sm2)
Merging drm/drm-next (0d2e90f47c4f Merge tag 'amd-drm-fixes-5.10-2020-10-09=
' of git://people.freedesktop.org/~agd5f/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/selftests/mock_g=
em_device.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_con=
text.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/amdgpu_s=
mu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdkfd/kfd_priv.h
Applying: mark DRM_INGENIC as BROKEN
Applying: lib/scatterlist: merge fix for "drm: allow limiting the scatter l=
ist size."
Merging amdgpu/drm-next (02c3d98ce25b drm/amdgpu: add another raven1 gfxoff=
 quirk)
Merging drm-intel/for-linux-next (214bba50616f drm/i915: Set all unused col=
or plane offsets to ~0xfff again)
Merging drm-tegra/drm/tegra/for-next (d9f980ebcd01 drm/tegra: output: rgb: =
Wrap directly-connected panel into DRM bridge)
Merging drm-misc/for-linux-next (d3c8f2784d32 drm/ingenic: Fix bad revert)
Applying: mark DRM_INGENIC as not BROKEN
Merging drm-msm/msm-next (d1ea91492585 drm/msm/dp: fix incorrect function p=
rototype of dp_debug_get())
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (efd5a93d2a89 drm/imx: drop explicit drm_mode_=
config_cleanup)
Merging etnaviv/etnaviv/next (3136fed4f91e drm/etnaviv: Drop local dma_parm=
s)
Merging regmap/for-next (6e0545c4f083 Merge remote-tracking branch 'regmap/=
for-5.10' into regmap-next)
Merging sound/for-next (f401b2c9931a Merge tag 'asoc-v5.10' of https://git.=
kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus)
Merging sound-asoc/for-next (c890e30b069a Merge remote-tracking branch 'aso=
c/for-5.10' into asoc-next)
Merging modules/modules-next (fdf09ab88782 module: statically initialize in=
it section freeing data)
Merging input/next (8a30c6eb29e0 Input: Add MAINTAINERS entry for SiS i2c t=
ouch input driver)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/ven=
dor-prefixes.yaml
Merging block/for-next (2675918aee54 Merge branch 'for-5.10/io_uring' into =
for-next)
Merging device-mapper/for-next (681cc5e8667e dm: fix request-based DM to no=
t bounce through indirect dm_submit_bio)
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (1e23400f1a73 mmc: sdhci_am654: Fix module autoload)
CONFLICT (content): Merge conflict in drivers/mmc/host/Kconfig
Merging mfd/for-mfd-next (6d81dc3c79d4 mfd: kempld-core: Fix unused variabl=
e 'kempld_acpi_table' when !ACPI)
CONFLICT (content): Merge conflict in drivers/irqchip/Makefile
Merging backlight/for-backlight-next (97ecfda1a8ff backlight: tosa_bl: Incl=
ude the right header)
Merging battery/for-next (58d1620c4ded power: supply: ltc2941: Fix ptr to e=
num cast)
Merging regulator/for-next (c6e70a6fd5ce Merge remote-tracking branch 'regu=
lator/for-5.10' into regulator-next)
Merging security/next-testing (bc62d68e2a0a device_cgroup: Fix RCU list deb=
ugging warning)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (aa662fc04f5b ima: Fix NULL pointer derefe=
rence in ima_file_hash)
Merging keys/keys-next (b6f61c314649 keys: Implement update for the big_key=
 type)
Merging safesetid/safesetid-next (0476c865ded6 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (0d50f059c4cd selinux: provide a "no sooner than" date=
 for the checkreqprot removal)
Merging smack/next (edd615371b66 Smack: Remove unnecessary variable initial=
ization)
Merging tomoyo/master (5384d92e4e02 tomoyo: Loosen pathname/domainname vali=
dation.)
Merging tpmdd/next (7b9be800756f MAINTAINERS: TPM DEVICE DRIVER: Update GIT)
Merging watchdog/master (a1b8638ba132 Linux 5.9-rc7)
Merging iommu/next (7e3c3883c381 Merge branches 'arm/allwinner', 'arm/media=
tek', 'arm/renesas', 'arm/tegra', 'arm/qcom', 'arm/smmu', 'ppc/pamu', 'x86/=
amd', 'x86/vt-d' and 'core' into next)
CONFLICT (content): Merge conflict in include/linux/iommu.h
Applying: merge fix upt for iommu_flush_iotlb_all() rename
Merging vfio/next (2099363255f1 Merge branches 'v5.10/vfio/fsl-mc-v6' and '=
v5.10/vfio/zpci-info-v3' into v5.10/vfio/next)
CONFLICT (content): Merge conflict in arch/s390/pci/pci_bus.c
$ git reset --hard HEAD^
Merging next-20201012 version of vfio
CONFLICT (content): Merge conflict in arch/s390/pci/pci_bus.c
[master c2c6d3f5b64a] next-20201012/vfio
Merging audit/next (c07203516439 audit: Remove redundant null check)
Merging devicetree/for-next (0450d1f9a295 dt-bindings: arm: hisilicon: add =
missing properties into cpuctrl.yaml)
Merging mailbox/mailbox-for-next (62c04453381e mailbox: cancel timer before=
 starting it)
Merging spi/for-next (988731181359 Merge remote-tracking branch 'spi/for-5.=
10' into spi-next)
Merging tip/auto-latest (a292570e9f69 Merge branch 'x86/urgent')
CONFLICT (content): Merge conflict in arch/x86/kernel/setup.c
CONFLICT (content): Merge conflict in arch/x86/kernel/cpu/cpuid-deps.c
CONFLICT (content): Merge conflict in arch/x86/include/asm/special_insns.h
CONFLICT (content): Merge conflict in arch/arm/Makefile
Applying: perf build: Allow nested externs to enable BUILD_BUG() usage
Merging clockevents/timers/drivers/next (f087e452f27e clocksource: sp804: e=
nable Hisilicon sp804 timer 64bit mode)
Merging edac/edac-for-next (eea32b7fdcb5 Merge branch 'edac-misc' into edac=
-for-next)
Merging irqchip/irq/irqchip-next (63ea38a40221 Merge branch 'irq/mstar' int=
o irq/irqchip-next)
Merging ftrace/for-next (848183553e43 tracing: Fix synthetic print fmt chec=
k for use of __get_str())
Merging rcu/rcu/next (a9863c90f503 Merge branch 'urezki-pcount.2020.10.01a'=
 into HEAD)
Merging kvm/linux-next (e792415c5d3e KVM: MIPS/VZ: Fix build error caused b=
y 'kvm_run' cleanup)
Merging kvm-arm/next (4e5dc64c4319 Merge branches 'kvm-arm64/pt-new' and 'k=
vm-arm64/pmu-5.9' into kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (cf59eb13e151 KVM: PPC: Book3S: Fix symbol und=
eclared warnings)
Merging kvms390/next (23a60f834406 s390/kvm: diagnose 0x318 sync and reset)
Merging xen-tip/linux-next (32118f97f41d x86/xen: Fix typo in xen_pagetable=
_p2m_free())
Merging percpu/for-next (eff623d602db Merge branch 'for-5.9-fixes' into for=
-next)
Merging workqueues/for-next (10cdb1575954 workqueue: use BUILD_BUG_ON() for=
 compile time test instead of WARN_ON())
Merging drivers-x86/for-next (1a3f7813f38e MAINTAINERS: update X86 PLATFORM=
 DRIVERS entry with new kernel.org git repo)
Merging chrome-platform/for-next (3e98fd6d816c ARM: dts: cros-ec-keyboard: =
Add alternate keymap for KEY_LEFTMETA)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (19d2e0cef0b1 leds: pwm: Remove platform_data support)
Merging ipmi/for-next (8fe7990ceda8 ipmi_si: Fix wrong return value in try_=
smi_init())
Merging driver-core/driver-core-next (ee4906770ee9 regmap: debugfs: use sem=
icolons rather than commas to separate statements)
Merging usb/usb-next (93578a25d4e2 usb: musb: gadget: Use fallthrough pseud=
o-keyword)
CONFLICT (content): Merge conflict in drivers/usb/dwc3/gadget.c
CONFLICT (content): Merge conflict in drivers/usb/dwc3/dwc3-of-simple.c
CONFLICT (content): Merge conflict in drivers/usb/cdns3/gadget.c
CONFLICT (content): Merge conflict in drivers/pci/controller/pcie-brcmstb.c
Applying: net: usb: rtl8150: don't incorrectly assign random MAC addresses
Merging usb-gadget/next (b2c586eb07ef usb: dwc2: Fix INTR OUT transfers in =
DDMA mode.)
Merging usb-serial/usb-next (3e765cab8abe USB: serial: option: add Cellient=
 MPL200 card)
Merging usb-chipidea-next/ci-for-usb-next (71ac680e6339 usb: chipidea: ci_h=
drc_imx: restore pinctrl)
Merging phy-next/next (60f5a24c11f7 phy: qcom-qmp: initialize the pointer t=
o NULL)
Merging tty/tty-next (4be87603b6dc serial: mcf: add sysrq capability)
CONFLICT (content): Merge conflict in drivers/video/console/sticon.c
Merging char-misc/char-misc-next (f3277cbfba76 binder: fix UAF when releasi=
ng todo list)
CONFLICT (content): Merge conflict in drivers/misc/ocxl/Kconfig
CONFLICT (content): Merge conflict in MAINTAINERS
Merging extcon/extcon-next (dbc888072a97 extcon: axp288: Use module_platfor=
m_driver to simplify the code)
Merging soundwire/next (0173f525b2c1 soundwire: sysfs: add slave status and=
 device number before probe)
Merging thunderbolt/next (810278da901c thunderbolt: Capitalize comment on t=
op of QUIRK_FORCE_POWER_LINK_CONTROLLER)
Merging staging/staging-next (e1f13c879a7c staging: comedi: check validity =
of wMaxPacketSize of usb endpoints found)
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (86d6e5793e0f interconnect: imx: simplify the return e=
xpression of imx_icc_unregister)
Merging dmaengine/next (fc143e38ddd4 dmaengine: owl-dma: fix kernel-doc sty=
le for enum)
Merging cgroup/for-next (65026da59cda cgroup: Zero sized write should be no=
-op)
Merging scsi/for-next (1edad2ddea67 Merge branch 'misc' into for-next)
CONFLICT (content): Merge conflict in drivers/scsi/aacraid/aachba.c
Merging scsi-mkp/for-next (1ef16a407f54 scsi: qla2xxx: Fix return of uninit=
ialized value in rval)
Merging vhost/linux-next (65457c87de66 vdpa/mlx5: Fix failure to bring link=
 up)
Merging rpmsg/for-next (62180d7eae2f Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (3d6e8262d3c0 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (cf048e05b687 tools: gpio: add debounce sup=
port to gpio-event-mon)
Merging gpio-intel/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging pinctrl/for-next (c348abca14dc Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (a0bf06dc51db pinctrl: cherryview: Preserve =
CHV_PADCTRL1_INVRXTX_TXDATA flag on GPIOs)
Merging pinctrl-samsung/for-next (bbf5c979011a Linux 5.9)
Merging pwm/for-next (3b1954cd57bf dt-bindings: pwm: renesas,pwm-rcar: Add =
r8a7742 support)
Merging userns/for-next (7fce69dff8db Implement kernel_execve)
Merging ktest/for-next (ff131efff141 ktest.pl: Fix spelling mistake "Cant" =
-> "Can't")
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (4c8511317b4e doc: dev-tools: kselftest.rst: Update =
examples and paths)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (59fc1e476962 Merge branch 'for-5.10/flive-pa=
tching' into for-next)
Merging coresight/next (347732627745 coresight: etm4x: Fix save and restore=
 of TRCVMIDCCTLR1 register)
Merging rtc/rtc-next (179b4bcc4c0c rtc: rv8803: simplify the return express=
ion of rv8803_nvram_write)
Merging nvdimm/libnvdimm-for-next (a1b8638ba132 Linux 5.9-rc7)
Merging at24/at24/for-next (61f764c307f6 eeprom: at24: Support custom devic=
e names for AT24 EEPROMs)
Merging ntb/ntb-next (b8e2c8bbdf77 NTB: Use struct_size() helper in devm_kz=
alloc())
Merging seccomp/for-next/seccomp (dfe719fef03d seccomp: Make duplicate list=
ener detection non-racy)
Merging kspp/for-next/kspp (9b80e4c4ddac overflow: Add __must_check attribu=
te to check_*() helpers)
Merging gnss/gnss-next (48778464bb7d Linux 5.8-rc2)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (1cf257875246 slimbus: qcom-ngd-ctrl: disable ngd =
in qmi server down callback)
Merging nvmem/for-next (02200a863b9a nvmem: core: fix missing of_node_put()=
 in of_nvmem_device_get())
Merging xarray/main (50454f72a1d4 radix-tree: fix the comment of radix_tree=
_next_slot())
Merging hyperv/hyperv-next (1f3aed01473c hv: clocksource: Add notrace attri=
bute to read_hv_sched_clock_*() functions)
Merging auxdisplay/auxdisplay (46d4a403a04c auxdisplay: Replace HTTP links =
with HTTPS ones)
Merging kgdb/kgdb/for-next (d081a6e35316 kdb: Fix pager search for multi-li=
ne strings)
Merging pidfd/for-next (e06ce5515b74 Merge branch 'pidfd_o_nonblock' into f=
or-next)
Merging hmm/hmm (0c16d9635e3a RDMA/umem: Move to allocate SG table from pag=
es)
Merging fpga/for-next (e1e66168c769 Merge branch 'devm_fpga_mgr_register' i=
nto for-next)
Merging kunit/test (9123e3a74ec7 Linux 5.9-rc1)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (5de15b610f78 mtd: hyperbus: add Renesas RPC-IF driver)
Merging kunit-next/kunit (a82763e63ee7 Documentation: kunit: add a brief bl=
urb about kunit_test_suite)
Merging trivial/for-next (2a9b29b28983 xtensa: fix Kconfig typo)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (298edb32160f bus: mhi: debugfs: Print channel context=
 read-pointer)
Merging notifications/notifications-pipe-core (841a0dfa5113 watch_queue: sa=
mple: Display mount tree change notifications)
Merging memblock/for-next (762d4d1a174c arch/ia64: Restore arch-specific pg=
d_offset_k implementation)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (2095725c325b drivers/edac: convert pci counters =
to counter_atomic32)
CONFLICT (content): Merge conflict in drivers/char/ipmi/ipmi_msghandler.c
Merging akpm-current/current (9e02dcbaab9c x86: add failure injection to ge=
t/put/clear_user)
CONFLICT (content): Merge conflict in mm/page-writeback.c
CONFLICT (content): Merge conflict in mm/filemap.c
CONFLICT (content): Merge conflict in lib/kunit/test.c
CONFLICT (content): Merge conflict in lib/Makefile
CONFLICT (content): Merge conflict in include/linux/sched.h
CONFLICT (content): Merge conflict in include/acpi/acpi_numa.h
CONFLICT (content): Merge conflict in drivers/acpi/numa/hmat.c
CONFLICT (content): Merge conflict in arch/powerpc/platforms/pseries/hotplu=
g-memory.c
CONFLICT (content): Merge conflict in arch/powerpc/mm/kasan/kasan_init_32.c
CONFLICT (content): Merge conflict in arch/arm64/mm/mmu.c
Applying: fs/fuse/virtio_fs.c: fix for "mm/memremap_pages: convert to 'stru=
ct range'"
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (5048830f8b64 mm: remove duplicate include statement in=
 mmu.c)

--Sig_/KFBvBOVR6p.YpR7ND0N6gaY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+FX5gACgkQAVBC80lX
0GyqWQf9GQxB3Ps6KQaKAj835BcRPWq30jjaweGVw6faGU3gNZiv/FRfnENTQB2m
8RA0HzMTTvn1wG5VziWX74gaK1P9+Rt8M9d3vM58UfNO+G1ebO0OtWLjFlZhLlbU
GOkY5KNq/u1N4bluOOWqY9vjXV78o1A+h50SyJlPaWLwgt+nT81l2q8w+Y4NUoja
F0RB2GM8PGy0R3cutwQeNpuNd6xjhntnATiTIgNHFiLsugo/J3kfcpYy2H3tNBtq
82P2+7uXe6ANqLEy+ey/mJF4oi4V8Z8Z5LJH49otdLr+PulREJzSNiYViVzwhSe0
YIbIhJ8nsIsj53o3vUAeDv2YmzsItQ==
=yQxZ
-----END PGP SIGNATURE-----

--Sig_/KFBvBOVR6p.YpR7ND0N6gaY--
