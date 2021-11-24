Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C86945B3CA
	for <lists+linux-next@lfdr.de>; Wed, 24 Nov 2021 06:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbhKXFTn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Nov 2021 00:19:43 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:60479 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhKXFTn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Nov 2021 00:19:43 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HzTkm6Kj8z4xcb;
        Wed, 24 Nov 2021 16:16:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637730992;
        bh=SCj2aHOwifJpRAB5B2RPJZ75ErUzdDIh/2gaXXHWH6Q=;
        h=Date:From:To:Cc:Subject:From;
        b=usII+qaNpisfDXezI05hQwMFeDRrW6dGAzM5v94NnESqZLK6Y4CB1j2iyem8Ud+P1
         qQ79gsbgpqCXabNjd6S/xSyNCvVfsHSPLTrQpX7TBF6BKRccsQWQ1bl1OJqTwfiPnO
         Dw0U88v7xEjhPO9Wjma2XO2fkpZYk1+o3zwGuiKDvqfijRlNLl0cLVoe2tCdBl2Mfk
         NJwvKvclXLTPb7G3AlxLBcmT4OECzGKxD0KuokOvbXFglkjv8xrI9T4d1122nL9lXE
         wkvjw9rmyRl37mBltn+qWKNREhIKQraF6TPUVK0f6AHXuOrjCaAC+xqaOLREwApntJ
         SN7bcXXs7ce4g==
Date:   Wed, 24 Nov 2021 16:16:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 24
Message-ID: <20211124161632.1aabe7a5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jGvthsKN39TZ5IVuDolcpke";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jGvthsKN39TZ5IVuDolcpke
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20211123:

My fixes tree contains

  3483d332d72c ("Mark NTFS_RW as BROKEN")
I have disabled the ntfs file system write capabaility for now as it
fails for builds with 64k pages.

The sunxi tree lost its build failure.

The drm-intel-gt tree gained a conflict against the drm-intel tree.

The tomoyo tree gained a conflict against the block tree.

The gpio-brgl tree still had its build failure so I used the version from
next-20211115.

