Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25C1231F718
	for <lists+linux-next@lfdr.de>; Fri, 19 Feb 2021 11:10:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbhBSKJk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 19 Feb 2021 05:09:40 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:56963 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230169AbhBSKJb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 19 Feb 2021 05:09:31 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DhnN92JWyz9rx8;
        Fri, 19 Feb 2021 21:08:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613729321;
        bh=ZSilLuj6haBKAVeFBvYY5O2uzDkbtJ4B0bcFTFNtkY8=;
        h=Date:From:To:Cc:Subject:From;
        b=HFvpz0eSrgyBR1S1BAAvpnPjLWBfW1eeaUw27UFcxA4c3iUZ4vx6t4yHAvcQ4zmCe
         poaJ2paakKF9Am0vhwJHIlGPAxX1qilmRGfCD3pfmy2ydmvowz/9mPGdvUBt0cppLC
         MampeHzHCd/ypa8mJ7gQcJEiQQAphSSqeghZYQJ4tZsz9m6G6M9YYBYYgCOsLnIEYI
         3m6bKoG/vsfAEqEAEJICAvVipS0eGBlsLBUVhlwTRxdrstCX8GPRnyFVwoN8ruY8dD
         mACiIOJzn1qouQeZE94mRb6fiIg/BVXcomD+wEuXeZ8KXIXxmpR85zh3DnF4IOVBoM
         /uk4pcUuAf+IQ==
Date:   Fri, 19 Feb 2021 21:08:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 19
Message-ID: <20210219210840.06157519@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/74_me8_Oeu=Xx5by0V+2VR0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/74_me8_Oeu=Xx5by0V+2VR0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Please do not add any changes destined for v5.13 to your linux-next
included branches until after v5.12-rc1 has been released.

Changes since 20210218:

The gpio-brgl tree lost its build failure.

