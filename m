Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B95BE32BB6F
	for <lists+linux-next@lfdr.de>; Wed,  3 Mar 2021 22:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233973AbhCCM13 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Mar 2021 07:27:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237849AbhCCCFg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Mar 2021 21:05:36 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01A02C061794;
        Tue,  2 Mar 2021 18:04:42 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dqy473Bwfz9sRR;
        Wed,  3 Mar 2021 13:04:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614737079;
        bh=BLM3qLO0U6ExRAceAifxFMdxAc8CG/Zm52I5OckNTPk=;
        h=Date:From:To:Cc:Subject:From;
        b=omMw1pQNPwOqGuW98JhUyz8HGvem2MQeP0Y3KsC4PXOwCFj+hUyOoBQ5ZQzEl9U3A
         1LX2IxgNzQHmwswu5RSZ7tgLz/8oWXq6UJHo/GgkzmhVcS8NV0i4Jb90ya6Ppt/isw
         fKL2v0wtok84zAt9qjRQubYn1gI5t42cUp9XyEMt8v/3fevH8sPmeKjGrKZeFxG9Jh
         RJobyUaNo+0AOGahoZh6sF9HR6Ia/q8rS6dh8rHZ2Jxtezky9c9OZ9V0fb/ZuRQH5z
         wPvSdul8eg/a/LAsII4cRMMaI4TZDebUrlXVGZXBps6RASdxnD5eo0NObF6REWpMbB
         Nmz032k5Jy0sw==
Date:   Wed, 3 Mar 2021 13:04:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 3
Message-ID: <20210303130435.63135ee4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4Wal50V9Z_Wvn=k6=YNYsr7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4Wal50V9Z_Wvn=k6=YNYsr7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20210302:

The powerpc-fixes tree lost its build failure.

The tip tree gained a build failure so I used the version from
next-20210302.

