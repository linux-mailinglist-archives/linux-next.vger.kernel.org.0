Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 085FB294723
	for <lists+linux-next@lfdr.de>; Wed, 21 Oct 2020 06:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393704AbgJUEIK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Oct 2020 00:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbgJUEIJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Oct 2020 00:08:09 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E01AC0613CE;
        Tue, 20 Oct 2020 21:08:09 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CGH5y5d3bz9sPB;
        Wed, 21 Oct 2020 15:08:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603253286;
        bh=M8AgxRLqoj9FgK0B9V1bdMN0rvc+hwcD3m1qm0ygUN4=;
        h=Date:From:To:Cc:Subject:From;
        b=iYlr/D6Lf56wRgAZsbfo7l4N/Bfu/2PbkmLgBzLgtKga+kr0MvtUUbKP8CakXlxsz
         Coe4u3zJc/d6NM6rUDObYU3J1en8oA2nsSFYgWoMF9/q1ITN8gv66wGGT6AK8YpkN7
         h4uQVImaEXC9D5gsnuxkM3fuXRLWaOt7Xetq7w/zAFYs45SM+k0zGXNhb22WfgkXfL
         MG+b+WW+kK++r3012qRWA9ICFw9t5XG4df8tsCM41hn+WF8Cwe4ZI/hbGY0B0UV8CN
         BWsHvLofhdfRgssOy7QzXL3FyoueALAkwa4KvrsSYjEi/wpWyNiZKbZSldoV1+gzeR
         OBWuSe7GeE5mQ==
Date:   Wed, 21 Oct 2020 15:08:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 21
Message-ID: <20201021150804.408b808a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9fmqdnRTd0xWrVms.jXKs0y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9fmqdnRTd0xWrVms.jXKs0y
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Since the merge window is open, please do not add any v5.11 material to
your linux-next included branches until after v5.10-rc1 has been released.

Changes since 20201016:

The ext4 tree gained a conflict against Linus' tree.

The pm tree gained a conflict against the arm-soc tree.

The rpmsg tree lost its build failure.

The notifications tree gained conflicts against Linus' tree.