Non-merge commits (relative to Linus' tree): 2903
 3425 files changed, 136463 insertions(+), 53236 deletions(-)

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

I am currently merging 344 trees (counting Linus' and 94 trees of bug
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
Merging origin/master (136057256686 Linux 5.16-rc2)
Merging fixes/fixes (3483d332d72c Mark NTFS_RW as BROKEN)
Merging kbuild-current/fixes (e851dfae4371 Merge tag 'kgdb-5.16-rc1' of git=
://git.kernel.org/pub/scm/linux/kernel/git/danielt/linux)
Merging arc-current/for-curr (b9cac915c541 ARC: thread_info.h: correct two =
typos in a comment)
Merging arm-current/fixes (418ace9992a7 ARM: 9156/1: drop cc-option fallbac=
ks for architecture selection)
Merging arm64-fixes/for-next/fixes (d3eb70ead647 arm64: mm: Fix VM_BUG_ON(m=
m !=3D &init_mm) for trans_pgd)
Merging arm-soc-fixes/arm/fixes (18fe42bdd635 MAINTAINERS: Add entry to MAI=
NTAINERS for Milbeaut)
Merging drivers-memory-fixes/fixes (8c5ba21c16bd memory: mtk-smi: Fix a nul=
l dereference for the ostd)
Merging tee-fixes/fixes (d246d81cdbc4 Merge tag 'optee-fix-for-v5.16' into =
fixes)
Merging m68k-current/for-linus (8a3c0a74ae87 m68k: defconfig: Update defcon=
figs for v5.15-rc1)
Merging powerpc-fixes/fixes (136057256686 Linux 5.16-rc2)
Merging s390-fixes/fixes (890e3dc8bb6e ftrace/samples: add s390 support for=
 ftrace direct multi sample)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (80f6e3080bfc fs-verity: fix signed inte=
ger overflow with i_size near S64_MAX)
Merging net/master (7b1b62bc1e6a net: marvell: mvpp2: increase MTU limit wh=
en XDP enabled)
Merging bpf/master (c0d95d3380ee bpf, sockmap: Re-evaluate proto ops when p=
sock is removed from sockmap)
Merging ipsec/master (03a000bfd719 Merge branch 'nh-group-refcnt')
Merging netfilter/master (d6821c5bc6b6 Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/pablo/nf)
Merging ipvs/master (c45231a7668d litex_liteeth: Fix a double free in the r=
emove function)
Merging wireless-drivers/master (6e53d6d26920 mt76: mt7915: fix NULL pointe=
r dereference in mt7915_get_phy_mode)
Merging mac80211/master (8d0112ac6fd0 Merge tag 'net-5.16-rc2' of git://git=
.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging rdma-fixes/for-rc (136057256686 Linux 5.16-rc2)
Merging sound-current/for-linus (ae26c08e6c80 ALSA: intel-dsp-config: add q=
uirk for CML devices based on ES8336 codec)
Merging sound-asoc-fixes/for-linus (693d609322c0 Merge remote-tracking bran=
ch 'asoc/for-5.15' into asoc-linus)
Merging regmap-fixes/for-linus (459e1cd0d5ec Merge remote-tracking branch '=
regmap/for-5.15' into regmap-linus)
Merging regulator-fixes/for-linus (6966df483d7b regulator: Update protectio=
n IRQ helper docs)
Merging spi-fixes/for-linus (ecceaa393998 Merge remote-tracking branch 'spi=
/for-5.15' into spi-linus)
Merging pci-current/for-linus (fa55b7dcdc43 Linux 5.16-rc1)
Merging driver-core.current/driver-core-linus (136057256686 Linux 5.16-rc2)
Merging tty.current/tty-linus (fa55b7dcdc43 Linux 5.16-rc1)
Merging usb.current/usb-linus (113972d2e111 usb: typec: tipd: Fix initializ=
ation sequence for cd321x)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (aa5721a9e0c9 USB: serial: pl2303: fix G=
C type detection)
Merging usb-chipidea-fixes/for-usb-fixes (f130d08a8d79 usb: chipidea: ci_hd=
rc_imx: Also search for 'phys' phandle)
CONFLICT (content): Merge conflict in drivers/usb/chipidea/ci_hdrc_imx.c
Merging phy/fixes (99615ac16947 phy: stm32: adopt dev_err_probe for regulat=
ors)
Merging staging.current/staging-linus (b535917c51ac staging: rtl8192e: Fix =
use after free in _rtl92e_pci_disconnect())
Merging iio-fixes/fixes-togreg (92beafb76a31 iio: adc: axp20x_adc: fix char=
ging current reporting on AXP22x)
Merging char-misc.current/char-misc-linus (c21a80ca0684 binder: fix test re=
gression due to sender_euid change)
Merging soundwire-fixes/fixes (fa55b7dcdc43 Linux 5.16-rc1)
Merging thunderbolt-fixes/fixes (136057256686 Linux 5.16-rc2)
Merging input-current/for-linus (efe6f16c6faf Merge branch 'next' into for-=
linus)
Merging crypto-current/master (beaaaa37c664 crypto: api - Fix boot-up crash=
 when crypto manager is disabled)
Merging vfio-fixes/for-linus (42de956ca7e5 vfio/ap_ops: Add missed vfio_uni=
nit_group_dev())
Merging kselftest-fixes/fixes (fa55b7dcdc43 Linux 5.16-rc1)
Merging modules-fixes/modules-linus (0d67e332e6df module: fix clang CFI wit=
h MODULE_UNLOAD=3Dn)
Merging dmaengine-fixes/fixes (fa51b16d0558 dmaengine: idxd: fix calling wq=
 quiesce inside spinlock)
Merging backlight-fixes/for-backlight-fixes (a38fd8748464 Linux 5.12-rc2)
Merging mtd-fixes/mtd/fixes (bed96b1b5b2c mtd: rawnand: fsmc: Fix timing co=
mputation)
Merging mfd-fixes/for-mfd-fixes (a61f4661fba4 mfd: intel_quark_i2c_gpio: Re=
vert "Constify static struct resources")
Merging v4l-dvb-fixes/fixes (62456590b849 media: hi846: remove the of_match=
_ptr macro)
Merging reset-fixes/reset/fixes (69125b4b9440 reset: tegra-bpmp: Revert Han=
dle errors in BPMP response)
Merging mips-fixes/mips-fixes (136057256686 Linux 5.16-rc2)
Merging at91-fixes/at91-fixes (dbe68bc9e82b ARM: dts: at91: sama7g5ek: to n=
ot touch slew-rate for SDMMC pins)
Merging omap-fixes/fixes (80d680fdccba ARM: dts: omap3430-sdp: Fix NAND dev=
ice node)
Merging kvm-fixes/master (8ed716ca7dc9 KVM: x86/mmu: Pass parameter flush a=
s false in kvm_tdp_mmu_zap_collapsible_sptes())
Merging kvms390-fixes/master (0e9ff65f455d KVM: s390: preserve deliverable_=
mask in __airqs_kick_single_vcpu)
Merging hwmon-fixes/hwmon (0e4190d762ef hwmon: (sht4x) Fix EREMOTEIO errors)
Merging nvdimm-fixes/libnvdimm-fixes (3dd60fb9d95d nvdimm/pmem: stop using =
q_usage_count as external pgmap refcount)
Merging cxl-fixes/fixes (fae8817ae804 cxl/mem: Fix memory device capacity p=
robing)
Merging btrfs-fixes/next-fixes (0426549c5d7d Merge branch 'misc-5.16' into =
next-fixes)
Merging vfs-fixes/fixes (25f54d08f12f autofs: fix wait name hash calculatio=
n in autofs_wait())
Merging dma-mapping-fixes/for-linus (18a3c5f7abfd Merge tag 'for_linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (d477a907cba3 platform/x86: thinkpad_acpi: =
fix documentation for adaptive keyboard)
Merging samsung-krzk-fixes/fixes (4f5d06d381ba arm64: dts: exynos: drop sam=
sung,ufs-shareability-reg-offset in ExynosAutov9)
Merging pinctrl-samsung-fixes/fixes (fa55b7dcdc43 Linux 5.16-rc1)
Merging devicetree-fixes/dt/linus (913d3a3f8408 dt-bindings: watchdog: sunx=
i: fix error in schema)
Merging scsi-fixes/fixes (2d62253eb1b6 scsi: scsi_debug: Zero clear zones a=
t reset write pointer)
Merging drm-fixes/drm-fixes (136057256686 Linux 5.16-rc2)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (136057256686 Linux 5.16-rc2)
Merging mmc-fixes/fixes (5f719948b5d4 mmc: spi: Add device-tree SPI IDs)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (136057256686 Linux 5.16-rc2)
Merging hyperv-fixes/hyperv-fixes (f3e613e72f66 x86/hyperv: Move required M=
SRs check to initial platform probing)
Merging soc-fsl-fixes/fix (7e5e744183bb soc: fsl: dpio: fix qbman alignment=
 error in the virtualization context)
Merging risc-v-fixes/fixes (5a19c7e06236 riscv: fix building external modul=
es)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (8bb7eca972ad Linux 5.15)
Merging spdx/spdx-linus (fa55b7dcdc43 Linux 5.16-rc1)
Merging gpio-brgl-fixes/gpio/for-current (d6912b1251b4 gpio: rockchip: need=
s GENERIC_IRQ_CHIP to fix build errors)
Merging gpio-intel-fixes/fixes (fa55b7dcdc43 Linux 5.16-rc1)
Merging pinctrl-intel-fixes/fixes (fa55b7dcdc43 Linux 5.16-rc1)
Merging erofs-fixes/fixes (57bbeacdbee7 erofs: fix deadlock when shrink ero=
fs slab)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (fa55b7dcdc43 Linux 5.16-rc1)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (b5013d084e03 Merge tag '5.16-rc-part1-smb3-cl=
ient-fixes' of git://git.samba.org/sfrench/cifs-2.6)
Merging cel-fixes/for-rc (8bb7eca972ad Linux 5.15)
Merging irqchip-fixes/irq/irqchip-fixes (10a20b34d735 of/irq: Don't ignore =
interrupt-controller when interrupt-map failed)
Merging renesas-fixes/fixes (432b52eea3dc ARM: shmobile: defconfig: Restore=
 graphical consoles)
Merging perf-current/perf/urgent (8b98436af2c0 Merge tag 'perf-tools-fixes-=
for-v5.16-2021-11-19' of git://git.kernel.org/pub/scm/linux/kernel/git/acme=
/linux)
Merging efi-fixes/urgent (38fa3206bf44 efi: Change down_interruptible() in =
virt_efi_reset_system() to down_trylock())
Merging zstd-fixes/zstd-linus (7416cdc9b9c1 lib: zstd: Don't add -O3 to cfl=
ags)
Merging drm-misc-fixes/for-linux-next-fixes (e048834c209a drm/hyperv: Fix d=
evice removal on Gen1 VMs)
Merging kbuild/for-next (7528edbafeef [for -next only] kconfig: generate in=
clude/generated/rustc_cfg)
Merging perf/perf/core (8ab774587903 Merge tag 'trace-v5.16-5' of git://git=
.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging compiler-attributes/compiler-attributes (7c00621dcaee compiler_type=
s: mark __compiletime_assert failure as __noreturn)
Merging dma-mapping/for-next (9fbd8dc19aa5 dma-mapping: use 'bitmap_zalloc(=
)' when applicable)
Merging asm-generic/master (7efbbe6e1414 qcom_scm: hide Kconfig symbol)
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
Merging arc/for-next (6880fa6c5660 Linux 5.15-rc1)
Merging arm/for-next (0ce29cae5ba4 Merge branches 'devel-stable', 'misc' an=
d 'fixes' into for-next)
Merging arm64/for-next/core (c7c386fbc202 arm64: pgtable: make __pte_to_phy=
s/__phys_to_pte_val inline functions)
Merging arm-perf/for-next/perf (e656972b6986 drivers/perf: Improve build te=
st coverage)
Merging arm-soc/for-next (b86314b30dee Merge branch 'arm/fixes' into for-ne=
xt)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (1e9fc71213d7 arm64: dts: meson-gxbb-wetek: use up=
dated LED bindings)
Merging aspeed/for-next (16d6dc8d8030 ARM: dts: aspeed: mtjade: Add uefi pa=
rtition)
Merging at91/at91-next (f3c0366411d6 ARM: dts: at91: sama7g5-ek: use blocks=
 0 and 1 of TCB0 as cs and ce)
Merging drivers-memory/for-next (7dbdb198911d Merge branch 'for-v5.17/renes=
as-rpc' into for-next)
Merging imx-mxs/for-next (ee4fb9b87b3c Merge branch 'imx/dt64' into for-nex=
t)
Merging keystone/next (cb293d3b430e Merge branch 'for_5.15/drivers-soc' int=
o next)
Merging mediatek/for-next (c7f6a2bf61cb Merge branch 'v5.16-next/dts64' int=
o for-next)
Merging mvebu/for-next (04e78a787b74 arm/arm64: dts: Enable 2.5G Ethernet p=
ort on CN9130-CRB)
Merging omap/for-next (92d190433bd8 Merge branch 'omap-for-v5.16/gpmc' into=
 for-next)
Merging qcom/for-next (b287e05999e7 Merge branches 'arm64-for-5.17', 'drive=
rs-for-5.17' and 'dts-for-5.17' into for-next)
Merging raspberrypi/for-next (a036b0a5d7d6 ARM: dts: bcm2711-rpi-4-b: Fix u=
sb's unit address)
Merging renesas/next (4789519c215c Merge branches 'renesas-arm-dt-for-v5.17=
' and 'renesas-dt-bindings-for-v5.17' into renesas-next)
Merging reset/reset/next (c4f5b30dda01 reset: Add of_reset_control_get_opti=
onal_exclusive())
Merging rockchip/for-next (e862cef6cdda Merge branch 'v5.16-armsoc/soc-fixe=
s' into for-next)
Merging samsung-krzk/for-next (7b8664f50180 Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (13fb3693194d Merge branch 'for-next/scmi' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging stm32/stm32-next (d4b3aaf0f90b ARM: dts: stm32: use usbphyc ck_usbo=
_48m as USBH OHCI clock on stm32mp151)
Merging sunxi/sunxi/for-next (7c6997ef13d4 Merge branch 'sunxi/dt-for-5.17'=
 into sunxi/for-next)
Merging tee/next (de6c9fc2269e Merge branch 'fixes' into next)
Merging tegra/for-next (bbd827b4de7e Merge branch for-5.16/arm64/defconfig =
into for-next)
Merging ti/ti-next (71907ae8e0c0 Merge branch 'ti-drivers-soc-next' into ti=
-next)
Merging xilinx/for-next (326b5e9db528 Merge branch 'zynqmp/soc' into for-ne=
xt)
Merging clk/clk-next (fa55b7dcdc43 Linux 5.16-rc1)
Merging clk-imx/for-next (9dd81021084f clk: imx8mp: Fix the parent clk of t=
he audio_root_clk)
Merging clk-renesas/renesas-clk (827fbac821a6 dt-bindings: clock: renesas,c=
pg-mssr: Document r8a779f0)
Merging clk-samsung/for-next (bcda841f9bf2 clk: samsung: exynos850: Registe=
r clocks early)
Merging csky/linux-next (e21e52ad1e01 csky: Make HAVE_TCM depend on !COMPIL=
E_TEST)
Merging h8300/h8300-next (1ec10274d436 h8300: don't implement set_fs)
Merging m68k/for-next (8a3c0a74ae87 m68k: defconfig: Update defconfigs for =
v5.15-rc1)
Merging m68knommu/for-next (136057256686 Linux 5.16-rc2)
Merging microblaze/next (43bdcbd50043 microblaze: timer: Remove unused prop=
erties)
Merging mips/mips-next (136057256686 Linux 5.16-rc2)
Merging nds32/next (07cd7745c6f2 nds32/setup: remove unused memblock_region=
 variable in setup_memory())
CONFLICT (content): Merge conflict in arch/nds32/Kconfig
CONFLICT (content): Merge conflict in arch/nds32/Kbuild
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (27dff9a9c247 openrisc: fix SMP tlb flush NULL po=
inter dereference)
Merging parisc-hd/for-next (98400ad75e95 Revert "parisc: Fix backtrace to a=
lways include init funtion names")
Merging powerpc/next (136057256686 Linux 5.16-rc2)
Merging soc-fsl/next (54c8b5b6f8a8 soc: fsl: dpio: rename the enqueue descr=
iptor variable)
Merging risc-v/for-next (fa55b7dcdc43 Linux 5.16-rc1)
Merging s390/for-next (0fba2bd4e62b Merge branch 'fixes' into for-next)
Merging sh/for-next (8518e694203d sh: pgtable-3level: Fix cast to pointer f=
rom integer of different size)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (ab6ff1fda1e8 uml: x86: add FORCE to user_constants.=
h)
Merging xtensa/xtensa-for-next (bd47cdb78997 xtensa: move section symbols t=
o asm/sections.h)
Merging pidfd/for-next (968219708108 fs: handle circular mappings correctly)
Merging fscrypt/master (b7e072f9b77f fscrypt: improve a few comments)
Merging fscache/fscache-next (8bb7eca972ad Linux 5.15)
Merging afs/afs-next (52af7105eceb afs: Set mtime from the client for yfs c=
reate operations)
Merging btrfs/for-next (279373dee83e Fixup merge-to-merge conflict in lzo_c=
ompress_pages)
Merging ceph/master (c02cb7bdc450 ceph: add a new metric to keep track of r=
emote object copies)
Merging cifs/for-next (0b03fe6d3ae2 cifs: update internal version number)
Merging configfs/for-next (c42dd069be8d configfs: fix a race in configfs_lo=
okup())
Merging ecryptfs/next (682a8e2b41ef Merge tag 'ecryptfs-5.13-rc1-updates' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs)
Merging erofs/dev (a0961f351d82 erofs: don't trigger WARN() when decompress=
ion fails)
Merging exfat/dev (91c3c66033a0 exfat: fix i_blocks for files truncated ove=
r 4 GiB)
Merging ext3/for_next (a48fc69fe658 udf: Fix crash after seekdir)
Merging ext4/dev (124e7c61deb2 ext4: fix error code saved on super block du=
ring file system abort)
Merging f2fs/dev (b3b2202d4299 f2fs: use iomap for direct I/O)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (97de0e80fd4a fuse: send security context of inode on=
 file)
Merging gfs2/for-next (4cde5b025bbc gfs2: remove redundant set of INSTANTIA=
TE_NEEDED)
Merging jfs/jfs-next (c48a14dca2cb JFS: fix memleak in jfs_mount)
Merging ksmbd/ksmbd-for-next (8ab774587903 Merge tag 'trace-v5.16-5' of git=
://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging nfs/linux-next (064a91771f7a SUNRPC: use different lock keys for IN=
ET6 and LOCAL)
Merging nfs-anna/linux-next (8cfb9015280d NFS: Always provide aligned buffe=
rs to the RPC read layers)
Merging nfsd/nfsd-next (136057256686 Linux 5.16-rc2)
Merging cel/for-next (24e47575a845 NFSD: Fix sparse warning)
Merging ntfs3/master (3a2154b25a9f fs/ntfs3: Optimize locking in ntfs_save_=
wsl_perm)
Merging orangefs/for-next (ac2c63757f4f orangefs: Fix sb refcount leak when=
 allocate sb info failed.)
Merging overlayfs/overlayfs-next (5b0a414d06c3 ovl: fix filattr copy-up fai=
lure)
Merging ubifs/next (9aaa6cc099f6 ubifs: Document sysfs nodes)
Merging v9fs/9p-next (6e195b0f7c8e 9p: fix a bunch of checkpatch warnings)
Merging xfs/for-next (4a6b35b3b3f2 xfs: sync xfs_btree_split macros with us=
erspace libxfs)
Merging zonefs/for-next (95b115332a83 zonefs: remove redundant null bio che=
ck)
Merging iomap/iomap-for-next (03b8df8d43ec iomap: standardize tracepoint fo=
rmatting and storage)
Merging djw-vfs/vfs-for-next (d03ef4daf33a fs: forbid invalid project ID)
Merging file-locks/locks-next (30ccf6076b64 fs/locks: fix fcntl_getlk64/fcn=
tl_setlk64 stub prototypes)
Merging vfs/for-next (8f40da9494cf Merge branch 'misc.namei' into for-next)
Merging printk/for-next (06cf63cb69be Merge branch 'for-5.16-fixup' into fo=
r-next)
Merging pci/next (ff81d75aa0e4 Merge branch 'pci/switchtec')
Merging pstore/for-next/pstore (a5d05b07961a pstore/ftrace: Allow immediate=
 recording)
Merging hid/for-next (2d05de93b9a8 Merge branches 'for-5.16/upstream-fixes'=
, 'for-5.17/apple', 'for-5.17/i2c-hid', 'for-5.17/logitech' and 'for-5.17/m=
agicmouse' into for-next)
Merging i2c/i2c/for-next (fc27bf4a1b3a Merge branch 'i2c/for-mergewindow' i=
nto i2c/for-next)
Merging i3c/i3c/next (a3587e2c0578 i3c: fix incorrect address slot lookup o=
n 64-bit)
Merging dmi/dmi-for-next (f97a2103f1a7 firmware: dmi: Move product_sku info=
 to the end of the modalias)
Merging hwmon-staging/hwmon-next (9d07e54a25b8 hwmon: (asus_wmi_sensors) Su=
pport X370 Asus WMI.)
Merging jc_docs/docs-next (b96ff02ab2be Documentation/process: fix a cross =
reference)
Merging v4l-dvb/master (999ed03518cb media: atomisp: cleanup qbuf logic)
Merging v4l-dvb-next/master (0d2517b3765a media: hantro: Support NV12 on th=
e G2 core)
Merging pm/linux-next (f9efc61a2f28 Merge branch 'acpi-properties' into lin=
ux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (7e97b3dc2556 arch_topology: Rem=
ove unused topology_set_thermal_pressure() and related)
Merging cpupower/cpupower (79a0dc5530a9 tools: cpupower: fix typo in cpupow=
er-idle-set(1) manpage)
Merging devfreq/devfreq-next (5cf79c293821 PM / devfreq: Strengthen check f=
or freq_table)
Merging opp/opp/linux-next (7ca81b690e59 dt-bindings: opp: Allow multi-word=
ed OPP entry name)
Merging thermal/thermal/linux-next (a67a46af4ad6 thermal/core: Deprecate ch=
anging cooling device state from userspace)
Merging ieee1394/for-next (54b3bd99f094 firewire: nosy: switch from 'pci_' =
to 'dma_' API)
Merging dlm/next (1b9beda83e27 fs: dlm: fix build with CONFIG_IPV6 disabled)
Merging rdma/for-next (9c3631d17054 RDMA/hns: Remove magic number)
Merging net-next/master (2106efda785b net: remove .ndo_change_proto_down)
Merging bpf-next/for-next (fa721d4f0b91 selftests/bpf: Fix trivial typo)
CONFLICT (content): Merge conflict in Documentation/bpf/index.rst
Merging ipsec-next/master (2e1809208a4a xfrm: Remove duplicate assignment)
Merging mlx5-next/mlx5-next (fa55b7dcdc43 Linux 5.16-rc1)
Merging netfilter-next/master (ec574d9ee5d2 net: phylink: add 1000base-KX t=
o phylink_caps_to_linkmodes())
Merging ipvs-next/master (cc0356d6a02e Merge tag 'x86_core_for_v5.16_rc1' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging wireless-drivers-next/master (728e26c3ac89 Merge ath-next from git:=
//git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
Merging bluetooth/master (75082e7f4680 net: add missing include in include/=
net/gro.h)
Merging mac80211-next/master (1507b1531981 cfg80211: move offchan_cac_event=
 to a dedicated work)
Merging mtd/mtd/next (67bcbe202b48 mtd: core: clear out unregistered device=
s a bit more)
Merging nand/nand/next (f53d4c109a66 mtd: rawnand: gpmi: Add ERR007117 prot=
ection for nfc_apply_timings)
Merging spi-nor/spi-nor/next (228e80459960 MAINTAINERS: Add myself as SPI N=
OR co-maintainer)
Merging crypto/master (370a40ee2283 crypto: ccp - no need to initialise sta=
tics to 0)
Merging drm/drm-next (c18c8891111b Merge tag 'drm-misc-next-2021-11-18' of =
git://anongit.freedesktop.org/drm/drm-misc into drm-next)
Merging drm-misc/for-linux-next (7057474c8381 drm: ttm: correct ttm_range_m=
anager kernel-doc notation)
Merging amdgpu/drm-next (7890b8e78e69 drm/amdgpu: always reset the asic in =
suspend (v2))
Merging drm-intel/for-linux-next (3c542cfa8266 drm/i915/dg2: Tile 4 plane f=
ormat support)
Merging drm-intel-gt/for-linux-next-gt (d22d446f7a1c drm/i915/gt: Hold RPM =
wakelock during PXP suspend)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_pci.c
Merging drm-tegra/drm/tegra/for-next (cef3fb370da3 drm/tegra: Mark nvdec PM=
 functions as __maybe_unused)
CONFLICT (content): Merge conflict in drivers/gpu/drm/tegra/gem.c
Merging drm-msm/msm-next (02d44fde976a drm/msm/dp: fix missing #include)
Merging imx-drm/imx-drm/next (20fbfc81e390 drm/imx: imx-tve: Make use of th=
e helper function devm_platform_ioremap_resource())
Merging etnaviv/etnaviv/next (81fd23e2b3cc drm/etnaviv: Implement mmap as G=
EM object function)
Merging regmap/for-next (02d6fdecb9c3 regmap: allow to define reg_update_bi=
ts for no bus configuration)
Merging sound/for-next (7c72665c5667 ALSA: led: Use restricted type for ifa=
ce assignment)
Merging sound-asoc/for-next (65c16dd2942f ASoC: SOF: Add PM support for i.M=
X8/i.MX8X/i.MX8M)
Merging modules/modules-next (ced75a2f5da7 MAINTAINERS: Add Luis Chamberlai=
n as modules maintainer)
Merging input/next (744d0090a5f6 Input: iforce - fix control-message timeou=
t)
Merging block/for-next (985a94512537 Merge branch 'for-5.17/block' into for=
-next)
Merging device-mapper/for-next (7552750d0494 dm table: log table creation e=
rror code)
Merging libata/for-next (cac7e8b5f5fa ata: libata-sata: Declare ata_ncq_sde=
v_attrs static)
Merging pcmcia/pcmcia-next (e39cdacf2f66 pcmcia: i82092: fix a null pointer=
 dereference bug)
Merging mmc/next (68934a389805 mmc: dw_mmc: Allow lower TMOUT value than ma=
ximum)
Merging mfd/for-mfd-next (5dc6dafe6209 mfd: simple-mfd-i2c: Select MFD_CORE=
 to fix build error)
Merging backlight/for-backlight-next (3976e974df1f video: backlight: ili932=
0: Make ili9320_remove() return void)
Merging battery/for-next (0525f34d0275 power: supply: ab8500: Standardize c=
apacity lookup)
Merging regulator/for-next (cff6f593251c regulator: rohm-generic: iniline s=
tub function)
Merging security/next-testing (047843bdb316 Merge branch 'landlock_lsm_v34'=
 into next-testing)
Merging apparmor/apparmor-next (fa55b7dcdc43 Linux 5.16-rc1)
Merging integrity/next-integrity (32ba540f3c2a evm: mark evm_fixmode as __r=
o_after_init)
Merging keys/keys-next (e377c31f788f integrity: Load mokx variables into th=
e blacklist keyring)
CONFLICT (content): Merge conflict in certs/system_keyring.c
Merging safesetid/safesetid-next (1b8b71922919 LSM: SafeSetID: Mark safeset=
id_initialized as __initdata)
Merging selinux/next (6326948f940d lsm: security_task_getsecid_subj() -> se=
curity_current_getsecid_subj())
Merging smack/next (0934ad42bb2c smackfs: use netlbl_cfg_cipsov4_del() for =
deleting cipso_v4_doi)
Merging tomoyo/master (51d5ae114da8 loop: replace loop_validate_mutex with =
loop_validate_spinlock)
CONFLICT (content): Merge conflict in drivers/block/loop.c
Merging tpmdd/next (7eba41fe8c7b tpm_tis_spi: Add missing SPI ID)
Merging watchdog/master (c738888032ff watchdog: db8500_wdt: Rename symbols)
Merging iommu/next (52d96919d6a8 Merge branches 'apple/dart', 'arm/mediatek=
', 'arm/renesas', 'arm/smmu', 'arm/tegra', 'iommu/fixes', 'x86/amd', 'x86/v=
t-d' and 'core' into next)
Merging audit/next (fa55b7dcdc43 Linux 5.16-rc1)
Merging devicetree/for-next (3cd6bab2f81d of: property: fw_devlink: Fixup b=
ehaviour when 'node_not_dev' is set)
Merging mailbox/mailbox-for-next (97961f78e8bc mailbox: imx: support i.MX8U=
LP S4 MU)
Merging spi/for-next (44ec41b7f783 spi: pxa2xx: Remove redundant ->read() a=
nd ->write() in struct chip_data)
Merging tip/auto-latest (7284bd9822f3 Merge branch 'locking/core')
Merging clockevents/timers/drivers/next (eda9a4f7af6e clocksource/drivers/t=
imer-ti-dm: Select TIMER_OF)
Merging edac/edac-for-next (a9e6b3819b36 dt-bindings: memory: Add entry for=
 version 3.80a)
Merging irqchip/irq/irqchip-next (11e45471abea Merge branch irq/misc-5.16 i=
nto irq/irqchip-next)
Merging ftrace/for-next (2ef75e9bd2c9 tracing: Don't use out-of-sync va_lis=
t in event printing)
Merging rcu/rcu/next (794a7e5d2a98 workqueue: Upgrade queue_work_on() comme=
nt)
Merging kvm/next (da1bfd52b930 KVM: x86: Drop arbitrary KVM_SOFT_MAX_VCPUS)
Merging kvm-arm/next (5a2acbbb0179 Merge branch kvm/selftests/memslot into =
kvmarm-master/next)
Merging kvms390/next (3fd8417f2c72 KVM: s390: add debug statement for diag =
318 CPNC data)
Merging xen-tip/linux-next (de6da33e6cb7 xen: flag xen_snd_front to be not =
essential for system boot)
Merging percpu/for-next (a81a52b325ec Merge branch 'for-5.14-fixes' into fo=
r-next)
Merging workqueues/for-next (f9eaaa82b474 workqueue: doc: Call out the non-=
reentrance conditions)
Merging drivers-x86/for-next (c15f86856bec platform/x86: thinkpad_acpi: Acc=
ept ibm_init_struct.init() returning -ENODEV)
Merging chrome-platform/for-next (297d34e73d49 platform/chrome: cros_ec_pro=
to: Use ec_command for check_features)
Merging hsi/for-next (4ef69e17eb56 HSI: cmt_speech: unmark comments as kern=
el-doc)
Merging leds/for-next (2c702b9c8e9b dt-bindings: leds: Replace moonlight wi=
th indicator in mt6360 example)
Merging ipmi/for-next (1d49eb91e86e ipmi: Move remove_work to dedicated wor=
kqueue)
Merging driver-core/driver-core-next (136057256686 Linux 5.16-rc2)
Merging usb/usb-next (4616dddcfaf7 usb: typec: ucsi: Expose number of alter=
nate modes in partner)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (136057256686 Linux 5.16-rc2)
Merging usb-chipidea-next/for-usb-next (78665f57c3fa usb: chipidea: udc: ma=
ke controller hardware endpoint primed)
Merging tty/tty-next (fa55b7dcdc43 Linux 5.16-rc1)
Merging char-misc/char-misc-next (f4d77525679e firmware: xilinx: export the=
 feature check of zynqmp firmware)
Merging extcon/extcon-next (9e6ef3a25e5e dt-bindings: extcon: usbc-tusb320:=
 Add TUSB320L compatible string)
Merging phy-next/next (97004c1a4c52 phy: intel: Add Thunder Bay eMMC PHY su=
pport)
Merging soundwire/next (bb349fd2d580 soundwire: qcom: remove redundant vers=
ion number read)
Merging thunderbolt/next (136057256686 Linux 5.16-rc2)
Merging vfio/next (3bf1311f351e vfio/ccw: Convert to use vfio_register_emul=
ated_iommu_dev())
Merging staging/staging-next (1189d2fb15a4 staging: r8188eu: delete unused =
header)
Merging iio/togreg (7d71d289e1ba iio: light: ltr501: Added ltr303 driver su=
pport)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (91f83ea3491e Merge branch 'icc-msm8996' into icc-next)
Merging dmaengine/next (c61d7b2ef141 Documentation: dmaengine: Correctly de=
scribe dmatest with channel unset)
Merging cgroup/for-next (588e5d876648 cgroup: bpf: Move wrapper for __cgrou=
p_bpf_*() to kernel/bpf/cgroup.c)
Merging scsi/for-next (069dd8d37475 Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (659109a45c6c scsi: ufs: Fix double space in SCSI=
_UFS_HWMON description)
Merging vhost/linux-next (47ed04961471 virtio_gpio: drop packed attribute)
Merging rpmsg/for-next (612de6839c55 Merge branches 'rpmsg-next' and 'rproc=
-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (ea708ac5bf41 gpio: xlp: Remove Netlogic XL=
P variants)
$ git reset --hard HEAD^
Merging next-20211115 version of gpio-brgl
Merging gpio-intel/for-next (2ff64a84bbb3 gpiolib: acpi: shrink devm_acpi_d=
ev_add_driver_gpios())
Merging gpio-sim/gpio/gpio-sim (5065e08e4ef3 gpio: sim: fix missing unlock =
on error in gpio_sim_config_commit_item())
CONFLICT (content): Merge conflict in tools/testing/selftests/gpio/Makefile
Merging pinctrl/for-next (a9b5140c77d2 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (f7c151d86487 gpio: mockup: Switch to use ka=
sprintf_strarray())
Merging pinctrl-renesas/renesas-pinctrl (7c50a407b868 pinctrl: renesas: Rem=
ove unneeded locking around sh_pfc_read() calls)
Merging pinctrl-samsung/for-next (16dd3bb5c190 pinctrl: samsung: Make symbo=
l 'exynos7885_pin_ctrl' static)
Merging pwm/for-next (e9d866d5a629 pwm: vt8500: Rename pwm_busy_wait() to m=
ake it obviously driver-specific)
Merging userns/for-next (5ae9497dda62 signal: requeuing undeliverable signa=
ls)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging kselftest/next (a21296a51119 selftests: clone3: clone3: add case CL=
ONE3_ARGS_NO_TEST)
Merging livepatching/for-next (cd2d68f2d6b2 Merge branch 'for-5.15/cpu-hotp=
lug' into for-next)
Merging coresight/next (66bd1333abd7 Documentation: coresight: Fix document=
ation issue)
Merging rtc/rtc-next (fa55b7dcdc43 Linux 5.16-rc1)
Merging nvdimm/libnvdimm-for-next (e765f13ed126 nvdimm/pmem: move dax_attri=
bute_group from dax to pmem)
Merging at24/at24/for-next (fa55b7dcdc43 Linux 5.16-rc1)
Merging ntb/ntb-next (f96cb827ce49 ntb: ntb_pingpong: remove redundant init=
ialization of variables msg_data and spad_data)
Merging seccomp/for-next/seccomp (1e6d69c7b9cd selftests/seccomp: Report ev=
ent mismatches more clearly)
Merging kspp/for-next/kspp (879f756fa9bf Merge branches 'for-next/hardening=
', 'for-next/overflow' and 'for-next/thread_info/cpu' into for-next/kspp)
Merging kspp-gustavo/for-next/kspp (64bc5a949ae1 Merge branch 'for-linus/ks=
pp' into for-next/kspp)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (b15c90153fd9 gnss: drop stray semicolons)
Merging fsi/next (7cc2f34e1f4d fsi: sbefifo: Use interruptible mutex lockin=
g)
Merging slimbus/for-next (fa55b7dcdc43 Linux 5.16-rc1)
Merging nvmem/for-next (42f65ea5a727 nvmem: mtk-efuse: support minimum one =
byte access stride and granularity)
Merging xarray/main (2c7e57a02708 idr test suite: Improve reporting from id=
r_find_test_1)
Merging hyperv/hyperv-next (285f68afa8b2 x86/hyperv: Protect set_hv_tscchan=
ge_cb() against getting preempted)
Merging auxdisplay/auxdisplay (97fbb29fc1eb MAINTAINERS: Add DT Bindings fo=
r Auxiliary Display Drivers)
Merging kgdb/kgdb/for-next (b77dbc86d604 kdb: Adopt scheduler's task classi=
fication)
Merging hmm/hmm (6880fa6c5660 Linux 5.15-rc1)
Merging fpga/for-next (fa55b7dcdc43 Linux 5.16-rc1)
Merging kunit/test (fa55b7dcdc43 Linux 5.16-rc1)
Merging cfi/cfi/next (baaf965f9430 mtd: hyperbus: rpc-if: fix bug in rpcif_=
hb_remove)
Merging kunit-next/kunit (fa55b7dcdc43 Linux 5.16-rc1)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging mhi/mhi-next (77c0bbfcd2ea mhi: pci_generic: Graceful shutdown on f=
reeze)
Merging memblock/for-next (e888fa7bb882 memblock: Check memory add/cap orde=
ring)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging rust/rust-next (988f45dfe7ea MAINTAINERS: Rust)
CONFLICT (content): Merge conflict in scripts/kconfig/confdata.c
CONFLICT (content): Merge conflict in scripts/Makefile.modfinal
CONFLICT (content): Merge conflict in Makefile
Applying: Kbuild: fix for "kbuild: split DEBUG_CFLAGS out to scripts/Makefi=
le.debug"
Merging cxl/next (53989fad1286 cxl/pmem: Fix module reload vs workqueue sta=
te)
Merging folio/for-next (c03571399870 mm: Add functions to zero portions of =
a folio)
Merging bitmap/bitmap-master-5.15 (785cb064e2f8 vsprintf: rework bitmap_lis=
t_string)
CONFLICT (content): Merge conflict in drivers/dma/ti/edma.c
CONFLICT (content): Merge conflict in arch/parisc/include/asm/bitops.h
Merging zstd/zstd-next (fa55b7dcdc43 Linux 5.16-rc1)
Merging efi/next (720dff78de36 efi: Allow efi=3Druntime)
Merging unicode/for-next (e2a58d2d3416 unicode: only export internal symbol=
s for the selftests)
CONFLICT (content): Merge conflict in fs/f2fs/sysfs.c
Merging akpm-current/current (0041610a8d37 configs: introduce debug.config =
for CI-like setup)
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (48aeef72fcc3 lib/stackdepot: allow optional init and s=
tack_table allocation by kvmalloc() - fixup3)

--Sig_/jGvthsKN39TZ5IVuDolcpke
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGdyrAACgkQAVBC80lX
0Gy9BQf+OfQFmSBRyWiYdNtJAFK/4XiBGZ22WEk/8vbFRlYb5/khmcHpiGm3Jmpd
bYYvmrb+Elhw6SXON9uaKNs3jCvhhrBzlL/eH4YKd8iEEnD4BWXtAZOKfNFZngCc
HBMTpf0pU+c2plPHSID0SDEkjPYL5rwLHGlyGBAHPMaeAXhkZtkmEcwplvVz3RSF
U0SrlNdlxEhaJe08t9sNq+LGNiXlkZ08gDR/KFXaqjgg7csJbFw1ABCUY3pb0I6c
+QX2xjhob3Xb7H2k8r4zUAMTBpy8swoh5mRzk09u9jNiq9AusQcvB7slJ6vwC6+n
fM3CjQTMahnChVFfnaQpoOOCCqPd2g==
=hqLA
-----END PGP SIGNATURE-----

--Sig_/jGvthsKN39TZ5IVuDolcpke--
