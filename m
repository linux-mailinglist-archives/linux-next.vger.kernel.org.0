Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBF5C3CF419
	for <lists+linux-next@lfdr.de>; Tue, 20 Jul 2021 07:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232916AbhGTFJx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Jul 2021 01:09:53 -0400
Received: from ozlabs.org ([203.11.71.1]:38611 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235889AbhGTFJg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Jul 2021 01:09:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GTSVC6hHCz9sRN;
        Tue, 20 Jul 2021 15:50:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626760212;
        bh=i/wApeo5eqLvz5oFowEzvY0gjBqy27KvZsxFoexLD4s=;
        h=Date:From:To:Cc:Subject:From;
        b=G/YoDGzn+I+BDia2tgtBuasHBnQo3hOr51T40iPB4YZXrm1/YeJHLhO+LfYXI95Ln
         YWvYr9cYdpQHPsQUXArdavkUXS8xYCIrqEyKCzNyrqiNm0MM6G68dzJxCzbHOfEW/B
         QcJXCOCFf409lg6M7adRywLrvVwcxyk5CIUIi5+qQBe2L0S6K7pDgzhu+cDxWVk4fw
         97nkQZlbZPKwhj1YzL76fhGsDcBBOvWsM4ndLIWkLEvReaUZ69xyqMlrc8XGKiWqIT
         n7cFlMknkjqY+egldb6Ni9gBe9rOAYctxUWcPb9KRf0ooIuvRqv1ueS6iLrJsMAWv3
         vGrQNeGEnE6YA==
Date:   Tue, 20 Jul 2021 15:50:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 20
Message-ID: <20210720155010.0d7e9ab7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/prE1sBw0QwAkxRw=8Ezc7yR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/prE1sBw0QwAkxRw=8Ezc7yR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210719:

The at91 tree lost its build failure.

Non-merge commits (relative to Linus' tree): 1697
 1774 files changed, 109448 insertions(+), 23018 deletions(-)

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

I am currently merging 332 trees (counting Linus' and 90 trees of bug
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
Merging origin/master (2734d6c1b1a0 Linux 5.14-rc2)
Merging fixes/fixes (614124bea77e Linux 5.13-rc5)
Merging kbuild-current/fixes (5e60f363b38f Documentation: Fix intiramfs scr=
ipt name)
Merging arc-current/for-curr (3eada7b4bd85 ARC: fp: set FPU_STATUS.FWE to e=
nable FPU_STATUS update on context switch)
Merging arm-current/fixes (dad7b9896a5d ARM: 9081/1: fix gcc-10 thumb2-kern=
el regression)
Merging arm64-fixes/for-next/fixes (e6f85cbeb23b arm64: entry: fix KCOV sup=
pression)
Merging arm-soc-fixes/arm/fixes (82a1c67554df ARM: dts: versatile: Fix up i=
nterrupt controller node names)
Merging drivers-memory-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging m68k-current/for-linus (21ed49265986 m68k: MAC should select HAVE_P=
ATA_PLATFORM)
Merging powerpc-fixes/fixes (e44fbdb68049 KVM: PPC: Book3S HV P9: Fix guest=
 TM support)
Merging s390-fixes/fixes (f8c2602733c9 s390/ftrace: fix ftrace_update_ftrac=
e_func implementation)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (6f20c8adb181 net/tcp_fastopen: fix data races around tf=
o_active_disable_stamp)
Merging bpf/master (d6371c76e20d bpf: Fix OOB read when printing XDP link f=
dinfo)
Merging ipsec/master (2580d3f40022 xfrm: Fix RCU vs hash_resize_mutex lock =
inversion)
Merging netfilter/master (cfbe3650dd3e netfilter: nf_tables: fix audit memo=
ry leak in nf_tables_commit)
Merging ipvs/master (cfbe3650dd3e netfilter: nf_tables: fix audit memory le=
ak in nf_tables_commit)
Merging wireless-drivers/master (1f9482aa8d41 mwifiex: bring down link befo=
re deleting interface)
Merging mac80211/master (f4b29d2ee903 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/pablo/nf)
Merging rdma-fixes/for-rc (dc6afef7e142 RDMA/irdma: Change returned type of=
 irdma_setup_virt_qp to void)
Merging sound-current/for-linus (e4efa82660e6 ALSA: hda/realtek: Fix pop no=
ise and 2 Front Mic issues on a machine)
Merging sound-asoc-fixes/for-linus (85666456ceab Merge remote-tracking bran=
ch 'asoc/for-5.14' into asoc-linus)
Merging regmap-fixes/for-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging regulator-fixes/for-linus (30920b5b711a Merge remote-tracking branc=
h 'regulator/for-5.14' into regulator-linus)
Merging spi-fixes/for-linus (83a19f5184f0 Merge remote-tracking branch 'spi=
/for-5.14' into spi-linus)
Merging pci-current/for-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging driver-core.current/driver-core-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging tty.current/tty-linus (de5540965853 Merge tag 'rtc-5.14' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/abelloni/linux)
Merging usb.current/usb-linus (b0863f192732 USB: core: Fix incorrect pipe c=
alculation in do_proc_control())
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (94b619a07655 USB: serial: option: add s=
upport for u-blox LARA-R6 family)
Merging usb-chipidea-fixes/for-usb-fixes (42c4417937be usb: cdnsp: Fix the =
IMAN_IE_SET and IMAN_IE_CLEAR macro.)
Merging phy/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging staging.current/staging-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging iio-fixes/fixes-togreg (7e77ef8b8d60 iio: adis: set GPIO reset pin =
direction)
Merging char-misc.current/char-misc-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging soundwire-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging thunderbolt-fixes/fixes (13311e74253f Linux 5.13-rc7)
Merging input-current/for-linus (818b26588994 Merge branch 'next' into for-=
linus)
Merging crypto-current/master (66192b2e3fd8 crypto: hisilicon/sec - fix the=
 process of disabling sva prefetching)
Merging vfio-fixes/for-linus (dc51ff91cf2d vfio/platform: fix module_put ca=
ll in error flow)
Merging kselftest-fixes/fixes (0c0f6299ba71 selftests: memory-hotplug: avoi=
d spamming logs with dump_page(), ratio limit hot-remove error test)
Merging modules-fixes/modules-linus (055f23b74b20 module: check for exit se=
ctions in layout_sections() instead of module_init_section())
Merging dmaengine-fixes/fixes (d5c10e0fc864 dmaengine: idxd: fix setup sequ=
ence for MSIXPERM table)
Merging backlight-fixes/for-backlight-fixes (a38fd8748464 Linux 5.12-rc2)
Merging mtd-fixes/mtd/fixes (ba3562892619 mtd: devices: mchp48l640: Fix mem=
ory leak on cmd)
Merging mfd-fixes/for-mfd-fixes (a61f4661fba4 mfd: intel_quark_i2c_gpio: Re=
vert "Constify static struct resources")
Merging v4l-dvb-fixes/fixes (61c6f04a988e media: s5p-mfc: Fix display delay=
 control creation)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging at91-fixes/at91-fixes (6efb943b8616 Linux 5.13-rc1)
Merging omap-fixes/fixes (3ff340e24c9d bus: ti-sysc: Fix gpt12 system timer=
 issue with reserved status)
Merging kvm-fixes/master (d951b2210c1a KVM: selftests: smm_test: Test SMM e=
nter from L2)
Merging kvms390-fixes/master (cd4220d23bf3 KVM: selftests: do not require 6=
4GB in set_memory_region_test)
Merging hwmon-fixes/hwmon (e73f0f0ee754 Linux 5.14-rc1)
Merging nvdimm-fixes/libnvdimm-fixes (b05d4c576b69 dax: Ensure errno is ret=
urned from dax_direct_access)
Merging cxl-fixes/fixes (fae8817ae804 cxl/mem: Fix memory device capacity p=
robing)
Merging btrfs-fixes/next-fixes (2376b98e2a50 Merge branch 'misc-5.14' into =
next-fixes)
Merging vfs-fixes/fixes (173e84953eaa fs: fix reporting supported extra fil=
e attributes for statx())
Merging dma-mapping-fixes/for-linus (18a3c5f7abfd Merge tag 'for_linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (f7e506ec4a99 platform/x86: think-lmi: Fix =
possible mem-leaks on tlmi_analyze() error-exit)
Merging samsung-krzk-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging pinctrl-samsung-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging devicetree-fixes/dt/linus (50d8d7e19c43 dt-bindings: display: renes=
as,du: Make resets optional on R-Car H1)
Merging scsi-fixes/fixes (053c16ac8905 scsi: ufs: core: Add missing host_lo=
ck in ufshcd_vops_setup_xfer_req())
Merging drm-fixes/drm-fixes (2734d6c1b1a0 Linux 5.14-rc2)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (3761baae908a Revert "drm/i915=
: Propagate errors on awaiting already signaled fences")
Merging mmc-fixes/fixes (10252bae863d mmc: core: Don't allocate IDA for OF =
aliases)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (e73f0f0ee754 Linux 5.14-rc1)
Merging hyperv-fixes/hyperv-fixes (7c9ff3deeee6 Drivers: hv: vmbus: Fix dup=
licate CPU assignments within a device)
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (7ede12b01b59 riscv: dts: fu740: fix cache-contr=
oller interrupts)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (2e8496f31d0b firmware: stratix10-svc: reset COMMA=
ND_RECONFIG_FLAG_PARTIAL to 0)
Merging spdx/spdx-linus (de5540965853 Merge tag 'rtc-5.14' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/abelloni/linux)
Merging gpio-brgl-fixes/gpio/for-current (ec7099fdea80 Revert "gpio: mpc8xx=
x: change the gpio interrupt flags.")
Merging gpio-intel-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging pinctrl-intel-fixes/fixes (e73f0f0ee754 Linux 5.14-rc1)
Merging erofs-fixes/fixes (0852b6ca941e erofs: fix 1 lcluster-sized pcluste=
r for big pcluster)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (df4b0807ca1a kunit: tool: Assert the versi=
on requirement)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (024591f9a6e0 arm: ioremap: don't abuse pfn_va=
lid() to check if pfn is in RAM)
Merging cel-fixes/for-rc (9f4ad9e425a1 Linux 5.12)
Merging irqchip-fixes/irq/irqchip-fixes (1fee9db9b42d irqchip/mips: Fix RCU=
 violation when using irqdomain lookup on interrupt entry)
Merging renesas-fixes/fixes (432b52eea3dc ARM: shmobile: defconfig: Restore=
 graphical consoles)
Merging drm-misc-fixes/for-linux-next-fixes (a3a9ee4b5254 drm/nouveau: init=
 the base GEM fields for internal BOs)
Merging kspp-gustavo/for-next/kspp (615c77eb5e87 powerpc/pasemi: Fix fall-t=
hrough warning for Clang)
Merging kbuild/for-next (27932b6a2088 scripts: add generic syscallnr.sh)
Merging compiler-attributes/compiler-attributes (7ed012969bbc Compiler Attr=
ibutes: fix __has_attribute(__no_sanitize_coverage__) for GCC 4)
CONFLICT (content): Merge conflict in include/linux/compiler_attributes.h
Merging dma-mapping/for-next (40ac971eab89 dma-mapping: handle vmalloc addr=
esses in dma_common_{mmap,get_sgtable})
Merging asm-generic/master (14462376858e Merge branch 'asm-generic-unaligne=
d' into asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (3bd1461d1691 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (3d1bf78c7b13 Merge branch 'for-next/sve' into =
for-next/core)
Merging arm-perf/for-next/perf (d96b1b8c9f79 drivers/perf: fix the missed i=
da_simple_remove() in ddr_perf_probe())
Merging arm-soc/for-next (82a1c67554df ARM: dts: versatile: Fix up interrup=
t controller node names)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (b03485fe99f2 Merge tags 'amlogic-arm64-dt-for-v5.=
14-v2' and 'amlogic-arm-dt-for-v5.14' into for-next)
Merging aspeed/for-next (00e9e776fa19 ARM: dts: aspeed: wedge100: Enable AD=
C channels)
Merging at91/at91-next (b2a7f104a035 Merge branches 'at91-dt' and 'at91-def=
config' into at91-next)
Merging drivers-memory/for-next (20328d360a58 Merge branch 'for-v5.14/tegra=
-mc-late-or-fixes' into for-next)
Merging imx-mxs/for-next (2332f8e99198 Merge branch 'imx/dt64' into for-nex=
t)
Merging keystone/next (9d2e21ed98a2 Merge branch 'for_5.12/drivers-soc' int=
o next)
Merging mediatek/for-next (a1c8c49de3d7 Merge branch 'v5.13-next/soc' into =
for-next)
Merging mvebu/for-next (72a0a49b7c77 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (91ee322340fb Merge branch 'omap-for-v5.14/dt' into f=
or-next)
Merging qcom/for-next (c275bbc84be9 Merge branches 'arm64-defconfig-for-5.1=
4', 'arm64-for-5.14', 'drivers-for-5.14' and 'dts-for-5.14' into for-next)
Merging raspberrypi/for-next (21c6bf8304f0 arm64: dts: broadcom: Add refere=
nce to RPi 400)
Merging renesas/next (2a022240886d Merge branches 'renesas-arm-defconfig-fo=
r-v5.15' and 'renesas-arm-dt-for-v5.15' into renesas-next)
Merging reset/reset/next (48a74b1147f7 reset: Add compile-test stubs)
Merging rockchip/for-next (b0d174c8c1e1 Merge branch 'v5.15-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (178a5d90dc04 arm64: dts: exynos: Add cpu cac=
he information to Exynos5433)
Merging scmi/for-linux-next (7929b794edc7 Merge branch 'for-next/juno' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging stm32/stm32-next (b462e2fc78f0 ARM: dts: stm32: Update AV96 adv7513=
 node per dtbs_check)
Merging sunxi/sunxi/for-next (3f1c53207cf0 Merge branches 'sunxi/dt-for-5.1=
4' and 'sunxi/fixes-for-5.13' into sunxi/for-next)
Merging tegra/for-next (51b89b49954f Merge branch for-5.14/arm64/dt into fo=
r-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (e73f0f0ee754 Linux 5.14-rc1)
Merging xilinx/for-next (d98fb9ab6255 Merge branch 'zynq/dt' into for-next)
Merging clk/clk-next (e73f0f0ee754 Linux 5.14-rc1)
Merging clk-imx/for-next (c586f53ae159 clk: imx8mq: remove SYS PLL 1/2 cloc=
k gates)
Merging clk-renesas/renesas-clk (1b87d5bba32c clk: renesas: r9a07g044: Add =
clock and reset entries for ADC)
Merging clk-samsung/for-next (a38fd8748464 Linux 5.12-rc2)
Merging csky/linux-next (90dc8c0e664e csky: Kconfig: Remove unused selects)
Merging h8300/h8300-next (6e5e55227c95 Merge tag 'v5.11' into h8300-next)
Merging m68k/for-next (a0b22464ce93 m68k: defconfig: Update defconfigs for =
v5.14-rc1:)
Merging m68knommu/for-next (64151620227a m68k: m5441x: add flexcan support)
Merging microblaze/next (14a832498c23 arch: microblaze: Fix spelling mistak=
e "vesion" -> "version")
Merging mips/mips-next (e98b461bb057 MIPS: octeon: Remove vestiges of CONFI=
G_CAVIUM_RESERVE32)
Merging nds32/next (40e0dd851e7b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (ad4e600cbf89 drivers/soc/litex: remove 8-bit sub=
register option)
Merging parisc-hd/for-next (ca2b19a4bdb6 parisc: Increase gcc stack frame c=
heck to 2048 for 32- and 64-bit)
Merging powerpc/next (e73f0f0ee754 Linux 5.14-rc1)
Merging soc-fsl/next (242b0b398ccd soc: fsl: enable acpi support in RCPM dr=
iver)
Merging risc-v/for-next (7761e36bc722 riscv: Fix PTDUMP output now BPF regi=
on moved back to module region)
Merging s390/for-next (ad48fd727ccf Merge branch 'fixes' into for-next)
Merging sh/for-next (2882b7626f49 sh: kernel: traps: remove unused variable)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (1aee020155f3 um: remove unneeded semicolon in um_ar=
ch.c)
Merging xtensa/xtensa-for-next (ac637a0ada71 xtensa: add fairness to IRQ ha=
ndling)
Merging pidfd/for-next (5ddf9602d711 Merge branch 'fs.mount_setattr.nosymfo=
llow' into for-next)
Merging fscrypt/master (2fc2b430f559 fscrypt: fix derivation of SipHash key=
s on big endian CPUs)
Merging fscache/fscache-next (5193f26aef59 fscache: Use refcount_t for the =
cookie refcount instead of atomic_t)
Merging afs/afs-next (7af08140979a Revert "gcov: clang: fix clang-11+ build=
")
Merging btrfs/for-next (808c6838dfee Merge branch 'for-next-current-v5.12-2=
0210624' into for-next-20210624)
Merging ceph/master (4c18347238ab ceph: take reference to req->r_parent at =
point of assignment)
Merging cifs/for-next (ffa25a280c7b cifs: support share failover when remou=
nting)
Merging cifsd/cifsd-for-next (9946aa630ae7 Merge pull request #61 from namj=
aejeon/cifsd-for-next)
Merging configfs/for-next (420405ecde06 configfs: fix the read and write it=
erators)
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (8215d5b7f15f MAINTAINERS: erofs: update my email address)
Merging exfat/dev (50be9417e23a Merge tag 'io_uring-5.14-2021-07-09' of git=
://git.kernel.dk/linux-block)
Merging ext3/for_next (f97d9dea9404 Merge hole punch fixes.)
Merging ext4/dev (0705e8d1e220 ext4: inline jbd2_journal_[un]register_shrin=
ker())
Merging f2fs/dev (0cbdab412e4b f2fs: fix wrong inflight page stats for dire=
ctIO)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (c4e0cd4e0c16 virtiofs: Fix spelling mistakes)
Merging gfs2/for-next (e6d1bd8d56de gfs2: Fix memory leak of object lsi on =
error return path)
Merging jfs/jfs-next (5d299f44d765 jfs: Avoid field-overflowing memcpy())
Merging nfs/linux-next (2734d6c1b1a0 Linux 5.14-rc2)
Merging nfs-anna/linux-next (4f8be1f53bf6 nfs: we don't support removing sy=
stem.nfs4_acl)
Merging nfsd/nfsd-next (ab1016d39cc0 nfsd: fix NULL dereference in nfs3svc_=
encode_getaclres)
Merging cel/for-next (9b5b7a72fdc4 NFSD: Use new __string_len C macros for =
nfsd_clid_class)
Merging orangefs/for-next (0fdec1b3c9fb orangefs: fix orangefs df output.)
Merging overlayfs/overlayfs-next (8ffe5f3c17de ovl: do not set overlay.opaq=
ue for new directories)
Merging ubifs/next (a801fcfeef96 ubifs: Set/Clear I_LINKABLE under i_lock f=
or whiteout inode)
Merging v9fs/9p-next (cba7dcd8878e 9p/trans_virtio: Remove sysfs file on pr=
obe failure)
Merging xfs/for-next (b102a46ce16f xfs: detect misaligned rtinherit directo=
ry extent size hints)
Merging zonefs/for-next (95b115332a83 zonefs: remove redundant null bio che=
ck)
Merging iomap/iomap-for-next (229adf3c64db iomap: Don't create iomap_page o=
bjects in iomap_page_mkwrite_actor)
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (e1cc6e8c1969 fcntl: fix potential deadlock f=
or &fasync_struct.fa_lock)
Merging vfs/for-next (303392fd5c16 Merge tag 'leds-5.14-rc1' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/pavel/linux-leds)
Merging printk/for-next (fbdc7b96a5ae Merge branch 'for-5.15-printk-index' =
into for-next)
Merging pci/next (e73f0f0ee754 Linux 5.14-rc1)
Merging pstore/for-next/pstore (c5d4fb2539ca pstore/blk: Use "%lu" to forma=
t unsigned long)
Merging hid/for-next (1b97ec646386 Merge branch 'for-5.15/goodix' into for-=
next)
Merging i2c/i2c/for-next (5bac2a5bf0c6 Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i3c/i3c/next (3e5feb11a829 i3c: master: svc: fix doc warning in svc=
-i3c-master.c)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (47f53972ca15 hwmon: intel-m10-bmc-hwmon: =
add n5010 sensors)
Merging jc_docs/docs-next (4b3abe1fde47 docs/zh_CN: add core api protection=
 keys translation)
Merging v4l-dvb/master (e73f0f0ee754 Linux 5.14-rc1)
Merging v4l-dvb-next/master (379e205dab9d media: usb: dvb-usb-v2: af9035: l=
et subdrv autoselect enable si2168 and si2157)
Merging pm/linux-next (d713e0c83398 Merge branch 'pm-pci' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (e73f0f0ee754 Linux 5.14-rc1)
Merging cpupower/cpupower (e73f0f0ee754 Linux 5.14-rc1)
Merging devfreq/devfreq-next (e73f0f0ee754 Linux 5.14-rc1)
Merging opp/opp/linux-next (e73f0f0ee754 Linux 5.14-rc1)
Merging thermal/thermal/linux-next (fe6a6de6692e thermal/drivers/int340x/pr=
ocessor_thermal: Fix tcc setting)
Merging ieee1394/for-next (54b3bd99f094 firewire: nosy: switch from 'pci_' =
to 'dma_' API)
Merging dlm/next (957adb68b3f7 fs: dlm: invalid buffer access in lookup err=
or)
Merging swiotlb/linux-next (868c9ddc182b swiotlb: add overflow checks to sw=
iotlb_bounce)
Merging rdma/for-next (923232bbea88 RDMA/rxe: Fix types in rxe_icrc.c)
Merging net-next/master (0d6835ffe50c net: phy: Fix data type in DP83822 dp=
8382x_disable_wol())
CONFLICT (content): Merge conflict in net/bpf/test_run.c
Merging bpf-next/for-next (08f71a1e39a1 selftests/bpf: Check inner map dele=
tion)
Merging ipsec-next/master (5e437416ff66 Merge branch 'dsa-mv88e6xxx-topaz-f=
ixes')
Merging mlx5-next/mlx5-next (96cd2dd65bb0 net/mlx5: Add DCS caps & fields s=
upport)
Merging netfilter-next/master (84fe73996c2e Merge branch 'do_once_lite')
Merging ipvs-next/master (84fe73996c2e Merge branch 'do_once_lite')
Merging wireless-drivers-next/master (ff8744b5eb11 Merge branch '100GbE' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue)
Merging bluetooth/master (3c755b4545aa Bluetooth: hci_h5: Disable the hci_s=
uspend_notifier for btrtl devices)
Merging mac80211-next/master (0d6835ffe50c net: phy: Fix data type in DP838=
22 dp8382x_disable_wol())
Merging mtd/mtd/next (ff44b90b325d dt_bindings: mtd: partitions: redboot: c=
onvert to YAML)
Merging nand/nand/next (c5b9ee9c361f mtd: rawnand: Fix a couple of spelling=
 mistakes in Kconfig)
Merging spi-nor/spi-nor/next (2734d6c1b1a0 Linux 5.14-rc2)
Merging crypto/master (f03a3cab26c1 crypto: lib - rename 'mod_init' & 'mod_=
exit' functions to be module-specific)
Merging drm/drm-next (2734d6c1b1a0 Linux 5.14-rc2)
Merging drm-misc/for-linux-next (85fd4a8a8431 drm/ttm: Fix COW check)
Merging amdgpu/drm-next (dfbabcfa161c drm/amdgpu/display: add support for m=
ultiple backlights)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
CONFLICT (rename/delete): drivers/gpu/drm/amd/pm/inc/smu_v13_0_1.h deleted =
in HEAD and renamed to drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.h in amdgpu=
/drm-next. Version amdgpu/drm-next of drivers/gpu/drm/amd/amdgpu/amdgpu_eep=
rom.h left in tree.
Merging drm-intel/for-linux-next (7ad2d09ccde2 Merge branch 'topic/revid_st=
eppings' into drm-intel-next)
Merging drm-tegra/drm/tegra/for-next (8874e3a7baec drm/tegra: Fix compilati=
on of variadic macro)
Merging drm-msm/msm-next (e88bbc91849b Revert "drm/msm/mdp5: provide dynami=
c bandwidth management")
Merging imx-drm/imx-drm/next (fc1e985b67f9 drm/imx: ipuv3-plane: add color =
encoding and range properties)
Merging etnaviv/etnaviv/next (81fd23e2b3cc drm/etnaviv: Implement mmap as G=
EM object function)
Merging regmap/for-next (d63aa09f7c53 regmap: Prefer unsigned int to bare u=
se of unsigned)
Merging sound/for-next (3a1e341c5687 ALSA: pcsp: Allocate resources with de=
vice-managed APIs)
Merging sound-asoc/for-next (1537ad364fc4 Merge remote-tracking branch 'aso=
c/for-5.15' into asoc-next)
Merging modules/modules-next (4c5afb74d945 module: combine constructors in =
module linker script)
Merging input/next (133b6558c755 Input: parkbd - switch to use module_parpo=
rt_driver())
Merging block/for-next (60b8191c4777 Merge branch 'for-5.15/block' into for=
-next)
Merging device-mapper/for-next (5c0de3d72f8c dm writecache: make writeback =
pause configurable)
Merging pcmcia/pcmcia-next (e9d503fef7da pcmcia: rsrc_nonstatic: Fix call-b=
ack function as reference formatting)
Merging mmc/next (441b4dc421dc Merge branch 'fixes' into next)
Merging mfd/for-mfd-next (495fb48dbd9b mfd: wm831x: Use DEFINE_RES_IRQ_NAME=
D() and DEFINE_RES_IRQ() to simplify code)
Merging backlight/for-backlight-next (1181f2164135 backlight: lm3630a: Conv=
ert to atomic PWM API and check for errors)
Merging battery/for-next (56d629af09b9 power: supply: PCHG: Peripheral devi=
ce charger)
Merging regulator/for-next (5c5600cba3a2 Merge remote-tracking branch 'regu=
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
Merging smack/next (2734d6c1b1a0 Linux 5.14-rc2)
Merging tomoyo/master (4fb9c588398f Bluetooth: call lock_sock() outside of =
spinlock section)
Merging tpmdd/next (0178f9d0f60b tpm: Replace WARN_ONCE() with dev_err_once=
() in tpm_tis_status())
Merging watchdog/master (cf813c67d961 watchdog: iTCO_wdt: use dev_err() ins=
tead of pr_err())
Merging iommu/next (4a5c155a5ab3 MAINTAINERS: Add Suravee Suthikulpanit as =
Reviewer for AMD IOMMU (AMD-Vi))
Merging audit/next (e73f0f0ee754 Linux 5.14-rc1)
Merging devicetree/for-next (1c14c1695e78 dt-bindings: PCI: remove designwa=
re-pcie.txt)
Merging mailbox/mailbox-for-next (4f197188da66 MAINTAINERS: add entry for p=
olarfire soc mailbox)
Merging spi/for-next (9ca49e85e5f3 Merge remote-tracking branch 'spi/for-5.=
15' into spi-next)
Merging tip/auto-latest (dd9ced4003dd Merge branch 'core/urgent')
Merging clockevents/timers/drivers/next (6f64c8159af9 clocksource/drivers/a=
rm_global_timer: Remove duplicated argument in arm_global_timer)
Merging edac/edac-for-next (d19faf0e49eb EDAC/amd64: Use DEVICE_ATTR helper=
 macros)
Merging irqchip/irq/irqchip-next (c51e96dace68 Merge branch irq/irqchip-dri=
ver-updates into irq/irqchip-next)
Merging ftrace/for-next (704adfb5a997 tracing: Do not reference char * as a=
 string in histograms)
Merging rcu/rcu/next (e107ca1a35b6 doc: Update stallwarn.rst with recent ch=
anges)
Merging kvm/next (d951b2210c1a KVM: selftests: smm_test: Test SMM enter fro=
m L2)
Merging kvm-arm/next (188982cda00e Merge branch kvm-arm64/mmu/mte into kvma=
rm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (1f703d2cf204 KVM: s390: allow facility 192 (vector-pa=
cked-decimal-enhancement facility 2))
Merging xen-tip/linux-next (629a5d87e26f xen: sync include/xen/interface/io=
/ring.h with Xen's newest version)
Merging percpu/for-next (a81a52b325ec Merge branch 'for-5.14-fixes' into fo=
r-next)
Merging workqueues/for-next (a9a2e0482d64 workqueue: fix UAF in pwq_unbound=
_release_workfn())
CONFLICT (content): Merge conflict in include/linux/fs_context.h
Merging drivers-x86/for-next (f7e506ec4a99 platform/x86: think-lmi: Fix pos=
sible mem-leaks on tlmi_analyze() error-exit)
Merging chrome-platform/for-next (6efb943b8616 Linux 5.13-rc1)
Merging hsi/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging leds/for-next (e642197562cd leds: is31fl32xx: Fix missing error cod=
e in is31fl32xx_parse_dt())
Merging ipmi/for-next (1a2055cd5091 bindings: ipmi: Add binding for SSIF BM=
C driver)
Merging driver-core/driver-core-next (e73f0f0ee754 Linux 5.14-rc1)
Merging usb/usb-next (97db1b081e12 dt-bindings: usb: dwc3: Update dwc3 TX f=
ifo properties)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (2734d6c1b1a0 Linux 5.14-rc2)
Merging usb-chipidea-next/for-usb-next (956df1bb0ab8 usb: chipidea: host: f=
ix port index underflow and UBSAN complains)
Merging tty/tty-next (de5540965853 Merge tag 'rtc-5.14' of git://git.kernel=
.org/pub/scm/linux/kernel/git/abelloni/linux)
Merging char-misc/char-misc-next (e73f0f0ee754 Linux 5.14-rc1)
Merging extcon/extcon-next (e73f0f0ee754 Linux 5.14-rc1)
Merging phy-next/next (e73f0f0ee754 Linux 5.14-rc1)
Merging soundwire/next (e73f0f0ee754 Linux 5.14-rc1)
Merging thunderbolt/next (b18f901382fd thunderbolt: Fix DROM handling for U=
SB4 DROM)
Merging vfio/next (6a45ece4c9af vfio/pci: Handle concurrent vma faults)
Merging staging/staging-next (e73f0f0ee754 Linux 5.14-rc1)
Merging iio/togreg (e73f0f0ee754 Linux 5.14-rc1)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (46bdcac533cc interconnect: qcom: Add SC7280 interconn=
ect provider driver)
Merging dmaengine/next (407b3ea075c2 Merge branch 'fixes' into next)
Merging cgroup/for-next (1f8c543f1429 cgroup: remove cgroup_mount from comm=
ents)
Merging scsi/for-next (053c16ac8905 scsi: ufs: core: Add missing host_lock =
in ufshcd_vops_setup_xfer_req())
Merging scsi-mkp/for-next (f339c7e491a8 scsi: smartpqi: Update version to 2=
.1.10-020)
Merging vhost/linux-next (db7b337709a1 virtio-mem: prioritize unplug from Z=
ONE_MOVABLE in Big Block Mode)
Merging rpmsg/for-next (7486f29e5e60 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (3d134e75c08b gpio: rcar: Always use local =
variable dev in gpio_rcar_probe())
Merging gpio-intel/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging pinctrl/for-next (bfa50166cd9d pinctrl: ralink: rt305x: add missing=
 include)
Merging pinctrl-intel/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging pinctrl-renesas/renesas-pinctrl (e9d66bdbc5ab pinctrl: renesas: r8a=
77995: Add bias pinconf support)
Merging pinctrl-samsung/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging pwm/for-next (f4a8e31ed84e pwm: ep93xx: Ensure configuring period a=
nd duty_cycle isn't wrongly skipped)
Merging userns/for-next (5e6b8a50a7ce cred: add missing return error code w=
hen set_cred_ucounts() failed)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (e73f0f0ee754 Linux 5.14-rc1)
Merging livepatching/for-next (c150bbbb1731 Merge branch 'for-5.13/signal' =
into for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (4aa90c036df6 rtc: pcf8523: rename register and bit de=
fines)
Merging nvdimm/libnvdimm-for-next (30c10d32152d Merge branch 'for-5.12/cxl'=
 into libnvdimm-for-next)
Merging at24/at24/for-next (6efb943b8616 Linux 5.13-rc1)
Merging ntb/ntb-next (28293b6c68cd ntb: ntb_pingpong: remove redundant init=
ialization of variables msg_data and spad_data)
Merging seccomp/for-next/seccomp (19d67694745c Documentation: seccomp: Fix =
typo in user notification)
Merging kspp/for-next/kspp (6a0544606ec7 pgo: rectify comment to proper ker=
nel-doc syntax)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (0f79ce970e79 gnss: drop stray semicolons)
Merging fsi/next (9ab1428dfe2c fsi/sbefifo: Fix reset timeout)
Merging slimbus/for-next (e5c578adcdd9 slimbus: ngd: reset dma setup during=
 runtime pm)
Merging nvmem/for-next (e73f0f0ee754 Linux 5.14-rc1)
Merging xarray/main (2c7e57a02708 idr test suite: Improve reporting from id=
r_find_test_1)
Merging hyperv/hyperv-next (31e5e64694cf drivers: hv: Decouple Hyper-V cloc=
k/timer code from VMbus drivers)
Merging auxdisplay/auxdisplay (24ebc044c72e auxdisplay: Replace symbolic pe=
rmissions with octal permissions)
Merging kgdb/kgdb/for-next (c8daba4640ac kgdb: Fix fall-through warning for=
 Clang)
Merging hmm/hmm (fe07bfda2fb9 Linux 5.12-rc1)
Merging fpga/for-next (c485d3bf3cc7 fpga: fpga-mgr: wrap the write_sg() op)
Merging kunit/test (e73f0f0ee754 Linux 5.14-rc1)
Merging cfi/cfi/next (6efb943b8616 Linux 5.13-rc1)
Merging kunit-next/kunit (e73f0f0ee754 Linux 5.14-rc1)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mhi/mhi-next (b8c95616d154 bus: mhi: core: Improve debug messages f=
or power up)
Merging memblock/for-next (a4d5613c4dc6 arm: extend pfn_valid to take into =
account freed memory map alignment)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging rust/rust-next (5d3986cf8ed6 MAINTAINERS: Rust)
CONFLICT (content): Merge conflict in include/linux/kallsyms.h
CONFLICT (content): Merge conflict in Makefile
Merging cxl/next (4ad6181e4b21 cxl/pci: Rename CXL REGLOC ID)
Merging akpm-current/current (23287cf015b0 selftests/memfd: remove unused v=
ariable)
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (a38f0138ae14 Merge branch 'akpm-current/current')

--Sig_/prE1sBw0QwAkxRw=8Ezc7yR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD2ZBIACgkQAVBC80lX
0GzUSQf/Ux/HwUpnBX6xmCckkcs3Eh9xdW4JAqj2W+akoft83KJp41bqbnx5KDaL
PEmbCPi8BR1PnYd4t26BbTO43FhYSmmTs9oto03AuoUMt9EDOu0U3S5YenwgCrkW
IkM/OjhZPs+sIZ6OIqCVBuKNHb6YuzCaD5FWrsPbN0QdzLO+IVasm8Q4G969pfoZ
JASFhpt7ABGbeRPvRGCpJ442XBHsb8aSvP9+0BQn2lWEYdCRDLAPfCFa5slppSN9
9AfqZTm3y4Reg2UyIaiZOk6wGigljGkABjd8PuUlVBM/hkWjHDNxHpZA6J2wKuYG
TJPBim+3FEgo1rFR8Duy+A55xcdZiw==
=DnfV
-----END PGP SIGNATURE-----

--Sig_/prE1sBw0QwAkxRw=8Ezc7yR--
