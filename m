Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 567C4517EE5
	for <lists+linux-next@lfdr.de>; Tue,  3 May 2022 09:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbiECHdG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 May 2022 03:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231761AbiECHdC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 May 2022 03:33:02 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 126AF366AA;
        Tue,  3 May 2022 00:29:29 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Kss6H4syGz4xR7;
        Tue,  3 May 2022 17:29:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1651562967;
        bh=gOnBU5sfPr63GEQTs8Cv8/DfFCnSxDvqCF+FZONdB3I=;
        h=Date:From:To:Cc:Subject:From;
        b=Ikgz8ypU/ASSf4T6MIUPSMbyohEmzGiVV5NkSycY3wdfqCfno4TRBGWkhYMpZsAKf
         1j5mGrMGQwZEhbY5ciMIN0dxA9OsvRoJnrOSBjCxJZVuYmobUD3xKLz/i1T25XD1s2
         9wy5SbP7BV9eHm99Nt87eGxEUldcpxxdGjWbnErNMT/LDPojVZ3Z+3jF+HN52qTgLF
         7ETdwPJklpwVfakMwC3DoZ65pC5Zx8UfQ0yQjc6MWvNpm7Y+DlwFfrcPbmbGAFtNQK
         m8i6tAuN2CPJIr7c2VvwLSrAlEvqDypaez1bwqlDq6IynDpILlU/FAa6tlyTKwi9BO
         G3bsXMoMe9SIw==
Date:   Tue, 3 May 2022 17:29:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 3
Message-ID: <20220503172926.08215c77@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jcHneZ1ip6DYkbC8wlx88TS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,LOCALPART_IN_SUBJECT,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jcHneZ1ip6DYkbC8wlx88TS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20220502:

The input tree still had its build failure so I used the version from
next-20220426.

The usb tree still had its build failure for which I reverted a commit.

The bitmap tree lost its build failure.

The mm tree still had its build failures for which I applied a supplied
patch and gained a conflict against the folio tree.