Non-merge commits (relative to Linus' tree): 10798
 10757 files changed, 467616 insertions(+), 299725 deletions(-)

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
Merging origin/master (f40ddce88593 Linux 5.11)
Merging fixes/fixes (e71ba9452f0b Linux 5.11-rc2)
Merging kbuild-current/fixes (fe968c41ac4f scripts: set proper OpenSSL incl=
ude dir also for sign-file)
Merging arc-current/for-curr (7c53f6b671f4 Linux 5.11-rc3)
Merging arm-current/fixes (4d62e81b60d4 ARM: kexec: fix oops after TLB are =
invalidated)
Merging arm64-fixes/for-next/fixes (68d54ceeec0e arm64: mte: Allow PTRACE_P=
EEKMTETAGS access to the zero page)
Merging arm-soc-fixes/arm/fixes (090e502e4e63 Merge tag 'socfpga_dts_fix_fo=
r_v5.12' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux in=
to arm/fixes)
Merging drivers-memory-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging m68k-current/for-linus (c396dd2ec5bb macintosh/adb-iop: Use big-end=
ian autopoll mask)
Merging powerpc-fixes/fixes (8c511eff1827 powerpc/kuap: Allow kernel thread=
 to access userspace after kthread_use_mm)
Merging s390-fixes/fixes (92bf22614b21 Linux 5.11-rc7)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (3af409ca278d net: enetc: fix destroyed phylink derefere=
nce during unbind)
Merging bpf/master (57baf8cc70ea net: axienet: Handle deferred probe on clo=
ck properly)
Merging ipsec/master (57baf8cc70ea net: axienet: Handle deferred probe on c=
lock properly)
Merging netfilter/master (57baf8cc70ea net: axienet: Handle deferred probe =
on clock properly)
Merging ipvs/master (44a674d6f798 Merge tag 'mlx5-fixes-2021-01-26' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/saeed/linux)
Merging wireless-drivers/master (94f0e6256c2a mt76: mt7915: only modify tx =
buffer list after allocating tx token id)
CONFLICT (content): Merge conflict in tools/testing/selftests/net/forwardin=
g/tc_flower.sh
CONFLICT (content): Merge conflict in include/uapi/linux/pkt_cls.h
CONFLICT (content): Merge conflict in drivers/net/ethernet/realtek/r8169_ma=
in.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx5/co=
re/en_rx.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx5/co=
re/en_main.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/ibm/ibmvnic.h
CONFLICT (content): Merge conflict in drivers/net/ethernet/ibm/ibmvnic.c
Merging mac80211/master (3af409ca278d net: enetc: fix destroyed phylink der=
eference during unbind)
Merging rdma-fixes/for-rc (1048ba83fb1c Linux 5.11-rc6)
Merging sound-current/for-linus (c4294d7f057d ALSA: hda: intel-dsp-config: =
add Alder Lake support)
Merging sound-asoc-fixes/for-linus (0969db0d8d15 Merge remote-tracking bran=
ch 'asoc/for-5.12' into asoc-linus)
Merging regmap-fixes/for-linus (19c329f68089 Linux 5.11-rc4)
Merging regulator-fixes/for-linus (8571bdc21388 Merge remote-tracking branc=
h 'regulator/for-5.11' into regulator-linus)
Merging spi-fixes/for-linus (110bc220aaab Merge remote-tracking branch 'spi=
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
Merging thunderbolt-fixes/fixes (f40ddce88593 Linux 5.11)
Merging input-current/for-linus (42ffcd1dba17 Input: xpad - add support for=
 PowerA Enhanced Wired Controller for Xbox Series X|S)
Merging crypto-current/master (0de9dc80625b hwrng: timeriomem - Use device-=
managed registration API)
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
Merging at91-fixes/at91-fixes (16457a528e63 ARM: dts: at91: sam9x60: fix mu=
x-mask to match product's datasheet)
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
Merging btrfs-fixes/next-fixes (7575423616f6 Merge branch 'misc-5.11' into =
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
Merging drm-fixes/drm-fixes (f40ddce88593 Linux 5.11)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (f40ddce88593 Linux 5.11)
Merging mmc-fixes/fixes (d7fb9c242095 mmc: sdhci-pltfm: Fix linking err for=
 sdhci-brcmstb)
Merging rtc-fixes/rtc-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging gnss-fixes/gnss-linus (7c53f6b671f4 Linux 5.11-rc3)
Merging hyperv-fixes/hyperv-fixes (fff7b5e6ee63 x86/hyperv: Initialize cloc=
kevents after LAPIC is initialized)
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (3da3cc1b5f47 Revert "dts: phy: add GPIO number =
and active state used for phy reset")
Merging pidfd-fixes/fixes (a409ed156a90 Merge tag 'gpio-v5.11-1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio)
Merging fpga-fixes/fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging spdx/spdx-linus (6ee1d745b7c9 Linux 5.11-rc5)
Merging gpio-brgl-fixes/gpio/for-current (f40ddce88593 Linux 5.11)
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
Merging cel-fixes/for-rc (4d12b7275386 SUNRPC: Further clean up svc_tcp_sen=
dmsg())
Merging drm-misc-fixes/for-linux-next-fixes (f40ddce88593 Linux 5.11)
Merging kspp-gustavo/for-next/kspp (36f9ff9e03de lib: Fix fall-through warn=
ings for Clang)
Merging kbuild/for-next (585d32f9b053 gen_compile_commands: prune some dire=
ctories)
Merging compiler-attributes/compiler-attributes (19c329f68089 Linux 5.11-rc=
4)
Merging dma-mapping/for-next (3dc47131f8aa media: uvcvideo: Use dma_alloc_n=
oncontiguos API)
Merging asm-generic/master (38489db09b10 Merge branch 'asm-generic-fixes' i=
nto asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (171db91076f3 Merge branch 'devel-stable' into for-nex=
t)
Merging arm64/for-next/core (1ffa9763828c Merge branch 'for-next/vdso' into=
 for-next/core)
Merging arm-perf/for-next/perf (f0c140481d1b perf: Constify static struct a=
ttribute_group)
Merging arm-soc/for-next (e6c44b8c57c9 soc: document merges)
CONFLICT (content): Merge conflict in arch/arm/Kconfig.debug
Merging actions/for-next (006828d706fd Merge branch 'v5.12/defconfig' into =
for-next)
Merging amlogic/for-next (70994f761efe Merge branch 'v5.12/soc' into tmp/am=
l-rebuild)
Merging aspeed/for-next (697dabd5d370 Merge branches 'soc-for-v5.12' and 'd=
t-for-v5.12' into for-next)
Merging at91/at91-next (9639bdcf8954 Merge branch 'at91-fixes' into at91-ne=
xt)
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
Merging scmi/for-linux-next (f40ddce88593 Linux 5.11)
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
Merging clk/clk-next (4d5c4ae32945 Merge branches 'clk-socfpga', 'clk-mstar=
', 'clk-qcom' and 'clk-warnings' into clk-next)
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
Merging microblaze/next (48783be427c7 microblaze: Fix built-in DTB alignmen=
t to be 8-byte aligned)
Merging mips/mips-next (b0c2793bad0b Revert "MIPS: Add basic support for pt=
race single step")
CONFLICT (content): Merge conflict in .mailmap
Merging nds32/next (54bde873682b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (8f722f67452f openrisc: Use devicetree to determi=
ne present cpus)
Merging parisc-hd/for-next (2347961b11d4 binfmt_misc: pass binfmt_misc flag=
s to the interpreter)
Merging powerpc/next (82d2c16b350f powerpc/perf: Adds support for programmi=
ng of Thresholding in P10)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e95f287deed2 soc: fsl: handle RCPM errata A-008646 on=
 SoC LS1021A)
Merging risc-v/for-next (36c3d86ac4e7 arch_numa: fix common code printing o=
f phys_addr_t)
CONFLICT (content): Merge conflict in drivers/soc/Makefile
CONFLICT (content): Merge conflict in drivers/soc/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/mm/Makefile
Merging s390/for-next (b47f625e102b Merge branch 'features' into for-next)
Merging sh/for-next (b89bc060b53e sh/intc: Restore devm_ioremap() alignment)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (ddad5187fc2a um: irq.h: include <asm-generic/irq.h>)
Merging xtensa/xtensa-for-next (7b79eba1d0d1 xtensa: fix spelling mistake i=
n Kconfig "wont" -> "won't")
Merging pidfd/for-next (f69e8091c4a2 xfs: remove the possibly unused mp var=
iable in xfs_file_compat_ioctl)
CONFLICT (content): Merge conflict in fs/overlayfs/inode.c
CONFLICT (content): Merge conflict in fs/overlayfs/copy_up.c
CONFLICT (content): Merge conflict in fs/ecryptfs/inode.c
Merging fscrypt/master (a14d0b676491 fscrypt: allow deleting files with uns=
upported encryption policy)
Merging fscache/fscache-next (32685453751f netfs: Hold a ref on a page when=
 PG_private_2 is set)
CONFLICT (content): Merge conflict in include/linux/fs.h
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (191e697796c2 Merge branch 'for-next-next-v5.11-2021=
0217' into for-next-20210217)
CONFLICT (content): Merge conflict in lib/iov_iter.c
Merging ceph/master (558b4510f622 ceph: defer flushing the capsnap if the F=
b is used)
Merging cifs/for-next (03e9bb1a0b40 cifs: Reformat DebugData and index conn=
ections by conn_id.)
Merging configfs/for-next (65cdb4a214c0 configfs: fix kernel-doc markup iss=
ue)
Merging ecryptfs/next (902af369942f ecryptfs: use DEFINE_MUTEX() for mutex =
lock)
Merging erofs/dev (ce0631291813 erofs: initialized fields can only be obser=
ved after bit is set)
Merging exfat/dev (61dd9f0b09e0 exfat: improve performance of exfat_free_cl=
uster when using dirsync mount option)
Merging ext3/for_next (c5b8ccc3da76 Pull udf & isofs UID/GID parsing fixes.)
Merging ext4/dev (b5776e7524af ext4: fix potential htree index checksum cor=
ruption)
Merging f2fs/dev (092af2eb1800 Documentation: f2fs: fix typo s/automaic/aut=
omatic)
CONFLICT (content): Merge conflict in fs/f2fs/file.c
CONFLICT (content): Merge conflict in fs/f2fs/acl.c
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (5d069dbe8aaf fuse: fix bad inode)
Merging jfs/jfs-next (4208c398aae4 fs/jfs: fix potential integer overflow o=
n shift of a int)
Merging nfs/linux-next (92bf22614b21 Linux 5.11-rc7)
Merging nfs-anna/linux-next (6c17260ca4ae NFS: Set the stable writes flag w=
hen initialising the super block)
Merging nfsd/nfsd-next (c3213d260a23 SUNRPC: Fix oops in the rpc_xdr_buf ev=
ent class)
Merging cel/for-next (428a23d2bf0c nfsd: skip some unnecessary stats in the=
 v4 case)
Merging orangefs/for-next (c1048828c3db orangefs: add splice file operation=
s)
Merging overlayfs/overlayfs-next (d46b7cd68336 ovl: plumb through flush met=
hod)
Merging ubifs/next (42119dbe571e ubifs: Fix error return code in alloc_wbuf=
s())
Merging v9fs/9p-next (324a158fe535 fs: 9p: add generic splice_write file op=
eration)
Merging xfs/for-next (1cd738b13ae9 xfs: consider shutdown in bmapbt cursor =
delete assert)
CONFLICT (content): Merge conflict in fs/xfs/xfs_ioctl.c
CONFLICT (content): Merge conflict in fs/xfs/xfs_inode.c
Merging zonefs/for-next (059c01039c01 zonefs: Fix file size of zones in ful=
l condition)
Merging iomap/iomap-for-next (ed1128c2d0c8 xfs: reduce exclusive locking on=
 unaligned dio)
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (cc4a3f885e8f fcntl: make F_GETOWN(EX) return=
 0 on dead owner task)
Merging vfs/for-next (07add5008f9f Merge branch 'work.namei' into for-next)
CONFLICT (content): Merge conflict in fs/namei.c
CONFLICT (content): Merge conflict in fs/coredump.c
CONFLICT (content): Merge conflict in arch/Kconfig
Merging printk/for-next (f78dd21aa363 Merge branch 'for-5.12-no_hash_pointe=
rs' into for-next)
Merging pci/next (84c8d3d0b60e Merge branch 'remotes/lorenzo/pci/misc')
Merging pstore/for-next/pstore (19d8e9149c27 pstore: Fix typo in compressio=
n option name)
Merging hid/for-next (914fe0466c86 Merge branch 'for-5.12/playstation-v2' i=
nto for-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging i2c/i2c/for-next (35ea257a39ae Merge branch 'i2c/for-5.12' into i2c=
/for-next)
Merging i3c/i3c/next (5c34b8e7e8bb i3c: master: dw: Drop redundant disec ca=
ll)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (6ab3332cc692 MAINTAINERS: Add entry for T=
exas Instruments TPS23861 PoE PSE)
Merging jc_docs/docs-next (3c2e0a489da6 docs: kernel-hacking: be more civil)
Merging v4l-dvb/master (8f202f8e9ff3 media: v4l: async: Fix kerneldoc docum=
entation for async functions)
Merging v4l-dvb-next/master (d0a9fffedca1 docs: fs: api-summary.rst: get ri=
d of kernel-doc include)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_dp_helper.c
CONFLICT (content): Merge conflict in Documentation/dev-tools/kasan.rst
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (8b72d3aa065c Merge branches 'pm-cpufreq-fixes' and '=
pm-opp-fixes' into linux-next)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging cpufreq-arm/cpufreq/arm/linux-next (67fc209b527d cpufreq: qcom-hw: =
drop devm_xxx() calls from init/exit hooks)
Merging cpupower/cpupower (3a3ecfdb605c cpupower: Add cpuid cap flag for MS=
R_AMD_HWCR support)
Merging devfreq/devfreq-next (fc1745c0e40c PM / devfreq: rk3399_dmc: Remove=
 unneeded semicolon)
Merging opp/opp/linux-next (de04241ab87a opp: Don't skip freq update for di=
fferent frequency)
Merging thermal/thermal/linux-next (a51afb13311c thermal: cpufreq_cooling: =
freq_qos_update_request() returns < 0 on error)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (4f19d071f9be fs: dlm: check on existing node address)
Merging swiotlb/linux-next (e998879d4fb7 x86,swiotlb: Adjust SWIOTLB bounce=
 buffer size for SEV guests)
Merging rdma/for-next (7289e26f395b Merge tag 'v5.11' into rdma.git for-nex=
t)
Merging net-next/master (38b5133ad607 octeontx2-pf: Fix otx2_get_fecparam())
CONFLICT (content): Merge conflict in tools/testing/selftests/net/forwardin=
g/tc_flower.sh
CONFLICT (content): Merge conflict in include/uapi/linux/pkt_cls.h
CONFLICT (content): Merge conflict in drivers/net/ethernet/mellanox/mlx5/co=
re/en_main.c
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/toshiba/tmpv7708.=
dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/toshiba/tmpv7708-=
rm-mbrc.dts
Merging bpf-next/for-next (7b1e385c9a48 bpf: Fix a warning message in mark_=
ptr_not_null_reg())
Merging ipsec-next/master (c48f86071027 Merge branch 'PTP-for-DSA-tag_ocelo=
t_8021q')
Merging mlx5-next/mlx5-next (432119de33d9 net/mlx5: Add cyc2time HW transla=
tion mode support)
Merging netfilter-next/master (38b5133ad607 octeontx2-pf: Fix otx2_get_fecp=
aram())
Merging ipvs-next/master (a61e4b60761f Merge branch 'net-dsa-hellcreek-add-=
taprio-offloading')
Merging wireless-drivers-next/master (773dc50d7169 Merge branch 'Xilinx-axi=
enet-updates')
Merging bluetooth/master (55c0bd77479b Bluetooth: hci_qca: Fixed issue duri=
ng suspend)
Merging mac80211-next/master (b646acd5eb48 net: re-solve some conflicts aft=
er net -> net-next merge)
Merging gfs2/for-next (5f9b07b2a242 Merge branch 'rgrp-glock-sharing' into =
for-next)
Merging mtd/mtd/next (6e9dff6fe3fb dt-bindings: mtd: add binding for BCM490=
8 partitions)
Merging nand/nand/next (073abfa7ea9a mtd: rawnand: intel: Fix an error hand=
ling path in 'ebu_dma_start()')
Merging spi-nor/spi-nor/next (75386810d3a6 mtd: spi-nor: sst: Add support f=
or Global Unlock on sst26vf)
Merging crypto/master (0de9dc80625b hwrng: timeriomem - Use device-managed =
registration API)
Merging drm/drm-next (ac35d19fe871 Merge branch '00.00-inst' of git://githu=
b.com/skeggsb/linux into drm-next)
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
Merging drm-misc/for-linux-next (b1b805f3cb22 dt-bindings: dp-connector: Dr=
op maxItems from -supply)
CONFLICT (modify/delete): drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c delete=
d in drm-misc/for-linux-next and modified in HEAD. Version HEAD of drivers/=
gpu/drm/gma500/tc35876x-dsi-lvds.c left in tree.
CONFLICT (modify/delete): drivers/gpu/drm/gma500/mdfld_output.c deleted in =
drm-misc/for-linux-next and modified in HEAD. Version HEAD of drivers/gpu/d=
rm/gma500/mdfld_output.c left in tree.
CONFLICT (modify/delete): drivers/gpu/drm/gma500/mdfld_dsi_output.c deleted=
 in drm-misc/for-linux-next and modified in HEAD. Version HEAD of drivers/g=
pu/drm/gma500/mdfld_dsi_output.c left in tree.
CONFLICT (modify/delete): drivers/gpu/drm/gma500/mdfld_device.c deleted in =
drm-misc/for-linux-next and modified in HEAD. Version HEAD of drivers/gpu/d=
rm/gma500/mdfld_device.c left in tree.
CONFLICT (content): Merge conflict in drivers/gpu/drm/gma500/Kconfig
$ git rm -f drivers/gpu/drm/gma500/mdfld_device.c drivers/gpu/drm/gma500/md=
fld_dsi_output.c drivers/gpu/drm/gma500/mdfld_output.c drivers/gpu/drm/gma5=
00/tc35876x-dsi-lvds.c
Merging amdgpu/drm-next (809b39a119ca drm/amdgpu: always reset the asic in =
suspend)
Merging drm-intel/for-linux-next (81ce8f04aa96 drm/i915/gt: Correct surface=
 base address for renderclear)
Merging drm-tegra/drm/tegra/for-next (dcdfe2712b68 drm/tegra: Fix reference=
 leak when pm_runtime_get_sync() fails)
Merging drm-msm/msm-next (182b4a2d2513 drm/msm/dp: Add a missing semi-colon)
Merging imx-drm/imx-drm/next (82581fcf070b drm/modes: add non-OF stub for o=
f_get_drm_display_mode)
Merging etnaviv/etnaviv/next (7d614ab2f205 drm/etnaviv: fix NULL check befo=
re some freeing functions is not needed)
Merging regmap/for-next (aa3233086b48 Merge remote-tracking branch 'regmap/=
for-5.12' into regmap-next)
Merging sound/for-next (c4294d7f057d ALSA: hda: intel-dsp-config: add Alder=
 Lake support)
Merging sound-asoc/for-next (0969db0d8d15 Merge remote-tracking branch 'aso=
c/for-5.12' into asoc-linus)
Merging modules/modules-next (1e80d9cb579e module: potential uninitialized =
return in module_kallsyms_on_each_symbol())
Merging input/next (0958351e93fa Input: elo - fix an error code in elo_conn=
ect())
Merging block/for-next (171a447a33bf Merge branch 'for-5.12/io_uring' into =
for-next)
CONFLICT (content): Merge conflict in lib/iov_iter.c
CONFLICT (content): Merge conflict in fs/iomap/direct-io.c
CONFLICT (content): Merge conflict in Documentation/filesystems/porting.rst
Applying: block: bio: fix up for bi_disk removal
Applying: block: btrfs: another fix up for bi_disk removal
Merging device-mapper/for-next (a666e5c05e7c dm: fix deadlock when swapping=
 to encrypted device)
Merging pcmcia/pcmcia-next (4ce6b242b78d pcmcia: Switch to using the new AP=
I kobj_to_dev())
Merging mmc/next (a56f44138a2c mmc: sdhci-esdhc-imx: fix kernel panic when =
remove module)
Merging mfd/for-mfd-next (26783d74cc6a mfd: wm831x-auxadc: Prevent use afte=
r free in wm831x_auxadc_read_irq())
Merging backlight/for-backlight-next (0b5e0f45af40 backlight/video: Use Pla=
tform getter/setter functions)
Merging battery/for-next (a72acc56f3e9 power-supply: use kobj_to_dev())
Merging regulator/for-next (f03e2a72e5e8 Merge remote-tracking branch 'regu=
lator/for-5.12' into regulator-next)
Merging security/next-testing (9dcd47fc1f7d Merge branch 'fixes-v5.10' into=
 next-testing)
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (f6692213b504 integrity: Make function int=
egrity_add_key() static)
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
Merging tomoyo/master (9c83465f3245 tomoyo: recognize kernel threads correc=
tly)
Merging tpmdd/next (8c657a0590de KEYS: trusted: Reserve TPM for seal and un=
seal operations)
Merging watchdog/master (a4f3407c4160 watchdog: qcom: Remove incorrect usag=
e of QCOM_WDT_ENABLE_IRQ)
Merging iommu/next (45e606f27269 Merge branches 'arm/renesas', 'arm/smmu', =
'x86/amd', 'x86/vt-d' and 'core' into next)
Merging audit/next (127c8c5f0589 audit: Make audit_filter_syscall() return =
void)
Merging devicetree/for-next (0f6144e53664 Merge branch 'dt/kexec-v2' into d=
t/next)
CONFLICT (content): Merge conflict in scripts/Makefile.lib
CONFLICT (content): Merge conflict in arch/powerpc/kexec/elf_64.c
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/net=
/ti,k3-am654-cpsw-nuss.yaml
Merging mailbox/mailbox-for-next (d1e6bc0ca01c mailbox: tegra-hsp: Set lock=
dep class dynamically)
Merging spi/for-next (eec262d179ff Merge remote-tracking branch 'spi/for-5.=
12' into spi-next)
CONFLICT (content): Merge conflict in drivers/spi/spi-mpc52xx.c
Merging tip/auto-latest (e3e6a51e779f Merge branch 'core/mm')
CONFLICT (modify/delete): arch/x86/platform/intel-mid/device_libs/platform_=
bt.c deleted in HEAD and modified in tip/auto-latest. Version tip/auto-late=
st of arch/x86/platform/intel-mid/device_libs/platform_bt.c left in tree.
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/int=
errupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
$ git rm -f arch/x86/platform/intel-mid/device_libs/platform_bt.c
Merging clockevents/timers/drivers/next (e85c1d21b16b clocksource/drivers/t=
imer-microchip-pit64b: Add clocksource suspend/resume)
Merging edac/edac-for-next (faf042d15093 Merge branch 'edac-amd64' into eda=
c-for-next)
Merging irqchip/irq/irqchip-next (c83fd57be3fe irqdomain: Remove debugfs_fi=
le from struct irq_domain)
Merging ftrace/for-next (e23db805da2d tracing/tools: Add the latency-collec=
tor to tools directory)
CONFLICT (content): Merge conflict in kernel/trace/trace.c
Merging rcu/rcu/next (c8c430f4a2fb Merge branch 'nolibc.2021.01.21a' into H=
EAD)
Merging kvm/next (8c6e67bec319 Merge tag 'kvmarm-5.12' of git://git.kernel.=
org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
CONFLICT (content): Merge conflict in arch/x86/kvm/x86.c
Merging kvm-arm/next (c93199e93e12 Merge branch 'kvm-arm64/pmu-debug-fixes-=
5.11' into kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (50a05be484cb KVM: s390: track synchronous pfault even=
ts in kvm_stat)
Merging xen-tip/linux-next (871997bc9e42 xen-blkback: fix error handling in=
 xen_blkbk_map())
Merging percpu/for-next (df1c002198a8 Merge branch 'for-5.12' into for-next)
Merging workqueues/for-next (e9ad2eb3d9ae workqueue: Use %s instead of func=
tion name)
Merging drivers-x86/for-next (a7d53dbbc70a platform/x86: intel_scu_ipc: Inc=
rease virtual timeout from 3 to 5 seconds)
CONFLICT (content): Merge conflict in drivers/platform/x86/ideapad-laptop.c
Merging chrome-platform/for-next (a59e12218c4f platform/chrome: cros_ec_typ=
ec: Flush pending work)
Merging hsi/for-next (aa57e77b3d28 HSI: Fix PM usage counter unbalance in s=
si_hw_init)
Merging leds/for-next (d86464527681 leds: gpio: Set max brightness to 1)
Merging ipmi/for-next (fc26067c7417 ipmi: remove open coded version of SMBu=
s block write)
Merging driver-core/driver-core-next (56348560d495 debugfs: do not attempt =
to create a new file before the filesystem is initalized)
Merging usb/usb-next (b5a12546e779 dt-bindings: usb: mediatek: musb: add mt=
8516 compatbile)
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
Merging char-misc/char-misc-next (d19db80a3665 spmi: spmi-pmic-arb: Fix hw_=
irq overflow)
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
Merging soundwire/next (8d8d95842867 regmap: sdw-mbq: use MODULE_LICENSE("G=
PL"))
Merging thunderbolt/next (c6da62a219d0 thunderbolt: Add support for native =
USB4 _OSC)
Merging vfio/next (76adb20f924f Merge branch 'v5.12/vfio/next-vaddr' into v=
5.12/vfio/next)
Merging staging/staging-next (4eb839aef182 staging: hikey9xx: Fix alignment=
 of function parameters)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (6715ea06ced4 Merge branch 'icc-sdx55' into icc-next)
Merging dmaengine/next (eda38ce482b2 dmaengine: dw-axi-dmac: remove redunda=
nt null check on desc)
Merging cgroup/for-next (00bfa16052cd Merge branch 'for-5.11-fixes' into fo=
r-next)
Merging scsi/for-next (307e69053eb3 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (d39bfd0686fd scsi: iscsi: Drop session lock in i=
scsi_session_chkready())
Merging vhost/linux-next (bd4ff6766f47 ALSA: virtio: introduce device suspe=
nd/resume support)
Merging rpmsg/for-next (d9ff3a5789cb Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (a8002a35935a gpio: pcf857x: Fix missing fi=
rst interrupt)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/toshiba/tmpv7708-=
rm-mbrc.dts
CONFLICT (content): Merge conflict in MAINTAINERS
Merging gpio-intel/for-next (c5318e248f52 gpio: msic: Drop driver from Make=
file)
Merging pinctrl/for-next (b40b760aa2a9 pinctrl: mediatek: Fix trigger type =
setting follow for unexpected interrupt)
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
Merging rtc/rtc-next (49dfc1f16b03 rtc: abx80x: Add utility function for wr=
iting configuration key)
Merging nvdimm/libnvdimm-for-next (68a5a9a24335 MAINTAINERS: Add maintainer=
s of the CXL driver)
Merging at24/at24/for-next (5366c48f327e dt-bindings: eeprom: at24: Documen=
t ROHM BR24G01)
Merging ntb/ntb-next (5c8fe583cce5 Linux 5.11-rc1)
Merging seccomp/for-next/seccomp (a381b70a1cf8 seccomp: Improve performace =
by optimizing rmb())
Merging kspp/for-next/kspp (2b8689520520 kbuild: prevent CC_FLAGS_LTO self-=
bloating on recursive rebuilds)
CONFLICT (content): Merge conflict in include/asm-generic/vmlinux.lds.h
Merging gnss/gnss-next (45d5996e034c gnss: drop stray semicolons)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (0320ed0a8236 drivers: slimbus: Fix word resposibl=
e -> responsible in slimbus.h)
CONFLICT (content): Merge conflict in drivers/nvmem/Kconfig
Merging nvmem/for-next (667fbb3fcde1 nvmem: qcom-spmi-sdam: Fix uninitializ=
ed pdev pointer)
Merging xarray/main (80c1dbebf308 XArray: Fix splitting to non-zero orders)
Merging hyperv/hyperv-next (3019270282a1 Revert "Drivers: hv: vmbus: Copy p=
ackets sent by Hyper-V out of the ring buffer")
Merging auxdisplay/auxdisplay (b45616445a6e auxdisplay: Fix duplicate CHARL=
CD config symbol)
Merging kgdb/kgdb/for-next (f11e2bc682cc kgdb: Remove kgdb_schedule_breakpo=
int())
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
Merging mhi/mhi-next (9e04adfcab78 mhi: Fix double dma free)
Merging memblock/for-next (097d43d85704 mm: memblock: remove return value o=
f memblock_free_all())
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging iomem-mmap-vs-gup/topic/iomem-mmap-vs-gup (636b21b50152 PCI: Revoke=
 mappings like devmem)
Applying: mm: fixup for follow_pte() API change
Merging oprofile-removal/oprofile/removal (be65de6b03aa fs: Remove dcookies=
 support)
Merging akpm-current/current (12e9b8a3c276 initramfs-panic-with-memory-info=
rmation-fix)
CONFLICT (content): Merge conflict in include/linux/pagemap.h
CONFLICT (content): Merge conflict in fs/hugetlbfs/inode.c
CONFLICT (content): Merge conflict in fs/btrfs/file.c
Applying: fs/ramfs/inode.c: update inode_operations.tmpfile
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (4adeaa532da8 MIPS: make userspace mapping young by def=
ault)

--Sig_/74_me8_Oeu=Xx5by0V+2VR0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAvjigACgkQAVBC80lX
0Gy54AgAhBzEHVnIjtV08LAL6EqqVaDH0WfDd0r3GkraCS/VLM+kVNAHxCFjOta1
1ayuk0XhYp/nvOV5K+NziaIeqrKmyYyTvOU1MoCfbrZ+wB7pyCLyY8s3seWZYDdM
8x/N5yLTLVmf3Jh+9WNOhrRJHPG+FNmTC6GMQ5Z+IHTTD2dLkBHmWrSAOQAJjtBt
zZxG7sb1fB6TsbFOhZZgcBCAqS9ySVm9yHikuu40vDJq7GQ+VDJCGXUW9Rots3mE
Uj6d+zgo+nFPXthHmQujod/toEUJX5ixS2Z3mCBrVI4JjmDJzo0/XSEVI0gyXBT4
cgHm1UuK/bzn0Yff7E2qzstJtCb+ww==
=KMV8
-----END PGP SIGNATURE-----

--Sig_/74_me8_Oeu=Xx5by0V+2VR0--
