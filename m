Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC06835F413
	for <lists+linux-next@lfdr.de>; Wed, 14 Apr 2021 14:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347383AbhDNMkD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Apr 2021 08:40:03 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58249 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237671AbhDNMkB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Apr 2021 08:40:01 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FL29K0DHQz9sWS;
        Wed, 14 Apr 2021 22:39:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618403973;
        bh=47q43yHY27ZIWSMFd0EWUuD7J/BrATjsI7ywi+8Ed98=;
        h=Date:From:To:Cc:Subject:From;
        b=bo8Zpj/G+ZlflAp+v2W78r2/P5O8ibHSPUQ21C5o32lpgmMFzcnR4GkZTtcUPCy89
         7ExOT4wQvc5k3/sP2l3+RzlrJUI+lAP0ORQC0BLFO3AnEkWhsz2wXEt7mwp0ZEer75
         QUEbGxdHkvxgVcZwBPHdwPnpZzccf7xJvZXUDrAQxvZrD9JLkLfgwM9eSBl9BzMGGd
         n3R94WKbkRJ+TrVDhLP4P6g8SGJgLQPcqYrsaDihdbmDtUEcOqCl3KH6KZ6yzApM9x
         Cpfzg9LPgOsJ1f6+PrTCqW+BcUYG11Smr1CIWEKxXEAyZyuAwXMS3kei+TmzRWMwwq
         wSXCy5K2X2m6w==
Date:   Wed, 14 Apr 2021 22:39:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 14
Message-ID: <20210414223930.72bfbf53@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bAqSDbDw=qnAlfqtp4kg/mT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bAqSDbDw=qnAlfqtp4kg/mT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210413:

