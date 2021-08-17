Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA9753EECCB
	for <lists+linux-next@lfdr.de>; Tue, 17 Aug 2021 14:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236950AbhHQMuc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Aug 2021 08:50:32 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41997 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229539AbhHQMub (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Aug 2021 08:50:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GprTc68qmz9sVq;
        Tue, 17 Aug 2021 22:49:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629204597;
        bh=nRosbABavwqyZF3DnT7tDdYy6oePu8H8sMaVUF/mug4=;
        h=Date:From:To:Cc:Subject:From;
        b=mzuSEdG0oP0wyUzPJ9zZHnjfW7irn/gzQyeuVJC/c4BWnguE9x5P6mgkh4n4PmoLQ
         ZlvttHInycHfJrMfOKxBEd1o+pZtWEuTxzlCs/ivD1SKOiFiu8wrCSVq0wusx3X10R
         Ch3lPDr1OGNWZIbDUUApD+M/teoX21qabT6I2u/QfVsXdGCw9LG4zZXmvBQ++HRe70
         HI0i/CizZMnXuYpdLwQZtUSMv0jVjswLS08Vzr03+LHzuYJIdLxEm/KRuPSsBhb/N/
         mDeKevFCYh9F9fFWNXqexkF7nuMsLSIoCDhzs6ciyX1bFyG3GapG83/g63oGSBr8HD
         vS+EHouIv507w==
Date:   Tue, 17 Aug 2021 22:49:55 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 17
Message-ID: <20210817224955.0124148d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g3M3bTe.VTIavamkOjFnfy7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/g3M3bTe.VTIavamkOjFnfy7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210816:

The net-next tree gained a conflict against the net tree.

The net-next tree still had its build failure for which I applied a patch.

The mtd tree gained a conflict against Linus' tree.

The block tree gained a conflict against Linus' tree.

The rcu tree gained a conflict against the tip tree.

The staging tree lost its build failure.

The scsi-mkp tree gained a build failure so I used the version from
next-20210816.

The pinctrl tree gained a conflict against the irqchip tree.

Non-merge commits (relative to Linus' tree): 7654
 7628 files changed, 458524 insertions(+), 181322 deletions(-)

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

I am currently merging 334 trees (counting Linus' and 90 trees of bug
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
Merging origin/master (a2824f19e606 Merge tag 'mtd/fixes-for-5.14-rc7' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux)
Merging fixes/fixes (614124bea77e Linux 5.13-rc5)
Merging kbuild-current/fixes (36a21d51725a Linux 5.14-rc5)
Merging arc-current/for-curr (7c60610d4767 Linux 5.14-rc6)
Merging arm-current/fixes (463dbba4d189 ARM: 9104/2: Fix Keystone 2 kernel =
mapping regression)
Merging arm64-fixes/for-next/fixes (017f5fb9ce79 arm64: clean vdso & vdso32=
 files)
Merging arm-soc-fixes/arm/fixes (d0dc706ab192 Merge tag 'qcom-arm64-fixes-f=
or-5.14' of git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into a=
rm/fixes)
Merging drivers-memory-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging m68k-current/for-linus (21ed49265986 m68k: MAC should select HAVE_P=
ATA_PLATFORM)
Merging powerpc-fixes/fixes (cbc06f051c52 powerpc/xive: Do not skip CPU-les=
s nodes when creating the IPIs)
Merging s390-fixes/fixes (ecd92e2167c3 s390: update defconfigs)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (4f3f2e3fa043 net: iosm: Prevent underflow in ipc_chnl_c=
fg_get())
Merging bpf/master (3776f3517ed9 selftests, bpf: Test that dead ldx_w insns=
 are accepted)
Merging ipsec/master (480e93e12aa0 net: xfrm: Fix end of loop tests for lis=
t_for_each_entry)
Merging netfilter/master (e3245a7b7b34 netfilter: nft_ct: protect nft_ct_pc=
pu_template_refcnt with mutex)
Merging ipvs/master (269fc69533de netfilter: nfnetlink_hook: translate inet=
 ingress to netdev)
Merging wireless-drivers/master (abf3d98dee7c mt76: fix enum type mismatch)
Merging mac80211/master (5f7735196390 ice: Fix perout start time rounding)
Merging rdma-fixes/for-rc (2638a32348bb RDMA/iw_cxgb4: Fix refcount underfl=
ow while destroying cqs.)
Merging sound-current/for-linus (67bb66d32905 ALSA: oxfw: fix functioal reg=
ression for silence in Apogee Duet FireWire)
Merging sound-asoc-fixes/for-linus (52a827933dab Merge remote-tracking bran=
ch 'asoc/for-5.14' into asoc-linus)
Merging regmap-fixes/for-linus (ff1176468d36 Linux 5.14-rc3)
Merging regulator-fixes/for-linus (25b549d69e17 Merge remote-tracking branc=
h 'regulator/for-5.14' into regulator-linus)
Merging spi-fixes/for-linus (c3c559158bd0 Merge remote-tracking branch 'spi=
/for-5.14' into spi-linus)
Merging pci-current/for-linus (d5450c42cbc3 PCI: Increase D3 delay for AMD =
Renoir/Cezanne XHCI)
Merging driver-core.current/driver-core-linus (36a21d51725a Linux 5.14-rc5)
Merging tty.current/tty-linus (36a21d51725a Linux 5.14-rc5)
Merging usb.current/usb-linus (7c60610d4767 Linux 5.14-rc6)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (8da0e55c7988 USB: serial: ftdi_sio: add=
 device ID for Auto-M3 OP-COM v2)
Merging usb-chipidea-fixes/for-usb-fixes (5df09c15bab9 usb: cdnsp: Fix the =
IMAN_IE_SET and IMAN_IE_CLEAR macro)
Merging phy/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging staging.current/staging-linus (7c60610d4767 Linux 5.14-rc6)
Merging iio-fixes/fixes-togreg (a5056c0bc24f Merge tag 'iio-fixes-5.14a' of=
 https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-lin=
us)
Merging char-misc.current/char-misc-linus (d30836a95289 Merge tag 'icc-5.14=
-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc into char=
-misc-linus)
Merging soundwire-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging thunderbolt-fixes/fixes (7c60610d4767 Linux 5.14-rc6)
Merging input-current/for-linus (818b26588994 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (5261cdf457ce crypto: drbg - select SHA512)
Merging vfio-fixes/for-linus (dc51ff91cf2d vfio/platform: fix module_put ca=
ll in error flow)
Merging kselftest-fixes/fixes (567c39047dbe selftests/sgx: Fix Q1 and Q2 ca=
lculation in sigstruct.c)
Merging modules-fixes/modules-linus (055f23b74b20 module: check for exit se=
ctions in layout_sections() instead of module_init_section())
Merging dmaengine-fixes/fixes (7199ddede9f0 dmaengine: imx-dma: configure t=
he generic DMA type to make it work)
Merging backlight-fixes/for-backlight-fixes (a38fd8748464 Linux 5.12-rc2)
Merging mtd-fixes/mtd/fixes (b48027083a78 mtd: rawnand: Fix probe failure d=
ue to of_get_nand_secure_regions())
Merging mfd-fixes/for-mfd-fixes (a61f4661fba4 mfd: intel_quark_i2c_gpio: Re=
vert "Constify static struct resources")
Merging v4l-dvb-fixes/fixes (f1de1c780359 media: atmel: fix build when ISC=
=3Dm and XISC=3Dy)
Merging reset-fixes/reset/fixes (1435f82689e1 reset: RESET_MCHP_SPARX5 shou=
ld depend on ARCH_SPARX5)
Merging mips-fixes/mips-fixes (6aa32467299e MIPS: check return value of pgt=
able_pmd_page_ctor)
Merging at91-fixes/at91-fixes (6efb943b8616 Linux 5.13-rc1)
Merging omap-fixes/fixes (06a089ef6449 bus: ti-sysc: Fix error handling for=
 sysc_check_active_timer())
Merging kvm-fixes/master (c7dfa4009965 KVM: nSVM: always intercept VMLOAD/V=
MSAVE when nested (CVE-2021-3656))
Merging kvms390-fixes/master (cd4220d23bf3 KVM: selftests: do not require 6=
4GB in set_memory_region_test)
Merging hwmon-fixes/hwmon (03726fd90f4b hwmon: sht4x: update Documentation =
for Malformed table)
Merging nvdimm-fixes/libnvdimm-fixes (96dcb97d0a40 Merge branch 'for-5.14/d=
ax' into libnvdimm-fixes)
Merging cxl-fixes/fixes (fae8817ae804 cxl/mem: Fix memory device capacity p=
robing)
Merging btrfs-fixes/next-fixes (01e9fcf19c13 Merge branch 'misc-5.14' into =
next-fixes)
Merging vfs-fixes/fixes (173e84953eaa fs: fix reporting supported extra fil=
e attributes for statx())
Merging dma-mapping-fixes/for-linus (18a3c5f7abfd Merge tag 'for_linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (73fcbad69111 platform/x86: asus-nb-wmi: Ad=
d tablet_mode_sw=3Dlid-flip quirk for the TP200s)
Merging samsung-krzk-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging pinctrl-samsung-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging devicetree-fixes/dt/linus (50d8d7e19c43 dt-bindings: display: renes=
as,du: Make resets optional on R-Car H1)
Merging scsi-fixes/fixes (40d32727931c scsi: mpt3sas: Fix incorrectly assig=
ned error return and check)
Merging drm-fixes/drm-fixes (7c60610d4767 Linux 5.14-rc6)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (ffd5caa26f6a drm/doc/rfc: dro=
p lmem uapi section)
Merging mmc-fixes/fixes (419dd626e357 mmc: sdhci-iproc: Set SDHCI_QUIRK_CAP=
_CLOCK_BASE_BROKEN on BCM2711)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging hyperv-fixes/hyperv-fixes (f5a11c69b699 Revert "x86/hyperv: fix log=
ical processor creation")
Merging soc-fsl-fixes/fix (c1e64c0aec8c soc: fsl: qe: fix static checker wa=
rning)
Merging risc-v-fixes/fixes (fdf3a7a1e0a6 riscv: Fix comment regarding kerne=
l mapping overlapping with IS_ERR_VALUE)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (277c0dd93bf7 fpga: machxo2-spi: Return an error o=
n failure)
Merging spdx/spdx-linus (36a21d51725a Linux 5.14-rc5)
Merging gpio-brgl-fixes/gpio/for-current (9b87f43537ac gpio: tqmx86: really=
 make IRQ optional)
Merging gpio-intel-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging pinctrl-intel-fixes/fixes (2f658f7a3953 pinctrl: tigerlake: Fix GPI=
O mapping for newer version of software)
Merging erofs-fixes/fixes (0852b6ca941e erofs: fix 1 lcluster-sized pcluste=
r for big pcluster)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (2734d6c1b1a0 Linux 5.14-rc2)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (024591f9a6e0 arm: ioremap: don't abuse pfn_va=
lid() to check if pfn is in RAM)
Merging cel-fixes/for-rc (9f4ad9e425a1 Linux 5.12)
Merging irqchip-fixes/irq/irqchip-fixes (1fee9db9b42d irqchip/mips: Fix RCU=
 violation when using irqdomain lookup on interrupt entry)
Merging renesas-fixes/fixes (432b52eea3dc ARM: shmobile: defconfig: Restore=
 graphical consoles)
Merging drm-misc-fixes/for-linux-next-fixes (958f44255058 drm: ttm: Don't b=
ail from ttm_global_init if debugfs_create_dir fails)
Merging kspp-gustavo/for-next/kspp (cb163627e6d3 scsi: fas216: Fix fall-thr=
ough warning for Clang)
Merging kbuild/for-next (f12b034afeb3 scripts/Makefile.clang: default to LL=
VM_IAS=3D1)
Merging compiler-attributes/compiler-attributes (7ed012969bbc Compiler Attr=
ibutes: fix __has_attribute(__no_sanitize_coverage__) for GCC 4)
CONFLICT (content): Merge conflict in include/linux/compiler_attributes.h
Merging dma-mapping/for-next (2a047e0662ae dma-mapping: return an unsigned =
int from dma_map_sg{,_attrs})
Merging asm-generic/master (8f76f9c46952 bitops/non-atomic: make @nr unsign=
ed to avoid any DIV)
Merging arc/for-next (8020547829b7 ARC: mm: move MMU specific bits out of e=
ntry code ...)
Merging arm/for-next (3e9a47a71364 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (92b5529ab76e Merge branch 'for-next/entry' int=
o for-next/core)
Merging arm-perf/for-next/perf (fd264b310579 arm64/perf: Replace '0xf' inst=
ances with ID_AA64DFR0_PMUVER_IMP_DEF)
Merging arm-soc/for-next (4060df1d7c27 soc: document merges)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (6285af2a2821 Merge tags 'amlogic-arm-configs-for-=
v5.15', 'amlogic-arm64-dt-for-v5.15' and 'amlogic-arm-dt-for-v5.15' into fo=
r-next)
Merging aspeed/for-next (40cb6373b46c ARM: dts: aspeed: Add Facebook Fuji (=
AST2600) BMC)
Merging at91/at91-next (b102356e5bc1 Merge branch 'at91-dt' into at91-next)
Merging drivers-memory/for-next (c28b584deb1b Merge branch 'for-v5.15/omap-=
gpmc' into for-next)
Merging imx-mxs/for-next (2cb411d89676 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (cb293d3b430e Merge branch 'for_5.15/drivers-soc' int=
o next)
Merging mediatek/for-next (69862ae4e378 Merge branch 'v5.14-next/soc' into =
for-next)
Merging mvebu/for-next (69a91ff5e46c Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (7911f95d1713 Merge branch 'fixes' into for-next)
Merging qcom/for-next (57249830120b Merge remote-tracking branch 'refs/remo=
tes/origin/for-next' into for-next)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/qcom/msm8996.dtsi
Merging raspberrypi/for-next (b1f2fcb28228 ARM: dts: bcm283x: Fix VEC addre=
ss for BCM2711)
Merging renesas/next (59d7f78144a8 Merge branches 'renesas-arm-dt-for-v5.15=
' and 'renesas-drivers-for-v5.15' into renesas-next)
Merging reset/reset/next (bee08559701f reset: renesas: Add RZ/G2L usbphy co=
ntrol driver)
Merging rockchip/for-next (b484ae362bbc Merge branch 'v5.15-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (90861bf54255 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (3c94441995dd Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging stm32/stm32-next (1e6bc5987a52 ARM: dts: stm32: Update AV96 adv7513=
 node per dtbs_check)
Merging sunxi/sunxi/for-next (3f1c53207cf0 Merge branches 'sunxi/dt-for-5.1=
4' and 'sunxi/fixes-for-5.13' into sunxi/for-next)
Merging tegra/for-next (cc701ccede61 Merge branch for-5.15/arm64/dt into fo=
r-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (c1fa5ac6c2f4 arm64: dts: ti: k3-am642-sk: Add=
 pwm nodes)
Merging xilinx/for-next (4cddd9be7ef6 Merge branch 'zynq/soc' of https://gi=
thub.com/Xilinx/linux-xlnx into for-next)
Merging clk/clk-next (765f4fa0e9f1 Merge branch 'clk-qcom' into clk-next)
Merging clk-imx/for-next (fb3f4bca19b3 clk: imx: clk-divider-gate: Switch t=
o clk_divider.determine_rate)
Merging clk-renesas/renesas-clk (e8425dd55abb clk: renesas: Make CLK_R9A06G=
032 invisible)
Merging clk-samsung/for-next (a38fd8748464 Linux 5.12-rc2)
Merging csky/linux-next (90dc8c0e664e csky: Kconfig: Remove unused selects)
Merging h8300/h8300-next (6e5e55227c95 Merge tag 'v5.11' into h8300-next)
Merging m68k/for-next (2189e928b62e m68k: Fix invalid RMW_INSNS on CPUs tha=
t lack CAS)
Merging m68knommu/for-next (07c4e80124d1 m68knommu: only set CONFIG_ISA_DMA=
_API for ColdFire sub-arch)
Merging microblaze/next (14a832498c23 arch: microblaze: Fix spelling mistak=
e "vesion" -> "version")
Merging mips/mips-next (4d2ee1be4c2a MIPS: generic: Return true/false (not =
1/0) from bool functions)
Merging nds32/next (40e0dd851e7b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (94effcedaa54 openrisc: Fix compiler warnings in =
setup)
Merging parisc-hd/for-next (ca2b19a4bdb6 parisc: Increase gcc stack frame c=
heck to 2048 for 32- and 64-bit)
Merging powerpc/next (1e688dd2a3d6 powerpc/bug: Provide better flexibility =
to WARN_ON/__WARN_FLAGS() with asm goto)
CONFLICT (content): Merge conflict in arch/powerpc/sysdev/xive/common.c
Merging soc-fsl/next (242b0b398ccd soc: fsl: enable acpi support in RCPM dr=
iver)
Merging risc-v/for-next (8ba1a8b77ba1 riscv: Support allocating gigantic hu=
gepages using CMA)
Merging s390/for-next (e6e9bca186a0 Merge branch 'features' into for-next)
Merging sh/for-next (2882b7626f49 sh: kernel: traps: remove unused variable)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (1aee020155f3 um: remove unneeded semicolon in um_ar=
ch.c)
Merging xtensa/xtensa-for-next (7b7cec477fc3 xtensa: move core-y in arch/xt=
ensa/Makefile to arch/xtensa/Kbuild)
Merging pidfd/for-next (f4dd02cd8631 Merge branch 'kernel.sys' into for-nex=
t)
Merging fscrypt/master (38ef66b05cfa fscrypt: document struct fscrypt_opera=
tions)
Merging fscache/fscache-next (5193f26aef59 fscache: Use refcount_t for the =
cookie refcount instead of atomic_t)
Merging afs/afs-next (7af08140979a Revert "gcov: clang: fix clang-11+ build=
")
Merging btrfs/for-next (06ad2ba8e658 Merge branch 'for-next-next-v5.14-2021=
0811' into for-next-20210811)
Merging ceph/master (8434ffe71c87 ceph: take snap_empty_lock atomically wit=
h snaprealm refcount change)
Merging cifs/for-next (6d923f7a7e29 cifs: enable fscache usage even for fil=
es opened as rw)
Merging cifsd/cifsd-for-next (456af438ad49 Merge pull request #64 from namj=
aejeon/cifsd-for-next)
Merging configfs/for-next (769f52676756 configfs: restore the kernel v5.13 =
text attribute write behavior)
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (d252ff3de786 erofs: remove the mapping parameter from er=
ofs_try_to_free_cached_page())
Merging exfat/dev (50be9417e23a Merge tag 'io_uring-5.14-2021-07-09' of git=
://git.kernel.dk/linux-block)
Merging ext3/for_next (ca6e04e8f8d1 Pull udf cleanups and LVID check fix.)
Merging ext4/dev (6c6ce4d71465 jbd2: add sparse annotations for add_transac=
tion_credits())
Merging f2fs/dev (f4b05791dda9 f2fs: introduce periodic iostat io latency t=
races)
Applying: fxup for "f2fs: Convert to using invalidate_lock"
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (5d5b74aa9c76 fuse: allow sharing existing sb)
Merging gfs2/for-next (477448413342 gfs2: Remove redundant check from gfs2_=
glock_dq)
Merging jfs/jfs-next (5d299f44d765 jfs: Avoid field-overflowing memcpy())
Merging nfs/linux-next (2734d6c1b1a0 Linux 5.14-rc2)
Merging nfs-anna/linux-next (ca7d1d1a0b97 NFSv4.2: remove restriction of co=
py size for inter-server copy.)
Merging nfsd/nfsd-next (ab1016d39cc0 nfsd: fix NULL dereference in nfs3svc_=
encode_getaclres)
Merging cel/for-next (5312c4903d3f lockd: change the proc_handler for nsm_u=
se_hostnames)
Merging ntfs3/master (96b18047a717 fs/ntfs3: Add MAINTAINERS)
Merging orangefs/for-next (0fdec1b3c9fb orangefs: fix orangefs df output.)
Merging overlayfs/overlayfs-next (1be620376fbb ovl: use kvalloc in xattr co=
py-up)
Merging ubifs/next (a801fcfeef96 ubifs: Set/Clear I_LINKABLE under i_lock f=
or whiteout inode)
Merging v9fs/9p-next (732b33d0dbf1 9p/xen: Fix end of loop tests for list_f=
or_each_entry)
Merging xfs/for-next (edf27485eb56 xfs: cleanup __FUNCTION__ usage)
Merging zonefs/for-next (95b115332a83 zonefs: remove redundant null bio che=
ck)
Merging iomap/iomap-for-next (ae44f9c286da iomap: Add another assertion to =
inline data handling)
Merging djw-vfs/vfs-for-next (d03ef4daf33a fs: forbid invalid project ID)
Merging file-locks/locks-next (e1cc6e8c1969 fcntl: fix potential deadlock f=
or &fasync_struct.fa_lock)
Merging vfs/for-next (d75b9fa053e4 gfs2: Switch to may_setattr in gfs2_seta=
ttr)
Merging printk/for-next (23d8adcf8022 Merge branch 'rework/printk_safe-remo=
val' into for-next)
Merging pci/next (b9dd4044dcce Merge branch 'remotes/lorenzo/pci/tools')
Merging pstore/for-next/pstore (c5d4fb2539ca pstore/blk: Use "%lu" to forma=
t unsigned long)
Merging hid/for-next (e2e4893180f3 Merge branch 'for-5.14/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (32e8e4aeb37d Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i3c/i3c/next (3e5feb11a829 i3c: master: svc: fix doc warning in svc=
-i3c-master.c)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (b51f752c586c hwmon: (dell-smm) Rework SMM=
 function debugging)
Merging jc_docs/docs-next (37397b092e7f docs: sphinx-requirements: Move sph=
inx_rtd_theme to top)
Merging v4l-dvb/master (9c3a0f285248 Merge tag 'v5.14-rc4' into media_tree)
Merging v4l-dvb-next/master (b395ba42afd9 media: ir_toy: allow tx carrier t=
o be set)
Merging pm/linux-next (f0524fb43c59 Merge branch 'pm-opp' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (8158488baa1e cpufreq: scmi: Use=
 .register_em() to register with energy model)
Merging cpupower/cpupower (5499f2b80b56 tools: cpupower: fix typo in cpupow=
er-idle-set(1) manpage)
Merging devfreq/devfreq-next (e73f0f0ee754 Linux 5.14-rc1)
Merging opp/opp/linux-next (e122d7edf1a2 dt-bindings: opp: Convert to DT sc=
hema)
Merging thermal/thermal/linux-next (16f944291a4a thermal/drivers/tegra-soct=
herm: Silence message about clamped temperature)
Merging ieee1394/for-next (54b3bd99f094 firewire: nosy: switch from 'pci_' =
to 'dma_' API)
Merging dlm/next (62699b3f0a62 fs: dlm: move receive loop into receive hand=
ler)
Merging swiotlb/linux-next (a449ffaf9181 powerpc/svm: Don't issue ultracall=
s if !mem_encrypt_active())
Merging rdma/for-next (d2b10794fc13 RDMA/core: Create clean QP creations in=
terface for uverbs)
Merging net-next/master (1b3f78df6a80 bonding: improve nl error msg when de=
vice can't be enslaved because of IFF_MASTER)
CONFLICT (content): Merge conflict in drivers/ptp/Kconfig
Applying: NET_VENDOR_CIRRUS is not ready for COMPILE_TEST
Merging bpf-next/for-next (3c3bd542ffbb selftests/bpf: Add exponential back=
off to map_update_retriable in test_maps)
Merging ipsec-next/master (5d8dbb7fb82b net: xfrm: fix shift-out-of-bounce)
Merging mlx5-next/mlx5-next (598fe77df855 net/mlx5: Lag, Create shared FDB =
when in switchdev mode)
Merging netfilter-next/master (6f45933dfed0 Merge git://git.kernel.org/pub/=
scm/linux/kernel/git/pablo/nf-next)
Merging ipvs-next/master (9344988d2979 netfilter: ctnetlink: allow to filte=
r dump by status bits)
Merging wireless-drivers-next/master (d249ff28b1d8 intersil: remove obsolet=
e prism54 wireless driver)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging bluetooth/master (ecb71f256667 Bluetooth: Fix race condition in han=
dling NOP command)
CONFLICT (content): Merge conflict in net/bluetooth/hci_sysfs.c
CONFLICT (content): Merge conflict in net/bluetooth/hci_core.c
CONFLICT (content): Merge conflict in include/net/bluetooth/hci_core.h
Merging mac80211-next/master (8c89f7b3d3f2 mac80211: Use flex-array for rad=
iotap header bitmap)
Merging mtd/mtd/next (ed0587f96f35 mtd: rfd_ftl: use container_of() rather =
than cast)
CONFLICT (content): Merge conflict in drivers/mtd/mtd_blkdevs.c
Merging nand/nand/next (c26b316307ff mtd: spinand: macronix: Add Quad suppo=
rt for serial NAND flash)
Merging spi-nor/spi-nor/next (2734d6c1b1a0 Linux 5.14-rc2)
Merging crypto/master (9491923e4a68 crypto: wp512 - correct a non-kernel-do=
c comment)
Merging drm/drm-next (397ab98e2d69 Merge tag 'drm-msm-next-2021-08-12' of h=
ttps://gitlab.freedesktop.org/drm/msm into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/dp/dp_display.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_device_inf=
o.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_pci.c
CONFLICT (modify/delete): drivers/gpu/drm/i915/i915_globals.c deleted in dr=
m/drm-next and modified in HEAD. Version HEAD of drivers/gpu/drm/i915/i915_=
globals.c left in tree.
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_di=
splay.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ras=
_eeprom.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_drv=
.c
CONFLICT (content): Merge conflict in drivers/firmware/Makefile
$ git rm -f drivers/gpu/drm/i915/i915_globals.c
Merging drm-misc/for-linux-next (80cbd8808f85 drm/ttm: Include pagemap.h fr=
om ttm_tt.h)
Merging amdgpu/drm-next (a461152cdcd1 drm/radeon: Add HD-audio component no=
tifier support (v2))
Merging drm-intel/for-linux-next (bbaafe536c84 drm/i915: Nuke ORIGIN_GTT)
Merging drm-tegra/drm/tegra/for-next (fed028939417 gpu: host1x: debug: Dump=
 DMASTART and DMAEND register)
Merging drm-msm/msm-next (cb0927ab80d2 drm/msi/mdp4: populate priv->kms in =
mdp4_kms_init)
Merging imx-drm/imx-drm/next (59e4e762a17d gpu: ipu-v3: Fix i.MX IPU-v3 off=
set calculations for (semi)planar U/V formats)
Merging etnaviv/etnaviv/next (81fd23e2b3cc drm/etnaviv: Implement mmap as G=
EM object function)
Merging regmap/for-next (cc15156265f0 Merge remote-tracking branch 'regmap/=
for-5.15' into regmap-next)
Merging sound/for-next (327b34f2a97d ALSA: hda: Nuke unused reboot_notify c=
allback)
Merging sound-asoc/for-next (8d1998893cd5 Merge remote-tracking branch 'aso=
c/for-5.15' into asoc-next)
Merging modules/modules-next (ced75a2f5da7 MAINTAINERS: Add Luis Chamberlai=
n as modules maintainer)
Merging input/next (76ba1900cb67 dt-bindings: power: reset: qcom-pon: Conve=
rt qcom PON binding to yaml)
Merging block/for-next (16a390b4109c Merge branch 'for-5.15/io_uring' into =
for-next)
CONFLICT (modify/delete): block/mq-deadline-cgroup.c deleted in HEAD and mo=
dified in block/for-next. Version block/for-next of block/mq-deadline-cgrou=
p.c left in tree.
$ git rm -f block/mq-deadline-cgroup.c
Merging device-mapper/for-next (5a2a33884f0b dm crypt: Avoid percpu_counter=
 spinlock contention in crypt_page_alloc())
Merging pcmcia/pcmcia-next (e39cdacf2f66 pcmcia: i82092: fix a null pointer=
 dereference bug)
Merging mmc/next (7d6fab2c3ea8 mmc: renesas_sdhi: Refactor renesas_sdhi_pro=
be())
Merging mfd/for-mfd-next (9050ad816f52 mfd: db8500-prcmu: Handle missing FW=
 variant)
Merging backlight/for-backlight-next (1181f2164135 backlight: lm3630a: Conv=
ert to atomic PWM API and check for errors)
Merging battery/for-next (565efae96ca1 power: supply: smb347-charger: Imple=
ment USB VBUS regulator)
Merging regulator/for-next (4addb9a0c520 Merge remote-tracking branch 'regu=
lator/for-5.15' into regulator-next)
Merging security/next-testing (047843bdb316 Merge branch 'landlock_lsm_v34'=
 into next-testing)
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (907a399de7b0 evm: Check xattr size discre=
pancy between kernel and user)
Merging keys/keys-next (e377c31f788f integrity: Load mokx variables into th=
e blacklist keyring)
CONFLICT (content): Merge conflict in certs/system_keyring.c
Merging safesetid/safesetid-next (1b8b71922919 LSM: SafeSetID: Mark safeset=
id_initialized as __initdata)
Merging selinux/next (893c47d1964f selinux: return early for possible NULL =
audit buffers)
Merging smack/next (bfc3cac0c761 smack: mark 'smack_enabled' global variabl=
e as __initdata)
Merging tomoyo/master (ff1176468d36 Linux 5.14-rc3)
Merging tpmdd/next (ada16d6b0f0a tpm: ibmvtpm: Avoid error message when pro=
cess gets signal while waiting)
Merging watchdog/master (cf813c67d961 watchdog: iTCO_wdt: use dev_err() ins=
tead of pr_err())
Merging iommu/next (5441a84b87fa Merge branches 'iommu/fixes', 'apple/dart'=
 and 'x86/amd' into next)
Merging audit/next (d97e99386ad0 audit: add header protection to kernel/aud=
it.h)
Merging devicetree/for-next (5dfb2d2406e5 dt-bindings: phy: Add bindings fo=
r HiKey 970 PCIe PHY)
CONFLICT (modify/delete): Documentation/devicetree/bindings/arm/mediatek/me=
diatek,mmsys.txt deleted in devicetree/for-next and modified in HEAD. Versi=
on HEAD of Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.tx=
t left in tree.
$ git rm -f Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.t=
xt
Applying: dt-bindings: arm: mediatek: mmsys: fixup for conversion to yaml
Merging mailbox/mailbox-for-next (4f197188da66 MAINTAINERS: add entry for p=
olarfire soc mailbox)
Merging spi/for-next (65b41e07fa6c Merge remote-tracking branch 'spi/for-5.=
15' into spi-next)
Merging tip/auto-latest (5b38334330db Merge branch 'core/debugobjects')
CONFLICT (content): Merge conflict in include/asm-generic/bitops/non-atomic=
.h
Merging clockevents/timers/drivers/next (ce9570657d45 clocksource/drivers/m=
ediatek: Optimize systimer irq clear flow on shutdown)
Merging edac/edac-for-next (7d07deb3b838 EDAC/altera: Skip defining unused =
structures for specific configs)
Merging irqchip/irq/irqchip-next (4513fb87e140 Merge branch irq/misc-5.15 i=
nto irq/irqchip-next)
Merging ftrace/for-next (5acce0bff2a0 tracing / histogram: Fix NULL pointer=
 dereference on strcmp() on NULL event name)
Merging rcu/rcu/next (213605c149ff kcsan: selftest: Cleanup and add missing=
 __init)
CONFLICT (content): Merge conflict in kernel/time/tick-internal.h
Merging kvm/next (32bdc0198841 KVM: selftests: Move vcpu_args_set into perf=
_test_util)
Merging kvm-arm/next (ae280335cdb5 Merge branch kvm-arm64/mmu/el2-tracking =
into kvmarm-master/next)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/sysreg.h
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (1f703d2cf204 KVM: s390: allow facility 192 (vector-pa=
cked-decimal-enhancement facility 2))
Merging xen-tip/linux-next (88ca2521bd5b xen/events: Fix race in set_evtchn=
_to_irq)
Merging percpu/for-next (a81a52b325ec Merge branch 'for-5.14-fixes' into fo=
r-next)
Merging workqueues/for-next (ffd8bea81fbb workqueue: Replace deprecated CPU=
-hotplug functions.)
Merging drivers-x86/for-next (e4ec7a49ef8b platform/x86: intel_cht_int33fe:=
 Use the new i2c_acpi_client_count() helper)
Merging chrome-platform/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging hsi/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging leds/for-next (654933ae7d32 leds: flash: Remove redundant initializ=
ation of variable ret)
Merging ipmi/for-next (bf064c7bec3b char: ipmi: use DEVICE_ATTR helper macr=
o)
Merging driver-core/driver-core-next (3b35f2a6a625 bitmap: extend comment t=
o bitmap_print_bitmask/list_to_buf)
Merging usb/usb-next (2dec48c32a34 Merge 5.14-rc6 into usb-next)
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/qcom/sc7280.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/qcom/sc7280-idp.d=
ts
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (4e9340bb551a USB: serial: cp210x: determine fw=
 version for CP2105 and CP2108)
Merging usb-chipidea-next/for-usb-next (956df1bb0ab8 usb: chipidea: host: f=
ix port index underflow and UBSAN complains)
Merging tty/tty-next (9a4d22f7955e tty: serial: samsung: Add Exynos850 SoC =
data)
Merging char-misc/char-misc-next (9e1b28b77388 char: move RANDOM_TRUST_CPU =
& RANDOM_TRUST_BOOTLOADER into the Character devices menu)
Merging extcon/extcon-next (07de34f5ce1e extcon: max3355: Drop unused inclu=
de)
Merging phy-next/next (23fd679249df phy: qcom-qmp: add USB3 PHY support for=
 IPQ6018)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/phy=
/qcom,qmp-usb3-dp-phy.yaml
Merging soundwire/next (dd81e7c3f0bb soundwire: cadence: override PDI confi=
gurations to create loopback)
Merging thunderbolt/next (42716425ad7e thunderbolt: Fix port linking by che=
cking all adapters)
Merging vfio/next (eb24c1007e68 vfio: Remove struct vfio_device_ops open/re=
lease)
Merging staging/staging-next (ff63261978ee staging: r8188eu: remove ipx sup=
port from driver)
CONFLICT (modify/delete): drivers/staging/rtl8188eu/os_dep/os_intfs.c delet=
ed in staging/staging-next and modified in HEAD. Version HEAD of drivers/st=
aging/rtl8188eu/os_dep/os_intfs.c left in tree.
CONFLICT (modify/delete): drivers/staging/rtl8188eu/os_dep/ioctl_linux.c de=
leted in staging/staging-next and modified in HEAD. Version HEAD of drivers=
/staging/rtl8188eu/os_dep/ioctl_linux.c left in tree.
CONFLICT (modify/delete): drivers/staging/rtl8188eu/include/osdep_intf.h de=
leted in staging/staging-next and modified in HEAD. Version HEAD of drivers=
/staging/rtl8188eu/include/osdep_intf.h left in tree.
CONFLICT (content): Merge conflict in drivers/staging/r8188eu/os_dep/rtw_an=
droid.c
CONFLICT (content): Merge conflict in drivers/staging/r8188eu/include/rtw_a=
ndroid.h
CONFLICT (content): Merge conflict in drivers/misc/Kconfig
$ git rm -f drivers/staging/rtl8188eu/include/osdep_intf.h drivers/staging/=
rtl8188eu/os_dep/ioctl_linux.c drivers/staging/rtl8188eu/os_dep/os_intfs.c
Merging iio/togreg (d484c21bacfa iio: adc: Add driver for Renesas RZ/G2L A/=
D converter)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (8bf5d31c4f06 interconnect: qcom: osm-l3: Use driver-s=
pecific naming)
Merging dmaengine/next (9760383b22ed Merge tag 'v5.14-rc5' into next)
Merging cgroup/for-next (c5b6c8a56ef3 Merge branch 'for-5.15' into for-next)
Merging scsi/for-next (394a5f529e59 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (58dd8f6e1cf8 scsi: target: Fix sense key for inv=
alid EXTENDED COPY request)
$ git reset --hard HEAD^
Merging next-20210816 version of scsi-mkp
Merging vhost/linux-next (879753c816db vdpa/mlx5: Fix queue type selection =
logic)
Merging rpmsg/for-next (c93ca5f21d93 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (d0ef631d40ba gpio: mlxbf2: Use DEFINE_RES_=
MEM_NAMED() helper macro)
Merging gpio-intel/for-next (5111c2b6b019 gpio: dwapb: Get rid of legacy pl=
atform data)
Merging pinctrl/for-next (0dda8b013329 Merge branch 'ib-rockchip' into deve=
l)
CONFLICT (content): Merge conflict in drivers/pinctrl/pinctrl-rockchip.c
Merging pinctrl-intel/for-next (2f658f7a3953 pinctrl: tigerlake: Fix GPIO m=
apping for newer version of software)
Merging pinctrl-renesas/renesas-pinctrl (c4c4637eb57f pinctrl: renesas: Add=
 RZ/G2L pin and gpio controller driver)
Merging pinctrl-samsung/for-next (cdd3d945dcec pinctrl: samsung: Add Exynos=
850 SoC specific data)
Merging pwm/for-next (f4a8e31ed84e pwm: ep93xx: Ensure configuring period a=
nd duty_cycle isn't wrongly skipped)
Merging userns/for-next (534471c614f8 Merge of ucount-fixes-for-5.14, and s=
iginfo-si_trapno-for-v5.15 for testing in linux-next)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (2734d6c1b1a0 Linux 5.14-rc2)
Merging livepatching/for-next (c150bbbb1731 Merge branch 'for-5.13/signal' =
into for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (b02c96464f44 rtc: move RTC_LIB_KUNIT_TEST to proper l=
ocation)
Merging nvdimm/libnvdimm-for-next (30c10d32152d Merge branch 'for-5.12/cxl'=
 into libnvdimm-for-next)
Merging at24/at24/for-next (658ae44345c1 dt-bindings: at24: add ON Semi CAT=
24C04 and CAT24C05)
Merging ntb/ntb-next (28293b6c68cd ntb: ntb_pingpong: remove redundant init=
ialization of variables msg_data and spad_data)
Merging seccomp/for-next/seccomp (b4d8a58f8dcf seccomp: Fix setting loaded =
filter count during TSYNC)
Merging kspp/for-next/kspp (b88972649fa0 lib/test_stackinit: Add assigned i=
nitializers)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (0f79ce970e79 gnss: drop stray semicolons)
Merging fsi/next (9ab1428dfe2c fsi/sbefifo: Fix reset timeout)
Merging slimbus/for-next (e5c578adcdd9 slimbus: ngd: reset dma setup during=
 runtime pm)
Merging nvmem/for-next (80c3356bea4e nvmem: nintendo-otp: Add new driver fo=
r the Wii and Wii U OTP)
Merging xarray/main (2c7e57a02708 idr test suite: Improve reporting from id=
r_find_test_1)
Merging hyperv/hyperv-next (7aff79e297ee Drivers: hv: Enable Hyper-V code t=
o be built on ARM64)
Merging auxdisplay/auxdisplay (24ebc044c72e auxdisplay: Replace symbolic pe=
rmissions with octal permissions)
Merging kgdb/kgdb/for-next (e868f0a3c4b9 kdb: Rename members of struct kdbt=
ab_t)
Merging hmm/hmm (fe07bfda2fb9 Linux 5.12-rc1)
Merging fpga/for-next (4f45f3404960 spi: spi-altera-dfl: support n5010 feat=
ure revision)
Merging kunit/test (e73f0f0ee754 Linux 5.14-rc1)
Merging cfi/cfi/next (ff1176468d36 Linux 5.14-rc3)
Merging kunit-next/kunit (acd8e8407b8f kunit: Print test statistics on fail=
ure)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mhi/mhi-next (813272ed5238 Merge 5.14-rc5 into char-misc-next)
Merging memblock/for-next (e888fa7bb882 memblock: Check memory add/cap orde=
ring)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging rust/rust-next (5d3986cf8ed6 MAINTAINERS: Rust)
CONFLICT (content): Merge conflict in include/linux/kallsyms.h
CONFLICT (content): Merge conflict in Makefile
Applying: fixup for rust integration with Makefile.clang creation
Merging cxl/next (ceeb0da0a032 cxl/mem: Adjust ram/pmem range to represent =
DPA ranges)
Merging folio/for-next (1a90e9dae32c mm/writeback: Add folio_write_one)
CONFLICT (content): Merge conflict in mm/util.c
CONFLICT (content): Merge conflict in mm/rmap.c
CONFLICT (content): Merge conflict in mm/filemap.c
Merging akpm-current/current (2e2a9d7224fe ipc: replace costly bailout chec=
k in sysvipc_find_ipc())
CONFLICT (content): Merge conflict in mm/page-writeback.c
CONFLICT (content): Merge conflict in mm/memcontrol.c
CONFLICT (content): Merge conflict in include/linux/sched.h
CONFLICT (content): Merge conflict in include/linux/memcontrol.h
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (83a6f7913a93 arch: remove compat_alloc_user_space)

--Sig_/g3M3bTe.VTIavamkOjFnfy7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEbsHMACgkQAVBC80lX
0GyNbgf/XFB6cmRYPbbaewf6BGu+gw+Z9w7N50TDtdXKCZo6h4EdtfRVxGhzWd7q
hj9DhLH3SLuZVTbhBrCiRSiCx6hXuOtz+BdAkOJW6bkKKesdOv5njqTegskcMAsH
j+O83064Dhrh9ys472o/6aZLKxHx4HnX8XbS0wWMUIWjhfbSGAe4J9FW64RLupmk
kGy2soC7y8HO/o0fOhVNw0ksrXQnx6TBKGHZJcy6Z/05liJNrv7rV7ft4qHqVtSG
DK+cApKzywjslltMIb6ugYpKrKDyfflIL7ZJ7ovl+V9COF7xMdc28/sB6+YERTmA
HTeQroc+fVznLX8NTxSjXZ1eDpQ6sQ==
=eZPK
-----END PGP SIGNATURE-----

--Sig_/g3M3bTe.VTIavamkOjFnfy7--