Non-merge commits (relative to Linus' tree): 7492
 8226 files changed, 410422 insertions(+), 168696 deletions(-)

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
ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386,
arm64, sparc and sparc64 defconfig and htmldocs. And finally, a simple
boot test of the powerpc pseries_le_defconfig kernel in qemu (with and
without kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 347 trees (counting Linus' and 94 trees of bug
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
Merging origin/master (9050ba3a61a4 Merge tag 'for-5.18-rc5-tag' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging fixes/fixes (d06c942efea4 Merge tag 'for_linus' of git://git.kernel=
.org/pub/scm/linux/kernel/git/mst/vhost)
Merging mm-hotfixes/mm-hotfixes-unstable (10663622a1e5 arm[64]/memremap: do=
n't abuse pfn_valid() to ensure presence of linear map)
Merging kbuild-current/fixes (312310928417 Linux 5.18-rc1)
Merging arc-current/for-curr (c6ed4d84a2c4 ARC: remove redundant READ_ONCE(=
) in cmpxchg loop)
Merging arm-current/fixes (9be4c88bb792 ARM: 9191/1: arm/stacktrace, kasan:=
 Silence KASAN warnings in unwind_frame())
Merging arm64-fixes/for-next/fixes (c35fe2a68f29 elf: Fix the arm64 MTE ELF=
 segment name and value)
Merging arm-soc-fixes/arm/fixes (adee8aa22a92 Revert "arm: dts: at91: Fix b=
oolean properties with values")
Merging drivers-memory-fixes/fixes (73039c6c7f36 memory: renesas-rpc-if: Fi=
x HF/OSPI data transfer in Manual Mode)
Merging tee-fixes/fixes (98268f2a2a9f Merge branch 'optee_ffa_probe_fix_for=
_v5.18' into fixes)
Merging m68k-current/for-linus (0d52a01a266b m68k: defconfig: Disable fbdev=
 on Sun3/3x)
Merging powerpc-fixes/fixes (bb82c574691d powerpc/perf: Fix 32bit compile)
Merging s390-fixes/fixes (b5d1274409d0 KVM: s390: Fix lockdep issue in vm m=
emop)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (80f6e3080bfc fs-verity: fix signed inte=
ger overflow with i_size near S64_MAX)
Merging net/master (79396934e289 net: dsa: b53: convert to phylink_pcs)
Merging bpf/master (a0df71948e95 tls: Skip tls_append_frag on zero copy siz=
e)
Merging ipsec/master (79396934e289 net: dsa: b53: convert to phylink_pcs)
Merging netfilter/master (05ae2fba821c netfilter: nft_socket: make cgroup m=
atch work in input too)
Merging ipvs/master (05ae2fba821c netfilter: nft_socket: make cgroup match =
work in input too)
Merging wireless/main (bb300130e47f ath11k: reduce the wait time of 11d sca=
n and hw scan while add interface)
Merging rdma-fixes/for-rc (570a4bf7440e RDMA/rxe: Recheck the MR in when ge=
nerating a READ reply)
Merging sound-current/for-linus (eb9d84b0ffe3 ALSA: fireworks: fix wrong re=
turn count shorter than expected by 4 bytes)
Merging sound-asoc-fixes/for-linus (3a129880c5de Merge remote-tracking bran=
ch 'asoc/for-5.17' into asoc-linus)
Merging regmap-fixes/for-linus (312310928417 Linux 5.18-rc1)
Merging regulator-fixes/for-linus (dfd2b37edf7e regulator: dt-bindings: Rev=
ise the rt5190a buck/ldo description)
Merging spi-fixes/for-linus (8868c03f3ca5 spi: spi-mem: check if data buffe=
rs are on stack)
Merging pci-current/for-linus (92597f97a40b PCI/PM: Avoid putting Elo i2 PC=
Ie Ports in D3cold)
Merging driver-core.current/driver-core-linus (672c0c517342 Linux 5.18-rc5)
Merging tty.current/tty-linus (672c0c517342 Linux 5.18-rc5)
Merging usb.current/usb-linus (672c0c517342 Linux 5.18-rc5)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (e23e50e7acc8 USB: serial: whiteheat: fi=
x heap overflow in WHITEHEAT_GET_DTR_RTS)
Merging phy/fixes (2c8045d48dee phy: amlogic: fix error path in phy_g12a_us=
b3_pcie_probe())
Merging staging.current/staging-linus (ce522ba9ef7e Linux 5.18-rc2)
Merging iio-fixes/fixes-togreg (fe18894930a0 iio: mma8452: fix probe fail w=
hen device tree compatible is used.)
Merging counter-fixes/fixes-togreg (ce522ba9ef7e Linux 5.18-rc2)
Merging char-misc.current/char-misc-linus (672c0c517342 Linux 5.18-rc5)
Merging soundwire-fixes/fixes (312310928417 Linux 5.18-rc1)
Merging thunderbolt-fixes/fixes (672c0c517342 Linux 5.18-rc5)
Merging input-current/for-linus (4352e23a7ff2 Input: cros-ec-keyb - only re=
gister keyboard if rows/columns exist)
Merging crypto-current/master (aa8e73eed7d3 crypto: x86/sm3 - Fixup SLS)
Merging vfio-fixes/for-linus (1ef3342a934e vfio/pci: Fix vf_token mechanism=
 when device-specific VF drivers are used)
Merging kselftest-fixes/fixes (e8f0c8965932 selftest/vm: add skip support t=
o mremap_test)
Merging modules-fixes/modules-linus (dc0ce6cc4b13 lib/test: use after free =
in register_test_dev_kmod())
Merging dmaengine-fixes/fixes (9889fc4f19e0 dmaengine: idxd: Fix the error =
handling path in idxd_cdev_register())
Merging backlight-fixes/for-backlight-fixes (a38fd8748464 Linux 5.12-rc2)
Merging mtd-fixes/mtd/fixes (ba7542eb2dd5 mtd: rawnand: qcom: fix memory co=
rruption that causes panic)
Merging mfd-fixes/for-mfd-fixes (a61f4661fba4 mfd: intel_quark_i2c_gpio: Re=
vert "Constify static struct resources")
Merging v4l-dvb-fixes/fixes (d4cb77112c7b media: isl7998x: select V4L2_FWNO=
DE to fix build error)
Merging reset-fixes/reset/fixes (03cb66463b55 dt-bindings: reset: Add paren=
t "resets" property as optional)
Merging mips-fixes/mips-fixes (f0a6c68f6998 MIPS: Fix CP0 counter erratum d=
etection for R4k CPUs)
Merging at91-fixes/at91-fixes (0c640d9544d0 ARM: dts: at91: fix pinctrl pha=
ndles)
Merging omap-fixes/fixes (46ff3df87215 ARM: dts: logicpd-som-lv: Fix wrong =
pinmuxing on OMAP35)
Merging kvm-fixes/master (f751d8eac176 KVM: x86: work around QEMU issue wit=
h synthetic CPUID leaves)
Merging kvms390-fixes/master (4aa5ac75bf79 KVM: s390: Fix lockdep issue in =
vm memop)
Merging hwmon-fixes/hwmon (08da09f02804 hwmon: (pmbus) delta-ahe50dc-fan: w=
ork around hardware quirk)
Merging nvdimm-fixes/libnvdimm-fixes (d28820419ca3 cxl/pci: Drop shadowed v=
ariable)
Merging cxl-fixes/fixes (fae8817ae804 cxl/mem: Fix memory device capacity p=
robing)
Merging btrfs-fixes/next-fixes (e4a747ad6e40 Merge branch 'misc-5.18' into =
next-fixes)
Merging vfs-fixes/fixes (9d2231c5d74e lib/iov_iter: initialize "flags" in n=
ew pipe_buffer)
Merging dma-mapping-fixes/for-linus (18a3c5f7abfd Merge tag 'for_linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (eb2fd9b43fae platform/x86/intel: pmc/core:=
 change pmc_lpm_modes to static)
Merging samsung-krzk-fixes/fixes (436ce66003d5 ARM: s3c: mark as deprecated=
 and schedule removal)
Merging pinctrl-samsung-fixes/fixes (ac875df4d854 pinctrl: samsung: fix mis=
sing GPIOLIB on ARM64 Exynos config)
Merging devicetree-fixes/dt/linus (e17fd4bf54fb dt-bindings: leds-mt6360: D=
rop redundant 'unevaluatedProperties')
Merging scsi-fixes/fixes (8be70a842f70 scsi: target: pscsi: Set SCF_TREAT_R=
EAD_AS_NORMAL flag only if there is valid data)
Merging drm-fixes/drm-fixes (9d9f720733b7 Merge tag 'amd-drm-fixes-5.18-202=
2-04-27' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (f7e1089f4376 drm/i915/fbc: Co=
nsult hw.crtc instead of uapi.crtc)
Merging mmc-fixes/fixes (4bc31edebde5 mmc: core: Set HS clock speed before =
sending HS CMD13)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (312310928417 Linux 5.18-rc1)
Merging hyperv-fixes/hyperv-fixes (eaa03d345358 Drivers: hv: vmbus: Replace=
 smp_store_mb() with virt_store_mb())
Merging soc-fsl-fixes/fix (a222fd854139 soc: fsl: qe: Check of ioremap retu=
rn value)
Merging risc-v-fixes/fixes (c6fe81191bd7 RISC-V: relocate DTB if it's outsi=
de memory region)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (312310928417 Linux 5.18-rc1)
Merging spdx/spdx-linus (312310928417 Linux 5.18-rc1)
Merging gpio-brgl-fixes/gpio/for-current (e5f6e5d554ac gpio: mvebu: drop pw=
m base assignment)
Merging gpio-intel-fixes/fixes (0c2cae09a765 gpiolib: acpi: Convert type fo=
r pin to be unsigned)
Merging pinctrl-intel-fixes/fixes (0be0b70df661 pinctrl: alderlake: Fix reg=
ister offsets for ADL-N variant)
Merging erofs-fixes/fixes (8b1ac84dcf2c Documentation/ABI: sysfs-fs-erofs: =
Fix Sphinx errors)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (02c7efa43627 Documentation: kunit: fix pat=
h to .kunitconfig in start.rst)
Merging ubifs-fixes/fixes (c3c07fc25f37 ubi: fastmap: Return error code if =
memory allocation fails in add_aeb())
Merging memblock-fixes/fixes (c94afc46cae7 memblock: use kfree() to release=
 kmalloced memblock regions)
Merging cel-fixes/for-rc (4d5004451ab2 SUNRPC: Fix the svc_deferred_event t=
race class)
Merging irqchip-fixes/irq/irqchip-fixes (544808f7e21c irqchip/gic, gic-v3: =
Prevent GSI to SGI translations)
Merging renesas-fixes/fixes (432b52eea3dc ARM: shmobile: defconfig: Restore=
 graphical consoles)
Merging perf-current/perf/urgent (8013d1d3d2e3 Merge tag 'soc-fixes-5.18-3'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc)
Merging efi-fixes/urgent (9feaf8b387ee efi: fix return value of __setup han=
dlers)
Merging zstd-fixes/zstd-linus (88a309465b3f lib: zstd: clean up double word=
 in comment.)
Merging drm-misc-fixes/for-linux-next-fixes (dc3ae06c5f21 drm/sun4i: Remove=
 obsolete references to PHYS_OFFSET)
Merging kbuild/for-next (3eb85539032f Makefile: fix 2 typos)
Merging perf/perf/core (e0c1b8f9eba8 Merge remote-tracking branch 'torvalds=
/master' into perf/core)
Merging compiler-attributes/compiler-attributes (7c00621dcaee compiler_type=
s: mark __compiletime_assert failure as __noreturn)
Merging dma-mapping/for-next (3cb4503a3301 x86: remove cruft from <asm/dma-=
mapping.h>)
Merging asm-generic/master (fba2689ee77e Merge branch 'remove-h8300' of git=
://git.infradead.org/users/hch/misc into asm-generic)
CONFLICT (modify/delete): Documentation/devicetree/bindings/memory-controll=
ers/renesas,h8300-bsc.yaml deleted in asm-generic/master and modified in HE=
AD.  Version HEAD of Documentation/devicetree/bindings/memory-controllers/r=
enesas,h8300-bsc.yaml left in tree.
$ git rm -f Documentation/devicetree/bindings/memory-controllers/renesas,h8=
300-bsc.yaml
Merging arc/for-next (6aa98f621786 ARC: bpf: define uapi for BPF_PROG_TYPE_=
PERF_EVENT program type)
Merging arm/for-next (012d2fb6c8c9 Merge branch 'devel-stable' into for-nex=
t)
CONFLICT (content): Merge conflict in arch/arm/Kconfig
CONFLICT (content): Merge conflict in arch/arm/Kconfig
CONFLICT (content): Merge conflict in arch/arm/Kconfig.debug
CONFLICT (content): Merge conflict in arch/arm/boot/compressed/Makefile
CONFLICT (content): Merge conflict in arch/arm/include/asm/switch_to.h
CONFLICT (content): Merge conflict in arch/arm/kernel/traps.c
Merging arm64/for-next/core (c3adaa5c5c55 Merge branch 'for-next/kselftest'=
 into for-next/core)
Merging arm-perf/for-next/perf (602c873eb52e perf: Replace acpi_bus_get_dev=
ice())
Merging arm-soc/for-next (d8c5d0d2d566 soc:document merges)
CONFLICT (content): Merge conflict in arch/arm/Kconfig
CONFLICT (content): Merge conflict in drivers/video/fbdev/omap/lcdc.c
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (ed532523b458 Merge branch 'v5.18/fixes' into for-=
next)
Merging aspeed/for-next (d9540eeaa3d1 Merge branches 'nuvoton-dt-for-v5.18'=
 and 'dt-for-v5.18' into for-next)
Merging at91/at91-next (0c640d9544d0 ARM: dts: at91: fix pinctrl phandles)
Merging drivers-memory/for-next (d2fd434f2e1c Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (08021731ef7a Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (cb293d3b430e Merge branch 'for_5.15/drivers-soc' int=
o next)
Merging mediatek/for-next (54715794cbcd Merge branch 'v5.18-next/soc' into =
for-next)
Merging mvebu/for-next (8885ae5142a4 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (930161749e64 Merge branch 'omap-for-v5.19/dt' into f=
or-next)
Merging qcom/for-next (0b3dd1e94ac0 Merge branches 'arm64-for-5.19', 'arm64=
-defconfig-for-5.19', 'clk-for-5.19', 'defconfig-for-5.19', 'drivers-for-5.=
19', 'dts-for-5.19' and 'arm64-fixes-for-5.18' into for-next)
Merging raspberrypi/for-next (c5915b53d4c2 dt-bindings: soc: bcm: Convert b=
rcm,bcm2835-vchiq to json-schema)
Merging renesas/next (f8a7df6a1a04 Merge branch 'renesas-arm-dt-for-v5.19' =
into renesas-next)
Merging reset/reset/next (25459cf32255 dt-bindings: reset: st,sti-powerdown=
: Convert to yaml)
Merging rockchip/for-next (7aa1e0349129 Merge branch 'v5.19-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (96a93983e538 Merge branch 'for-v5.19/arm-dts=
64-cleanups' into for-next)
Merging scmi/for-linux-next (d291310bcf58 Merge branch 'for-next/ffa' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-lin=
ux-next)
Merging stm32/stm32-next (1a43e9b281c6 ARM: dts: stm32: add support for Pro=
tonic PRTT1x boards)
Merging sunxi/sunxi/for-next (737a9ba0eeb8 Merge branch 'sunxi/fixes-for-5.=
18' into sunxi/for-next)
Merging tee/next (db30e53bf897 Merge branch 'tee_cleanup_for_v5.19' into ne=
xt)
Merging tegra/for-next (59ac218540e9 Merge branch for-5.19/arm64/defconfig =
into for-next)
Merging ti/ti-next (720b32f0f7bc Merge branch 'ti-k3-config-next' into ti-n=
ext)
Merging xilinx/for-next (312310928417 Linux 5.18-rc1)
Merging clk/clk-next (b473708bf4b5 Merge branch 'clk-airoha' into clk-next)
Merging clk-imx/for-next (43896f56b59e clk: imx8mp: add clkout1/2 support)
Merging clk-renesas/renesas-clk (0ab55cf18341 clk: renesas: cpg-mssr: Add s=
upport for R-Car V4H)
Merging clk-samsung/for-next (45bd8166a1d8 clk: samsung: Add initial Exynos=
7885 clock driver)
Merging csky/linux-next (c5acdf12cc24 csky: atomic: Add conditional atomic =
operations' optimization)
Merging m68k/for-next (a96e4ebf3ded m68k: defconfig: Update defconfigs for =
v5.18-rc1)
Merging m68knommu/for-next (2954225f1484 m68k: coldfire: drop ISA_DMA_API s=
upport)
Merging microblaze/next (78b5f52ab6f6 microblaze: fix typos in comments)
Merging mips/mips-next (7671f9674b47 mips: dts: ingenic: x1000: Add PWM dev=
ice tree node)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (862cf8d5fd98 openrisc/boot: Remove unnecessary i=
nitialisation in memcpy().)
Merging parisc-hd/for-next (e34799ccc126 parisc: Change MAX_ADDRESS to beco=
me unsigned long long)
Merging powerpc/next (ce522ba9ef7e Linux 5.18-rc2)
Merging soc-fsl/next (1ce93cb102e7 soc: fsl: qe: Check of ioremap return va=
lue)
Merging risc-v/for-next (d26eee72d9b9 riscv: dts: rename the node name of d=
ma)
Merging s390/for-next (aed80953c8f6 Merge branch 'features' into for-next)
Merging sh/for-next (8518e694203d sh: pgtable-3level: Fix cast to pointer f=
rom integer of different size)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (82017457957a um: run_helper: Write error message to=
 kernel log on exec failure on host)
Merging xtensa/xtensa-for-next (7f9c97417481 xtensa: clean up labels in the=
 kernel entry assembly)
Merging pidfd/for-next (0014edaedfd8 fs: unset MNT_WRITE_HOLD on failure)
Merging fscrypt/master (a7a5bc5fe8ac fscrypt: log when starting to use inli=
ne encryption)
Merging fscache/fscache-next (312310928417 Linux 5.18-rc1)
Merging afs/afs-next (26291c54e111 Linux 5.17-rc2)
Merging btrfs/for-next (ee13d3e82868 Merge branch 'for-next-next-v5.18-2022=
0429' into for-next-20220429)
Merging ceph/master (7acae6183cf3 ceph: fix possible NULL pointer dereferen=
ce for req->r_session)
Merging cifs/for-next (672c0c517342 Linux 5.18-rc5)
Merging configfs/for-next (84ec758fb2da configfs: fix a race in configfs_{,=
un}register_subsystem())
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (011c045788ed erofs: add 'fsid' mount option)
Merging exfat/dev (1d404b899e32 exfat: reduce block requests when zeroing a=
 cluster)
Merging ext3/for_next (cfb73d370782 Pull evictable fsnotify marks work from=
 Amir.)
Merging ext4/dev (23e3d7f7061f jbd2: fix a potential race while discarding =
reserved buffers after an abort)
Merging f2fs/dev (6daa83cbee0d f2fs: extend stat_lock to avoid potential ra=
ce in statfs)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (6b49bc9d8a5f fuse: avoid unnecessary spinlock bump)
Merging gfs2/for-next (db0c1968e935 gfs2: Variable rename)
Merging jfs/jfs-next (0d4837fdb796 fs: jfs: fix possible NULL pointer deref=
erence in dbFree())
Merging ksmbd/ksmbd-for-next (22da5264abf4 Merge tag '5.18-rc3-ksmbd-fixes'=
 of git://git.samba.org/ksmbd)
Merging nfs/linux-next (00c94ebec592 NFSv4: Don't invalidate inode attribut=
es on delegation return)
Merging nfs-anna/linux-next (d19e0183a883 NFS: Do not report writeback erro=
rs in nfs_getattr())
Merging nfsd/for-next (5c2cb3833940 SUNRPC: Remove svc_rqst::rq_xprt_hlen)
Merging ntfs3/master (52e00ea6b26e fs/ntfs3: Update valid size if -EIOCBQUE=
UED)
Merging orangefs/for-next (40a74870b2d1 orangefs: Fix the size of a memory =
allocation in orangefs_bufmap_alloc())
Merging overlayfs/overlayfs-next (94fd19752b28 ovl: don't fail copy up if n=
o fileattr support on upper)
Merging ubifs/next (705757274599 ubifs: rename_whiteout: correct old_dir si=
ze computing)
Merging v9fs/9p-next (22e424feb665 Revert "fs/9p: search open fids first")
Merging xfs/for-next (a44a027a8b2a Merge tag 'large-extent-counters-v9' of =
https://github.com/chandanr/linux into xfs-5.19-for-next)
Merging zonefs/for-next (31a644b3c2ae documentation: zonefs: Document sysfs=
 attributes)
CONFLICT (content): Merge conflict in fs/zonefs/super.c
Merging iomap/iomap-for-next (ebb7fb1557b1 xfs, iomap: limit individual ioe=
nd chain lengths in writeback)
Merging djw-vfs/vfs-for-next (49df34221804 fs: fix an infinite loop in ioma=
p_fiemap)
Merging file-locks/locks-next (80d8e4d3f313 fs/locks: fix fcntl_getlk64/fcn=
tl_setlk64 stub prototypes)
Merging vfs/for-next (fd78f28f9f50 Merge branch 'work.namei' into for-next)
Merging printk/for-next (bfc1f2749c23 Merge branch 'rework/kthreads' into f=
or-next)
Merging pci/next (9507c62158a6 Merge branch 'remotes/lorenzo/pci/versatile')
Merging pstore/for-next/pstore (8126b1c73108 pstore: Don't use semaphores i=
n always-atomic-context code)
Merging hid/for-next (eb3f85f0fc6e Merge branch 'for-5.19/wacom' into for-n=
ext)
CONFLICT (content): Merge conflict in drivers/hid/Kconfig
CONFLICT (content): Merge conflict in drivers/hid/Makefile
Merging i2c/i2c/for-next (05b42eff61a5 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i3c/i3c/next (6cbf8b38dfe3 i3c: fix uninitialized variable use in i=
2c setup)
Merging dmi/dmi-for-next (f97a2103f1a7 firmware: dmi: Move product_sku info=
 to the end of the modalias)
Merging hwmon-staging/hwmon-next (260c272ce947 hwmon: (pmbus) Register with=
 thermal for PSC_TEMPERATURE)
Merging jc_docs/docs-next (81c653659d34 Documentation/sysctl: document max_=
rcu_stall_to_panic)
Merging v4l-dvb/master (3d59142ad94c media: dvb-usb: dib0700_devices: use a=
n enum for the device number)
Merging v4l-dvb-next/master (6c1c1eb8c87d media: ext-ctrls-codec.rst: fix i=
ndentation)
Merging pm/linux-next (d3fa656ae5f3 Merge branch 'pm-cpuidle-next' into lin=
ux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (a3b8d1b12c6b cpufreq: mediatek:=
 Fix NULL pointer dereference in mediatek-cpufreq)
Merging cpupower/cpupower (312310928417 Linux 5.18-rc1)
Merging devfreq/devfreq-next (5d521a307526 PM / devfreq: rk3399_dmc: Avoid =
static (reused) profile)
Merging opp/opp/linux-next (3e1fac9324f8 dt-bindings: opp: opp-v2-kryo-cpu:=
 Remove SMEM)
Merging thermal/thermal/linux-next (c07a7c8dbcd8 tools/thermal: Add thermal=
 daemon skeleton)
Merging ieee1394/for-next (54b3bd99f094 firewire: nosy: switch from 'pci_' =
to 'dma_' API)
Merging dlm/next (8e51ec6146fd dlm: use kref_put_lock in __put_lkb)
Merging rdma/for-next (ff815a89398d RDMA/core: Avoid flush_workqueue(system=
_unbound_wq) usage)
Merging net-next/master (0530a683fc85 Merge branch 'vsock-virtio-add-suppor=
t-for-device-suspend-resume')
CONFLICT (content): Merge conflict in tools/testing/selftests/net/forwardin=
g/Makefile
Merging bpf-next/for-next (20b87e7c29df selftests/bpf: Fix two memory leaks=
 in prog_tests)
Merging ipsec-next/master (6e28f56c0d1d Merge branch 'adin1100-industrial-P=
HY-support')
Merging mlx5-next/mlx5-next (2984287c4c19 net/mlx5: Remove not-implemented =
IPsec capabilities)
Merging netfilter-next/master (0c7b27616fbd selftests: netfilter: add fib e=
xpression forward test case)
Merging ipvs-next/master (0c7b27616fbd selftests: netfilter: add fib expres=
sion forward test case)
Merging bluetooth/master (a99a4899aae6 Bluetooth: btusb: Add a new PID/VID =
0489/e0c8 for MT7921)
Merging wireless-next/main (0d3b26c4b97a rtw88: remove a copy of the NAPI_P=
OLL_WEIGHT define)
Merging mtd/mtd/next (43823c5c56f2 mtd: cfi_cmdset_0002: Rename chip_ready =
variables)
Merging nand/nand/next (079d6348f3be Merge tag 'mtd/mtk-spi-nand-for-5.19' =
into nand/next)
Merging spi-nor/spi-nor/next (5ad784d990ac mtd: spi-nor: amend the rdsr dum=
my cycles documentation)
Merging crypto/master (11aeb93089ce hwrng: optee - remove redundant initial=
ization to variable rng_size)
Merging drm/drm-next (15e2b419a837 Merge tag 'drm-misc-next-2022-04-28' of =
git://anongit.freedesktop.org/drm/drm-misc into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/radeon/radeon_sync.c
Merging drm-misc/for-linux-next (3fa50896c359 drm/rockchip: Support YUV for=
mats with U/V swapped)
Merging amdgpu/drm-next (3da2c38231a4 drm/amdgpu: Free user pages if amdgpu=
_cs_parser_bos failed)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
Applying: fix up for "drm/ttm: rework bulk move handling v5"
Merging drm-intel/for-linux-next (c140915c00c9 drm/i915: move tons of power=
 well initializers to rodata)
Merging drm-tegra/drm/tegra/for-next (b53c24f69199 drm/tegra: Support YVYU,=
 VYUY and YU24 formats)
Merging drm-msm/msm-next (78f815c1cf8f drm/msm: return the average load ove=
r the polling period)
Merging imx-drm/imx-drm/next (927d8fd465ad drm/imx: ipuv3-plane: Remove red=
undant color encoding and range initialisation)
Merging etnaviv/etnaviv/next (2829a9fcb738 drm/etnaviv: reap idle softpin m=
appings when necessary)
Merging fbdev/for-next (f443e374ae13 Linux 5.17)
Merging regmap/for-next (d640947562ce regmap: cache: set max_register with =
reg_stride)
Merging sound/for-next (011b559be832 ALSA: pcm: Check for null pointer of p=
ointer substream before dereferencing it)
Merging sound-asoc/for-next (180e66c028cb Merge remote-tracking branch 'aso=
c/for-5.19' into asoc-next)
Merging modules/modules-next (eb28e156bfd4 kallsyms: enhance %pS/s/b printi=
ng when KALLSYSMS is disabled)
Merging input/next (75e97ccaf557 Input: sun4i-lradc-keys - add support for =
R329 and D1)
$ git reset --hard HEAD^
Merging next-20220426 version of input
Merging block/for-next (e74c4a875ad8 Merge branch 'for-5.19/block' into for=
-next)
Merging device-mapper/for-next (e7ea9556985f dm: improve abnormal bio proce=
ssing)
Merging libata/for-next (0cb63670d505 ata: Make use of the helper function =
devm_platform_ioremap_resource())
Merging pcmcia/pcmcia-next (3928cf08334e pcmcia: db1xxx_ss: restrict to MIP=
S_DB1XXX boards)
Merging mmc/next (ac9d25557dcc mmc: core: Add CIDs for cards to the entropy=
 pool)
Merging mfd/for-mfd-next (3474b838f420 dt-bindings: Drop undocumented i.MX =
iomuxc-gpr bindings in examples)
Merging backlight/for-backlight-next (023a8830a628 backlight: backlight: Sl=
ighly simplify devm_of_find_backlight())
Merging battery/for-next (312310928417 Linux 5.18-rc1)
Merging regulator/for-next (dae010473785 Merge remote-tracking branch 'regu=
lator/for-5.19' into regulator-next)
Merging security/next-testing (047843bdb316 Merge branch 'landlock_lsm_v34'=
 into next-testing)
Merging apparmor/apparmor-next (c2489617b3b9 apparmor: Fix undefined refere=
nce to `zlib_deflate_workspacesize')
Merging integrity/next-integrity (891163adf180 ima: remove the IMA_TEMPLATE=
 Kconfig option)
Merging keys/keys-next (2d743660786e Merge branch 'fixes' of git://git.kern=
el.org/pub/scm/linux/kernel/git/viro/vfs)
Merging safesetid/safesetid-next (1b8b71922919 LSM: SafeSetID: Mark safeset=
id_initialized as __initdata)
Merging selinux/next (6a9e261cbbee selinux: don't sleep when CONFIG_SECURIT=
Y_SELINUX_CHECKREQPROT_VALUE is true)
Merging smack/next (ba6b652bd863 smack: Remove redundant assignments)
Merging tomoyo/master (3a321335572d workqueue: Warn flushing of kernel-glob=
al workqueues)
Merging tpmdd/next (fad7eba9464e certs: Explain the rationale to call panic=
())
Merging watchdog/master (672c0c517342 Linux 5.18-rc5)
Merging iommu/next (85613addc0be Merge branches 'apple/dart', 'arm/msm', 'i=
ommu/fixes', 'ppc/pamu', 'x86/amd', 'vfio-notifier-fix' and 'core' into nex=
t)
CONFLICT (content): Merge conflict in drivers/iommu/amd/iommu.c
Merging audit/next (312310928417 Linux 5.18-rc1)
Merging devicetree/for-next (4fb74186cee8 of: overlay: do not free changese=
t when of_overlay_apply returns error)
Merging mailbox/mailbox-for-next (1b0d0f7c12d5 dt-bindings: mailbox: add de=
finition for mt8186)
Merging spi/for-next (4b939e3a3e91 Merge remote-tracking branch 'spi/for-5.=
19' into spi-next)
Merging tip/master (aea1ae1ab93e Merge x86/cpu into tip/master)
CONFLICT (content): Merge conflict in Documentation/admin-guide/kernel-para=
meters.txt
CONFLICT (content): Merge conflict in kernel/sysctl.c
Merging clockevents/timers/drivers/next (49c14f94ccfe clocksource/drivers/t=
imer-of: check return value of of_iomap in timer_of_base_init())
Merging edac/edac-for-next (cd2ef50eb483 Merge edac-alloc-cleanup into for-=
next)
Merging irqchip/irq/irqchip-next (4bde53ab3370 Merge branch irq/gpio-immuta=
ble into irq/irqchip-next)
Merging ftrace/for-next (c87857e21486 Merge branch 'trace/for-next-rtla' in=
to trace/for-next)
Merging rcu/rcu/next (4ccb27d8a0f2 rcutorture: Simplify rcu_torture_read_ex=
it_child() loop)
Merging kvm/next (71d7c575a673 Merge branch 'kvm-fixes-for-5.18-rc5' into H=
EAD)
Merging kvm-arm/next (4e6921a2e6c1 Merge branch kvm-arm64/hyp-stack-guard i=
nto kvmarm-master/next)
Merging kvms390/next (4aa5ac75bf79 KVM: s390: Fix lockdep issue in vm memop)
Merging xen-tip/linux-next (533bec143a4c arm/xen: Fix some refcount leaks)
Merging percpu/for-next (4e1f82dce05b Merge branch 'for-5.16-fixes' into fo=
r-next)
Merging workqueues/for-next (10a5a651e3af workqueue: Restrict kworker in th=
e offline CPU pool running on housekeeping CPUs)
Merging drivers-x86/for-next (b0c07116c894 platform/x86: amd-pmc: Avoid rea=
ding SMU version at probe time)
Merging chrome-platform/for-next (57b888ca2541 platform/chrome: Re-introduc=
e cros_ec_cmd_xfer and use it for ioctls)
Merging hsi/for-next (43c14f8d18a7 HSI: omap_ssi: Fix refcount leak in ssi_=
probe)
Merging leds/for-next (312310928417 Linux 5.18-rc1)
Merging ipmi/for-next (8d190578f326 ipmi: remove unnecessary type castings)
Merging driver-core/driver-core-next (0e509f537f8d Merge 5.18-rc5 into driv=
er-core-next)
Merging usb/usb-next (c40b62216c1a usb: core: hcd: Create platform devices =
for onboard hubs in probe())
CONFLICT (content): Merge conflict in drivers/usb/dwc3/drd.c
Applying: Revert "usb: core: hcd: Create platform devices for onboard hubs =
in probe()"
Merging thunderbolt/next (5dddb4169284 thunderbolt: Link USB4 ports to thei=
r USB Type-C connectors)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (312310928417 Linux 5.18-rc1)
Merging tty/tty-next (9e6a90790357 Merge 5.18-rc5 into tty-next)
Merging char-misc/char-misc-next (35a7609639c4 Merge 5.18-rc5 into char-mis=
c-next)
Merging coresight/next (c86dd9869128 coresight: etm4x: Cleanup TRCRSCTLRn r=
egister accesses)
Merging fpga/for-next (eee1071ee7df fpga: Use tab instead of space indentat=
ion)
Merging icc/icc-next (2c16d1b0fc5f Merge branch 'icc-const' into icc-next)
Merging iio/togreg (eda75f8238b0 iio: ti-ads8688: use of_device_id for OF m=
atching)
Merging phy-next/next (bc055a50a859 dt-bindings: phy: renesas,usb2-phy: Doc=
ument RZ/G2UL phy bindings)
Merging soundwire/next (60657fb9b19d dt-bindings: soundwire: qcom: Add bind=
ings for audio clock reset control property)
Merging extcon/extcon-next (ef799ab8dc5c extcon: Modify extcon device to be=
 created after driver data is set)
CONFLICT (content): Merge conflict in drivers/usb/dwc3/drd.c
Applying: fixup for "usb: dwc3: Don't switch OTG -> peripheral if extcon is=
 present"
Merging gnss/gnss-next (312310928417 Linux 5.18-rc1)
Merging vfio/next (676d7cda1a3c Merge remote-tracking branch 'iommu/vfio-no=
tifier-fix', tag 'gvt-next-2022-04-29' into v5.19/vfio/next-jgg)
Merging staging/staging-next (5fe7856ad59a staging: vt6655: Replace MACvRea=
dISR with VNSvInPortD)
Merging mux/for-next (0fcfb00b28c0 Linux 5.16-rc4)
Merging dmaengine/next (99faef48e7a3 dmaengine: mv_xor_v2 : Move spin_lock_=
bh() to spin_lock())
Merging cgroup/for-next (5c26993c31f0 cgroup: Add config file to cgroup sel=
ftest suite)
Merging scsi/for-next (a576d58bd4ac Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (f304d35e5995 scsi: mpi3mr: Update driver version=
 to 8.0.0.69.0)
Merging vhost/linux-next (1c80cf031e02 vdpa: mlx5: synchronize driver statu=
s with CVQ)
Merging rpmsg/for-next (e8d9d4560c51 Merge branches 'rpmsg-next', 'rproc-ne=
xt' and 'hwspinlock-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (30a35c07d9e9 gpio: vf610: drop the SOC_VF6=
10 dependency for GPIO_VF610)
Merging gpio-intel/for-next (edc5601db664 pinctrl: meson: Replace custom co=
de by gpiochip_node_count() call)
Merging gpio-sim/gpio/gpio-sim (0fcfb00b28c0 Linux 5.16-rc4)
Merging pinctrl/for-next (a985730491d1 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/int=
errupt-controller/qcom,pdc.txt
CONFLICT (content): Merge conflict in drivers/pinctrl/stm32/pinctrl-stm32.c
Merging pinctrl-intel/for-next (0be0b70df661 pinctrl: alderlake: Fix regist=
er offsets for ADL-N variant)
Merging pinctrl-renesas/renesas-pinctrl (f7bc5f52d235 pinctrl: renesas: rzg=
2l: Restore pin config order)
Merging pinctrl-samsung/for-next (ac875df4d854 pinctrl: samsung: fix missin=
g GPIOLIB on ARM64 Exynos config)
Merging pwm/for-next (2bf8ee0faa98 dt-bindings: pwm: Add interrupts propert=
y for MediaTek MT8192)
Merging userns/for-next (9def41809e95 Merge of prlimit-tasklist_lock-for-v5=
.18, per-namespace-ipc-sysctls-for-v5.18, and ptrace-for-v5.18 for testing =
in linux-next)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (c7b607fa9325 selftests/resctrl: Fix null pointer de=
reference on open failed)
Merging livepatching/for-next (0e1b951d6de0 Merge branch 'for-5.18/selftest=
s-fixes' into for-next)
Merging rtc/rtc-next (312310928417 Linux 5.18-rc1)
Merging nvdimm/libnvdimm-for-next (d43fae7c4d3e testing: nvdimm: asm/mce.h =
is not needed in nfit.c)
Merging at24/at24/for-next (312310928417 Linux 5.18-rc1)
Merging ntb/ntb-next (e9d0fa5e2482 IDT: Fix Build warnings on some 32bit ar=
chitectures.)
Merging seccomp/for-next/seccomp (662340ef9218 selftests/seccomp: Ensure th=
at notifications come in FIFO order)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging fsi/next (f2af60bb7ce2 fsi: Add trace events in initialization path)
Merging slimbus/for-next (54bf672111ee slimbus: qcom: Fix IRQ check in qcom=
_slim_probe)
Merging nvmem/for-next (0f07cbb92a28 nvmem: sfp: Add support for TA 2.1 dev=
ices)
Merging xarray/main (63b1898fffcd XArray: Disallow sibling entries of nodes)
Merging hyperv/hyperv-next (455880dfe292 PCI: hv: Fix hv_arch_irq_unmask() =
for multi-MSI)
Merging auxdisplay/auxdisplay (13de23494f38 auxdisplay: lcd2s: Use array si=
ze explicitly in lcd2s_gotoxy())
Merging kgdb/kgdb/for-next (c1cb81429df4 kdb: Fix the putarea helper functi=
on)
Merging hmm/hmm (312310928417 Linux 5.18-rc1)
Merging kunit/test (312310928417 Linux 5.18-rc1)
Merging cfi/cfi/next (312310928417 Linux 5.18-rc1)
Merging kunit-next/kunit (38289a26e1b8 kunit: fix debugfs code to use enum =
kunit_status, not bool)
CONFLICT (content): Merge conflict in drivers/thunderbolt/test.c
CONFLICT (content): Merge conflict in net/mctp/test/route-test.c
CONFLICT (content): Merge conflict in security/apparmor/policy_unpack_test.c
Merging trivial/for-next (081c8919b02b Documentation: remove trivial tree)
Merging mhi/mhi-next (aa5c73d9296d bus: mhi: pci_generic: add Telit FN990)
Merging memblock/for-next (58ffc34896db memblock tests: Add TODO and README=
 files)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging cxl/next (280302f0e8f6 cxl/mbox: Replace NULL check with IS_ERR() a=
fter vmemdup_user())
Merging folio-iomap/folio-iomap (4d7bd0eb72e5 iomap: Inline __iomap_zero_it=
er into its caller)
Merging zstd/zstd-next (88a309465b3f lib: zstd: clean up double word in com=
ment.)
Merging efi/next (736e0f2179d3 efi/arm64: libstub: run image in place if ra=
ndomized by the loader)
CONFLICT (content): Merge conflict in drivers/virt/Kconfig
CONFLICT (content): Merge conflict in drivers/virt/Makefile
Merging unicode/for-next (b500d6d7243d unicode: Handle memory allocation fa=
ilures in mkutf8data)
Merging slab/for-next (6b2d72729581 Merge branches 'slab/for-5.19/stackdepo=
t' and 'slab/for-5.19/refactor' into slab/for-next)
Merging random/master (eb3f5d23695b random: mix in timestamps and reseed on=
 system restore)
Merging landlock/next (312310928417 Linux 5.18-rc1)
Merging rust/rust-next (011150424cd9 rust: avoid all GCC plugins, not just =
the randstruct one)
CONFLICT (content): Merge conflict in Makefile
Merging sysctl/sysctl-next (a467257ffe4b kernel/kexec_core: move kexec_core=
 sysctls into its own file)
CONFLICT (content): Merge conflict in kernel/rcu/rcu.h
Merging folio/for-next (5d5754741171 fs: Remove aops->freepage)
CONFLICT (content): Merge conflict in fs/btrfs/ctree.h
CONFLICT (content): Merge conflict in fs/btrfs/inode.c
Applying: fix up for "btrfs: move btrfs_readpage to extent_io.c"
Applying: fixup for "mm,fs: Remove stray references to ->readpage"
Merging execve/for-next/execve (70578ff3367d binfmt_flat: Remove shared lib=
rary support)
Merging bitmap/bitmap-for-next (0b109ac32b03 include/linux/find: Fix docume=
ntation)
Merging kspp/for-next/kspp (e6f3b3c9c109 cfi: Use __builtin_function_start)
Merging kspp-gustavo/for-next/kspp (6bf825b2731d Merge branch 'for-next/ksp=
p-checkpatch' into for-next/kspp)
Merging mm-stable/mm-stable (059342d1dd4e mm/damon/reclaim: fix the timer a=
lways stays active)
CONFLICT (content): Merge conflict in arch/x86/mm/Makefile
Merging mm-nonmm-stable/mm-nonmm-stable (f6e2c20ca760 fs: sysv: check sbi->=
s_firstdatazone in complete_read_super)
Merging mm/mm-everything (cdb5a08f5c15 Merge branch 'mm-nonmm-unstable' int=
o mm-everything)
CONFLICT (content): Merge conflict in fs/nfs/file.c
CONFLICT (content): Merge conflict in include/linux/slab.h
CONFLICT (content): Merge conflict in mm/page_io.c
Applying: linux-next: build failure after merge of the mm tree
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (468e4d4736f3 kselftest/vm: override TARGETS from argum=
ents)

--Sig_/jcHneZ1ip6DYkbC8wlx88TS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJw2dYACgkQAVBC80lX
0GyvVQf7BO4IRP/MYOtayENlbsUFmJMbvJJAqAwBwthSURjmnWiXZGUPeAGru2dv
rqacgn1lxhxGYg8hoDXLmzkGSE3S/v8xKL0CA26fyEUfsj5ykX6cCdmedFKrXXz6
yejfn5tkkMqjoOiiZaMq6qiBrAwOBm2Pf2IwOU2PxCP1BLQg3Fmp8QFlXym0qbG+
1/WMhdsJtBIZNb2Y5x/70q10SknBAidXw37kmW2I5rV72OOoj0He3l1t4lASjj7F
8x6ImrKnqJ8CcogJ7dsb3bKAWmP1rmTFFII8qSschCY1Ldxd3YKzfDWIQRw2yUdb
/4lr6/YyreEFlfxm3dQ2BNEL+fnNdQ==
=YenP
-----END PGP SIGNATURE-----

--Sig_/jcHneZ1ip6DYkbC8wlx88TS--