Non-merge commits (relative to Linus' tree): 11611
 10392 files changed, 569164 insertions(+), 261078 deletions(-)

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

I am currently merging 338 trees (counting Linus' and 87 trees of bug
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
Merging origin/master (eebe426d32e1 Merge tag 'fixes-for-5.12-rc7' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/mtd/linux)
Merging fixes/fixes (e71ba9452f0b Linux 5.11-rc2)
Merging kbuild-current/fixes (bcbcf50f5218 kbuild: fix ld-version.sh to not=
 be affected by locale)
Merging arc-current/for-curr (163630b2d95b arc: Fix typos/spellos)
Merging arm-current/fixes (30e3b4f256b4 ARM: footbridge: fix PCI interrupt =
mapping)
Merging arm64-fixes/for-next/fixes (738fa58ee132 arm64: kprobes: Restore lo=
cal irqflag if kprobes is cancelled)
Merging arm-soc-fixes/arm/fixes (b9a9786a13ea Merge tag 'omap-for-v5.12/fix=
es-rc6-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linu=
x-omap into arm/fixes)
Merging drivers-memory-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging m68k-current/for-linus (a65a802aadba m68k: Fix virt_addr_valid() W=
=3D1 compiler warnings)
Merging powerpc-fixes/fixes (791f9e36599d powerpc/vdso: Make sure vdso_wrap=
per.o is rebuilt everytime vdso.so is rebuilt)
Merging s390-fixes/fixes (a994eddb947e s390/entry: save the caller of psw_i=
dle)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (2afeec08ab5c xen-netback: Check for hotplug-status exis=
tence before watching)
Merging bpf/master (afd0be729953 libbpf: Fix potential NULL pointer derefer=
ence)
Merging ipsec/master (6628ddfec758 net: geneve: check skb is large enough f=
or IPv4/IPv6 header)
Merging netfilter/master (ccb39c628558 Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/pablo/nf)
Merging ipvs/master (fbea31808ca1 netfilter: conntrack: do not print icmpv6=
 as unknown via /proc)
Merging wireless-drivers/master (65db391dd874 iwlwifi: mvm: fix beacon prot=
ection checks)
Merging mac80211/master (864db232dc70 net: ipv6: check for validity before =
dereferencing cfg->fc_nlinfo.nlh)
Merging rdma-fixes/for-rc (d434405aaab7 Linux 5.12-rc7)
Merging sound-current/for-linus (c8426b2700b5 ALSA: hda/realtek: Fix speake=
r amp setup on Acer Aspire E1)
Merging sound-asoc-fixes/for-linus (357505e41fb0 Merge remote-tracking bran=
ch 'asoc/for-5.12' into asoc-linus)
Merging regmap-fixes/for-linus (78d889705732 Merge remote-tracking branch '=
regmap/for-5.12' into regmap-linus)
Merging regulator-fixes/for-linus (6068cc31dedd Merge remote-tracking branc=
h 'regulator/for-5.12' into regulator-linus)
Merging spi-fixes/for-linus (c730b40940f9 Merge remote-tracking branch 'spi=
/for-5.12' into spi-linus)
Merging pci-current/for-linus (cf673bd0cc97 PCI: switchtec: Fix Spectre v1 =
vulnerability)
Merging driver-core.current/driver-core-linus (d434405aaab7 Linux 5.12-rc7)
Merging tty.current/tty-linus (e49d033bddf5 Linux 5.12-rc6)
Merging usb.current/usb-linus (d434405aaab7 Linux 5.12-rc7)
Merging usb-gadget-fixes/fixes (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial-fixes/usb-linus (0d02ec6b3136 Linux 5.12-rc4)
Merging usb-chipidea-fixes/for-usb-fixes (cf97d7af2468 usb: cdnsp: Fixes is=
sue with dequeuing requests after disabling endpoint)
Merging phy/fixes (da848f9a0e13 phy: qcom-qmp: add hbr3_hbr2 voltage and pr=
emphasis swing table)
Merging staging.current/staging-linus (e49d033bddf5 Linux 5.12-rc6)
Merging iio-fixes/fixes-togreg (e49d033bddf5 Linux 5.12-rc6)
Merging char-misc.current/char-misc-linus (e49d033bddf5 Linux 5.12-rc6)
Merging soundwire-fixes/fixes (fde5d7f27108 soundwire: bus: Fix device foun=
d flag correctly)
Merging thunderbolt-fixes/fixes (d434405aaab7 Linux 5.12-rc7)
Merging input-current/for-linus (56cfe6f820a6 Input: elants_i2c - drop zero=
-checking of ABS_MT_TOUCH_MAJOR resolution)
Merging crypto-current/master (0de9dc80625b hwrng: timeriomem - Use device-=
managed registration API)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (909290786ea3 vfio/pci: Add missing range chec=
k in vfio_pci_mmap)
Merging kselftest-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (ea9aadc06a9f dmaengine: idxd: fix wq cleanup=
 of WQCFG registers)
Merging backlight-fixes/for-backlight-fixes (a38fd8748464 Linux 5.12-rc2)
Merging mtd-fixes/mtd/fixes (2fb164f0ce95 mtd: rawnand: mtk: Fix WAITRDY br=
eak condition and timeout)
Merging mfd-fixes/for-mfd-fixes (a61f4661fba4 mfd: intel_quark_i2c_gpio: Re=
vert "Constify static struct resources")
Merging v4l-dvb-fixes/fixes (0e37b4fa67f5 media: coda: fix macroblocks coun=
t control usage)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (9ae31e2ab293 MIPS: kernel: setup.c: fix comp=
ilation error)
Merging at91-fixes/at91-fixes (2c69c8a1736e ARM: dts: at91: sam9x60: fix mu=
x-mask to match product's datasheet)
Merging omap-fixes/fixes (fc85dc42a384 ARM: OMAP2+: Fix uninitialized sr_in=
st)
Merging kvm-fixes/master (04c4f2ee3f68 KVM: VMX: Don't use vcpu->run->inter=
nal.ndata as an array index)
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (a38fd8748464 Linux 5.12-rc2)
Merging nvdimm-fixes/libnvdimm-fixes (99a81dcc717d Merge branch 'for-5.12/c=
xl' into libnvdimm-fixes)
Merging btrfs-fixes/next-fixes (3b7ec4d1b5cb Merge branch 'misc-5.12' into =
next-fixes)
Merging vfs-fixes/fixes (4f0ed93fb92d LOOKUP_MOUNTPOINT: we are cleaning "j=
umped" flag too late)
Merging dma-mapping-fixes/for-linus (d17405d52bac dma-mapping: benchmark: f=
ix kernel crash when dma_map_single fails)
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (a3790a8a94fc platform/x86: intel-hid: Fix =
spurious wakeups caused by tablet-mode events during suspend)
Merging samsung-krzk-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging pinctrl-samsung-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging devicetree-fixes/dt/linus (d473d32c2fba of: property: fw_devlink: d=
o not link ".*,nr-gpios")
Merging scsi-fixes/fixes (176ddd89171d scsi: libsas: Reset num_scatter if l=
ibata marks qc as NODATA)
Merging drm-fixes/drm-fixes (d434405aaab7 Linux 5.12-rc7)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (aee6f25e9c91 drm/i915/display=
/vlv_dsi: Do not skip panel_pwr_cycle_delay when disabling the panel)
Merging mmc-fixes/fixes (a5e13c6df0e4 Linux 5.12-rc5)
Merging rtc-fixes/rtc-fixes (bd33335aa93d rtc: cmos: Disable irq around dir=
ect invocation of cmos_interrupt())
Merging gnss-fixes/gnss-linus (a38fd8748464 Linux 5.12-rc2)
Merging hyperv-fixes/hyperv-fixes (37df9f3fedb6 video: hyperv_fb: Fix a dou=
ble free in hvfb_probe)
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (79c338ab575e riscv: keep interrupts disabled fo=
r BREAKPOINT exception)
Merging pidfd-fixes/fixes (03ba0fe4d09f file: simplify logic in __close_ran=
ge())
Merging fpga-fixes/fixes (2e8496f31d0b firmware: stratix10-svc: reset COMMA=
ND_RECONFIG_FLAG_PARTIAL to 0)
Merging spdx/spdx-linus (e49d033bddf5 Linux 5.12-rc6)
Merging gpio-brgl-fixes/gpio/for-current (23cf00ddd2e1 gpio: sysfs: Obey va=
lid_mask)
Merging gpio-intel-fixes/fixes (b41ba2ec54a7 gpiolib: Read "gpio-line-names=
" from a firmware node)
Merging pinctrl-intel-fixes/fixes (196d94175329 pinctrl: lewisburg: Update =
number of pins in community)
Merging erofs-fixes/fixes (9f377622a484 erofs: fix bio->bi_max_vecs behavio=
r change)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (7fd53f41f771 kunit: tool: Disable PAGE_POI=
SONING under --alltests)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (17cbe03872be mm/memblock: Fix typo in comment=
 of memblock_phys_alloc_try_nid())
Merging cel-fixes/for-rc (e49d033bddf5 Linux 5.12-rc6)
Merging drm-misc-fixes/for-linux-next-fixes (eb9dfdd1ed40 drm/vc4: crtc: Re=
duce PV fifo threshold on hvs4)
Merging kspp-gustavo/for-next/kspp (36f9ff9e03de lib: Fix fall-through warn=
ings for Clang)
Merging kbuild/for-next (b3d4b152be01 Merge branch 'kconfig' into for-next)
Merging compiler-attributes/compiler-attributes (19c329f68089 Linux 5.11-rc=
4)
Merging dma-mapping/for-next (a7f3d3d3600c dma-mapping: add unlikely hint t=
o error path in dma_mapping_error)
Merging asm-generic/master (38489db09b10 Merge branch 'asm-generic-fixes' i=
nto asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (0ae6d1f52670 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (1e91a92b9af5 Merge branch 'for-next/mte-async-=
kernel-mode' into for-next/core)
CONFLICT (content): Merge conflict in arch/arm64/include/asm/cpucaps.h
Merging arm-perf/for-next/perf (2c2e21e78a94 arm64: perf: Remove redundant =
initialization in perf_event.c)
Merging arm-soc/for-next (a3689dbaeca3 soc: document merges)
Merging actions/for-next (444d018d8d38 ARM: dts: owl-s500-roseapplepi: Add =
ATC2603C PMIC)
Merging amlogic/for-next (6373d6d2ee83 Merge branch 'v5.13/dt64' into tmp/a=
ml-rebuild)
Merging aspeed/for-next (61fbc42084f4 Merge branches 'wpcm450-for-v5.13', '=
dt-for-v5.13' and 'lpc-for-v5.13' into for-next)
Merging at91/at91-next (969bbb49f36c Merge branch 'at91-dt' into at91-next)
Merging drivers-memory/for-next (93567c59f9b0 Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (1f0f76f795d5 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (9d2e21ed98a2 Merge branch 'for_5.12/drivers-soc' int=
o next)
Merging mediatek/for-next (068acd3c4e4c Merge branch 'v5.12-next/dts64-2' i=
nto for-next)
Merging mvebu/for-next (79e93f9dc81a Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (44e97f6fb29b Merge branch 'fixes' into for-next)
Merging qcom/for-next (f63813c31ac6 Merge branches 'arm64-defconfig-for-5.1=
3', 'arm64-for-5.13', 'drivers-for-5.13' and 'dts-for-5.13' into for-next)
Merging raspberrypi/for-next (fbdcf1d20126 ARM: dts: bcm2711: Add the CEC i=
nterrupt controller)
CONFLICT (content): Merge conflict in arch/arm/boot/dts/bcm2711.dtsi
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (e9903a1559e0 Merge branch 'renesas-arm-dt-for-v5.13' =
into renesas-next)
Merging reset/reset/next (d4e4dffec50b reset: oxnas: replace file name with=
 short description)
Merging rockchip/for-next (f40c51456fe0 Merge branch 'v5.13-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (8a4d4cd15c39 Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (4c2443962313 Merge tag 'scmi-updates-5.13' of =
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-l=
inux-next)
Merging stm32/stm32-next (6ed9269265e1 ARM: dts: stm32: Add PTP clock to Et=
hernet controller)
Merging sunxi/sunxi/for-next (9fa021aa01fd Merge tags 'sunxi-dt-for-5.13-1'=
 and 'sunxi-fixes-for-5.12' into sunxi/for-next)
Merging tegra/for-next (93b9ea9ca307 Merge branch for-5.13/arm64/dt into fo=
r-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (112e5934ff3a arm64: dts: ti: k3-am64-main: Fi=
x ospi compatible)
Merging xilinx/for-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging clk/clk-next (dde6bbadafa4 Merge branch 'clk-samsung' into clk-next)
Merging clk-imx/for-next (054ef44ea3ef clk: imx: Reference preceded by free)
Merging clk-renesas/renesas-clk (f2fb4fe62390 clk: renesas: Zero init clk_i=
nit_data)
Merging clk-samsung/for-next (7f32917642c7 clk: samsung: Remove redundant d=
ev_err calls)
Merging csky/linux-next (74cdb2664477 csky: Fixup typos)
Merging h8300/h8300-next (6e5e55227c95 Merge tag 'v5.11' into h8300-next)
Merging m68k/for-next (f829b4b212a3 m68k: Add missing mmap_read_lock() to s=
ys_cacheflush())
Merging m68knommu/for-next (08782216ecbb m68k: fix flatmem memory model set=
up)
Merging microblaze/next (bbcee72c2f7a microblaze: Fix a typo)
Merging mips/mips-next (dbd815c0dcca MIPS: Alchemy: Use DEFINE_SPINLOCK() f=
or spinlock)
Merging nds32/next (40e0dd851e7b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (1683f7de65db soc: litex: Remove duplicated heade=
r file inclusion)
Merging parisc-hd/for-next (711d090f0e02 parisc: syscalls: switch to generi=
c syscallhdr.sh)
Merging powerpc/next (c46bbf5d2def powerpc/32: Remove powerpc specific defi=
nition of 'ptrdiff_t')
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (242b0b398ccd soc: fsl: enable acpi support in RCPM dr=
iver)
Merging risc-v/for-next (7ad85ab93d03 riscv: Use $(LD) instead of $(CC) to =
link vDSO)
Merging s390/for-next (6a8402de86fc Merge branch 'features' into for-next)
Merging sh/for-next (2882b7626f49 sh: kernel: traps: remove unused variable)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (ddad5187fc2a um: irq.h: include <asm-generic/irq.h>)
Merging xtensa/xtensa-for-next (6a8eb99e130f xtensa: ISS: add GDBIO impleme=
ntation to semihosting interface)
Merging pidfd/for-next (8fac44cbbaa2 Merge branch 'fs/idmapped_mounts/helpe=
rs' into for-next)
Merging fscrypt/master (a14d0b676491 fscrypt: allow deleting files with uns=
upported encryption policy)
Merging fscache/fscache-next (3b541757ad58 afs: Use the netfs_write_begin()=
 helper)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (3c1750120613 Merge branch 'for-next-next-v5.12-2021=
0406' into for-next-20210406)
Merging ceph/master (558b4510f622 ceph: defer flushing the capsnap if the F=
b is used)
Merging cifs/for-next (1276c56f9854 cifs: update internal version number)
Merging cifsd/cifsd-for-next (43c157144230 Merge pull request #37 from namj=
aejeon/cifsd-for-next)
Merging configfs/for-next (14fbbc829772 configfs: fix a use-after-free in _=
_configfs_open_file)
Merging ecryptfs/next (902af369942f ecryptfs: use DEFINE_MUTEX() for mutex =
lock)
Merging erofs/dev (8e6c8fa9f2e9 erofs: enable big pcluster feature)
Merging exfat/dev (f9b23f1f6ca0 exfat: speed up iterate/lookup by fixing st=
art point of traversing cluster chain)
Merging ext3/for_next (652a066ee959 Pull kmap_local ext2 conversion from Ir=
a Weiny.)
Merging ext4/dev (4811d9929cda ext4: allow the dax flag to be set and clear=
ed on inline directories)
Merging f2fs/dev (5f029c045c94 f2fs: clean up build warnings)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (9d7994c5200c virtiofs: remove useless function)
Merging jfs/jfs-next (b462cecfa323 fs: Fix typo issue)
Merging nfs/linux-next (e49d033bddf5 Linux 5.12-rc6)
Merging nfs-anna/linux-next (4f8be1f53bf6 nfs: we don't support removing sy=
stem.nfs4_acl)
Merging nfsd/nfsd-next (c3213d260a23 SUNRPC: Fix oops in the rpc_xdr_buf ev=
ent class)
Merging cel/for-next (b73ac6808b0f NFSD: Use DEFINE_SPINLOCK() for spinlock)
Merging orangefs/for-next (c1048828c3db orangefs: add splice file operation=
s)
Merging overlayfs/overlayfs-next (5e717c6fa41f ovl: add debug print to ovl_=
do_getxattr())
Merging ubifs/next (42119dbe571e ubifs: Fix error return code in alloc_wbuf=
s())
Merging v9fs/9p-next (f8b139e2f241 fs: 9p: fix v9fs_file_open writeback fid=
 error check)
Merging xfs/for-next (e7a3d7e792a5 xfs: drop unnecessary setfilesize helper)
Merging zonefs/for-next (6980d29ce4da zonefs: fix to update .i_wr_refcnt co=
rrectly in zonefs_open_zone())
Merging iomap/iomap-for-next (ad89b66cbad1 iomap: improve the warnings from=
 iomap_swapfile_activate)
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (cbe6fc4e0142 fs/locks: remove useless assign=
ment in fcntl_getlk)
Merging vfs/for-next (6fa1bf18db71 Merge branch 'work.misc' into for-next)
CONFLICT (content): Merge conflict in fs/xfs/xfs_ioctl.c
CONFLICT (content): Merge conflict in fs/overlayfs/file.c
CONFLICT (content): Merge conflict in fs/btrfs/ioctl.c
Merging printk/for-next (94a67011a225 Merge branch 'for-5.13' into for-next)
Merging pci/next (2125db52a0b9 Merge branch 'remotes/lorenzo/pci/misc')
Merging pstore/for-next/pstore (9d843e8fafc7 pstore: Add mem_type property =
DT parsing support)
Merging hid/for-next (2b84a0f6c2c2 Merge branch 'for-5.13/wacom' into for-n=
ext)
Merging i2c/i2c/for-next (bb90758e6720 Merge branch 'i2c/for-5.13' into i2c=
/for-next)
Merging i3c/i3c/next (e43d5c7c3c34 dt-bindings: i3c: Fix silvaco,i3c-master=
-v1 compatible string)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (56940c97f6e5 hwmon: (intel-m10-bmc-hwmon)=
 add sensor support of Intel D5005 card)
Merging jc_docs/docs-next (6161a4b18a66 docs: reporting-issues: make people=
 CC the regressions list)
Merging v4l-dvb/master (4f4e6644cd87 media: gscpa/stv06xx: fix memory leak)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging v4l-dvb-next/master (1e28eed17697 Linux 5.12-rc3)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (f0ad2a845d86 Merge branch 'acpi-tables' into linux-n=
ext)
Merging cpufreq-arm/cpufreq/arm/linux-next (dbbd49bade05 cpufreq: armada-37=
xx: Fix module unloading)
Merging cpupower/cpupower (a38fd8748464 Linux 5.12-rc2)
Merging devfreq/devfreq-next (0a7dc8318c28 PM / devfreq: imx8m-ddrc: Remove=
 unneeded of_match_ptr())
Merging opp/opp/linux-next (a8bb0e872bfb memory: samsung: exynos5422-dmc: C=
onvert to use resource-managed OPP API)
Merging thermal/thermal/linux-next (dd2bbec12b31 thermal/drivers/bcm2835: R=
emove redundant dev_err call in bcm2835_thermal_probe())
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (2fd8db2dd05d fs: dlm: fix missing unlock on error in acce=
pt_from_sock())
Merging swiotlb/linux-next (2726bf3ff252 swiotlb: Make SWIOTLB_NO_FORCE per=
form no allocation)
Merging rdma/for-next (7f4a8592ff29 RDMA/rtrs-clt: destroy sysfs after remo=
ving session from active list)
Merging net-next/master (5871d0c6b8ea ionic: return -EFAULT if copy_to_user=
() fails)
CONFLICT (content): Merge conflict in net/nfc/nci/uart.c
Applying: merger fix for "netfilter: bridge: add pre_exit hooks for ebtable=
 unregistration"
Merging bpf-next/for-next (463c2149ede7 selftests/bpf: Add tests for target=
 information in bpf_link info queries)
Merging ipsec-next/master (6ad2dd6c14d3 ipv6: fix clang Wformat warning)
Merging mlx5-next/mlx5-next (63f9c44bca5e net/mlx5: Add MEMIC operations re=
lated bits)
Merging netfilter-next/master (78ed0a9bc6db netfilter: flowtable: Add FLOW_=
OFFLOAD_XMIT_UNSPEC xmit type)
Merging ipvs-next/master (db3685b4046f net: remove obsolete members from st=
ruct net)
Merging wireless-drivers-next/master (fa9f5d0e0b45 iwlegacy: avoid -Wempty-=
body warning)
Merging bluetooth/master (1c55c39f8232 Bluetooth: cmtp: fix file refcount w=
hen cmtp_attach_device fails)
Merging mac80211-next/master (8a16ffdc4cf3 cfg80211: Remove wrong RNR IE va=
lidation check)
Merging gfs2/for-next (c551f66c5dfe gfs2: Fix a number of kernel-doc warnin=
gs)
Merging mtd/mtd/next (28f0be44b263 include: linux: mtd: Remove duplicate in=
clude of nand.h)
Merging nand/nand/next (32cbc7cb70b0 mtd: rawnand: qcom: Use dma_mapping_er=
ror() for error check)
Merging spi-nor/spi-nor/next (46094049a49b Revert "mtd: spi-nor: macronix: =
Add support for mx25l51245g")
Merging crypto/master (16a9874fe468 crypto: chelsio - Read rxchannel-id fro=
m firmware)
Merging drm/drm-next (af8352f1ff54 Merge tag 'drm-msm-next-2021-04-11' of h=
ttps://gitlab.freedesktop.org/drm/msm into drm-next)
Applying: merge fix for "drm: Switch to %p4cc format modifier"
Merging drm-misc/for-linux-next (9c0fed84d575 Merge tag 'drm-intel-next-202=
1-04-01' of git://anongit.freedesktop.org/drm/drm-intel into drm-next)
Merging amdgpu/drm-next (835fcb07b7be drm/amdkfd: Update L1 and add L2/3 ca=
che information)
Merging drm-intel/for-linux-next (f10fe8f89d85 Revert "drm/i915/tgl/psr: Fi=
x glitches when doing frontbuffer modifications")
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/vlv_dsi.c
Merging drm-tegra/drm/tegra/for-next (0265531f0897 drm/tegra: sor: Fully in=
itialize SOR before registration)
Merging drm-msm/msm-next (a29c8c024165 drm/msm/disp/dpu1: fix display under=
runs during modeset.)
Merging imx-drm/imx-drm/next (74181df8c6db drm/imx: ipuv3-plane: Remove two=
 unnecessary export symbols)
CONFLICT (content): Merge conflict in drivers/gpu/drm/imx/ipuv3-plane.c
Merging etnaviv/etnaviv/next (7d614ab2f205 drm/etnaviv: fix NULL check befo=
re some freeing functions is not needed)
Merging regmap/for-next (ccac12acc0c0 Merge remote-tracking branch 'regmap/=
for-5.13' into regmap-next)
Merging sound/for-next (d2e8f641257d ALSA: usb-audio: Explicitly set up the=
 clock selector)
Merging sound-asoc/for-next (993afe97fc05 Merge remote-tracking branch 'aso=
c/for-5.13' into asoc-next)
Merging modules/modules-next (33121347fb1c module: treat exit sections the =
same as init sections when !CONFIG_MODULE_UNLOAD)
Merging input/next (dadf1fd8807e Input: cyttsp - flag the device properly)
Merging block/for-next (3bb0ab37bf5c Merge branch 'for-5.13/block' into for=
-next)
Merging device-mapper/for-next (db7b93e38106 dm integrity: add the "reset_r=
ecalculate" feature flag)
Merging pcmcia/pcmcia-next (e9d503fef7da pcmcia: rsrc_nonstatic: Fix call-b=
ack function as reference formatting)
Merging mmc/next (50eae6bada81 mmc: sdhci-st: Remove unnecessary error log)
Merging mfd/for-mfd-next (43e72121b5f6 mfd: intel_quark_i2c_gpio: Don't pla=
y dirty trick with const)
Merging backlight/for-backlight-next (225be60f3853 dt-bindings: backlight: =
qcom-wled: Add PMI8994 compatible)
Merging battery/for-next (a4d5ed3b54f0 power: supply: surface-charger: Make=
 symbol 'surface_ac_pm_ops' static)
Merging regulator/for-next (dc6c17ce1886 Merge remote-tracking branch 'regu=
lator/for-5.13' into regulator-next)
Merging security/next-testing (b0ccf48b958e Merge branch 'landlock_lsm_v33'=
 into next-testing)
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
CONFLICT (content): Merge conflict in arch/arm64/include/asm/unistd.h
CONFLICT (content): Merge conflict in arch/arm/tools/syscall.tbl
CONFLICT (content): Merge conflict in arch/alpha/kernel/syscalls/syscall.tbl
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (282c0a4d15b6 integrity: Add declarations =
to init_once void arguments.)
Merging keys/keys-next (e377c31f788f integrity: Load mokx variables into th=
e blacklist keyring)
CONFLICT (content): Merge conflict in certs/system_keyring.c
Merging safesetid/safesetid-next (03ca0ec13892 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (1fb057dcde11 smack: differentiate between subjective =
and objective task credentials)
Merging smack/next (7ef4c19d245f smackfs: restrict bytes count in smackfs w=
rite functions)
Merging tomoyo/master (5dc33592e955 lockdep: Allow tuning tracing capacity =
constants.)
Merging tpmdd/next (289b91ab1891 char: tpm: fix error return code in tpm_cr=
50_i2c_tis_recv())
Merging watchdog/master (1e28eed17697 Linux 5.12-rc3)
Merging iommu/next (962538297ffb Merge branches 'iommu/fixes', 'arm/mediate=
k', 'arm/smmu', 'unisoc', 'x86/vt-d', 'x86/amd' and 'core' into next)
Merging audit/next (b75d8f38bcc9 audit: drop /proc/PID/loginuid documentati=
on Format field)
Merging devicetree/for-next (56ddc4cd4c8f docs: dt: update writing-schema.r=
st references)
CONFLICT (content): Merge conflict in drivers/of/of_net.c
Merging mailbox/mailbox-for-next (a683246a069b mailbox: arm_mhu_db: Remove =
redundant dev_err call in mhu_db_probe())
Merging spi/for-next (a00e84701e23 Merge remote-tracking branch 'spi/for-5.=
13' into spi-next)
Merging tip/auto-latest (2afefec14c61 Merge branch 'x86/cleanups')
Merging clockevents/timers/drivers/next (8120891105ba dt-bindings: timer: n=
uvoton,npcm7xx: Add wpcm450-timer)
Merging edac/edac-for-next (faf042d15093 Merge branch 'edac-amd64' into eda=
c-for-next)
Merging irqchip/irq/irqchip-next (94bc94209a66 irqchip/wpcm450: Drop COMPIL=
E_TEST)
CONFLICT (content): Merge conflict in drivers/irqchip/Makefile
CONFLICT (content): Merge conflict in drivers/irqchip/Kconfig
Merging ftrace/for-next (ceaaa12904df ftrace: Simplify the calculation of p=
age number for ftrace_page->records some more)
CONFLICT (content): Merge conflict in arch/x86/kernel/kprobes/ftrace.c
Merging rcu/rcu/next (420d9384a0b9 rcu: Reject RCU_LOCKDEP_WARN() false pos=
itives)
Merging kvm/next (657f1d86a38e Merge branch 'kvm-tdp-fix-rcu' into HEAD)
CONFLICT (content): Merge conflict in arch/x86/kvm/svm/nested.c
Merging kvm-arm/next (a2387e0a1315 Merge remote-tracking branch 'coresight/=
next-ETE-TRBE' into kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (c3171e94cc1c KVM: s390: VSIE: fix MVPG handling for p=
refixing and MSO)
Merging xen-tip/linux-next (d120198bd5ff xen/evtchn: Change irq_info lock t=
o raw_spinlock_t)
Merging percpu/for-next (bd0d09ebd4f8 Merge branch 'for-5.12-fixes' into fo=
r-next)
Merging workqueues/for-next (89e28ce60cb6 workqueue/watchdog: Make unbound =
workqueues aware of touch_softlockup_watchdog() 84;0;0c84;0;0c There are tw=
o workqueue-specific watchdog timestamps:)
Merging drivers-x86/for-next (507cf5a2f1e2 platform/surface: aggregator: mo=
ve to use request_irq by IRQF_NO_AUTOEN flag)
CONFLICT (content): Merge conflict in drivers/platform/x86/thinkpad_acpi.c
CONFLICT (content): Merge conflict in MAINTAINERS
Merging chrome-platform/for-next (c6e939c63c80 platform/chrome: cros_ec_typ=
ec: fix clang -Wformat warning)
Merging hsi/for-next (aa57e77b3d28 HSI: Fix PM usage counter unbalance in s=
si_hw_init)
Merging leds/for-next (d9dfac5419d0 leds: rt4505: Add support for Richtek R=
T4505 flash LED controller)
Merging ipmi/for-next (07cbd87b0416 ipmi_si: Join string literals back)
Merging driver-core/driver-core-next (4ce535ec0084 node: fix device cleanup=
s in error handling code)
CONFLICT (content): Merge conflict in drivers/of/property.c
Merging usb/usb-next (401411bbc4e6 usb: dwc2: Add exit clock gating before =
removing driver)
Merging usb-gadget/next (e49d033bddf5 Linux 5.12-rc6)
Merging usb-serial/usb-next (039b81d50a48 USB: cdc-acm: add more Maxlinear/=
Exar models to ignore list)
Merging usb-chipidea-next/for-usb-next (10076de33b5e usb: cdnsp: Fixes issu=
e with Configure Endpoint command)
Merging tty/tty-next (63bbdb4ea02b tty: hvc: make symbol 'hvc_udbg_dev' sta=
tic)
Merging char-misc/char-misc-next (31d8df9f4ae5 Merge tag 'mhi-for-v5.13' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi into char-misc-next)
CONFLICT (content): Merge conflict in drivers/phy/qualcomm/phy-qcom-qmp.c
Merging extcon/extcon-next (7b1222b224af extcon: qcom-spmi: Add support for=
 VBUS detection)
Merging phy-next/next (8a6b85b14f08 phy: Revert "phy: ti: j721e-wiz: add mi=
ssing of_node_put")
Merging soundwire/next (14968dd36a50 soundwire: intel_init: test link->cdns)
Merging thunderbolt/next (6f3badead6a0 thunderbolt: Hide authorized attribu=
te if router does not support PCIe tunnels)
Merging vfio/next (6a2a235aa627 Merge branches 'v5.13/vfio/embed-vfio_devic=
e', 'v5.13/vfio/misc' and 'v5.13/vfio/nvlink' into v5.13/vfio/next)
Merging staging/staging-next (07ff20cf172f staging: fieldbus: simplify devm=
_anybuss_host_common_probe)
CONFLICT (content): Merge conflict in drivers/iio/common/scmi_sensors/scmi_=
iio.c
Applying: iio: adc: merge fix for "spi: core: remove 'delay_usecs' field fr=
om spi_transfer"
Merging iio/togreg (6470a8206a10 Merge tag 'iio-for-5.13b-take2' of https:/=
/git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-next)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (c1de07884f2b Merge branch 'icc-sm8350' into icc-next)
Merging dmaengine/next (84b0aa2e0d91 dmaengine: dw-edma: Add pcim_iomap_tab=
le return check)
Merging cgroup/for-next (d95af61df072 cgroup/cpuset: fix typos in comments)
Merging scsi/for-next (15cc26df6552 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (15cfef8623a4 scsi: ibmvfc: Fix invalid state mac=
hine BUG_ON())
CONFLICT (content): Merge conflict in drivers/target/iscsi/iscsi_target.c
Merging vhost/linux-next (89d54fb5f508 virtio-balloon: fix a typo in commen=
t of virtballoon_migratepage())
Merging rpmsg/for-next (6bb9d98d929c Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (14a4e9ea3ce2 gpio: mxs: remove useless fun=
ction)
Merging gpio-intel/for-next (058459043e71 gpio: ich: Switch to be dependent=
 on LPC_ICH)
Merging pinctrl/for-next (cbde6c823bfa pinctrl: at91-pio4: Fix slew rate di=
sablement)
Merging pinctrl-intel/for-next (5b613df3f499 pinctrl: intel: No need to dis=
able IRQs in the handler)
Merging pinctrl-renesas/renesas-pinctrl (61232cd6efca pinctrl: renesas: r8a=
7791: Add bias pinconf support)
Merging pinctrl-samsung/for-next (a38fd8748464 Linux 5.12-rc2)
Merging pwm/for-next (64d7d074acd5 pwm: lpss: Don't modify HW state in .rem=
ove callback)
Merging userns/for-next (95ebabde382c capabilities: Don't allow writing amb=
iguous v3 file capabilities)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (e75074781f17 selftests/resctrl: Change a few printe=
d messages)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (c150bbbb1731 Merge branch 'for-5.13/signal' =
into for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (8d69f62fddf6 rtc: rx6110: add ACPI bindings to I2C)
Merging nvdimm/libnvdimm-for-next (30c10d32152d Merge branch 'for-5.12/cxl'=
 into libnvdimm-for-next)
Merging at24/at24/for-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging ntb/ntb-next (5c8fe583cce5 Linux 5.11-rc1)
Merging seccomp/for-next/seccomp (a3fc712c5b37 seccomp: Fix "cacheable" typ=
o in comments)
Merging kspp/for-next/kspp (f4648c741299 Merge branch 'for-next/overflow' i=
nto for-next/kspp)
Merging gnss/gnss-next (994adcbd3714 gnss: drop stray semicolons)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (0320ed0a8236 drivers: slimbus: Fix word resposibl=
e -> responsible in slimbus.h)
CONFLICT (content): Merge conflict in drivers/nvmem/Makefile
CONFLICT (content): Merge conflict in drivers/nvmem/Kconfig
Merging nvmem/for-next (e8405ad55f4c nvmem: sprd: Add missing MODULE_DEVICE=
_TABLE)
Merging xarray/main (2c7e57a02708 idr test suite: Improve reporting from id=
r_find_test_1)
Merging hyperv/hyperv-next (0975694befc0 Drivers: hv: vmbus: Remove unused =
linux/version.h header)
CONFLICT (content): Merge conflict in arch/x86/include/asm/mshyperv.h
Applying: fix up for "x86/paravirt: Switch time pvops functions to use stat=
ic_call()"
Merging auxdisplay/auxdisplay (701454bce906 auxdisplay: Remove in_interrupt=
() usage.)
Merging kgdb/kgdb/for-next (2bbd9b0f2b4e kernel: debug: Ordinary typo fixes=
 in the file gdbstub.c)
Merging hmm/hmm (fe07bfda2fb9 Linux 5.12-rc1)
Merging fpga/for-next (a78a51a851ed fpga: dfl: pci: add DID for D5005 PAC c=
ards)
Merging kunit/test (a38fd8748464 Linux 5.12-rc2)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (f3907773d602 mtd: cfi_cmdset_0002: remove redundant a=
ssignment to variable timeo)
Merging kunit-next/kunit (de2fcb3e6201 Documentation: kunit: add tips for u=
sing current->kunit_test)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (a503d1628c9c bus: mhi: fix typo in comments for struc=
t mhi_channel_config)
Merging memblock/for-next (097d43d85704 mm: memblock: remove return value o=
f memblock_free_all())
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging iomem-mmap-vs-gup/topic/iomem-mmap-vs-gup (ac8b8400620a mm: unexpor=
t follow_pfn)
Merging rust/rust-next (add74f8473c5 Rust support)
CONFLICT (content): Merge conflict in Makefile
Merging akpm-current/current (d7de7846cc94 ipc/sem.c: mundane typo fixes)
CONFLICT (content): Merge conflict in mm/slub.c
CONFLICT (content): Merge conflict in lib/test_kasan.c
CONFLICT (content): Merge conflict in include/linux/bitmap.h
CONFLICT (content): Merge conflict in block/blk-settings.c
CONFLICT (content): Merge conflict in arch/x86/mm/init_64.c
CONFLICT (content): Merge conflict in arch/arm64/Kconfig
CONFLICT (content): Merge conflict in Documentation/admin-guide/kernel-para=
meters.txt
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (46684493b57e memfd_secret: use unsigned int rather tha=
n long as syscall flags type)

--Sig_/bAqSDbDw=qnAlfqtp4kg/mT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB24oIACgkQAVBC80lX
0Gw1Igf/YpY3568RfUnLngN+JTL9BvhM8OkRn2DVnr9vG1LZpRqHah9pOUkC5FBW
8mk/4cJjIYyKLpSWALxXOkMzcWcFAXIg4klZyw1Ro5YRk/+3SGus82t93JP107vv
/k2X+42E4SMWU7yJe04pw+mVZ6B3MFf1XfR1R6p1+kZVwWzIAytJ6mjybj8KlTZC
A5+5SanHFneXzNhSDmUtVNJaSmGunu8j0YMUPZy+qwI1t57Mwf+kfL46dOhe6+0P
Tq7jicclMvd61ESZgga+zIGVceYOWHX7G2H6B99xIDhgEK9vcDePR97k8xyXPPpw
9XDtgn94qYFEz4pDMgRjmaFUiYdrDw==
=uTzy
-----END PGP SIGNATURE-----

--Sig_/bAqSDbDw=qnAlfqtp4kg/mT--