Non-merge commits (relative to Linus' tree): 1235
 1290 files changed, 37370 insertions(+), 17856 deletions(-)

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
Merging origin/master (7a7fd0de4a98 Merge branch 'kmap-conversion-for-5.12'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging fixes/fixes (e71ba9452f0b Linux 5.11-rc2)
Merging kbuild-current/fixes (207da4c82ade kbuild: Fix <linux/version.h> fo=
r empty SUBLEVEL or PATCHLEVEL again)
Merging arc-current/for-curr (7c53f6b671f4 Linux 5.11-rc3)
Merging arm-current/fixes (4d62e81b60d4 ARM: kexec: fix oops after TLB are =
invalidated)
Merging arm64-fixes/for-next/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging arm-soc-fixes/arm/fixes (090e502e4e63 Merge tag 'socfpga_dts_fix_fo=
r_v5.12' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux in=
to arm/fixes)
Merging drivers-memory-fixes/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging m68k-current/for-linus (5d2b62832c2e m68k: Fix virt_addr_valid() W=
=3D1 compiler warnings)
Merging powerpc-fixes/fixes (5c88a17e1579 powerpc/sstep: Fix VSX instructio=
n emulation)
Merging s390-fixes/fixes (f7546a8f6613 s390: remove IBM_PARTITION and CONFI=
GFS_FS from zfcpdump defconfig)
Merging sparc/master (cf64c2a905e0 Merge branch 'work.sparc32' of git://git=
.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (8811f4a9836e tcp: add sanity tests to TCP_QUEUE_SEQ)
Merging bpf/master (6185266c5a85 selftests/bpf: Mask bpf_csum_diff() return=
 value to 16 bits in test_verifier)
Merging ipsec/master (8fc0e3b6a866 xfrm: interface: fix ipv4 pmtu check to =
honor ip header df)
Merging netfilter/master (9cc0001a18b4 netfilter: nftables: disallow update=
s on table ownership)
Merging ipvs/master (44a674d6f798 Merge tag 'mlx5-fixes-2021-01-26' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/saeed/linux)
Merging wireless-drivers/master (c490492f15f6 mt76: mt7915: fix unused 'mod=
e' variable)
Merging mac80211/master (8811f4a9836e tcp: add sanity tests to TCP_QUEUE_SE=
Q)
Merging rdma-fixes/for-rc (fe07bfda2fb9 Linux 5.12-rc1)
Merging sound-current/for-linus (48698c973e6b ALSA: hda/realtek: Add quirk =
for Clevo NH55RZQ)
Merging sound-asoc-fixes/for-linus (0bf36bd63292 Merge remote-tracking bran=
ch 'asoc/for-5.12' into asoc-linus)
Merging regmap-fixes/for-linus (fe07bfda2fb9 Linux 5.12-rc1)
Merging regulator-fixes/for-linus (a077a13f9baf Merge remote-tracking branc=
h 'regulator/for-5.12' into regulator-linus)
Merging spi-fixes/for-linus (21bb242db523 Merge remote-tracking branch 'spi=
/for-5.12' into spi-linus)
Merging pci-current/for-linus (7e69d07d7c3c Revert "PCI/ASPM: Save/restore =
L1SS Capability for suspend/resume")
Merging driver-core.current/driver-core-linus (fe07bfda2fb9 Linux 5.12-rc1)
Merging tty.current/tty-linus (511a9d5dc2d4 Revert "serial: max310x: rework=
 RX interrupt handling")
Merging usb.current/usb-linus (466b4bed6798 usb: gadget: f_uac1: stop playb=
ack on function disable)
Merging usb-gadget-fixes/fixes (129aa9734559 usb: raw-gadget: fix memory le=
ak in gadget_setup)
Merging usb-serial-fixes/usb-linus (9a962f427abb USB: serial: xr: fix NULL-=
deref on disconnect)
Merging usb-chipidea-fixes/for-usb-fixes (491b1bea0004 MAINTAINERS: update =
Peter Chen's email address)
Merging phy/fixes (c92e72ae9e0e phy: ti: j721e-wiz: add missing call to of_=
node_put())
Merging staging.current/staging-linus (d1a5bd3f875c staging: comedi: pcl726=
: Use 16-bit 0 for interrupt data)
Merging char-misc.current/char-misc-linus (fe07bfda2fb9 Linux 5.12-rc1)
Merging soundwire-fixes/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging thunderbolt-fixes/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging input-current/for-linus (1bff77f41a80 Input: st1232 - fix NORMAL vs=
. IDLE state handling)
Merging crypto-current/master (0de9dc80625b hwrng: timeriomem - Use device-=
managed registration API)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (e4eccb853664 vfio/pci: Bypass IGD init in cas=
e of -ENODEV)
Merging kselftest-fixes/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging backlight-fixes/for-backlight-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging mtd-fixes/mtd/fixes (b135b3358d73 mtd: rawnand: omap: Use BCH priva=
te fields in the specific OOB layout)
Merging mfd-fixes/for-mfd-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging v4l-dvb-fixes/fixes (246dc3e4a75b media: rc: compile rc-cec.c into =
rc-core)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging at91-fixes/at91-fixes (16457a528e63 ARM: dts: at91: sam9x60: fix mu=
x-mask to match product's datasheet)
Merging omap-fixes/fixes (816fa08a1a32 ARM: OMAP4: Fix cpu_pm handling for =
HS/EMU interrupt save)
Merging kvm-fixes/master (fe07bfda2fb9 Linux 5.12-rc1)
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (4008bc7d3953 hwmon: (dell-smm) Add XPS 15 L502X =
to fan control blacklist)
Merging nvdimm-fixes/libnvdimm-fixes (7018c897c2f2 libnvdimm/dimm: Avoid ra=
ce between probe and available_slots_show())
Merging btrfs-fixes/next-fixes (026fb436af2e Merge branch 'misc-5.12' into =
next-fixes)
Merging vfs-fixes/fixes (d36a1dd9f77a dump_common_audit_data(): fix racy ac=
cesses to ->d_name)
Merging dma-mapping-fixes/for-linus (d17405d52bac dma-mapping: benchmark: f=
ix kernel crash when dma_map_single fails)
Merging i3c-fixes/i3c/fixes (291b5c9870fc i3c/master/mipi-i3c-hci: Fix posi=
tion of __maybe_unused in i3c_hci_of_match)
Merging drivers-x86-fixes/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging samsung-krzk-fixes/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging pinctrl-samsung-fixes/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging devicetree-fixes/dt/linus (8242ff9ea9f0 dt-bindings: display: media=
tek,dpi: Convert to use graph schema)
Merging scsi-fixes/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drm-fixes/drm-fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging mmc-fixes/fixes (4d52020545ac mmc: mmci: Add MMC_CAP_NEED_RSP_BUSY =
for the stm32 variants)
Merging rtc-fixes/rtc-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging gnss-fixes/gnss-linus (fe07bfda2fb9 Linux 5.12-rc1)
Merging hyperv-fixes/hyperv-fixes (fff7b5e6ee63 x86/hyperv: Initialize cloc=
kevents after LAPIC is initialized)
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (f01e631cccab RISC-V: Make NUMA depend on SMP)
Merging pidfd-fixes/fixes (a409ed156a90 Merge tag 'gpio-v5.11-1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio)
Merging fpga-fixes/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging spdx/spdx-linus (c03c21ba6f4e Merge tag 'keys-misc-20210126' of git=
://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs)
Merging gpio-brgl-fixes/gpio/for-current (235c2d137007 gpio: fix gpio-devic=
e list corruption)
Merging gpio-intel-fixes/fixes (a43e36928cf4 gpiolib: acpi: Add missing IRQ=
F_ONESHOT)
Merging pinctrl-intel-fixes/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging erofs-fixes/fixes (a30573b3cdc7 erofs: fix setting up pcluster for =
temporary pages)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (d50ffcd2c371 kunit: tool: Disable PAGE_POI=
SONING under --alltests)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (17cbe03872be mm/memblock: Fix typo in comment=
 of memblock_phys_alloc_try_nid())
Merging cel-fixes/for-rc (bc3ba243099e sunrpc: fix refcount leak for rpc au=
th modules)
Merging drm-misc-fixes/for-linux-next-fixes (71688fdd51c3 drm/qxl: fix lock=
dep issue in qxl_alloc_release_reserved)
Merging kspp-gustavo/for-next/kspp (36f9ff9e03de lib: Fix fall-through warn=
ings for Clang)
Merging kbuild/for-next (6fbd6cf85a3b Merge tag 'kbuild-v5.12' of git://git=
.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging compiler-attributes/compiler-attributes (19c329f68089 Linux 5.11-rc=
4)
Merging dma-mapping/for-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging asm-generic/master (38489db09b10 Merge branch 'asm-generic-fixes' i=
nto asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (1afb7e6348aa Merge branch 'devel-stable' into for-nex=
t)
Merging arm64/for-next/core (1ffa9763828c Merge branch 'for-next/vdso' into=
 for-next/core)
Merging arm-perf/for-next/perf (f0c140481d1b perf: Constify static struct a=
ttribute_group)
Merging arm-soc/for-next (e6c44b8c57c9 soc: document merges)
Merging actions/for-next (006828d706fd Merge branch 'v5.12/defconfig' into =
for-next)
Merging amlogic/for-next (9faeb18107d1 Merge branch 'v5.12/soc' into tmp/am=
l-rebuild)
Merging aspeed/for-next (697dabd5d370 Merge branches 'soc-for-v5.12' and 'd=
t-for-v5.12' into for-next)
Merging at91/at91-next (9639bdcf8954 Merge branch 'at91-fixes' into at91-ne=
xt)
Merging drivers-memory/for-next (cd6eb6742578 memory: tegra: replace DEFINE=
_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE)
Merging imx-mxs/for-next (7535d59c5f11 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (9d2e21ed98a2 Merge branch 'for_5.12/drivers-soc' int=
o next)
Merging mediatek/for-next (e6468af3b590 Merge branch 'v5.11-next/soc' into =
for-next)
Merging mvebu/for-next (8e03d45cb7de Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (01e73147cbf8 Merge branch 'fixes' into for-next)
Merging qcom/for-next (d242adf2067e Merge branch 'arm64-for-5.13' into for-=
next)
Merging raspberrypi/for-next (fbdcf1d20126 ARM: dts: bcm2711: Add the CEC i=
nterrupt controller)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (3158164f1526 Merge branches 'renesas-arm-dt-for-v5.13=
' and 'renesas-drivers-for-v5.13' into renesas-next)
Merging reset/reset/next (d17655759b3f reset: Add devm_reset_control_get_op=
tional_exclusive_released())
Merging rockchip/for-next (38051549ac38 Merge branch 'v5.12-clk/next' into =
for-next)
Merging samsung-krzk/for-next (20bc04ace4e4 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (f40ddce88593 Linux 5.11)
Merging stm32/stm32-next (a9c92a9671d7 ARM: dts: stm32: add #clock-cells pr=
operty to usbphyc node on stm32mp151)
Merging sunxi/sunxi/for-next (981e0af7e064 Merge branches 'sunxi/dt-for-5.1=
3' and 'sunxi/clk-for-5.13' into sunxi/for-next)
Merging tegra/for-next (b62f4a3fbb22 Merge branch for-5.12/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (9e3faed4dc17 arm64: dts: ti: k3-j721e-main: U=
pdate the speed modes supported and their itap delay values for MMCSD subsy=
stems)
Merging clk/clk-next (4d5c4ae32945 Merge branches 'clk-socfpga', 'clk-mstar=
', 'clk-qcom' and 'clk-warnings' into clk-next)
Merging clk-renesas/renesas-clk (24ece96554a9 clk: renesas: cpg-mssr: Fix f=
ormatting issues for 'smstpcr_saved's documentation)
Merging clk-samsung/for-next (44a9e78f9242 clk: samsung: Prevent potential =
endless loop in the PLL ops)
Merging csky/linux-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging h8300/h8300-next (8808515be0ed h8300: Replace <linux/clk-provider.h=
> by <linux/of_clk.h>)
Merging m68k/for-next (5d2b62832c2e m68k: Fix virt_addr_valid() W=3D1 compi=
ler warnings)
Merging m68knommu/for-next (751e8e413e59 m68k: fix flatmem memory model set=
up)
Merging microblaze/next (9dc12e4ccd97 microblaze: tag highmem_setup() with =
__meminit)
Merging mips/mips-next (ee54efc2bbf3 mips: cavium: Replace DEFINE_SIMPLE_AT=
TRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE)
Merging nds32/next (40e0dd851e7b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (8f722f67452f openrisc: Use devicetree to determi=
ne present cpus)
Merging parisc-hd/for-next (778e45d7720d parisc: Enable -mlong-calls gcc op=
tion with CONFIG_COMPILE_TEST)
Merging powerpc/next (fe07bfda2fb9 Linux 5.12-rc1)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e95f287deed2 soc: fsl: handle RCPM errata A-008646 on=
 SoC LS1021A)
Merging risc-v/for-next (dd2d082b5760 riscv: Cleanup setup_bootmem())
Merging s390/for-next (1f6f48a8c81e Merge branch 'fixes' into for-next)
Merging sh/for-next (2882b7626f49 sh: kernel: traps: remove unused variable)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (ddad5187fc2a um: irq.h: include <asm-generic/irq.h>)
Merging xtensa/xtensa-for-next (d5cd31a2b6af xtensa: move coprocessor_flush=
 to the .text section)
Merging pidfd/for-next (f69e8091c4a2 xfs: remove the possibly unused mp var=
iable in xfs_file_compat_ioctl)
Merging fscrypt/master (a14d0b676491 fscrypt: allow deleting files with uns=
upported encryption policy)
Merging fscache/fscache-next (351588943c79 afs: Use the fscache_write_begin=
() helper)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (9cee91bcf4db Merge branch 'for-next-next-v5.12-2021=
0226' into for-next-20210226)
CONFLICT (content): Merge conflict in fs/btrfs/file.c
Merging ceph/master (558b4510f622 ceph: defer flushing the capsnap if the F=
b is used)
Merging cifs/for-next (a671cb46c294 smb3: allow files to be created with ba=
ckslash in name)
Merging configfs/for-next (65cdb4a214c0 configfs: fix kernel-doc markup iss=
ue)
Merging ecryptfs/next (902af369942f ecryptfs: use DEFINE_MUTEX() for mutex =
lock)
Merging erofs/dev (ce0631291813 erofs: initialized fields can only be obser=
ved after bit is set)
Merging exfat/dev (fe07bfda2fb9 Linux 5.12-rc1)
Merging ext3/for_next (c5b8ccc3da76 Pull udf & isofs UID/GID parsing fixes.)
Merging ext4/dev (0a76945fd1ba ext4: add .kunitconfig fragment to enable ex=
t4-specific tests)
Merging f2fs/dev (10e0b8ef8715 f2fs: expose # of overprivision segments)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (5d069dbe8aaf fuse: fix bad inode)
Merging jfs/jfs-next (c03c21ba6f4e Merge tag 'keys-misc-20210126' of git://=
git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs)
Merging nfs/linux-next (92bf22614b21 Linux 5.11-rc7)
Merging nfs-anna/linux-next (7ae017c7322e NFS: Support the '-owrite=3D' opt=
ion in /proc/self/mounts and mountinfo)
Merging nfsd/nfsd-next (c3213d260a23 SUNRPC: Fix oops in the rpc_xdr_buf ev=
ent class)
Merging cel/for-next (9a0060af2a48 NFSD: Clean up after updating NFSv3 ACL =
encoders)
Merging orangefs/for-next (c1048828c3db orangefs: add splice file operation=
s)
Merging overlayfs/overlayfs-next (d46b7cd68336 ovl: plumb through flush met=
hod)
Merging ubifs/next (42119dbe571e ubifs: Fix error return code in alloc_wbuf=
s())
Merging v9fs/9p-next (324a158fe535 fs: 9p: add generic splice_write file op=
eration)
Merging xfs/for-next (756b1c343333 xfs: use current->journal_info for detec=
ting transaction recursion)
Merging zonefs/for-next (059c01039c01 zonefs: Fix file size of zones in ful=
l condition)
Merging iomap/iomap-for-next (ed1128c2d0c8 xfs: reduce exclusive locking on=
 unaligned dio)
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (cc4a3f885e8f fcntl: make F_GETOWN(EX) return=
 0 on dead owner task)
Merging vfs/for-next (086e94e6f4c3 Merge branches 'work.recursive_removal' =
and 'work.coredump' into for-next)
Merging printk/for-next (f78dd21aa363 Merge branch 'for-5.12-no_hash_pointe=
rs' into for-next)
Merging pci/next (e18fb64b7986 Merge branch 'remotes/lorenzo/pci/misc')
Merging pstore/for-next/pstore (9c7d83ae6ba6 pstore: Fix warning in pstore_=
kill_sb())
Merging hid/for-next (914fe0466c86 Merge branch 'for-5.12/playstation-v2' i=
nto for-next)
Merging i2c/i2c/for-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging i3c/i3c/next (5c34b8e7e8bb i3c: master: dw: Drop redundant disec ca=
ll)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (6ab3332cc692 MAINTAINERS: Add entry for T=
exas Instruments TPS23861 PoE PSE)
Merging jc_docs/docs-next (ba5cb300e0b5 docs: arm: /chosen node parameters)
Merging v4l-dvb/master (fe07bfda2fb9 Linux 5.12-rc1)
Merging v4l-dvb-next/master (d0a9fffedca1 docs: fs: api-summary.rst: get ri=
d of kernel-doc include)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_dp_helper.c
CONFLICT (content): Merge conflict in Documentation/dev-tools/kasan.rst
CONFLICT (content): Merge conflict in Documentation/conf.py
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging cpufreq-arm/cpufreq/arm/linux-next (8f9d3ee02bcc cpufreq: blacklist=
 Arm Vexpress platforms in cpufreq-dt-platdev)
Merging cpupower/cpupower (fe07bfda2fb9 Linux 5.12-rc1)
Merging devfreq/devfreq-next (0d844b9f3177 PM / devfreq: rk3399_dmc: Simpli=
fy with dev_err_probe())
Merging opp/opp/linux-next (de04241ab87a opp: Don't skip freq update for di=
fferent frequency)
Merging thermal/thermal/linux-next (a51afb13311c thermal: cpufreq_cooling: =
freq_qos_update_request() returns < 0 on error)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (c7a3549673d8 fs: dlm: add shutdown hook)
Merging swiotlb/linux-next (daf9514fd5eb swiotlb: Validate bounce size in t=
he sync/unmap path)
Merging rdma/for-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging net-next/master (d310ec03a34e Merge tag 'perf-core-2021-02-17' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging bpf-next/for-next (d310ec03a34e Merge tag 'perf-core-2021-02-17' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging ipsec-next/master (d310ec03a34e Merge tag 'perf-core-2021-02-17' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging mlx5-next/mlx5-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging netfilter-next/master (38b5133ad607 octeontx2-pf: Fix otx2_get_fecp=
aram())
Merging ipvs-next/master (a61e4b60761f Merge branch 'net-dsa-hellcreek-add-=
taprio-offloading')
Merging wireless-drivers-next/master (773dc50d7169 Merge branch 'Xilinx-axi=
enet-updates')
Merging bluetooth/master (5cb08553f7f2 Bluetooth: Notify suspend on le conn=
 failed)
Merging mac80211-next/master (38b5133ad607 octeontx2-pf: Fix otx2_get_fecpa=
ram())
Merging gfs2/for-next (f6e1e1d1e149 Merge tag 'gfs2-for-5.12' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2)
Merging mtd/mtd/next (457da931b608 mtd: parsers: ofpart: support BCM4908 fi=
xed partitions)
Merging nand/nand/next (095b4dabff2a mtd: rawnand: brcmnand: fix OOB R/W wi=
th Hamming ECC)
Merging spi-nor/spi-nor/next (fe07bfda2fb9 Linux 5.12-rc1)
Merging crypto/master (0de9dc80625b hwrng: timeriomem - Use device-managed =
registration API)
Merging drm/drm-next (d153e8c156da Merge tag 'drm-intel-next-fixes-2021-02-=
25' of git://anongit.freedesktop.org/drm/drm-intel into drm-next)
Merging drm-misc/for-linux-next (5fd3de7a5185 drm/compat: Clear bounce stru=
ctures)
Merging amdgpu/drm-next (7f0346042f19 drm/amdgpu: only check for _PR3 on dG=
PUs)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
Merging drm-intel/for-linux-next (cec3295b246b drm/i915/icp+: Use icp_hpd_i=
rq_setup() instead of spt_hpd_irq_setup())
Merging drm-tegra/drm/tegra/for-next (dcdfe2712b68 drm/tegra: Fix reference=
 leak when pm_runtime_get_sync() fails)
Merging drm-msm/msm-next (7bf168c8fe8c drm/msm: Fix speed-bin support not t=
o access outside valid memory)
Merging imx-drm/imx-drm/next (82581fcf070b drm/modes: add non-OF stub for o=
f_get_drm_display_mode)
Merging etnaviv/etnaviv/next (7d614ab2f205 drm/etnaviv: fix NULL check befo=
re some freeing functions is not needed)
Merging regmap/for-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging sound/for-next (d49c3e711c2b ALSA: ps3: fix spelling typo of values)
Merging sound-asoc/for-next (1bc068f39415 Merge remote-tracking branch 'aso=
c/for-5.13' into asoc-next)
Merging modules/modules-next (1e80d9cb579e module: potential uninitialized =
return in module_kallsyms_on_each_symbol())
Merging input/next (4c47097f8514 Input: aiptek - convert sysfs sprintf/snpr=
intf family to sysfs_emit)
Merging block/for-next (a5aedd7b65ba Merge branch 'io_uring-5.12' into for-=
next)
Merging device-mapper/for-next (a666e5c05e7c dm: fix deadlock when swapping=
 to encrypted device)
Merging pcmcia/pcmcia-next (4ce6b242b78d pcmcia: Switch to using the new AP=
I kobj_to_dev())
Merging mmc/next (4e596fc8a610 mmc: sdhci-pci-o2micro: Add missing checks i=
n sdhci_pci_o2_probe)
Merging mfd/for-mfd-next (14711e8f92cc dt-bindings: mfd: ricoh,rn5t618: Tri=
vial: Fix spelling mistake of 'additionally')
Merging backlight/for-backlight-next (0b5e0f45af40 backlight/video: Use Pla=
tform getter/setter functions)
Merging battery/for-next (ef11d03735ac power: supply: smb347-charger: Clean=
 up whitespaces in the code)
Merging regulator/for-next (c54607a8383c Merge remote-tracking branch 'regu=
lator/for-5.13' into regulator-next)
Merging security/next-testing (9dcd47fc1f7d Merge branch 'fixes-v5.10' into=
 next-testing)
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (f6692213b504 integrity: Make function int=
egrity_add_key() static)
Merging keys/keys-next (ea20ea8b8ba4 integrity: Load mokx variables into th=
e blacklist keyring)
Merging safesetid/safesetid-next (03ca0ec13892 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (365982aba1f2 fs: anon_inodes: rephrase to appropriate=
 kernel-doc)
Merging smack/next (7ef4c19d245f smackfs: restrict bytes count in smackfs w=
rite functions)
Merging tomoyo/master (fe07bfda2fb9 Linux 5.12-rc1)
Merging tpmdd/next (c03c21ba6f4e Merge tag 'keys-misc-20210126' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs)
Merging watchdog/master (a4f3407c4160 watchdog: qcom: Remove incorrect usag=
e of QCOM_WDT_ENABLE_IRQ)
Merging iommu/next (45e606f27269 Merge branches 'arm/renesas', 'arm/smmu', =
'x86/amd', 'x86/vt-d' and 'core' into next)
Merging audit/next (127c8c5f0589 audit: Make audit_filter_syscall() return =
void)
Merging devicetree/for-next (cb8be8b4b27f driver core: platform: Drop of_de=
vice_node_put() wrapper)
Merging mailbox/mailbox-for-next (6b50df2b8c20 mailbox: arm_mhuv2: Skip cal=
ling kfree() with invalid pointer)
Merging spi/for-next (86afa3913263 Merge remote-tracking branch 'spi/for-5.=
13' into spi-next)
Merging tip/auto-latest (0390bf9195b4 Merge branch 'locking/urgent')
$ git reset --hard HEAD^
Merging next-20210302 version of tip
Merging clockevents/timers/drivers/next (e85c1d21b16b clocksource/drivers/t=
imer-microchip-pit64b: Add clocksource suspend/resume)
Merging edac/edac-for-next (faf042d15093 Merge branch 'edac-amd64' into eda=
c-for-next)
Merging irqchip/irq/irqchip-next (c83fd57be3fe irqdomain: Remove debugfs_fi=
le from struct irq_domain)
Merging ftrace/for-next (e23db805da2d tracing/tools: Add the latency-collec=
tor to tools directory)
Merging rcu/rcu/next (c8c430f4a2fb Merge branch 'nolibc.2021.01.21a' into H=
EAD)
Merging kvm/next (2df8d3807ce7 KVM: SVM: Fix nested VM-Exit on #GP intercep=
tion handling)
Merging kvm-arm/next (255af9c2d1df Merge remote-tracking branch 'kvmarm/fix=
es' into kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (50a05be484cb KVM: s390: track synchronous pfault even=
ts in kvm_stat)
Merging xen-tip/linux-next (53f131c284e8 xen-front-pgdir-shbuf: don't recor=
d wrong grant handle upon error)
Merging percpu/for-next (df1c002198a8 Merge branch 'for-5.12' into for-next)
Merging workqueues/for-next (e9ad2eb3d9ae workqueue: Use %s instead of func=
tion name)
Merging drivers-x86/for-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging chrome-platform/for-next (b996c10e0f5b Merge tag 'tag-chrome-platfo=
rm-for-v5.12' of git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platf=
orm/linux)
Merging hsi/for-next (aa57e77b3d28 HSI: Fix PM usage counter unbalance in s=
si_hw_init)
Merging leds/for-next (b0a82efa51ad leds: lp50xx: Get rid of redundant expl=
icit casting)
Merging ipmi/for-next (fc26067c7417 ipmi: remove open coded version of SMBu=
s block write)
Merging driver-core/driver-core-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging usb/usb-next (5bb9cdb320a5 USB: remove usb_bus_type from usb.h)
Merging usb-gadget/next (b2c586eb07ef usb: dwc2: Fix INTR OUT transfers in =
DDMA mode.)
Merging usb-serial/usb-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging usb-chipidea-next/for-usb-next (1ee18ded86ec usb: cdnsp: Removes so=
me useless trace events)
Merging tty/tty-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging char-misc/char-misc-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging extcon/extcon-next (b906ab549836 extcon: qcom-spmi: Add support for=
 VBUS detection)
Merging phy-next/next (8e6b3a78eddd phy: tusb1210: use bitmasks to set VEND=
OR_SPECIFIC2)
Merging soundwire/next (fe07bfda2fb9 Linux 5.12-rc1)
Merging thunderbolt/next (a5b18338eb39 thunderbolt: Drop unused functions t=
b_switch_is_[ice|tiger]_lake())
Merging vfio/next (4d83de6da265 vfio/type1: Batch page pinning)
Merging staging/staging-next (b0ff7ee301a6 staging: clocking-wizard: Remove=
 the hardcoding of the clock outputs)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (3ffdec2843e1 Merge branch 'icc-fixes' into HEAD)
Merging dmaengine/next (fe07bfda2fb9 Linux 5.12-rc1)
Merging cgroup/for-next (00bfa16052cd Merge branch 'for-5.11-fixes' into fo=
r-next)
Merging scsi/for-next (586b0f072857 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (100d21c4ff29 scsi: target: core: Make completion=
 affinity configurable)
Merging vhost/linux-next (1f77f124f2f2 ALSA: virtio: introduce device suspe=
nd/resume support)
Merging rpmsg/for-next (fcb4c469244b Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging gpio-intel/for-next (a43e36928cf4 gpiolib: acpi: Add missing IRQF_O=
NESHOT)
Merging pinctrl/for-next (b40b760aa2a9 pinctrl: mediatek: Fix trigger type =
setting follow for unexpected interrupt)
Merging pinctrl-intel/for-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging pinctrl-renesas/renesas-pinctrl (a5cda861ed57 pinctrl: renesas: r8a=
779a0: Add TPU pins, groups and functions)
Merging pinctrl-samsung/for-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging pwm/for-next (9a9dd7e47351 pwm: lpc18xx-sct: remove unneeded semico=
lon)
Merging userns/for-next (95ebabde382c capabilities: Don't allow writing amb=
iguous v3 file capabilities)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (fe07bfda2fb9 Linux 5.12-rc1)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (81840f21d416 Merge branch 'for-5.12/doc' int=
o for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (49dfc1f16b03 rtc: abx80x: Add utility function for wr=
iting configuration key)
Merging nvdimm/libnvdimm-for-next (30c10d32152d Merge branch 'for-5.12/cxl'=
 into libnvdimm-for-next)
Merging at24/at24/for-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging ntb/ntb-next (5c8fe583cce5 Linux 5.11-rc1)
Merging seccomp/for-next/seccomp (a381b70a1cf8 seccomp: Improve performace =
by optimizing rmb())
Merging kspp/for-next/kspp (414eece95b98 Merge tag 'clang-lto-v5.12-rc1-par=
t2' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging gnss/gnss-next (eaa895a2f4df gnss: drop stray semicolons)
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
Merging hmm/hmm (fe07bfda2fb9 Linux 5.12-rc1)
Merging fpga/for-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging kunit/test (fe07bfda2fb9 Linux 5.12-rc1)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (5de15b610f78 mtd: hyperbus: add Renesas RPC-IF driver)
Merging kunit-next/kunit (fe07bfda2fb9 Linux 5.12-rc1)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (9e04adfcab78 mhi: Fix double dma free)
Merging memblock/for-next (097d43d85704 mm: memblock: remove return value o=
f memblock_free_all())
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging iomem-mmap-vs-gup/topic/iomem-mmap-vs-gup (fe07bfda2fb9 Linux 5.12-=
rc1)
Merging oprofile-removal/oprofile/removal (be65de6b03aa fs: Remove dcookies=
 support)
Merging akpm-current/current (a2c9f62c837e aio: simplify read_events())
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (217dcd883e5c Merge branch 'akpm-current/current')

--Sig_/4Wal50V9Z_Wvn=k6=YNYsr7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA+7rMACgkQAVBC80lX
0GzkfwgAgSoXTBXISb77JAPaWtBEzaUqzKFz5WgQe+0WTgEsojdQ+6f3vsUR2HKm
ySBC/kV0Q0sR1bXs22hY3cIWMe59Ajr0B87F7VgA0BndLePU2Jw3FEl0vPm411z/
QzHk/EgCxTQcuwFpnDstI3ROeP5iNOz1vaiOtARxnTk4igmJCIKhaZpv17tFaEMm
mGikWAvpMjnwGZfsfoCzenGBe89NDC0cGvkvCC6Kr6W10ZuS8fBJCMVXMOC09qy6
mbN/fGhf869sBh26dZHuZ13PkInL8yKpSG2FkVcRNU/ESjd1xrGFJmbvUJZV4XvH
eA07bgZ6mFkurm9qpxNd2PneUS05EQ==
=Bvmp
-----END PGP SIGNATURE-----

--Sig_/4Wal50V9Z_Wvn=k6=YNYsr7--
