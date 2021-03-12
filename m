Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80DDD3384F9
	for <lists+linux-next@lfdr.de>; Fri, 12 Mar 2021 06:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhCLFVU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Mar 2021 00:21:20 -0500
Received: from ozlabs.org ([203.11.71.1]:51047 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231276AbhCLFUx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 12 Mar 2021 00:20:53 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DxZ0M2bJwz9sPf;
        Fri, 12 Mar 2021 16:20:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615526451;
        bh=okvuwGQAJeRXqe9Fdxtfm4D5pGqkHUAxn/pP+2wbh50=;
        h=Date:From:To:Cc:Subject:From;
        b=tiYc96fyxK76LFdCrLqJ17MjXgVPJ8xtMmt+Qm2BLq591xdATvl8AE2Z9+E5TWM9o
         rxJD9RnjDqnXG5MySCJ9xmYAC2lijprV5o0TELe8lSfoJVAzgyQ1stoGFGQU4JM/eh
         Lsbb7oru/e7+G4hF7tvpEV6qYRwxhR2ofWPjDxrDn5Wq7Pjp+hSeT1pR8Ot7mcH5Lo
         eLVNlxWoTIDF3gW/Bs5uhEC68uRGsLCoVX2cipK0mQeCdu6ickCy0VgI/PX8622mfl
         Dg0tMavUp79/WfiCzVlJ2VQw2qrGjNGXo5YPwxxYgLZC5zE/AP1KNM8trzznEjYhd/
         Jt4El1ZdXvCYQ==
Date:   Fri, 12 Mar 2021 16:20:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 12
Message-ID: <20210312162050.1bcd3090@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wf1/38etofI5JVHQKiQ7sfY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wf1/38etofI5JVHQKiQ7sfY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Warning: Some of the branches in linux-next are still based on v5.12-rc1,
so please be careful if you are trying to bisect a bug.

News: if your -next included tree is based on Linus' tree tag
v5.12-rc1{,-dontuse} (or somewhere between v5.11 and that tag), please
consider rebasing it onto v5.12-rc2. Also, please check any branches
merged into your branch.

Changes since 20210311:

The bpf-next tree lost its build failure.

The scsi-mkp tree gained a semantic conflict against the block tree.

The akpm-current tree lost one build failure but still had the one for
which I reverted 5 commits.

Non-merge commits (relative to Linus' tree): 3277
 3010 files changed, 224522 insertions(+), 55917 deletions(-)

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

I am currently merging 332 trees (counting Linus' and 87 trees of bug
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
Merging origin/master (28806e4d9b97 Merge tag 'media/v5.12-2' of git://git.=
kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media)
Merging fixes/fixes (e71ba9452f0b Linux 5.11-rc2)
Merging kbuild-current/fixes (8c01072502c7 kbuild: collect minimum tool ver=
sions into scripts/min-tool-version.sh)
Merging arc-current/for-curr (7c53f6b671f4 Linux 5.11-rc3)
Merging arm-current/fixes (a38fd8748464 Linux 5.12-rc2)
Merging arm64-fixes/for-next/fixes (30b2675761b8 arm64: mm: remove unused _=
_cpu_uses_extended_idmap[_level()])
Merging arm-soc-fixes/arm/fixes (090e502e4e63 Merge tag 'socfpga_dts_fix_fo=
r_v5.12' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux in=
to arm/fixes)
Merging drivers-memory-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging m68k-current/for-linus (a65a802aadba m68k: Fix virt_addr_valid() W=
=3D1 compiler warnings)
Merging powerpc-fixes/fixes (bd73758803c2 powerpc: Fix missing declaration =
of [en/dis]able_kernel_vsx())
Merging s390-fixes/fixes (78c7cccaab9d s390: remove IBM_PARTITION and CONFI=
GFS_FS from zfcpdump defconfig)
Merging sparc/master (05a59d79793d Merge git://git.kernel.org:/pub/scm/linu=
x/kernel/git/netdev/net)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (47142ed6c34d net: dsa: bcm_sf2: Qualify phydev->dev_fla=
gs based on port)
Merging bpf/master (47142ed6c34d net: dsa: bcm_sf2: Qualify phydev->dev_fla=
gs based on port)
Merging ipsec/master (9ab1265d5231 xfrm: Use actual socket sk instead of sk=
b socket for xfrm_output_resume)
CONFLICT (content): Merge conflict in net/ipv6/ip6_vti.c
CONFLICT (content): Merge conflict in net/ipv4/ip_vti.c
Merging netfilter/master (9270bbe258c8 Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/pablo/nf)
Merging ipvs/master (44a674d6f798 Merge tag 'mlx5-fixes-2021-01-26' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/saeed/linux)
Merging wireless-drivers/master (05a59d79793d Merge git://git.kernel.org:/p=
ub/scm/linux/kernel/git/netdev/net)
Merging mac80211/master (8811f4a9836e tcp: add sanity tests to TCP_QUEUE_SE=
Q)
Merging rdma-fixes/for-rc (a38fd8748464 Linux 5.12-rc2)
Merging sound-current/for-linus (eea46a0879bc ALSA: hda/hdmi: Cancel pendin=
g works before suspend)
Merging sound-asoc-fixes/for-linus (9922f50f7178 ASoC: qcom: lpass-cpu: Fix=
 lpass dai ids parse)
Merging regmap-fixes/for-linus (e41a962f82e7 regmap: set debugfs_name to NU=
LL after it is freed)
Merging regulator-fixes/for-linus (d450293c5500 regulator: mt6315: Fix off-=
by-one for .n_voltages)
Merging spi-fixes/for-linus (ffb597b2bd3c spi: ath79: remove spi-master set=
up and cleanup assignment)
Merging pci-current/for-linus (12f6db15c40e PCI: Avoid building empty drive=
rs)
Merging driver-core.current/driver-core-linus (a38fd8748464 Linux 5.12-rc2)
Merging tty.current/tty-linus (c776b77a279c Revert "drivers:tty:pty: Fix a =
race causing data loss on close")
Merging usb.current/usb-linus (d26c00e7276f xhci: Fix repeated xhci wake af=
ter suspend due to uncleared internal wake state)
Merging usb-gadget-fixes/fixes (129aa9734559 usb: raw-gadget: fix memory le=
ak in gadget_setup)
Merging usb-serial-fixes/usb-linus (cfdc67acc785 USB: serial: io_edgeport: =
fix memory leak in edge_startup)
Merging usb-chipidea-fixes/for-usb-fixes (491b1bea0004 MAINTAINERS: update =
Peter Chen's email address)
Merging phy/fixes (c92e72ae9e0e phy: ti: j721e-wiz: add missing call to of_=
node_put())
Merging staging.current/staging-linus (16d7586dccf8 Revert "staging: wfx: r=
emove unused included header files")
Merging char-misc.current/char-misc-linus (65527a51c66f misc/pvpanic: Expor=
t module FDT device table)
Merging soundwire-fixes/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging thunderbolt-fixes/fixes (c94732bda079 thunderbolt: Increase runtime=
 PM reference count on DP tunnel discovery)
Merging input-current/for-linus (2d8aaa1720c6 Input: n64joy - fix return va=
lue check in n64joy_probe())
Merging crypto-current/master (0de9dc80625b hwrng: timeriomem - Use device-=
managed registration API)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (e4eccb853664 vfio/pci: Bypass IGD init in cas=
e of -ENODEV)
Merging kselftest-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging backlight-fixes/for-backlight-fixes (a38fd8748464 Linux 5.12-rc2)
Merging mtd-fixes/mtd/fixes (2fb164f0ce95 mtd: rawnand: mtk: Fix WAITRDY br=
eak condition and timeout)
Merging mfd-fixes/for-mfd-fixes (5c8fe583cce5 Linux 5.11-rc1)
Merging v4l-dvb-fixes/fixes (2025a48cfd92 media: rkisp1: params: fix wrong =
bits settings)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (bd67b711bfaa MIPS: kernel: Reserve exception=
 base early to prevent corruption)
Merging at91-fixes/at91-fixes (2c69c8a1736e ARM: dts: at91: sam9x60: fix mu=
x-mask to match product's datasheet)
Merging omap-fixes/fixes (4c9f4865f460 Merge branch 'fixes-rc2' into fixes)
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
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (56678a5f44ef platform/x86: intel-hid: Supp=
ort Lenovo ThinkPad X1 Tablet Gen 2)
Merging samsung-krzk-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging pinctrl-samsung-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging devicetree-fixes/dt/linus (8242ff9ea9f0 dt-bindings: display: media=
tek,dpi: Convert to use graph schema)
Merging scsi-fixes/fixes (1112963427d6 scsi: vmw_pvscsi: MAINTAINERS: Updat=
e maintainer)
Merging drm-fixes/drm-fixes (a38fd8748464 Linux 5.12-rc2)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (c3d2c6770b4b drm/i915: Wedge =
the GPU if command parser setup fails)
Merging mmc-fixes/fixes (f06391c45e83 mmc: cqhci: Fix random crash when rem=
ove mmc module/card)
Merging rtc-fixes/rtc-fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging gnss-fixes/gnss-linus (a38fd8748464 Linux 5.12-rc2)
Merging hyperv-fixes/hyperv-fixes (a22662138477 Drivers: hv: vmbus: Drop er=
ror message when 'No request id available')
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (0d7588ab9ef9 riscv: process: Fix no prototype f=
or arch_dup_task_struct)
Merging pidfd-fixes/fixes (ee2e3f50629f mount: fix mounting of detached mou=
nts onto targets that reside on shared mounts)
Merging fpga-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging spdx/spdx-linus (a38fd8748464 Linux 5.12-rc2)
Merging gpio-brgl-fixes/gpio/for-current (b41ba2ec54a7 gpiolib: Read "gpio-=
line-names" from a firmware node)
Merging gpio-intel-fixes/fixes (b41ba2ec54a7 gpiolib: Read "gpio-line-names=
" from a firmware node)
Merging pinctrl-intel-fixes/fixes (77e141266c8e pinctrl: intel: Show the GP=
IO base calculation explicitly)
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
Merging cel-fixes/for-rc (b4250dd868d1 NFSD: fix error handling in NFSv4.0 =
callbacks)
Merging drm-misc-fixes/for-linux-next-fixes (de066e116306 drm/compat: Clear=
 bounce structures)
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
Merging arm/for-next (08cbcb970256 ARM: 9060/1: kexec: Remove unused kexec_=
reinit callback)
Merging arm64/for-next/core (a38fd8748464 Linux 5.12-rc2)
Merging arm-perf/for-next/perf (f0c140481d1b perf: Constify static struct a=
ttribute_group)
Merging arm-soc/for-next (e6c44b8c57c9 soc: document merges)
Merging actions/for-next (006828d706fd Merge branch 'v5.12/defconfig' into =
for-next)
Merging amlogic/for-next (1c459c4d568d Merge branch 'v5.13/dt64' into tmp/a=
ml-rebuild)
Merging aspeed/for-next (697dabd5d370 Merge branches 'soc-for-v5.12' and 'd=
t-for-v5.12' into for-next)
Merging at91/at91-next (b95bbae19954 Merge branch 'at91-fixes' into at91-ne=
xt)
Merging drivers-memory/for-next (7db9ddae1371 memory: tegra: replace DEFINE=
_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE)
Merging imx-mxs/for-next (2ec23a93ffc7 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (9d2e21ed98a2 Merge branch 'for_5.12/drivers-soc' int=
o next)
Merging mediatek/for-next (e6468af3b590 Merge branch 'v5.11-next/soc' into =
for-next)
Merging mvebu/for-next (8e03d45cb7de Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (01e73147cbf8 Merge branch 'fixes' into for-next)
Merging qcom/for-next (5cefa932216f Merge branches 'arm64-defconfig-for-5.1=
3', 'arm64-for-5.13' and 'drivers-for-5.13' into for-next)
Merging raspberrypi/for-next (fbdcf1d20126 ARM: dts: bcm2711: Add the CEC i=
nterrupt controller)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (604bd2d4786e Merge branch 'renesas-arm-dt-for-v5.13' =
into renesas-next)
Merging reset/reset/next (d4e4dffec50b reset: oxnas: replace file name with=
 short description)
Merging rockchip/for-next (38051549ac38 Merge branch 'v5.12-clk/next' into =
for-next)
Merging samsung-krzk/for-next (e52a6d1c770f Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (1b07e14dc045 Merge branch 'for-next/juno' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging stm32/stm32-next (adc0496104b6 ARM: dts: stm32: Add Engicam i.Core =
STM32MP1 EDIMM2.2 Starter Kit)
Merging sunxi/sunxi/for-next (582cfdb9d206 Merge branch 'sunxi/clk-for-5.13=
' into sunxi/for-next)
Merging tegra/for-next (b62f4a3fbb22 Merge branch for-5.12/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (e180f76d0641 arm64: dts: ti: Add support for =
Siemens IOT2050 boards)
Merging clk/clk-next (a38fd8748464 Linux 5.12-rc2)
Merging clk-renesas/renesas-clk (c66424ea7564 clk: renesas: r8a779a0: Add T=
SC clock)
Merging clk-samsung/for-next (44a9e78f9242 clk: samsung: Prevent potential =
endless loop in the PLL ops)
Merging csky/linux-next (74cdb2664477 csky: Fixup typos)
Merging h8300/h8300-next (6e5e55227c95 Merge tag 'v5.11' into h8300-next)
Merging m68k/for-next (f2e7e4bf38fd m68k: syscalls: switch to generic sysca=
llhdr.sh)
Merging m68knommu/for-next (f81e12646946 m68k: fix flatmem memory model set=
up)
Merging microblaze/next (9dc12e4ccd97 microblaze: tag highmem_setup() with =
__meminit)
Merging mips/mips-next (043d7f9713b7 MIPS: Enable some missed configs in lo=
ongson3_defconfig to support bpftrace)
Merging nds32/next (40e0dd851e7b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (8f722f67452f openrisc: Use devicetree to determi=
ne present cpus)
Merging parisc-hd/for-next (711d090f0e02 parisc: syscalls: switch to generi=
c syscallhdr.sh)
Merging powerpc/next (fbda79043024 Merge tag 'powerpc-5.12-2' of git://git.=
kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e95f287deed2 soc: fsl: handle RCPM errata A-008646 on=
 SoC LS1021A)
Merging risc-v/for-next (9530141455c9 riscv: Add ARCH_HAS_FORTIFY_SOURCE)
Merging s390/for-next (755d91f36dab Merge branch 'fixes' into for-next)
Merging sh/for-next (2882b7626f49 sh: kernel: traps: remove unused variable)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (ddad5187fc2a um: irq.h: include <asm-generic/irq.h>)
Merging xtensa/xtensa-for-next (ab5eb336411f xtensa: move coprocessor_flush=
 to the .text section)
Merging pidfd/for-next (f69e8091c4a2 xfs: remove the possibly unused mp var=
iable in xfs_file_compat_ioctl)
Merging fscrypt/master (a14d0b676491 fscrypt: allow deleting files with uns=
upported encryption policy)
Merging fscache/fscache-next (42587ccf2ed5 afs: Use the fscache_write_begin=
() helper)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (c4e9b6a42a43 Merge branch 'for-next-next-v5.12-2021=
0308' into for-next-20210308)
Merging ceph/master (558b4510f622 ceph: defer flushing the capsnap if the F=
b is used)
Merging cifs/for-next (a3ef62ddbeab cifs: Fix preauth hash corruption)
Merging configfs/for-next (14fbbc829772 configfs: fix a use-after-free in _=
_configfs_open_file)
Merging ecryptfs/next (902af369942f ecryptfs: use DEFINE_MUTEX() for mutex =
lock)
Merging erofs/dev (ce0631291813 erofs: initialized fields can only be obser=
ved after bit is set)
Merging exfat/dev (a403e793cb41 exfat: add support ioctl and FITRIM functio=
n)
Merging ext3/for_next (c5b8ccc3da76 Pull udf & isofs UID/GID parsing fixes.)
Merging ext4/dev (73648622c60a ext4: fix bh ref count on error paths)
Merging f2fs/dev (e489f1ca49b3 f2fs: fix to align to section for fallocate(=
) on pinned file)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (166ddcdeea0b fuse: 32-bit user space ioctl compat fo=
r fuse device)
Merging jfs/jfs-next (c03c21ba6f4e Merge tag 'keys-misc-20210126' of git://=
git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs)
Merging nfs/linux-next (144c79ef3353 Merge tag 'perf-tools-fixes-for-v5.12-=
2020-03-07' of git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux)
Merging nfs-anna/linux-next (4f8be1f53bf6 nfs: we don't support removing sy=
stem.nfs4_acl)
Merging nfsd/nfsd-next (c3213d260a23 SUNRPC: Fix oops in the rpc_xdr_buf ev=
ent class)
Merging cel/for-next (e0924d9bf484 svcrdma: Retain the page backing rq_res.=
head[0].iov_base)
Merging orangefs/for-next (c1048828c3db orangefs: add splice file operation=
s)
Merging overlayfs/overlayfs-next (d46b7cd68336 ovl: plumb through flush met=
hod)
Merging ubifs/next (42119dbe571e ubifs: Fix error return code in alloc_wbuf=
s())
Merging v9fs/9p-next (324a158fe535 fs: 9p: add generic splice_write file op=
eration)
Merging xfs/for-next (96fd0303027c docs: ABI: Fix the spelling oustanding t=
o outstanding in the file sysfs-fs-xfs)
Merging zonefs/for-next (059c01039c01 zonefs: Fix file size of zones in ful=
l condition)
Merging iomap/iomap-for-next (5808fecc5723 iomap: Fix negative assignment t=
o unsigned sis->pages in iomap_swapfile_activate)
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (b8da9b10e26c fs/locks: print full locks info=
rmation)
Merging vfs/for-next (1f081146def4 Merge branches 'work.recursive_removal' =
and 'work.coredump' into for-next)
Merging printk/for-next (4e16cd8fae2f Merge branch 'printk-rework' into for=
-next)
Merging pci/next (9c70dfb47633 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (7db688e99c0f pstore/ram: Rate-limit "uncorr=
ectable error in header" message)
Merging hid/for-next (e453304975b0 Merge branch 'for-5.13/intel-ish' into f=
or-next)
Merging i2c/i2c/for-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging i3c/i3c/next (436cb709f8a9 i3c: master: svc: remove redundant assig=
nment to cmd->read_len)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (f61b7c730d9a hwmon: (pmbus/stpddc60) Add =
ST STPDDC60 pmbus driver)
Merging jc_docs/docs-next (a5907065ac1a docs: livepatch: Fix a typo and rem=
ove the unnecessary gaps in a sentence)
Merging v4l-dvb/master (1cb3ff130f4d media: imx: imx7_mipi_csis: Print shad=
ow registers in mipi_csis_dump_regs())
Merging v4l-dvb-next/master (d0a9fffedca1 docs: fs: api-summary.rst: get ri=
d of kernel-doc include)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_dp_helper.c
CONFLICT (content): Merge conflict in MAINTAINERS
CONFLICT (content): Merge conflict in Documentation/dev-tools/kasan.rst
CONFLICT (content): Merge conflict in Documentation/conf.py
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (8608bdeb4cdb Merge branch 'devprop' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (ce4e7ba54891 cpufreq: CPPC: Add=
 support for frequency invariance)
Merging cpupower/cpupower (a38fd8748464 Linux 5.12-rc2)
Merging devfreq/devfreq-next (5983f89cfcc3 PM / devfreq: Check get_dev_stat=
us in devfreq_update_stats)
Merging opp/opp/linux-next (6e1cb1b154bd opp: Don't drop extra references t=
o OPPs accidentally)
Merging thermal/thermal/linux-next (a51afb13311c thermal: cpufreq_cooling: =
freq_qos_update_request() returns < 0 on error)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (9d232469bcd7 fs: dlm: add shutdown hook)
Merging swiotlb/linux-next (a38fd8748464 Linux 5.12-rc2)
Merging rdma/for-next (e35ecb466eb6 RDMA/iwcm: Allow AFONLY binding for IPv=
6 addresses)
Merging net-next/master (6c6095214a6c Merge branch 'hns3-next')
Merging bpf-next/for-next (1211f4e9ae13 Merge branch 'libbpf/xsk cleanups')
Merging ipsec-next/master (d310ec03a34e Merge tag 'perf-core-2021-02-17' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging mlx5-next/mlx5-next (a38fd8748464 Linux 5.12-rc2)
Merging netfilter-next/master (05a59d79793d Merge git://git.kernel.org:/pub=
/scm/linux/kernel/git/netdev/net)
Merging ipvs-next/master (a61e4b60761f Merge branch 'net-dsa-hellcreek-add-=
taprio-offloading')
Merging wireless-drivers-next/master (05a59d79793d Merge git://git.kernel.o=
rg:/pub/scm/linux/kernel/git/netdev/net)
Merging bluetooth/master (c1a74160eaf1 Bluetooth: hci_qca: Add device_may_w=
akeup support)
Merging mac80211-next/master (38b5133ad607 octeontx2-pf: Fix otx2_get_fecpa=
ram())
Merging gfs2/for-next (1a5a2cfd34c1 gfs2: fix use-after-free in trans_drain)
Merging mtd/mtd/next (3ba6d1ff041f mtd: rawnand: stm32_fmc2: Fix fall-throu=
gh warnings for Clang)
Merging nand/nand/next (55fbb9ba4f06 mtd: rawnand: qcom: Return actual erro=
r code instead of -ENODEV)
Merging spi-nor/spi-nor/next (47f25032c0e3 MAINTAINERS: Add Michael and Pra=
tyush as designated reviewers for SPI NOR)
Merging crypto/master (1406f0f34402 crypto: nx - add missing call to of_nod=
e_put())
Merging drm/drm-next (a38fd8748464 Linux 5.12-rc2)
Merging drm-misc/for-linux-next (5fd3de7a5185 drm/compat: Clear bounce stru=
ctures)
Merging amdgpu/drm-next (cc8fb250e070 drm/amdgpu: disable gfxoff for ROCm w=
orkloads on Raven1)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu11/va=
ngogh_ppt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu11/sm=
u_v11_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_dev=
ice.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_acp=
i.c
Merging drm-intel/for-linux-next (086877a12f36 drm/i915: Tolerate bogus DPL=
L selection)
Merging drm-tegra/drm/tegra/for-next (dcdfe2712b68 drm/tegra: Fix reference=
 leak when pm_runtime_get_sync() fails)
Merging drm-msm/msm-next (7bf168c8fe8c drm/msm: Fix speed-bin support not t=
o access outside valid memory)
Merging imx-drm/imx-drm/next (82581fcf070b drm/modes: add non-OF stub for o=
f_get_drm_display_mode)
Merging etnaviv/etnaviv/next (7d614ab2f205 drm/etnaviv: fix NULL check befo=
re some freeing functions is not needed)
Merging regmap/for-next (e41a962f82e7 regmap: set debugfs_name to NULL afte=
r it is freed)
Merging sound/for-next (9c896eeca457 ALSA: ppc: keywest: remove outdated co=
mment)
Merging sound-asoc/for-next (4d32774ee1d6 Merge remote-tracking branch 'aso=
c/for-5.13' into asoc-next)
Merging modules/modules-next (1e80d9cb579e module: potential uninitialized =
return in module_kallsyms_on_each_symbol())
Merging input/next (ea16ef967ec8 Input: elan_i2c - reduce the resume time f=
or new devices)
Merging block/for-next (d3c4fd293a3f Merge branch 'block-5.12' into for-nex=
t)
Merging device-mapper/for-next (88cc16b9b3ac dm: remove useless loop in __s=
plit_and_process_bio)
Merging pcmcia/pcmcia-next (4ce6b242b78d pcmcia: Switch to using the new AP=
I kobj_to_dev())
Merging mmc/next (4cb034984f81 mmc: sdio: fix a typo in the comment of SDIO=
_SD_REV_3_00)
Merging mfd/for-mfd-next (fea19b6e80a1 mfd: lm3533: Switch to using the new=
 API kobj_to_dev())
Merging backlight/for-backlight-next (225be60f3853 dt-bindings: backlight: =
qcom-wled: Add PMI8994 compatible)
Merging battery/for-next (f38a16448327 power: supply: core: provide functio=
n stubs if CONFIG_POWER_SUPPLY=3Dn)
Merging regulator/for-next (1850ce9767a8 Merge remote-tracking branch 'regu=
lator/for-5.13' into regulator-next)
Merging security/next-testing (9dcd47fc1f7d Merge branch 'fixes-v5.10' into=
 next-testing)
Merging apparmor/apparmor-next (d108370c644b apparmor: fix error check)
Merging integrity/next-integrity (f6692213b504 integrity: Make function int=
egrity_add_key() static)
Merging keys/keys-next (e377c31f788f integrity: Load mokx variables into th=
e blacklist keyring)
Merging safesetid/safesetid-next (03ca0ec13892 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (431c3be16bd0 selinux: fix misspellings using codespel=
l tool)
Merging smack/next (7ef4c19d245f smackfs: restrict bytes count in smackfs w=
rite functions)
Merging tomoyo/master (fe07bfda2fb9 Linux 5.12-rc1)
Merging tpmdd/next (a8bba9247eb3 tpm: vtpm_proxy: Avoid reading host log wh=
en using a virtual device)
Merging watchdog/master (a4f3407c4160 watchdog: qcom: Remove incorrect usag=
e of QCOM_WDT_ENABLE_IRQ)
Merging iommu/next (be575abcf799 Merge branch 'iommu/fixes' into next)
Merging audit/next (a38fd8748464 Linux 5.12-rc2)
Merging devicetree/for-next (065cac6c686d of: property: Remove unneeded ret=
urn variable)
Merging mailbox/mailbox-for-next (6b50df2b8c20 mailbox: arm_mhuv2: Skip cal=
ling kfree() with invalid pointer)
Merging spi/for-next (31890269c0a0 spi: cadence-quadspi: Silence shiftTooMa=
nyBitsSigned warning)
Merging tip/auto-latest (10d40fa966ac Merge branch 'tip-x86-cleanups' into =
auto-latest)
Merging clockevents/timers/drivers/next (e85c1d21b16b clocksource/drivers/t=
imer-microchip-pit64b: Add clocksource suspend/resume)
Merging edac/edac-for-next (faf042d15093 Merge branch 'edac-amd64' into eda=
c-for-next)
Merging irqchip/irq/irqchip-next (5fbecd2389f4 irqchip/ingenic: Add support=
 for the JZ4760)
Merging ftrace/for-next (f9f344479d8b tracing: Fix comment about the trace_=
event_call flags)
Merging rcu/rcu/next (7836d7be2d23 EXP net: phy: make mdio_bus_phy_suspend/=
resume as __maybe_unused)
Merging kvm/next (357ad203d45c KVM: arm64: Fix range alignment when walking=
 page tables)
Merging kvm-arm/next (58c71cd7cac6 Merge branch 'kvmarm-master/fixes' into =
kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (20eff2c93a2d KVM: s390: VSIE: correctly handle MVPG w=
hen in VSIE)
Merging xen-tip/linux-next (f1d20d8643e5 Xen/gntdev: don't needlessly use k=
vcalloc())
Merging percpu/for-next (df1c002198a8 Merge branch 'for-5.12' into for-next)
Merging workqueues/for-next (a7347aa8e061 workqueue: Move the position of d=
ebug_work_activate() in __queue_work())
Merging drivers-x86/for-next (87eaede45385 platform/x86: touchscreen_dmi: H=
andle device properties with software node API)
Merging chrome-platform/for-next (a38fd8748464 Linux 5.12-rc2)
Merging hsi/for-next (aa57e77b3d28 HSI: Fix PM usage counter unbalance in s=
si_hw_init)
Merging leds/for-next (34731ed13e8a leds: lgm: fix gpiolib dependency)
Merging ipmi/for-next (c053c4eb5a0f ipmi: Handle device properties with sof=
tware node API)
Merging driver-core/driver-core-next (a38fd8748464 Linux 5.12-rc2)
Merging usb/usb-next (60a35ba9141f usb: usb-mx2: Remove unused file)
Merging usb-gadget/next (b2c586eb07ef usb: dwc2: Fix INTR OUT transfers in =
DDMA mode.)
Merging usb-serial/usb-next (a38fd8748464 Linux 5.12-rc2)
Merging usb-chipidea-next/for-usb-next (67982dfa59de usb: cdns3: imx: add p=
ower lost support for system resume)
Merging tty/tty-next (3d82be8be6fd serial: stm32: add support for "flush_bu=
ffer" ops)
CONFLICT (content): Merge conflict in drivers/tty/hvc/hvcs.c
Merging char-misc/char-misc-next (f8096ff38d5f drivers: misc: ad525x_dpot: =
Add missing check in dpot_read_spi)
Merging extcon/extcon-next (6993ac9bc2ad extcon: qcom-spmi: Add support for=
 VBUS detection)
Merging phy-next/next (8e6b3a78eddd phy: tusb1210: use bitmasks to set VEND=
OR_SPECIFIC2)
Merging soundwire/next (fe07bfda2fb9 Linux 5.12-rc1)
Merging thunderbolt/next (d59b8faa047e thunderbolt: Drop unused functions t=
b_switch_is_[ice|tiger]_lake())
Merging vfio/next (4d83de6da265 vfio/type1: Batch page pinning)
Merging staging/staging-next (c972c2d821ca staging: unisys: visornic: Fix r=
epeated words in comments)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (3ffdec2843e1 Merge branch 'icc-fixes' into HEAD)
Merging dmaengine/next (fe07bfda2fb9 Linux 5.12-rc1)
Merging cgroup/for-next (00bfa16052cd Merge branch 'for-5.11-fixes' into fo=
r-next)
Merging scsi/for-next (f88dfeea18aa Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (18956295fea6 Merge branch '5.13/sg' into 5.13/sc=
si-staging)
Applying: scsi: sg: fix up for BIO_MAX_PAGES rename
Merging vhost/linux-next (59a47ca88484 vhost_vdpa: fix the missing irq_bypa=
ss_unregister_producer() invocation)
Merging rpmsg/for-next (b07cb939c7e2 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (79bdf5472bab docs: driver-api: gpio: consu=
mer: Mark another line of code as such)
Merging gpio-intel/for-next (488d05fe25a6 gpiolib: Fold conditionals into a=
 simple ternary operator)
Merging pinctrl/for-next (a0686a4cdfad Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (9d8c5b0d2e09 pinctrl: intel: Show the GPIO =
base calculation explicitly)
Merging pinctrl-renesas/renesas-pinctrl (f7adcca27edf pinctrl: renesas: r8a=
77965: Add vin4_g8 and vin5_high8 pins)
Merging pinctrl-samsung/for-next (a38fd8748464 Linux 5.12-rc2)
Merging pwm/for-next (9a9dd7e47351 pwm: lpc18xx-sct: remove unneeded semico=
lon)
Merging userns/for-next (95ebabde382c capabilities: Don't allow writing amb=
iguous v3 file capabilities)
Merging ktest/for-next (170f4869e662 ktest.pl: Fix the logic for truncating=
 the size of the log file for email)
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (a38fd8748464 Linux 5.12-rc2)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (81840f21d416 Merge branch 'for-5.12/doc' int=
o for-next)
Merging coresight/next (1efbcec2ef8c coresight: cti: Reduce scope for the v=
ariable =E2=80=9Ccs_fwnode=E2=80=9D in cti_plat_create_connection())
Merging rtc/rtc-next (a38fd8748464 Linux 5.12-rc2)
Merging nvdimm/libnvdimm-for-next (30c10d32152d Merge branch 'for-5.12/cxl'=
 into libnvdimm-for-next)
Merging at24/at24/for-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging ntb/ntb-next (5c8fe583cce5 Linux 5.11-rc1)
Merging seccomp/for-next/seccomp (a381b70a1cf8 seccomp: Improve performace =
by optimizing rmb())
Merging kspp/for-next/kspp (414eece95b98 Merge tag 'clang-lto-v5.12-rc1-par=
t2' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux)
Merging gnss/gnss-next (994adcbd3714 gnss: drop stray semicolons)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (0320ed0a8236 drivers: slimbus: Fix word resposibl=
e -> responsible in slimbus.h)
CONFLICT (content): Merge conflict in drivers/nvmem/Kconfig
Merging nvmem/for-next (c079b5cd9472 nvmem: core: Fix unintentional sign ex=
tension issue)
Merging xarray/main (80c1dbebf308 XArray: Fix splitting to non-zero orders)
Merging hyperv/hyperv-next (a620bbaa3510 asm-generic/hyperv: Add missing fu=
nction prototypes per -W1 warnings)
Merging auxdisplay/auxdisplay (b45616445a6e auxdisplay: Fix duplicate CHARL=
CD config symbol)
Merging kgdb/kgdb/for-next (f11e2bc682cc kgdb: Remove kgdb_schedule_breakpo=
int())
Merging hmm/hmm (fe07bfda2fb9 Linux 5.12-rc1)
Merging fpga/for-next (6f1e376cfc68 fpga: Add support for Xilinx DFX AXI Sh=
utdown manager)
Merging kunit/test (a38fd8748464 Linux 5.12-rc2)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (a38fd8748464 Linux 5.12-rc2)
Merging kunit-next/kunit (a38fd8748464 Linux 5.12-rc2)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (4d5f52838d11 bus: mhi: Make firmware image optional f=
or controller)
Merging memblock/for-next (097d43d85704 mm: memblock: remove return value o=
f memblock_free_all())
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (e71ba9452f0b Linux 5.11-rc2)
Merging iomem-mmap-vs-gup/topic/iomem-mmap-vs-gup (fe07bfda2fb9 Linux 5.12-=
rc1)
Merging akpm-current/current (c661e4987275 gdb: lx-symbols: store the abspa=
th())
Applying: Revert "userfaultfd/selftests: exercise minor fault handling shme=
m support"
Applying: Revert "userfaultfd/selftests: reinitialize test context in each =
test"
Applying: Revert "userfaultfd/selftests: create alias mappings in the shmem=
 test"
Applying: Revert "userfaultfd/selftests: use memfd_create for shmem test ty=
pe"
Applying: Revert "userfaultfd: support minor fault handling for shmem"
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (b7f3cac0518a Merge branch 'akpm-current/current')

--Sig_/wf1/38etofI5JVHQKiQ7sfY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBK+jIACgkQAVBC80lX
0GyJYwf/QEt+6wbceSR3PopkcrgFSzboJpu3Par9p3wf8DHFwnQekdaSmk2evVHQ
q5YjdFUEAQ0WlkbR/0wMJgxCJVfD4K0awRxrVCjaU8EuuBsnlKkY2hg4QtoGQz9I
O1/Q4hQV98ln1C53X8tAw6UFwDMM39ApEMqX00/EZRJA0hJXtB2CPgETuS3hISXV
rJlk0H0iD7ilNP85Gtzk0p/1esXxqZLBiVE2tBVkyge2NyJ3J6eyuvfuYWwSfI2V
9c8dMKTWvaxSW42saBk8YT/arxRkI4pJIo1I0vLepGs2d1umACXvldyVPPSmORq8
bl+RGgI/Tc4x0+NCNMXen683Q6cCgw==
=mEcG
-----END PGP SIGNATURE-----

--Sig_/wf1/38etofI5JVHQKiQ7sfY--
