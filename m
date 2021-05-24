Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABB5538E0DB
	for <lists+linux-next@lfdr.de>; Mon, 24 May 2021 08:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232259AbhEXGKK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 May 2021 02:10:10 -0400
Received: from ozlabs.org ([203.11.71.1]:59123 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232120AbhEXGKK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 24 May 2021 02:10:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FpRbr6ycJz9s5R;
        Mon, 24 May 2021 16:08:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1621836521;
        bh=A3B0ziEKr5Vwlbr1Lbi5tQJy2JocPn5J0vBB+s8iM3A=;
        h=Date:From:To:Cc:Subject:From;
        b=AWNgPbha2FAerlqIvDFAh2pPhTeo+OkumK2E6Vj7RVJ5QShWLz1hP8exJyYnAueP6
         RWWjdkuAGWnxSgP28n48+eyjZSNRdZ72N7qMKrzAhxfBZjRcoSYiIQX4dMG2pNQu6r
         Ig/Lgu357bLqF99vs82Bjd3FEbPAYFliIT0Tm4zgCyJjMKhnxK+zXr7nNtZQ4bUWZ9
         08sWNB2KfMFlDq9cP9totdAsqVNq2Hdy/ckr8+xqJuqN3gGmQ3imrprlH+9FjUxaWf
         pKSW3cLDv/Q8DOyzF0ZjXErY7cT6j/jsigEXz+KPBA4/2JwYgj3rf8RNYY6d4etpO8
         kSg6NhO2vf1lA==
Date:   Mon, 24 May 2021 16:08:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 24
Message-ID: <20210524160839.6a387aa6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rL06FYM/j4FrcqJ0OAArsm=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rL06FYM/j4FrcqJ0OAArsm=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210521:

The drm-intel tree still had its build failures so I used the version from
next-20210520.

The akpm-current tree still had its build failure for which I reverted
a commit.

Non-merge commits (relative to Linus' tree): 4210
 4166 files changed, 201710 insertions(+), 64055 deletions(-)

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

I am currently merging 331 trees (counting Linus' and 89 trees of bug
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
Merging origin/master (c4681547bcce Linux 5.13-rc3)
Merging fixes/fixes (c06a2ba62fc4 Merge tag 'docs-5.13-3' of git://git.lwn.=
net/linux)
Merging kbuild-current/fixes (c93db682cfb2 kbuild: dummy-tools: adjust to s=
tricter stackprotector check)
Merging arc-current/for-curr (d07f6ca923ea Linux 5.13-rc2)
Merging arm-current/fixes (d2f7eca60b29 ARM: 9071/1: uprobes: Don't hook on=
 thumb instructions)
Merging arm64-fixes/for-next/fixes (588a513d3425 arm64: Fix race condition =
on PG_dcache_clean in __sync_icache_dcache())
Merging arm-soc-fixes/arm/fixes (d37316b72e8b ARM: npcm: wpcm450: select in=
terrupt controller driver)
Merging drivers-memory-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging m68k-current/for-linus (34e5269bf987 m68k: sun3x: Remove unneeded s=
emicolon)
Merging powerpc-fixes/fixes (d72500f99284 powerpc/64s/syscall: Fix ptrace s=
yscall info with scv syscalls)
Merging s390-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (e29f011e8fc0 ipv6: record frag_max_size in atomic fragm=
ents in input path)
Merging bpf/master (84316ca4e100 bpf: Set mac_len in bpf_skb_change_head)
Merging ipsec/master (b515d2637276 xfrm: xfrm_state_mtu should return at le=
ast 1280 for ipv6)
Merging netfilter/master (983c4fcb81d6 netfilter: nf_tables: extended netli=
nk error reporting for chain type)
Merging ipvs/master (414ed7fe863a Merge git://git.kernel.org/pub/scm/linux/=
kernel/git/pablo/nf)
Merging wireless-drivers/master (2c2bdd2372af mt76: validate rx A-MSDU subf=
rames)
Merging mac80211/master (b81ac7841d51 net: cdc_eem: fix URL to CDC EEM 1.0 =
spec)
Merging rdma-fixes/for-rc (463a3f66473b RDMA/uverbs: Fix a NULL vs IS_ERR()=
 bug)
Merging sound-current/for-linus (2b899f31f1a6 ALSA: usb-audio: scarlett2: s=
nd_scarlett_gen2_controls_create() can be static)
Merging sound-asoc-fixes/for-linus (3b598c67701a Merge remote-tracking bran=
ch 'asoc/for-5.13' into asoc-linus)
Merging regmap-fixes/for-linus (d07f6ca923ea Linux 5.13-rc2)
Merging regulator-fixes/for-linus (c4294ffdaff4 Merge remote-tracking branc=
h 'regulator/for-5.13' into regulator-linus)
Merging spi-fixes/for-linus (840c3e47276e Merge remote-tracking branch 'spi=
/for-5.13' into spi-linus)
Merging pci-current/for-linus (2ee4c8a26876 MAINTAINERS: Add Krzysztof as P=
CI host/endpoint controllers reviewer)
Merging driver-core.current/driver-core-linus (0c8713153fbf drivers: base: =
Reduce device link removal code duplication)
Merging tty.current/tty-linus (016002848c82 serial: rp2: use 'request_firmw=
are' instead of 'request_firmware_nowait')
Merging usb.current/usb-linus (2cbd838e0e48 Merge tag 'usb-v5.13-rc3' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb into usb-linus)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (f8e8c1b2f782 USB: serial: pl2303: add d=
evice id for ADLINK ND-6530 GC)
Merging usb-chipidea-fixes/for-usb-fixes (9e3927f6373d usb: chipidea: udc: =
assign interrupt number to USB gadget structure)
Merging phy/fixes (7c2fc79250ca phy: usb: Fix misuse of IS_ENABLED)
Merging staging.current/staging-linus (54732a5322ff Merge tag 'iio-fixes-5.=
13b-take2' of https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio int=
o staging-linus)
Merging iio-fixes/fixes-togreg (54732a5322ff Merge tag 'iio-fixes-5.13b-tak=
e2' of https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into stagi=
ng-linus)
Merging char-misc.current/char-misc-linus (bda7d3ab06f1 kgdb: fix gcc-11 wa=
rnings harder)
Merging soundwire-fixes/fixes (da096fbccd52 soundwire: qcom: fix handling o=
f qcom,ports-block-pack-mode)
Merging thunderbolt-fixes/fixes (22c7a18ed5f0 thunderbolt: usb4: Fix NVM re=
ad buffer bounds and offset issue)
Merging input-current/for-linus (05665cef4b74 Input: xpad - add support for=
 Amazon Game Controller)
Merging crypto-current/master (e3a606f2c544 fsverity: relax build time depe=
ndency on CRYPTO_SHA256)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (486cbe6d8fb5 vfio/pci: zap_vma_ptes() needs M=
MU)
Merging kselftest-fixes/fixes (d07f6ca923ea Linux 5.13-rc2)
Merging modules-fixes/modules-linus (055f23b74b20 module: check for exit se=
ctions in layout_sections() instead of module_init_section())
Merging dmaengine-fixes/fixes (538ea65a9fd1 dmaengine: xilinx: dpdma: initi=
alize registers before request_irq)
Merging backlight-fixes/for-backlight-fixes (a38fd8748464 Linux 5.12-rc2)
Merging mtd-fixes/mtd/fixes (562b4e91d3b2 mtd: parsers: ofpart: fix parsing=
 subpartitions)
Merging mfd-fixes/for-mfd-fixes (a61f4661fba4 mfd: intel_quark_i2c_gpio: Re=
vert "Constify static struct resources")
Merging v4l-dvb-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (6efb943b8616 Linux 5.13-rc1)
Merging at91-fixes/at91-fixes (2c69c8a1736e ARM: dts: at91: sam9x60: fix mu=
x-mask to match product's datasheet)
Merging omap-fixes/fixes (ec527f23e06a bus: ti-sysc: Fix am335x resume hang=
 for usb otg module)
Merging kvm-fixes/master (a4345a7cecfb Merge tag 'kvmarm-fixes-5.13-1' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (f0fb26c456a3 hwmon/pmbus: (q54sj108a2) The PMBUS=
_MFR_ID is actually 6 chars instead of 5)
Merging nvdimm-fixes/libnvdimm-fixes (de80d5781136 Merge branch 'for-5.13/d=
ax' into libnvdimm-fixes)
Merging cxl-fixes/fixes (fae8817ae804 cxl/mem: Fix memory device capacity p=
robing)
Merging btrfs-fixes/next-fixes (037239c36e72 Merge branch 'misc-5.13' into =
next-fixes)
Merging vfs-fixes/fixes (173e84953eaa fs: fix reporting supported extra fil=
e attributes for statx())
Merging dma-mapping-fixes/for-linus (18a3c5f7abfd Merge tag 'for_linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (e68671e9e127 platform/x86: touchscreen_dmi=
: Add info for the Chuwi Hi10 Pro (CWI529) tablet)
Merging samsung-krzk-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging pinctrl-samsung-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging devicetree-fixes/dt/linus (c17611592d96 dt-bindings: More removals =
of type references on common properties)
Merging scsi-fixes/fixes (2ef7665dfd88 scsi: target: qla2xxx: Wait for stop=
_phase1 at WWN removal)
Merging drm-fixes/drm-fixes (dd6ad0516ee3 Merge tag 'amd-drm-fixes-5.13-202=
1-05-19' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (eddd1b8f467f Merge tag 'gvt-f=
ixes-2021-05-19' of https://github.com/intel/gvt-linux into drm-intel-fixes)
Merging mmc-fixes/fixes (a1149a6c06ee mmc: sdhci-pci-gli: increase 1.8V reg=
ulator wait)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (a38fd8748464 Linux 5.12-rc2)
Merging hyperv-fixes/hyperv-fixes (6efb943b8616 Linux 5.13-rc1)
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (bab0d47c0ebb riscv: kexec: Fix W=3D1 build warn=
ings)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (2e8496f31d0b firmware: stratix10-svc: reset COMMA=
ND_RECONFIG_FLAG_PARTIAL to 0)
Merging spdx/spdx-linus (6efb943b8616 Linux 5.13-rc1)
Merging gpio-brgl-fixes/gpio/for-current (bdbe871ef0ca gpio: tegra186: Don'=
t set parent IRQ affinity)
Merging gpio-intel-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging pinctrl-intel-fixes/fixes (6efb943b8616 Linux 5.13-rc1)
Merging erofs-fixes/fixes (0852b6ca941e erofs: fix 1 lcluster-sized pcluste=
r for big pcluster)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (d7eab3df8f39 Documentation: kunit: Update =
kunit_tool page)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (17cbe03872be mm/memblock: Fix typo in comment=
 of memblock_phys_alloc_try_nid())
Merging cel-fixes/for-rc (9f4ad9e425a1 Linux 5.12)
Merging drm-misc-fixes/for-linux-next-fixes (7e008b02557c dma-buf: fix unin=
tended pin/unpin warnings)
Merging kspp-gustavo/for-next/kspp (135436a7d2cd xfrm: Fix fall-through war=
nings for Clang)
Merging kbuild/for-next (7bcdcd71f432 Makefile: extend 32B aligned debug op=
tion to 64B aligned)
Merging compiler-attributes/compiler-attributes (ca0760e7d79e Compiler Attr=
ibutes: Add continue in comment)
Merging dma-mapping/for-next (a7f3d3d3600c dma-mapping: add unlikely hint t=
o error path in dma_mapping_error)
Merging asm-generic/master (14462376858e Merge branch 'asm-generic-unaligne=
d' into asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (d3506d256d94 Merge branch 'misc' into for-next)
Merging arm64/for-next/core (c76fba33467b arm64: kernel: Update the stale c=
omment)
Merging arm-perf/for-next/perf (2c2e21e78a94 arm64: perf: Remove redundant =
initialization in perf_event.c)
Merging arm-soc/for-next (b433d090ac63 MAINTAINERS: ARM/Amlogic SoCs: add N=
eil as primary maintainer)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (09dc799bceb5 Merge branch 'v5.13/fixes' into tmp/=
aml-rebuild)
Merging aspeed/for-next (61fbc42084f4 Merge branches 'wpcm450-for-v5.13', '=
dt-for-v5.13' and 'lpc-for-v5.13' into for-next)
Merging at91/at91-next (969bbb49f36c Merge branch 'at91-dt' into at91-next)
Merging drivers-memory/for-next (76e5624f3f93 memory: pl353: Fix error retu=
rn code in pl353_smc_probe())
Merging imx-mxs/for-next (c8b0795265b6 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (9d2e21ed98a2 Merge branch 'for_5.12/drivers-soc' int=
o next)
Merging mediatek/for-next (fd450fd2a4fb Merge branch 'v5.13-next/soc' into =
for-next)
Merging mvebu/for-next (79e93f9dc81a Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (a4578e77223a Merge branch 'omap-for-v5.14/dt' into f=
or-next)
Merging qcom/for-next (0109038cffef Merge branches 'arm64-defconfig-for-5.1=
3', 'arm64-for-5.13', 'defconfig-for-5.13', 'drivers-for-5.13' and 'dts-for=
-5.13' into for-next)
Merging raspberrypi/for-next (fbdcf1d20126 ARM: dts: bcm2711: Add the CEC i=
nterrupt controller)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/bcm2711.dtsi
Merging renesas/next (943db114cf99 Merge branch 'renesas-arm-defconfig-for-=
v5.14' into renesas-next)
Merging reset/reset/next (e207457f9045 reset: brcmstb: Add missing MODULE_D=
EVICE_TABLE)
Merging rockchip/for-next (4cc573096563 Merge branch 'v5.14-clk/next' into =
for-next)
Merging samsung-krzk/for-next (6fed39b8b597 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (79053496a28d Merge tag 'scmi-fixes-5.13' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-lin=
ux-next)
Merging stm32/stm32-next (6ed9269265e1 ARM: dts: stm32: Add PTP clock to Et=
hernet controller)
Merging sunxi/sunxi/for-next (401c54f3951e Merge branches 'sunxi/core-for-5=
.14' and 'sunxi/dt-for-5.14' into sunxi/for-next)
Merging tegra/for-next (93b9ea9ca307 Merge branch for-5.13/arm64/dt into fo=
r-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (547be9a05dc8 arm64: dts: ti: k3-am65-iot2050-=
common: Disable mailbox nodes)
Merging xilinx/for-next (6efb943b8616 Linux 5.13-rc1)
Merging clk/clk-next (6efb943b8616 Linux 5.13-rc1)
Merging clk-imx/for-next (4539b53dd2d3 clk: imx8qm: add clock valid resourc=
e checking)
Merging clk-renesas/renesas-clk (6bd913f54f2f clk: renesas: r9a06g032: Swit=
ch to .determine_rate())
Merging clk-samsung/for-next (a38fd8748464 Linux 5.12-rc2)
Merging csky/linux-next (280af034a71d csky: Kconfig: Remove unused selects)
Merging h8300/h8300-next (6e5e55227c95 Merge tag 'v5.11' into h8300-next)
Merging m68k/for-next (eeff86b6d18c m68k: dma: Remove unnecessary include o=
f asm/cacheflush.h)
Merging m68knommu/for-next (d07f6ca923ea Linux 5.13-rc2)
Merging microblaze/next (6efb943b8616 Linux 5.13-rc1)
Merging mips/mips-next (33ae8f801ad8 hugetlb: clear huge pte during flush f=
unction on mips platform)
Merging nds32/next (40e0dd851e7b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (8b549c18ae81 openrisc: Define memory barrier mb)
Merging parisc-hd/for-next (9f4ad9e425a1 Linux 5.12)
Merging powerpc/next (d07f6ca923ea Linux 5.13-rc2)
Merging soc-fsl/next (242b0b398ccd soc: fsl: enable acpi support in RCPM dr=
iver)
Merging risc-v/for-next (11c2f6c1b303 Merge remote-tracking branches 'riscv=
/next-misc' and 'riscv/fixes' into for-next)
Merging s390/for-next (6efb943b8616 Linux 5.13-rc1)
Merging sh/for-next (2882b7626f49 sh: kernel: traps: remove unused variable)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (ed102bf2afed um: Fix W=3D1 missing-include-dirs war=
nings)
Merging xtensa/xtensa-for-next (6a8eb99e130f xtensa: ISS: add GDBIO impleme=
ntation to semihosting interface)
Merging pidfd/for-next (2ca4dcc4909d fs/mount_setattr: tighten permission c=
hecks)
Merging fscrypt/master (a14d0b676491 fscrypt: allow deleting files with uns=
upported encryption policy)
Merging fscache/fscache-next (3003bbd0697b afs: Use the netfs_write_begin()=
 helper)
Merging afs/afs-next (7af08140979a Revert "gcov: clang: fix clang-11+ build=
")
Merging btrfs/for-next (98a55e55c7a4 Merge branch 'fixes-for-master' into f=
or-next-20210521)
Merging ceph/master (f8234d7b1fb3 libceph: kill ceph_none_authorizer::reply=
_buf)
Merging cifs/for-next (1bac61a5514c cifs: change format of CIFS_FULL_KEY_DU=
MP ioctl)
Merging cifsd/cifsd-for-next (4ead0568f798 Merge pull request #49 from namj=
aejeon/cifsd-for-next)
Merging configfs/for-next (14fbbc829772 configfs: fix a use-after-free in _=
_configfs_open_file)
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (c439c3306fea erofs: remove the occupied parameter from z=
_erofs_pagevec_enqueue())
Merging exfat/dev (b741596468b0 Merge tag 'riscv-for-linus-5.13-mw1' of git=
://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging ext3/for_next (a5882ee966b1 Pull disabling of quotactl_path syscall=
. Merge branch 'for_next_testing' into for_next)
Merging ext4/dev (6c0912739699 ext4: wipe ext4_dir_entry2 upon file deletio=
n)
Merging f2fs/dev (ff463c01ac60 f2fs: support RO feature)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (3c9c14338c12 cuse: simplify refcount)
Merging jfs/jfs-next (cf1031ed4752 jfs: Remove trailing semicolon in macros)
Merging nfs/linux-next (d275880abce9 SUNRPC: Fix Oops in xs_tcp_send_reques=
t() when transport is disconnected)
Merging nfs-anna/linux-next (4f8be1f53bf6 nfs: we don't support removing sy=
stem.nfs4_acl)
Merging nfsd/nfsd-next (1808d90e8458 NFSD add vfs_fsync after async copy is=
 done)
Merging cel/for-next (b9f83ffaa0c0 SUNRPC: Fix null pointer dereference in =
svc_rqst_free())
Merging orangefs/for-next (211f9f2e0503 orangefs: leave files in the page c=
ache for a few micro seconds at least)
Merging overlayfs/overlayfs-next (5e717c6fa41f ovl: add debug print to ovl_=
do_getxattr())
Merging ubifs/next (9a29f7f020e0 ubi: Remove unnecessary struct declaration)
Merging v9fs/9p-next (cba7dcd8878e 9p/trans_virtio: Remove sysfs file on pr=
obe failure)
Merging xfs/for-next (e3c2b047475b xfs: restore old ioctl definitions)
Merging zonefs/for-next (6980d29ce4da zonefs: fix to update .i_wr_refcnt co=
rrectly in zonefs_open_zone())
Merging iomap/iomap-for-next (6e552494fb90 iomap: remove unused private fie=
ld from ioend)
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (cbe6fc4e0142 fs/locks: remove useless assign=
ment in fcntl_getlk)
Merging vfs/for-next (e8727aec724e Merge branch 'work.misc' into for-next)
Merging printk/for-next (2d66d9a31ab7 Merge branch 'for-5.14-vsprintf-scanf=
' into for-next)
Merging pci/next (6efb943b8616 Linux 5.13-rc1)
Merging pstore/for-next/pstore (9d843e8fafc7 pstore: Add mem_type property =
DT parsing support)
Merging hid/for-next (5b95bf4cc297 Merge branch 'for-5.13/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (d07f6ca923ea Linux 5.13-rc2)
Merging i3c/i3c/next (0d95f41ebde4 Revert "i3c master: fix missing destroy_=
workqueue() on error in i3c_master_register")
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (34569e775e39 docs: hwmon: Add an entry fo=
r mp2888)
Merging jc_docs/docs-next (0e7c52da1ab8 Documentation: checkpatch: Tweak BI=
T() macro include)
Merging v4l-dvb/master (bb9212fd9710 media: ARM: dts: sama5d4: enable Hantr=
o G1 VDEC)
Merging v4l-dvb-next/master (2fb27551ba40 media: imx: imx7_mipi_csis: Updat=
e MAINTAINERS)
Merging pm/linux-next (49f1b0f7d4af Merge branches 'devprop' and 'pnp' into=
 linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (3741541ed116 cpufreq: dt: Renam=
e black/white-lists)
Merging cpupower/cpupower (d07f6ca923ea Linux 5.13-rc2)
Merging devfreq/devfreq-next (a15fc9aa5b38 PM / devfreq: imx8m-ddrc: Remove=
 DEVFREQ_GOV_SIMPLE_ONDEMAND dependency)
Merging opp/opp/linux-next (ac9fd3c80340 opp: use list_del_init instead of =
list_del/INIT_LIST_HEAD)
Merging thermal/thermal/linux-next (c310e546164d thermal/drivers/mtk_therma=
l: Remove redundant initializations of several variables)
Merging dlm/next (2fd8db2dd05d fs: dlm: fix missing unlock on error in acce=
pt_from_sock())
Merging swiotlb/linux-next (dfc06b389a4f swiotlb: don't override user speci=
fied size in swiotlb_adjust_size)
Merging rdma/for-next (331859d320f5 RDMA/hns: Remove unused CMDQ member)
Merging net-next/master (f5120f599880 dpaa2-eth: don't print error from dpa=
a2_mac_connect if that's EPROBE_DEFER)
Applying: usb: class: cdc-wdm: fix for kill_urbs() removal
Merging bpf-next/for-next (a49e72b3bda7 net: qrtr: ns: Fix error return cod=
e in qrtr_ns_init())
Merging ipsec-next/master (ea89c862f01e net: mana: Use struct_size() in kza=
lloc())
Merging mlx5-next/mlx5-next (63f9c44bca5e net/mlx5: Add MEMIC operations re=
lated bits)
Merging netfilter-next/master (845064d752ce netfilter: Remove leading space=
s in Kconfig)
CONFLICT (content): Merge conflict in net/netfilter/nft_set_pipapo.c
Applying: fix up for merge involving nft_pipapo_lookup()
Merging ipvs-next/master (ea89c862f01e net: mana: Use struct_size() in kzal=
loc())
Merging wireless-drivers-next/master (6efb943b8616 Linux 5.13-rc1)
Merging bluetooth/master (c7e1e7ccd606 Bluetooth: Translate additional addr=
ess type during le_conn_comp)
Merging mac80211-next/master (77091933e453 net: mdio: ipq8064: enlarge slee=
p after read/write operation)
Merging gfs2/for-next (75069590915f gfs2: Fix do_gfs2_set_flags description)
Merging mtd/mtd/next (cc9d663a00a0 drivers: mtd: sm_ftl: Fix alignment of b=
lock comment)
Merging nand/nand/next (fd0d8d85f723 mtd: nand: bbt: Fix corner case in bad=
 block table handling)
Merging spi-nor/spi-nor/next (6efb943b8616 Linux 5.13-rc1)
Merging crypto/master (a6f8e68e238a crypto: ccp - Fix a resource leak in an=
 error handling path)
Merging drm/drm-next (9a91e5e0af5e Merge tag 'amd-drm-next-5.14-2021-05-21'=
 of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_mm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ttm=
.c
Merging drm-misc/for-linux-next (304ba5dca49a Merge drm/drm-next into drm-m=
isc-next)
Merging amdgpu/drm-next (da79c46085ec drm/radeon: Add HD-audio component no=
tifier support (v2))
Merging drm-intel/for-linux-next (cb4920cc40f6 drm/i915: Reenable LTTPR non=
-transparent LT mode for DPCD_REV<1.4)
$ git reset --hard HEAD^
Merging next-20210520 version of drm-intel
Merging drm-tegra/drm/tegra/for-next (c79184a9c029 drm/tegra: Fix shift ove=
rflow in tegra_shared_plane_atomic_update)
Merging drm-msm/msm-next (f2f46b878777 drm/msm/dp: initialize audio_comp wh=
en audio starts)
Merging imx-drm/imx-drm/next (fc1e985b67f9 drm/imx: ipuv3-plane: add color =
encoding and range properties)
Merging etnaviv/etnaviv/next (4bfdd2aa67fb drm/etnaviv: rework linear windo=
w offset calculation)
Merging regmap/for-next (dfde31c9d10f Merge remote-tracking branch 'regmap/=
for-5.14' into regmap-next)
Merging sound/for-next (13d11f14ae40 ALSA: firewire-lib: code refactoring f=
or transfer delay)
Merging sound-asoc/for-next (b18a902e455b Merge remote-tracking branch 'aso=
c/for-5.14' into asoc-next)
Merging modules/modules-next (02b2fb455b2e kernel/module: Use BUG_ON instea=
d of if condition followed by BUG)
Merging input/next (d12b64b9764e MAINTAINERS: repair reference in HYCON HY4=
6XX TOUCHSCREEN SUPPORT)
Merging block/for-next (f5155ffd8ac9 Merge branch 'for-5.14/libata' into fo=
r-next)
Merging device-mapper/for-next (68040817337f dm space map disk: cache a sma=
ll number of index entries)
Merging pcmcia/pcmcia-next (e9d503fef7da pcmcia: rsrc_nonstatic: Fix call-b=
ack function as reference formatting)
Merging mmc/next (3fb6180b0b97 mmc: core: Add support for cache ctrl for SD=
 cards)
Merging mfd/for-mfd-next (550d489184a0 Revert "MAINTAINERS: Add entry for I=
ntel MAX 10 mfd driver")
Merging backlight/for-backlight-next (190ccab3185e backlight: rt4831: Adds =
support for Richtek RT4831 backlight)
Merging battery/for-next (2aac79d14d76 power: supply: sc2731_charger: Add m=
issing MODULE_DEVICE_TABLE)
Merging regulator/for-next (55f0e3d2ed3d Merge remote-tracking branch 'regu=
lator/for-5.14' into regulator-next)
Merging security/next-testing (047843bdb316 Merge branch 'landlock_lsm_v34'=
 into next-testing)
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (49219d9b8785 evm: fix writing <securityfs=
>/evm overflow)
Merging keys/keys-next (e377c31f788f integrity: Load mokx variables into th=
e blacklist keyring)
CONFLICT (content): Merge conflict in certs/system_keyring.c
Merging safesetid/safesetid-next (1ca86ac1ec8d LSM: SafeSetID: Fix code spe=
cification by scripts/checkpatch.pl)
Merging selinux/next (869cbeef18e5 lsm_audit,selinux: pass IB device name b=
y reference)
Merging smack/next (0169d8f33ab7 Revert "Smack: Handle io_uring kernel thre=
ad privileges")
Merging tomoyo/master (6efb943b8616 Linux 5.13-rc1)
Merging tpmdd/next (8ac91e6c6033 Merge tag 'for-5.13-rc2-tag' of git://git.=
kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging watchdog/master (bf05bf16c76b Linux 5.12-rc8)
Merging iommu/next (54c80d907400 iommu/vt-d: Use user privilege for RID2PAS=
ID translation)
Merging audit/next (254c8b96c4af audit: add blank line after variable decla=
rations)
Merging devicetree/for-next (70c1fc34f3c6 dt-bindings: rng: mediatek: add m=
t8365 to mtk rng binding)
Merging mailbox/mailbox-for-next (2335f556b3af dt-bindings: mailbox: qcom-i=
pcc: Add compatible for SC7280)
Merging spi/for-next (ad2e8dfcaebd Merge remote-tracking branch 'spi/for-5.=
14' into spi-next)
Merging tip/auto-latest (c20e394bc6ed Merge branch 'x86/misc')
Merging clockevents/timers/drivers/next (8120891105ba dt-bindings: timer: n=
uvoton,npcm7xx: Add wpcm450-timer)
Merging edac/edac-for-next (2e2f16d5cdb3 EDAC/aspeed: Use proper format str=
ing for printing resource)
Merging irqchip/irq/irqchip-next (fbb80d5ad400 irqchip: Remove redundant er=
ror printing)
Merging ftrace/for-next (eb01f5353bda tracing: Handle %.*s in trace_check_v=
printf())
Merging rcu/rcu/next (16b0662a5c98 rcu: Start timing stall repetitions afte=
r warning complete)
Merging kvm/next (a4345a7cecfb Merge tag 'kvmarm-fixes-5.13-1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvm-arm/next (9a8aae605b80 Merge branch 'kvm-arm64/kill_oprofile_de=
pendency' into kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (44bada282190 KVM: s390: fix guarded storage control r=
egister handling)
Merging xen-tip/linux-next (c81d3d246025 xen-pciback: reconfigure also from=
 backend watch handler)
Merging percpu/for-next (7b92d0f97d9b Merge branch 'for-5.14' into for-next)
Merging workqueues/for-next (940d71c6462e wq: handle VM suspension in stall=
 detection)
Merging drivers-x86/for-next (3f6c859c4953 platform/x86: asus-nb-wmi: Rever=
t "add support for ASUS ROG Zephyrus G14 and G15")
Merging chrome-platform/for-next (6efb943b8616 Linux 5.13-rc1)
Merging hsi/for-next (6efb943b8616 Linux 5.13-rc1)
Merging leds/for-next (ee522bcf026e leds: tlc591xx: fix return value check =
in tlc591xx_probe())
Merging ipmi/for-next (2253042d86f5 ipmi/watchdog: Stop watchdog timer when=
 the current action is 'none')
Merging driver-core/driver-core-next (fd03c075e362 drivers/base/node.c: mak=
e CACHE_ATTR define static DEVICE_ATTR_RO)
Merging usb/usb-next (5cc59c418fde USB: core: WARN if pipe direction !=3D s=
etup packet direction)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (17cd3a106e97 USB: serial: drop irq-flags initi=
alisations)
Merging usb-chipidea-next/for-usb-next (4ae08bc23e1b usb: cdnsp: Useless co=
ndition has been removed)
Merging tty/tty-next (2ac62268a2c0 tty: hvc_console: Remove the repeated wo=
rds 'no' and 'from')
Merging char-misc/char-misc-next (281e46844699 misc: alcor_pci: fix inverte=
d branch condition)
Merging extcon/extcon-next (11fb12ed9bc9 extcon: max8997: Add missing modal=
ias string)
Merging phy-next/next (490dbd2380c7 phy: phy-core-mipi-dphy.c: Correct refe=
rence version)
Merging soundwire/next (037219925e7a soundwire: dmi-quirks: remove duplicat=
e initialization)
Merging thunderbolt/next (d07f6ca923ea Linux 5.13-rc2)
Merging vfio/next (adaeb718d46f vfio/gvt: fix DRM_I915_GVT dependency on VF=
IO_MDEV)
Merging staging/staging-next (1b4c0f3bbdbd staging: rtl8723bs: rename get_r=
a() due to global symbol collision)
Merging iio/togreg (4dc230efbdeb staging: iio: cdc: ad7746: use dt for capa=
citive channel setup.)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (1fd86e280d8b interconnect: qcom: Add missing MODULE_D=
EVICE_TABLE)
Merging dmaengine/next (6f64aa5746d2 dt-bindings: dma: convert arm-pl08x to=
 yaml)
Merging cgroup/for-next (b0565a089634 Merge branch 'for-5.13-fixes' into fo=
r-next)
Merging scsi/for-next (19d4902b12f6 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (ea2f0f77538c scsi: core: Cap scsi_host cmd_per_l=
un at can_queue)
Merging vhost/linux-next (7ff6e99e021c virtio_net: disable cb aggressively)
Merging rpmsg/for-next (dc0e14fa833b Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (6e153938b7f0 gpio: gpio-tegra186: remove p=
latform_set_drvdata() + cleanup probe)
Merging gpio-intel/for-next (2b71b66ac041 gpio: wcove: Split error handling=
 for CTRL and IRQ registers)
Merging pinctrl/for-next (9f96bd5ae866 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in include/linux/pinctrl/pinconf-generic=
.h
Merging pinctrl-intel/for-next (6efb943b8616 Linux 5.13-rc1)
Merging pinctrl-renesas/renesas-pinctrl (904ec4bebc1d pinctrl: renesas: r8a=
779{51,6,65}: Reduce non-functional differences)
Merging pinctrl-samsung/for-next (6efb943b8616 Linux 5.13-rc1)
Merging pwm/for-next (a6efb35019d0 pwm: Reword docs about pwm_apply_state())
Merging userns/for-next (922e3013046b signalfd: Remove SIL_PERF_EVENT field=
s from signalfd_siginfo)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (d07f6ca923ea Linux 5.13-rc2)
Merging livepatching/for-next (c150bbbb1731 Merge branch 'for-5.13/signal' =
into for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (4d0185e67806 rtc: sysfs: check features instead of op=
s)
Merging nvdimm/libnvdimm-for-next (30c10d32152d Merge branch 'for-5.12/cxl'=
 into libnvdimm-for-next)
Merging at24/at24/for-next (6efb943b8616 Linux 5.13-rc1)
Merging ntb/ntb-next (5c8fe583cce5 Linux 5.11-rc1)
Merging seccomp/for-next/seccomp (a3fc712c5b37 seccomp: Fix "cacheable" typ=
o in comments)
Merging kspp/for-next/kspp (72a12a91a634 init: verify that function is init=
call_t at compile-time)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (994adcbd3714 gnss: drop stray semicolons)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (0320ed0a8236 drivers: slimbus: Fix word resposibl=
e -> responsible in slimbus.h)
CONFLICT (content): Merge conflict in drivers/nvmem/Makefile
CONFLICT (content): Merge conflict in drivers/nvmem/Kconfig
Merging nvmem/for-next (d1a5f4ca656b nvmem: qfprom: minor nit fixes)
Merging xarray/main (2c7e57a02708 idr test suite: Improve reporting from id=
r_find_test_1)
Merging hyperv/hyperv-next (c6a8625fa4c6 hv_utils: Fix passing zero to 'PTR=
_ERR' warning)
Merging auxdisplay/auxdisplay (aecd79c09c2f auxdisplay: Add I2C gpio expand=
er example)
Merging kgdb/kgdb/for-next (83fa2d13d628 kdb: Refactor env variables get/se=
t code)
Merging hmm/hmm (fe07bfda2fb9 Linux 5.12-rc1)
Merging fpga/for-next (ded39fc4a5b4 docs: driver-api: fpga: avoid using UTF=
-8 chars)
Merging kunit/test (d07f6ca923ea Linux 5.13-rc2)
Merging cfi/cfi/next (6efb943b8616 Linux 5.13-rc1)
Merging kunit-next/kunit (d07f6ca923ea Linux 5.13-rc2)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mhi/mhi-next (6efb943b8616 Linux 5.13-rc1)
Merging memblock/for-next (097d43d85704 mm: memblock: remove return value o=
f memblock_free_all())
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging rust/rust-next (fef0214731cc rust: allow printing in the kernel cra=
te)
CONFLICT (content): Merge conflict in kernel/printk/printk.c
CONFLICT (content): Merge conflict in include/uapi/linux/android/binder.h
CONFLICT (content): Merge conflict in Makefile
Merging cxl/next (35c32e3095d3 cxl/docs: Fix "Title underline too short" wa=
rning)
Merging tpmdd-jejb/tpmdd-for-next (69977d1aeeca Merge branch 'tpmdd-fixes' =
into tpmdd-for-next)
Merging akpm-current/current (c5ea479305e0 ipc/sem.c: use READ_ONCE()/WRITE=
_ONCE() for use_global_lock)
Applying: Revert "mm: migrate: fix missing update page_private to hugetlb_p=
age_subpool"
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (a37dfd4eec37 kdump: use vmlinux_build_id to simplify)

--Sig_/rL06FYM/j4FrcqJ0OAArsm=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCrQugACgkQAVBC80lX
0GzidQf+J8m9TJVh0opW0ZxXVNrdU7QxJ9iK+36ZFcYnetQR9Z0aCccCELIIvdVx
G2bhMck2kR3det4/bH2EWnXTFZCLMt6qg++sYNxgcImZd+lloDZvH9OE4m+N+o0H
t9k9ipqS6kxDWYDBVF7AXTpFwxTM4I/xMoEYOyoll7FaytL8XM3WyBH5lYcYnfQh
550oB4HLGTFo03aXENnmwgx+1B7KqWFZinE4pgh2IfR7LkW9qdCRARY9okMOlHro
qJHTssFxbQDDsf8nKd0tEJIMP3V82OeV27gBd/+xYSlZmww1EVgGHz87/fd5lJcJ
Vz2nH8V9UTCMNGT5vFDiOFMClc6x9Q==
=W1vl
-----END PGP SIGNATURE-----

--Sig_/rL06FYM/j4FrcqJ0OAArsm=--