Non-merge commits (relative to Linus' tree): 2526
 2790 files changed, 354749 insertions(+), 44466 deletions(-)

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
Merging origin/master (38525c6919e2 Merge tag 'for-v5.10' of git://git.kern=
el.org/pub/scm/linux/kernel/git/sre/linux-power-supply)
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
Merging powerpc-fixes/fixes (d1781f237047 selftests/powerpc: Make alignment=
 handler test P9N DD2.1 vector CI load workaround)
Merging s390-fixes/fixes (549738f15da0 Linux 5.9-rc8)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (618355cc6a0d nfc: remove unneeded break)
Merging bpf/master (8568c3cefd51 bpf: selftest: Ensure the return value of =
the bpf_per_cpu_ptr() must be checked)
Merging ipsec/master (7fe94612dd4c xfrm: interface: fix the priorities for =
ipip and ipv6 tunnels)
Merging netfilter/master (31cc578ae2de netfilter: nftables_offload: KASAN s=
lab-out-of-bounds Read in nft_flow_rule_create)
Merging ipvs/master (48d072c4e8cd selftests: netfilter: add time counter ch=
eck)
Merging wireless-drivers/master (df41c19abbea drivers/net/wan/hdlc_fr: Move=
 the skb_headroom check out of fr_hard_header)
Merging mac80211/master (9ff9b0d392ea Merge tag 'net-next-5.10' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging rdma-fixes/for-rc (a1b8638ba132 Linux 5.9-rc7)
Merging sound-current/for-linus (7da4c510abff ALSA: usb-audio: Line6 Pod Go=
 interface requires static clock rate quirk)
Merging sound-asoc-fixes/for-linus (8101e3024d76 Merge remote-tracking bran=
ch 'asoc/for-5.10' into asoc-linus)
Merging regmap-fixes/for-linus (549738f15da0 Linux 5.9-rc8)
Merging regulator-fixes/for-linus (b7c11f48ff81 Merge remote-tracking branc=
h 'regulator/for-5.10' into regulator-linus)
Merging spi-fixes/for-linus (d4f3a651ab82 Merge remote-tracking branch 'spi=
/for-5.9' into spi-linus)
Merging pci-current/for-linus (76a6b0b90d53 MAINTAINERS: Add Pali Roh=C3=A1=
r as aardvark PCI maintainer)
Merging driver-core.current/driver-core-linus (270315b8235e Merge tag 'risc=
v-for-linus-5.10-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/risc=
v/linux)
Merging tty.current/tty-linus (270315b8235e Merge tag 'riscv-for-linus-5.10=
-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging usb.current/usb-linus (270315b8235e Merge tag 'riscv-for-linus-5.10=
-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging usb-gadget-fixes/fixes (51609fba0cca usb: dwc3: simple: add support=
 for Hikey 970)
CONFLICT (content): Merge conflict in drivers/usb/dwc3/gadget.c
CONFLICT (content): Merge conflict in drivers/usb/dwc3/dwc3-of-simple.c
CONFLICT (content): Merge conflict in drivers/usb/cdns3/gadget.c
Merging usb-serial-fixes/usb-linus (856deb866d16 Linux 5.9-rc5)
Merging usb-chipidea-fixes/ci-for-usb-stable (2d79b3360dcc usb: chipidea: c=
ore: add wakeup support for extcon)
Merging phy/fixes (850280156f64 phy: ti: am654: Fix a leak in serdes_am654_=
probe())
Merging staging.current/staging-linus (270315b8235e Merge tag 'riscv-for-li=
nus-5.10-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging char-misc.current/char-misc-linus (270315b8235e Merge tag 'riscv-fo=
r-linus-5.10-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/li=
nux)
Merging soundwire-fixes/fixes (3fbbf2148a40 soundwire: fix double free of d=
angling pointer)
Merging thunderbolt-fixes/fixes (bbf5c979011a Linux 5.9)
Merging input-current/for-linus (bb0bc0cfeabc Merge branch 'next' into for-=
linus)
Merging crypto-current/master (3093e7c16e12 X.509: Fix modular build of pub=
lic_key_sm2)
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
Merging btrfs-fixes/next-fixes (9c785122ab64 Merge branch 'misc-5.10' into =
next-fixes)
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
Merging mmc-fixes/fixes (b3e1ea16fb39 mmc: sdhci: Use Auto CMD Auto Select =
only when v4_mode is true)
Merging rtc-fixes/rtc-fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging gnss-fixes/gnss-linus (48778464bb7d Linux 5.8-rc2)
Merging hyperv-fixes/hyperv-fixes (2c3bd2a5c86f hv_balloon: disable warning=
 when floor reached)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (84814460eef9 riscv: Fixup bootup failure with H=
ARDENED_USERCOPY)
Merging pidfd-fixes/fixes (bda4c60d02e9 sys: Convert to the new fallthrough=
 notation)
Merging fpga-fixes/fixes (8614afd689df fpga: dfl: fix bug in port reset han=
dshake)
Merging spdx/spdx-linus (3e4fb4346c78 Merge tag 'spdx-5.10-rc1' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/gregkh/spdx)
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
Merging kbuild/for-next (6f8360f87334 Merge branch 'kconfig' into for-next)
CONFLICT (content): Merge conflict in arch/arm/Makefile
Merging compiler-attributes/compiler-attributes (bbf5c979011a Linux 5.9)
Merging dma-mapping/for-next (0eb3b4ab762d ARM/sa1111: add a missing includ=
e of dma-map-ops.h)
Merging asm-generic/master (9123e3a74ec7 Linux 5.9-rc1)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (adc5f7029376 ARM: add malloc size to decompressor kex=
ec size structure)
Merging arm64/for-next/core (3b92fa7485eb arm64: link with -z norelro regar=
dless of CONFIG_RELOCATABLE)
Merging arm-perf/for-next/perf (887e2cff0f8d perf: arm-cmn: Fix conversion =
specifiers for node type)
Merging arm-soc/for-next (4bb6c7b93462 ARM: Document merges)
CONFLICT (content): Merge conflict in drivers/mmc/host/Kconfig
CONFLICT (modify/delete): arch/arm/mach-imx/mach-mx31moboard.c deleted in a=
rm-soc/for-next and modified in HEAD. Version HEAD of arch/arm/mach-imx/mac=
h-mx31moboard.c left in tree.
CONFLICT (modify/delete): arch/arm/mach-imx/mach-imx27_visstrim_m10.c delet=
ed in arm-soc/for-next and modified in HEAD. Version HEAD of arch/arm/mach-=
imx/mach-imx27_visstrim_m10.c left in tree.
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/ven=
dor-prefixes.yaml
$ git rm -f arch/arm/mach-imx/mach-imx27_visstrim_m10.c arch/arm/mach-imx/m=
ach-mx31moboard.c
Merging amlogic/for-next (c56e4ad07fb3 Merge branch 'v5.10/drivers' into tm=
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
Merging scmi/for-linux-next (7c1ae3208ef2 Merge tag 'scmi-fixes-5.10' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-lin=
ux-next)
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
Merging clk/clk-next (5f56888fad46 Merge branches 'clk-ingenic', 'clk-at91'=
, 'clk-kconfig', 'clk-imx', 'clk-qcom', 'clk-prima2' and 'clk-bcm' into clk=
-next)
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
Merging microblaze/next (4a17e8513376 microblaze: fix kbuild redundant file=
 warning)
Merging mips/mips-next (cf3af0a4d3b6 MIPS: DEC: Restore bootmem reservation=
 for firmware working memory area)
Merging nds32/next (54bde873682b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (55b2662ec665 openrisc: uaccess: Add user address=
 space check to access_ok)
Merging parisc-hd/for-next (bbf5c979011a Linux 5.9)
Merging powerpc/next (ffd0b25ca049 Revert "powerpc/pci: unmap legacy INTx i=
nterrupts when a PHB is removed")
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (d97b957e32b1 soc: fsl: qe: Remove unnessesary check i=
n ucc_set_tdm_rxtx_clk)
Merging risc-v/for-next (e8d444d3e98c riscv: remove address space overrides=
 using set_fs())
CONFLICT (content): Merge conflict in arch/x86/lib/getuser.S
CONFLICT (content): Merge conflict in arch/s390/Kconfig
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
Merging btrfs/for-next (c4795f038f2e Merge branch 'for-next-current-v5.9-20=
201015' into for-next-20201015)
Merging ceph/master (28e1581c3b4e libceph: clear con->out_msg on Policy::st=
ateful_server faults)
Merging cifs/for-next (3ece60e3e78e cifs: make const array static, makes ob=
ject smaller)
Merging configfs/for-next (76ecfcb0852e samples: configfs: prefer pr_err() =
over bare printk(KERN_ERR)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (915f4c9358db erofs: remove unnecessary enum entries)
Merging exfat/dev (e17632ef8874 exfat: remove useless check in exfat_move_f=
ile())
Merging ext3/for_next (e44b86917b3f Pull direct IO fix from Gabriel Krisman=
.)
Merging ext4/dev (8d8282d4a358 ext4: add fast commit stats in procfs)
CONFLICT (content): Merge conflict in fs/ext4/ialloc.c
Merging f2fs/dev (071a0578b0ce Merge tag 'ovl-update-5.10' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/mszeredi/vfs)
Merging fsverity/fsverity (f3db0bed4583 fs-verity: use smp_load_acquire() f=
or ->i_verity_info)
Merging fuse/for-next (42d3e2d041f0 virtiofs: calculate number of scatter-g=
ather elements accurately)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (bbf5c979011a Linux 5.9)
Merging nfs-anna/linux-next (8c39076c276b NFSv4.2: support EXCHGID4_FLAG_SU=
PP_FENCE_OPS 4.2 EXCHANGE_ID flag)
Merging nfsd/nfsd-next (856deb866d16 Linux 5.9-rc5)
Merging cel/cel-next (13a9a9d74d4d SUNRPC: Fix svc_flush_dcache())
Merging orangefs/for-next (e848643b524b orangefs: remove unnecessary assign=
ment to variable ret)
Merging overlayfs/overlayfs-next (be4df0cea08a ovl: use generic vfs_ioc_set=
flags_prepare() helper)
Merging ubifs/next (e2a05cc7f822 ubifs: mount_ubifs: Release authentication=
 resource in error handling path)
Merging v9fs/9p-next (7ca1db21ef8e net: 9p: initialize sun_server.sun_path =
to have addr's value only when addr is valid)
Merging xfs/for-next (894645546bb1 xfs: fix Kconfig asking about XFS_SUPPOR=
T_V4 when XFS_FS=3Dn)
Merging zonefs/for-next (48bfd5c6fac1 zonefs: document the explicit-open mo=
unt option)
Merging iomap/iomap-for-next (1a31182edd00 iomap: Call inode_dio_end() befo=
re generic_write_sync())
Merging djw-vfs/vfs-for-next (407e9c63ee57 vfs: move the generic write and =
copy checks out of mm)
CONFLICT (content): Merge conflict in fs/Makefile
Merging file-locks/locks-next (1ad5f100e3ba locks: Remove extra "0x" in tra=
cepoint format specifier)
Merging vfs/for-next (bcc4e60be0f8 Merge branch 'work.set_fs' into for-next)
Merging printk/for-next (26911e6b1302 Merge branch 'for-5.10-fixup' into fo=
r-next)
Merging pci/next (065c21a8f8a4 Merge branch 'remotes/lorenzo/pci/xilinx')
CONFLICT (content): Merge conflict in drivers/pci/controller/vmd.c
CONFLICT (content): Merge conflict in drivers/pci/controller/pcie-brcmstb.c
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
Merging v4l-dvb/master (c386e0797d26 media: dvb-frontends/drxk_hard.c: fix =
uninitialized variable warning)
Merging v4l-dvb-next/master (f4a45be35c34 PM / devfreq: remove a duplicated=
 kernel-doc markup)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (bca751af60f1 Merge branches 'powercap' and 'pm-domai=
ns' into linux-next)
CONFLICT (content): Merge conflict in drivers/soc/ti/Makefile
Merging cpufreq-arm/cpufreq/arm/linux-next (bc9b9c5ab9d8 cpufreq: qcom: Don=
't add frequencies without an OPP)
Merging cpupower/cpupower (527b7779e5ec cpupower: speed up generating git v=
ersion string)
Merging devfreq/devfreq-next (953327265ee4 PM / devfreq: Add tracepoint for=
 frequency changes)
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
Merging rdma/for-next (c7a198c70076 RDMA/ucma: Fix use after free in destro=
y id flow)
Merging net-next/master (9ff9b0d392ea Merge tag 'net-next-5.10' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging bpf-next/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://=
git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging ipsec-next/master (61e7113e48d3 Merge 'xfrm: Add compat layer')
Merging mlx5-next/mlx5-next (9d8feb460adb RDMA/mlx5: Add sw_owner_v2 bit ca=
pability)
Merging netfilter-next/master (9ff9b0d392ea Merge tag 'net-next-5.10' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging ipvs-next/master (c2568c8c9e63 Merge branch 'net-Constify-struct-ge=
nl_small_ops')
Merging wireless-drivers-next/master (df41c19abbea drivers/net/wan/hdlc_fr:=
 Move the skb_headroom check out of fr_hard_header)
Merging bluetooth/master (44d59235ace5 Bluetooth: hci_h5: close serdev devi=
ce and free hu in h5_close)
Merging mac80211-next/master (9ff9b0d392ea Merge tag 'net-next-5.10' of git=
://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging gfs2/for-next (3288b677fbb5 gfs2: Recover statfs info in journal he=
ad)
Merging mtd/mtd/next (6402f4ce9581 mtd: hyperbus: Fix build failure when on=
ly RPCIF_HYPERBUS is enabled)
Merging nand/nand/next (88e315d12fbb mtd: onenand: simplify the return expr=
ession of onenand_transfer_auto_oob)
Merging spi-nor/spi-nor/next (9a3422a110c8 Revert "mtd: spi-nor: Prefer asy=
nchronous probe")
Merging crypto/master (3093e7c16e12 X.509: Fix modular build of public_key_=
sm2)
Merging drm/drm-next (40b99050455b Merge tag 'drm-intel-next-fixes-2020-10-=
15' of git://anongit.freedesktop.org/drm/drm-intel into drm-next)
Merging amdgpu/drm-next (02c3d98ce25b drm/amdgpu: add another raven1 gfxoff=
 quirk)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/amdgpu_s=
mu.c
Merging drm-intel/for-linux-next (4a9bb58aba6d drm/i915/gt: Wait for CSB en=
tries on Tigerlake)
Merging drm-tegra/drm/tegra/for-next (d9f980ebcd01 drm/tegra: output: rgb: =
Wrap directly-connected panel into DRM bridge)
Merging drm-misc/for-linux-next (272d70895113 Fonts: Support FONT_EXTRA_WOR=
DS macros for font_6x8)
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
Merging sound/for-next (7da4c510abff ALSA: usb-audio: Line6 Pod Go interfac=
e requires static clock rate quirk)
Merging sound-asoc/for-next (8101e3024d76 Merge remote-tracking branch 'aso=
c/for-5.10' into asoc-linus)
Merging modules/modules-next (fdf09ab88782 module: statically initialize in=
it section freeing data)
Merging input/next (8a30c6eb29e0 Input: Add MAINTAINERS entry for SiS i2c t=
ouch input driver)
Merging block/for-next (268d95ae6fd1 Merge branch 'io_uring-5.10' into for-=
next)
Merging device-mapper/for-next (681cc5e8667e dm: fix request-based DM to no=
t bounce through indirect dm_submit_bio)
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (3e4fb4346c78 Merge tag 'spdx-5.10-rc1' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/gregkh/spdx)
Merging mfd/for-mfd-next (6d81dc3c79d4 mfd: kempld-core: Fix unused variabl=
e 'kempld_acpi_table' when !ACPI)
Merging backlight/for-backlight-next (97ecfda1a8ff backlight: tosa_bl: Incl=
ude the right header)
Merging battery/for-next (7007fab4ae82 power: reset: POWER_RESET_OCELOT_RES=
ET should depend on Ocelot or Sparx5)
Merging regulator/for-next (b7c11f48ff81 Merge remote-tracking branch 'regu=
lator/for-5.10' into regulator-linus)
Merging security/next-testing (bc62d68e2a0a device_cgroup: Fix RCU list deb=
ugging warning)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (aa662fc04f5b ima: Fix NULL pointer derefe=
rence in ima_file_hash)
Merging keys/keys-next (b6f61c314649 keys: Implement update for the big_key=
 type)
Merging safesetid/safesetid-next (03ca0ec13892 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (0d50f059c4cd selinux: provide a "no sooner than" date=
 for the checkreqprot removal)
Merging smack/next (edd615371b66 Smack: Remove unnecessary variable initial=
ization)
Merging tomoyo/master (5384d92e4e02 tomoyo: Loosen pathname/domainname vali=
dation.)
Merging tpmdd/next (d3b03163a328 tpm_tis: Disable interrupts on ThinkPad T4=
90s)
Merging watchdog/master (c5b8e4644607 watchdog: Add Toshiba Visconti watchd=
og driver)
Merging iommu/next (7e3c3883c381 Merge branches 'arm/allwinner', 'arm/media=
tek', 'arm/renesas', 'arm/tegra', 'arm/qcom', 'arm/smmu', 'ppc/pamu', 'x86/=
amd', 'x86/vt-d' and 'core' into next)
Merging audit/next (c07203516439 audit: Remove redundant null check)
Merging devicetree/for-next (bd36e51d10e7 dt-bindings: misc: explicitly add=
 #address-cells for slave mode)
Merging mailbox/mailbox-for-next (c7dacf5b0f32 mailbox: avoid timer start f=
rom callback)
Merging spi/for-next (988731181359 Merge remote-tracking branch 'spi/for-5.=
10' into spi-next)
Merging tip/auto-latest (c8cd075be67b Merge branch 'core/rcu')
Merging clockevents/timers/drivers/next (f087e452f27e clocksource: sp804: e=
nable Hisilicon sp804 timer 64bit mode)
Merging edac/edac-for-next (eea32b7fdcb5 Merge branch 'edac-misc' into edac=
-for-next)
Merging irqchip/irq/irqchip-next (d26dd4131d0d irqchip/mips: Drop selection=
 of IRQ_DOMAIN_HIERARCHY)
Merging ftrace/for-next (ce66f6136460 tracing: Remove __init from __trace_e=
arly_add_new_event())
Merging rcu/rcu/next (a9863c90f503 Merge branch 'urezki-pcount.2020.10.01a'=
 into HEAD)
Merging kvm/linux-next (e792415c5d3e KVM: MIPS/VZ: Fix build error caused b=
y 'kvm_run' cleanup)
Merging kvm-arm/next (4e5dc64c4319 Merge branches 'kvm-arm64/pt-new' and 'k=
vm-arm64/pmu-5.9' into kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (cf59eb13e151 KVM: PPC: Book3S: Fix symbol und=
eclared warnings)
Merging kvms390/next (23a60f834406 s390/kvm: diagnose 0x318 sync and reset)
Merging xen-tip/linux-next (5f7f77400ab5 xen/events: block rogue events for=
 some time)
Merging percpu/for-next (eff623d602db Merge branch 'for-5.9-fixes' into for=
-next)
Merging workqueues/for-next (10cdb1575954 workqueue: use BUILD_BUG_ON() for=
 compile time test instead of WARN_ON())
Merging drivers-x86/for-next (1a3f7813f38e MAINTAINERS: update X86 PLATFORM=
 DRIVERS entry with new kernel.org git repo)
Merging chrome-platform/for-next (3e98fd6d816c ARM: dts: cros-ec-keyboard: =
Add alternate keymap for KEY_LEFTMETA)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (3e4fb4346c78 Merge tag 'spdx-5.10-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/spdx)
Merging ipmi/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://git.=
kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging driver-core/driver-core-next (270315b8235e Merge tag 'riscv-for-lin=
us-5.10-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging usb/usb-next (270315b8235e Merge tag 'riscv-for-linus-5.10-mw0' of =
git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging usb-gadget/next (b2c586eb07ef usb: dwc2: Fix INTR OUT transfers in =
DDMA mode.)
Merging usb-serial/usb-next (3e765cab8abe USB: serial: option: add Cellient=
 MPL200 card)
Merging usb-chipidea-next/ci-for-usb-next (71ac680e6339 usb: chipidea: ci_h=
drc_imx: restore pinctrl)
Merging phy-next/next (60f5a24c11f7 phy: qcom-qmp: initialize the pointer t=
o NULL)
Merging tty/tty-next (270315b8235e Merge tag 'riscv-for-linus-5.10-mw0' of =
git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging char-misc/char-misc-next (270315b8235e Merge tag 'riscv-for-linus-5=
.10-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging extcon/extcon-next (736696906a3c dt-bindings: extcon: add binding f=
or TUSB320)
Merging soundwire/next (0173f525b2c1 soundwire: sysfs: add slave status and=
 device number before probe)
Merging thunderbolt/next (810278da901c thunderbolt: Capitalize comment on t=
op of QUIRK_FORCE_POWER_LINK_CONTROLLER)
Merging vfio/next (2e6cfd496f5b vfio iommu type1: Fix memory leak in vfio_i=
ommu_type1_pin_pages)
CONFLICT (content): Merge conflict in arch/s390/pci/pci_bus.c
Merging staging/staging-next (270315b8235e Merge tag 'riscv-for-linus-5.10-=
mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (599809540f17 interconnect: qcom: sc7180: Init BCMs be=
fore creating the nodes)
Merging dmaengine/next (fc143e38ddd4 dmaengine: owl-dma: fix kernel-doc sty=
le for enum)
Merging cgroup/for-next (65026da59cda cgroup: Zero sized write should be no=
-op)
Merging scsi/for-next (9dcbbd959cef Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (1ef16a407f54 scsi: qla2xxx: Fix return of uninit=
ialized value in rval)
Merging vhost/linux-next (65457c87de66 vdpa/mlx5: Fix failure to bring link=
 up)
Merging rpmsg/for-next (a689837cb172 Merge branches 'hwspinlock-next', 'rpm=
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
Merging coresight/next (f4cb5e9daedf coresight: etm4x: Skip setting LPOVERR=
IDE bit for qcom,skip-power-up)
Merging rtc/rtc-next (35331b506f6c rtc: r9701: set range)
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
Merging xarray/main (84c34df158cf XArray: Fix xas_create_range for ranges a=
bove 4 billion)
Merging hyperv/hyperv-next (626b901f6044 Drivers: hv: vmbus: Add parsing of=
 VMbus interrupt in ACPI DSDT)
Merging auxdisplay/auxdisplay (bbf5c979011a Linux 5.9)
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
Merging kunit-next/kunit (294a7f1613ee lib: kunit: Fix compilation test whe=
n using TEST_BIT_FIELD_COMPILE)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (298edb32160f bus: mhi: debugfs: Print channel context=
 read-pointer)
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
CONFLICT (content): Merge conflict in arch/arm/tools/syscall.tbl
CONFLICT (content): Merge conflict in arch/alpha/kernel/syscalls/syscall.tbl
Merging memblock/for-next (762d4d1a174c arch/ia64: Restore arch-specific pg=
d_offset_k implementation)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (2095725c325b drivers/edac: convert pci counters =
to counter_atomic32)
CONFLICT (content): Merge conflict in lib/Makefile
CONFLICT (content): Merge conflict in drivers/char/ipmi/ipmi_msghandler.c
Merging akpm-current/current (e3a9e6be957d aio: simplify read_events())
CONFLICT (content): Merge conflict in include/linux/sched.h
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
dropping e967937bf079d95eefa1e8ba81358294df6f226b ia64: fix build error wit=
h !COREDUMP -- patch contents already upstream
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --a=
bort".
CONFLICT (content): Merge conflict in include/linux/sched/mm.h
Merging akpm/master (b1d66dafef66 selftests/vm: fix an improper dependency =
upon executable script permissions)

--Sig_/9fmqdnRTd0xWrVms.jXKs0y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+PtCQACgkQAVBC80lX
0Gzg3Af/fvUAAVpiZag10kJFU4UU8h/vR9C0fIq8ZkN5hUSuYxaSlI6WblS48pGj
qEtmeLNcYMWvWBVrWjJ/zqttJgixGeeMi86WL7KDJ5FCiQF34p/p13E9KJR82dAx
f47KoNP+Rw7K3hpzfon0C7qj2XklOkITJFxZQEDhfZqY8OX5oXNBpU/RENuEolYH
2m3CEO5ng+cPVAIna5zJILVFqThUHalvLBB3rkkeYsCJySYFBR9WX+0M3Kf017tp
j5jQIH40t1Qyu0HiWhFtLA3EomF9dSoy2Rg3WunWf7tpFO0GmSmEr0rAFOkYTMr+
Onu+qdXTTJQjFajRXYWU8lyc9jblpg==
=t5Of
-----END PGP SIGNATURE-----

--Sig_/9fmqdnRTd0xWrVms.jXKs0y--
