Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAAF3331DBE
	for <lists+linux-next@lfdr.de>; Tue,  9 Mar 2021 04:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhCID47 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Mar 2021 22:56:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbhCID4i (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Mar 2021 22:56:38 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68205C06174A;
        Mon,  8 Mar 2021 19:56:38 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DvhGV516Pz9sVv;
        Tue,  9 Mar 2021 14:56:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615262194;
        bh=LlrNh14NOiCERYYZg86rySXRPnIR4n94vgV5g1ZJlN0=;
        h=Date:From:To:Cc:Subject:From;
        b=jMpUu/ruMEgPgNxZqEMV+TZxqR/QhRFXCWdGh5XEKIfA0SApWFZcD9b6tKJHsfyPF
         PxizEFblwtcGSDKX/Q7Uxb9colfryaykFCtQGW4SfPZiZFBFztTmzDkU1jl3vNA0Ad
         UfO+obz3Ekx/fuvUXRSLNZ5hOJZFN+dwiHy4GLs0jhMPHdOLuUqnCjEo9k2CM0bHxm
         X3GvuvBZcqg1k/iPUyCVE463JF8IQCTXb2iuzC2V9mbvfpLTk6jDjW9PXvbXyZYOLB
         bSYw7J3eCaxyTgBDpeSByE9s1j1fpN1MLyJ241vLeJehmvyqLjJujplzDVCNuW7WCa
         +0N64/0OIjTqA==
Date:   Tue, 9 Mar 2021 14:56:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 9
Message-ID: <20210309145633.7727d70f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=X_A6SiEkTk9=qGJcP.jJFt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=X_A6SiEkTk9=qGJcP.jJFt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

News: if your -next included branch is based on Linus' tree tag
v5.12-rc1{,-dontuse} (or somewhere between v5.11 and that tag), please
consider rebasing it onto v5.12-rc2. Also, please check any branches
merged into you branch.

Changes since 20210305:

The vhost tree gained conflicts against the sound tree.

Non-merge commits (relative to Linus' tree): 2307
 2233 files changed, 64713 insertions(+), 40384 deletions(-)

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
Merging origin/master (144c79ef3353 Merge tag 'perf-tools-fixes-for-v5.12-2=
020-03-07' of git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux)
Merging fixes/fixes (e71ba9452f0b Linux 5.11-rc2)
Merging kbuild-current/fixes (486923cb192e kbuild: dummy-tools: fix inverte=
d tests for gcc)
Merging arc-current/for-curr (7c53f6b671f4 Linux 5.11-rc3)
Merging arm-current/fixes (4d62e81b60d4 ARM: kexec: fix oops after TLB are =
invalidated)
Merging arm64-fixes/for-next/fixes (093bbe211ea5 arm64/mm: Reorganize pfn_v=
alid())
Merging arm-soc-fixes/arm/fixes (090e502e4e63 Merge tag 'socfpga_dts_fix_fo=
r_v5.12' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux in=
to arm/fixes)
Merging drivers-memory-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging m68k-current/for-linus (a65a802aadba m68k: Fix virt_addr_valid() W=
=3D1 compiler warnings)
Merging powerpc-fixes/fixes (fbda79043024 Merge tag 'powerpc-5.12-2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging s390-fixes/fixes (78c7cccaab9d s390: remove IBM_PARTITION and CONFI=
GFS_FS from zfcpdump defconfig)
Merging sparc/master (cf64c2a905e0 Merge branch 'work.sparc32' of git://git=
.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (29d98f54a4fe net: enetc: allow hardware timestamping on=
 TX queues with tc-etf enabled)
Merging bpf/master (e7fb6465d4c8 libbpf: Fix INSTALL flag order)
Merging ipsec/master (9ab1265d5231 xfrm: Use actual socket sk instead of sk=
b socket for xfrm_output_resume)
CONFLICT (content): Merge conflict in net/ipv6/ip6_vti.c
CONFLICT (content): Merge conflict in net/ipv4/ip_vti.c
Merging netfilter/master (9270bbe258c8 Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/pablo/nf)
Merging ipvs/master (44a674d6f798 Merge tag 'mlx5-fixes-2021-01-26' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/saeed/linux)
Merging wireless-drivers/master (295d4cd82b01 iwlwifi: don't call netif_nap=
i_add() with rxq->lock held (was Re: Lockdep warning in iwl_pcie_rx_handle(=
)))
Merging mac80211/master (8811f4a9836e tcp: add sanity tests to TCP_QUEUE_SE=
Q)
Merging rdma-fixes/for-rc (a38fd8748464 Linux 5.12-rc2)
Merging sound-current/for-linus (0a0be72f9357 Merge branch 'for-linus-5.12-=
rc1' into for-linus)
Merging sound-asoc-fixes/for-linus (96a00096e50f Merge remote-tracking bran=
ch 'asoc/for-5.12' into asoc-linus)
Merging regmap-fixes/for-linus (fe07bfda2fb9 Linux 5.12-rc1)
Merging regulator-fixes/for-linus (406951a914e4 Merge remote-tracking branc=
h 'regulator/for-5.12' into regulator-linus)
Merging spi-fixes/for-linus (2a84b6123c49 Merge remote-tracking branch 'spi=
/for-5.12' into spi-linus)
Merging pci-current/for-linus (7e69d07d7c3c Revert "PCI/ASPM: Save/restore =
L1SS Capability for suspend/resume")
Merging driver-core.current/driver-core-linus (a38fd8748464 Linux 5.12-rc2)
Merging tty.current/tty-linus (4bed5190a833 Revert "drivers:tty:pty: Fix a =
race causing data loss on close")
Merging usb.current/usb-linus (7f6f181b3e2c USB: usblp: fix a hang in poll(=
) if disconnected)
Merging usb-gadget-fixes/fixes (129aa9734559 usb: raw-gadget: fix memory le=
ak in gadget_setup)
Merging usb-serial-fixes/usb-linus (aefe09d59fae USB: serial: io_edgeport: =
fix memory leak in edge_startup)
Merging usb-chipidea-fixes/for-usb-fixes (491b1bea0004 MAINTAINERS: update =
Peter Chen's email address)
Merging phy/fixes (c92e72ae9e0e phy: ti: j721e-wiz: add missing call to of_=
node_put())
Merging staging.current/staging-linus (d1a5bd3f875c staging: comedi: pcl726=
: Use 16-bit 0 for interrupt data)
Merging char-misc.current/char-misc-linus (803c1aadecdb virt: acrn: Use vfs=
_poll() instead of f_op->poll())
Merging soundwire-fixes/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging thunderbolt-fixes/fixes (c94732bda079 thunderbolt: Increase runtime=
 PM reference count on DP tunnel discovery)
Merging input-current/for-linus (30b3f6871559 Input: s6sy761 - fix coordina=
te read bit shift)
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
Merging v4l-dvb-fixes/fixes (dd2ce6ea601b media: rkisp1: params: fix wrong =
bits settings)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (6654111c893f MIPS: vmlinux.lds.S: align raw =
appended dtb to 8 bytes)
Merging at91-fixes/at91-fixes (e2b1d7027713 ARM: dts: at91: sam9x60: fix mu=
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
Merging i3c-fixes/i3c/fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging drivers-x86-fixes/fixes (56678a5f44ef platform/x86: intel-hid: Supp=
ort Lenovo ThinkPad X1 Tablet Gen 2)
Merging samsung-krzk-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging pinctrl-samsung-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging devicetree-fixes/dt/linus (8242ff9ea9f0 dt-bindings: display: media=
tek,dpi: Convert to use graph schema)
Merging scsi-fixes/fixes (1112963427d6 scsi: vmw_pvscsi: MAINTAINERS: Updat=
e maintainer)
Merging drm-fixes/drm-fixes (a1f105412493 Merge tag 'amd-drm-fixes-5.12-202=
1-03-03' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (c3d2c6770b4b drm/i915: Wedge =
the GPU if command parser setup fails)
Merging mmc-fixes/fixes (1c7ee2902a66 mmc: cqhci: Fix random crash when rem=
ove mmc module/card)
Merging rtc-fixes/rtc-fixes (fe07bfda2fb9 Linux 5.12-rc1)
Merging gnss-fixes/gnss-linus (fe07bfda2fb9 Linux 5.12-rc1)
Merging hyperv-fixes/hyperv-fixes (a22662138477 Drivers: hv: vmbus: Drop er=
ror message when 'No request id available')
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (f01e631cccab RISC-V: Make NUMA depend on SMP)
Merging pidfd-fixes/fixes (ee2e3f50629f mount: fix mounting of detached mou=
nts onto targets that reside on shared mounts)
Merging fpga-fixes/fixes (a38fd8748464 Linux 5.12-rc2)
Merging spdx/spdx-linus (c03c21ba6f4e Merge tag 'keys-misc-20210126' of git=
://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs)
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
Merging kunit-fixes/kunit-fixes (d50ffcd2c371 kunit: tool: Disable PAGE_POI=
SONING under --alltests)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (17cbe03872be mm/memblock: Fix typo in comment=
 of memblock_phys_alloc_try_nid())
Merging cel-fixes/for-rc (57427a37a7ac Revert "nfsd4: a client's own opens =
needn't prevent delegations")
Merging drm-misc-fixes/for-linux-next-fixes (5ef7daaa47c2 drm/shmem-helper:=
 Don't remove the offset in vm_area_struct pgoff)
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
Merging at91/at91-next (63ec390152e4 Merge branch 'at91-fixes' into at91-ne=
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
Merging qcom/for-next (de037fdb19b5 Merge branches 'arm64-defconfig-for-5.1=
3', 'arm64-for-5.13' and 'drivers-for-5.13' into for-next)
Merging raspberrypi/for-next (fbdcf1d20126 ARM: dts: bcm2711: Add the CEC i=
nterrupt controller)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (6f56f6c26099 Merge branches 'renesas-arm-dt-for-v5.13=
' and 'renesas-drivers-for-v5.13' into renesas-next)
Merging reset/reset/next (d4e4dffec50b reset: oxnas: replace file name with=
 short description)
Merging rockchip/for-next (38051549ac38 Merge branch 'v5.12-clk/next' into =
for-next)
Merging samsung-krzk/for-next (e52a6d1c770f Merge branch 'next/soc' into fo=
r-next)
Merging scmi/for-linux-next (1b07e14dc045 Merge branch 'for-next/juno' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging stm32/stm32-next (a9c92a9671d7 ARM: dts: stm32: add #clock-cells pr=
operty to usbphyc node on stm32mp151)
Merging sunxi/sunxi/for-next (582cfdb9d206 Merge branch 'sunxi/clk-for-5.13=
' into sunxi/for-next)
Merging tegra/for-next (b62f4a3fbb22 Merge branch for-5.12/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (0d7571c36331 arm64: dts: ti: k3-am65-main: Ad=
d device_type to pcie*_rc nodes)
Merging clk/clk-next (a38fd8748464 Linux 5.12-rc2)
Merging clk-renesas/renesas-clk (2e70d753789c clk: renesas: r8a779a0: Add T=
MU clocks)
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
Merging mips/mips-next (04100459caa9 MIPS: force CONFIG_PCI to on for IP27 =
and IP30)
Merging nds32/next (40e0dd851e7b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (7f7bc20bc41a nios2: Don't use _end for calculating =
min_low_pfn)
Merging openrisc/for-next (8f722f67452f openrisc: Use devicetree to determi=
ne present cpus)
Merging parisc-hd/for-next (a38fd8748464 Linux 5.12-rc2)
Merging powerpc/next (fbda79043024 Merge tag 'powerpc-5.12-2' of git://git.=
kernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e95f287deed2 soc: fsl: handle RCPM errata A-008646 on=
 SoC LS1021A)
Merging risc-v/for-next (dd2d082b5760 riscv: Cleanup setup_bootmem())
Merging s390/for-next (755d91f36dab Merge branch 'fixes' into for-next)
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
Merging fscache/fscache-next (d023d4b993da afs: Use the fscache_write_begin=
() helper)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (c4e9b6a42a43 Merge branch 'for-next-next-v5.12-2021=
0308' into for-next-20210308)
Merging ceph/master (558b4510f622 ceph: defer flushing the capsnap if the F=
b is used)
Merging cifs/for-next (a23a20612551 CIFS: Prevent error log on spurious opl=
ock break)
Merging configfs/for-next (65cdb4a214c0 configfs: fix kernel-doc markup iss=
ue)
Merging ecryptfs/next (902af369942f ecryptfs: use DEFINE_MUTEX() for mutex =
lock)
Merging erofs/dev (ce0631291813 erofs: initialized fields can only be obser=
ved after bit is set)
Merging exfat/dev (a403e793cb41 exfat: add support ioctl and FITRIM functio=
n)
Merging ext3/for_next (c5b8ccc3da76 Pull udf & isofs UID/GID parsing fixes.)
Merging ext4/dev (73648622c60a ext4: fix bh ref count on error paths)
Merging f2fs/dev (4e6e1364dccb f2fs: compress: add compress_inode to cache =
compressed blocks)
Merging fsverity/fsverity (07c99001312c fs-verity: support reading signatur=
e with ioctl)
Merging fuse/for-next (166ddcdeea0b fuse: 32-bit user space ioctl compat fo=
r fuse device)
Merging jfs/jfs-next (c03c21ba6f4e Merge tag 'keys-misc-20210126' of git://=
git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs)
Merging nfs/linux-next (f69d02e37a85 Merge tag 'misc-5.12-2021-03-02' of gi=
t://git.kernel.dk/linux-block)
Merging nfs-anna/linux-next (7ae017c7322e NFS: Support the '-owrite=3D' opt=
ion in /proc/self/mounts and mountinfo)
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
Merging vfs/for-next (1f081146def4 Merge branches 'work.recursive_removal' =
and 'work.coredump' into for-next)
Merging printk/for-next (f78dd21aa363 Merge branch 'for-5.12-no_hash_pointe=
rs' into for-next)
Merging pci/next (e18fb64b7986 Merge branch 'remotes/lorenzo/pci/misc')
Merging pstore/for-next/pstore (7db688e99c0f pstore/ram: Rate-limit "uncorr=
ectable error in header" message)
Merging hid/for-next (e453304975b0 Merge branch 'for-5.13/intel-ish' into f=
or-next)
Merging i2c/i2c/for-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging i3c/i3c/next (437f5e2af730 i3c: master: svc: remove redundant assig=
nment to cmd->read_len)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (6ab3332cc692 MAINTAINERS: Add entry for T=
exas Instruments TPS23861 PoE PSE)
Merging jc_docs/docs-next (6329d73d318f docs: arm: /chosen node parameters)
Merging v4l-dvb/master (1c5ab1e2286f Merge tag 'v5.12-rc2' into patchwork)
Merging v4l-dvb-next/master (d0a9fffedca1 docs: fs: api-summary.rst: get ri=
d of kernel-doc include)
CONFLICT (content): Merge conflict in drivers/gpu/drm/drm_dp_helper.c
CONFLICT (content): Merge conflict in Documentation/dev-tools/kasan.rst
CONFLICT (content): Merge conflict in Documentation/conf.py
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (f15befeb2bc3 Merge branch 'acpi-drivers' into linux-=
next)
Merging cpufreq-arm/cpufreq/arm/linux-next (fbb31cb805fd cpufreq: blacklist=
 Arm Vexpress platforms in cpufreq-dt-platdev)
Merging cpupower/cpupower (fe07bfda2fb9 Linux 5.12-rc1)
Merging devfreq/devfreq-next (0617d430ed1d PM / devfreq: rk3399_dmc: Simpli=
fy with dev_err_probe())
Merging opp/opp/linux-next (021c503e1508 opp: Invalidate current opp when d=
raining the opp list)
Merging thermal/thermal/linux-next (a51afb13311c thermal: cpufreq_cooling: =
freq_qos_update_request() returns < 0 on error)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (c7a3549673d8 fs: dlm: add shutdown hook)
Merging swiotlb/linux-next (a38fd8748464 Linux 5.12-rc2)
Merging rdma/for-next (a38fd8748464 Linux 5.12-rc2)
Merging net-next/master (d310ec03a34e Merge tag 'perf-core-2021-02-17' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging bpf-next/for-next (d310ec03a34e Merge tag 'perf-core-2021-02-17' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging ipsec-next/master (d310ec03a34e Merge tag 'perf-core-2021-02-17' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging mlx5-next/mlx5-next (a38fd8748464 Linux 5.12-rc2)
Merging netfilter-next/master (d310ec03a34e Merge tag 'perf-core-2021-02-17=
' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging ipvs-next/master (a61e4b60761f Merge branch 'net-dsa-hellcreek-add-=
taprio-offloading')
Merging wireless-drivers-next/master (773dc50d7169 Merge branch 'Xilinx-axi=
enet-updates')
Merging bluetooth/master (d00745da644d Bluetooth: btintel: Fix offset calcu=
lation boot address parameter)
Merging mac80211-next/master (38b5133ad607 octeontx2-pf: Fix otx2_get_fecpa=
ram())
Merging gfs2/for-next (1a5a2cfd34c1 gfs2: fix use-after-free in trans_drain)
Merging mtd/mtd/next (457da931b608 mtd: parsers: ofpart: support BCM4908 fi=
xed partitions)
Merging nand/nand/next (99a8e1154eb1 mtd: rawnand: qcom: Return actual erro=
r code instead of -ENODEV)
Merging spi-nor/spi-nor/next (47f25032c0e3 MAINTAINERS: Add Michael and Pra=
tyush as designated reviewers for SPI NOR)
Merging crypto/master (1406f0f34402 crypto: nx - add missing call to of_nod=
e_put())
Merging drm/drm-next (d153e8c156da Merge tag 'drm-intel-next-fixes-2021-02-=
25' of git://anongit.freedesktop.org/drm/drm-intel into drm-next)
Merging drm-misc/for-linux-next (5fd3de7a5185 drm/compat: Clear bounce stru=
ctures)
Merging amdgpu/drm-next (31513f644d1d drm/amdgpu: clean up non-DC suspend/r=
esume handling)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu11/va=
ngogh_ppt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/smu11/sm=
u_v11_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_drv=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_dev=
ice.c
Merging drm-intel/for-linux-next (aaca50ef45ed drm/i915: Extend icl_sanitiz=
e_encoder_pll_mapping() to all DDI platforms)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dd=
i.c
Merging drm-tegra/drm/tegra/for-next (dcdfe2712b68 drm/tegra: Fix reference=
 leak when pm_runtime_get_sync() fails)
Merging drm-msm/msm-next (7bf168c8fe8c drm/msm: Fix speed-bin support not t=
o access outside valid memory)
Merging imx-drm/imx-drm/next (82581fcf070b drm/modes: add non-OF stub for o=
f_get_drm_display_mode)
Merging etnaviv/etnaviv/next (7d614ab2f205 drm/etnaviv: fix NULL check befo=
re some freeing functions is not needed)
Merging regmap/for-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging sound/for-next (b9dd23bb03fe ALSA: hda/cirrus: Add Headphone and He=
adset MIC Volume Control)
Merging sound-asoc/for-next (9db86c209584 Merge remote-tracking branch 'aso=
c/for-5.13' into asoc-next)
Merging modules/modules-next (1e80d9cb579e module: potential uninitialized =
return in module_kallsyms_on_each_symbol())
Merging input/next (ad117c558e83 Input: exc3000 - add type sysfs attribute)
Merging block/for-next (074aa69b6b96 Merge branch 'for-5.13/io_uring' into =
for-next)
Merging device-mapper/for-next (8416f5edbcf7 dm: remove useless loop in __s=
plit_and_process_bio)
Merging pcmcia/pcmcia-next (4ce6b242b78d pcmcia: Switch to using the new AP=
I kobj_to_dev())
Merging mmc/next (cfe8feea5b04 Merge branch 'fixes' into next)
Merging mfd/for-mfd-next (14711e8f92cc dt-bindings: mfd: ricoh,rn5t618: Tri=
vial: Fix spelling mistake of 'additionally')
Merging backlight/for-backlight-next (0b5e0f45af40 backlight/video: Use Pla=
tform getter/setter functions)
Merging battery/for-next (2552e38dc8ad power: supply: smb347-charger: Clean=
 up whitespaces in the code)
Merging regulator/for-next (5fa184afc97d Merge remote-tracking branch 'regu=
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
Merging selinux/next (2e6d71dd97bf selinux: Allow context mounts for unpriv=
iliged overlayfs)
Merging smack/next (7ef4c19d245f smackfs: restrict bytes count in smackfs w=
rite functions)
Merging tomoyo/master (fe07bfda2fb9 Linux 5.12-rc1)
Merging tpmdd/next (232a37ea3aee tpm: Remove unintentional dump_stack() cal=
l)
Merging watchdog/master (a4f3407c4160 watchdog: qcom: Remove incorrect usag=
e of QCOM_WDT_ENABLE_IRQ)
Merging iommu/next (be575abcf799 Merge branch 'iommu/fixes' into next)
Merging audit/next (127c8c5f0589 audit: Make audit_filter_syscall() return =
void)
Merging devicetree/for-next (dce92f6b11c3 arm64: Enable passing IMA log to =
next kernel on kexec)
Merging mailbox/mailbox-for-next (6b50df2b8c20 mailbox: arm_mhuv2: Skip cal=
ling kfree() with invalid pointer)
Merging spi/for-next (62b99fc9b80d Merge remote-tracking branch 'spi/for-5.=
13' into spi-next)
Merging tip/auto-latest (361316d29e57 Merge branch 'efi/urgent')
Merging clockevents/timers/drivers/next (e85c1d21b16b clocksource/drivers/t=
imer-microchip-pit64b: Add clocksource suspend/resume)
Merging edac/edac-for-next (faf042d15093 Merge branch 'edac-amd64' into eda=
c-for-next)
Merging irqchip/irq/irqchip-next (a79f7051cccb irqchip: Do not blindly sele=
ct CONFIG_GENERIC_IRQ_MULTI_HANDLER)
Merging ftrace/for-next (f9f344479d8b tracing: Fix comment about the trace_=
event_call flags)
Merging rcu/rcu/next (5dd4b5a92030 torture: Add prototype kvm-remote.sh scr=
ipt)
Merging kvm/next (357ad203d45c KVM: arm64: Fix range alignment when walking=
 page tables)
Merging kvm-arm/next (255af9c2d1df Merge remote-tracking branch 'kvmarm/fix=
es' into kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (72476aaa4691 KVM: PPC: Book3S HV: Fix host ra=
dix SLB optimisation with hash guests)
Merging kvms390/next (50a05be484cb KVM: s390: track synchronous pfault even=
ts in kvm_stat)
Merging xen-tip/linux-next (882213990d32 xen: fix p2m size in dom0 for disa=
bled memory hotplug case)
Merging percpu/for-next (df1c002198a8 Merge branch 'for-5.12' into for-next)
Merging workqueues/for-next (a7347aa8e061 workqueue: Move the position of d=
ebug_work_activate() in __queue_work())
Merging drivers-x86/for-next (87eaede45385 platform/x86: touchscreen_dmi: H=
andle device properties with software node API)
Merging chrome-platform/for-next (b996c10e0f5b Merge tag 'tag-chrome-platfo=
rm-for-v5.12' of git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platf=
orm/linux)
Merging hsi/for-next (aa57e77b3d28 HSI: Fix PM usage counter unbalance in s=
si_hw_init)
Merging leds/for-next (b0a82efa51ad leds: lp50xx: Get rid of redundant expl=
icit casting)
Merging ipmi/for-next (5b3f4316e8fa ipmi: Handle device properties with sof=
tware node API)
Merging driver-core/driver-core-next (a38fd8748464 Linux 5.12-rc2)
Merging usb/usb-next (5e17812c22bc usb: dwc3: document usb_psy in struct dw=
c3)
Merging usb-gadget/next (b2c586eb07ef usb: dwc2: Fix INTR OUT transfers in =
DDMA mode.)
Merging usb-serial/usb-next (fe07bfda2fb9 Linux 5.12-rc1)
Merging usb-chipidea-next/for-usb-next (67982dfa59de usb: cdns3: imx: add p=
ower lost support for system resume)
Merging tty/tty-next (d1c1b2005dad drivers: tty: serial: IMX_EARLYCON: fix =
Kconfig dependency on SERIAL_CORE)
CONFLICT (content): Merge conflict in drivers/tty/hvc/hvcs.c
Merging char-misc/char-misc-next (870ef26e952c drivers: habanalabs: remove =
unused dentry pointer for debugfs files)
Merging extcon/extcon-next (b906ab549836 extcon: qcom-spmi: Add support for=
 VBUS detection)
Merging phy-next/next (8e6b3a78eddd phy: tusb1210: use bitmasks to set VEND=
OR_SPECIFIC2)
Merging soundwire/next (fe07bfda2fb9 Linux 5.12-rc1)
Merging thunderbolt/next (d59b8faa047e thunderbolt: Drop unused functions t=
b_switch_is_[ice|tiger]_lake())
Merging vfio/next (4d83de6da265 vfio/type1: Batch page pinning)
Merging staging/staging-next (4e1c5d4c35d8 staging: wimax/i2400m: convert _=
_le32 type to host byte-order)
Merging mux/for-next (3516bd729358 Merge tag 's390-5.11-3' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/s390/linux)
Merging icc/icc-next (3ffdec2843e1 Merge branch 'icc-fixes' into HEAD)
Merging dmaengine/next (fe07bfda2fb9 Linux 5.12-rc1)
Merging cgroup/for-next (00bfa16052cd Merge branch 'for-5.11-fixes' into fo=
r-next)
Merging scsi/for-next (f88dfeea18aa Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (a81a38cc6dda scsi: storvsc: Parameterize number =
hardware queues)
Merging vhost/linux-next (1f77f124f2f2 ALSA: virtio: introduce device suspe=
nd/resume support)
CONFLICT (add/add): Merge conflict in sound/virtio/virtio_pcm_ops.c
CONFLICT (add/add): Merge conflict in sound/virtio/virtio_pcm_msg.c
CONFLICT (add/add): Merge conflict in sound/virtio/virtio_pcm.h
CONFLICT (add/add): Merge conflict in sound/virtio/virtio_pcm.c
CONFLICT (add/add): Merge conflict in sound/virtio/virtio_ctl_msg.c
CONFLICT (add/add): Merge conflict in sound/virtio/virtio_card.h
CONFLICT (add/add): Merge conflict in sound/virtio/virtio_card.c
Merging rpmsg/for-next (fcb4c469244b Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7ac554888233 MAINTAINERS: Remove reference to non-ex=
isting file)
Merging gpio-brgl/gpio/for-next (79bdf5472bab docs: driver-api: gpio: consu=
mer: Mark another line of code as such)
Merging gpio-intel/for-next (488d05fe25a6 gpiolib: Fold conditionals into a=
 simple ternary operator)
Merging pinctrl/for-next (59263b2bab47 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (20a57ad4b848 pinctrl: intel: No need to dis=
able IRQs in the handler)
Merging pinctrl-renesas/renesas-pinctrl (a5cda861ed57 pinctrl: renesas: r8a=
779a0: Add TPU pins, groups and functions)
Merging pinctrl-samsung/for-next (a38fd8748464 Linux 5.12-rc2)
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
Merging rtc/rtc-next (fe07bfda2fb9 Linux 5.12-rc1)
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
Merging hyperv/hyperv-next (ec866be6ec54 clocksource/drivers/hyper-v: Move =
handling of STIMER0 interrupts)
Merging auxdisplay/auxdisplay (b45616445a6e auxdisplay: Fix duplicate CHARL=
CD config symbol)
Merging kgdb/kgdb/for-next (f11e2bc682cc kgdb: Remove kgdb_schedule_breakpo=
int())
Merging hmm/hmm (fe07bfda2fb9 Linux 5.12-rc1)
Merging fpga/for-next (6f1e376cfc68 fpga: Add support for Xilinx DFX AXI Sh=
utdown manager)
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
Merging akpm/master (3f62e62635c3 Merge branch 'akpm-current/current')

--Sig_/=X_A6SiEkTk9=qGJcP.jJFt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBG8fEACgkQAVBC80lX
0GzCKAf/ZAeATQamoERqKzea3/EygXsxrJgxmid18k/8d0J0aRQHIp/Ra7+5S8aT
EDIzRY16CUhC7cb4d3zp0kfVHF1rhnIrx5UtPD/vAUSRC7d42eb5sg3zzz+D8OP9
jqwpQAvpgxXteuX+js33X5bq9rcvWqiCcaDfQDuhFNyh+qXD1zWoEFg3C9WnOdmZ
s/fcCO48Q/uXpgtvny7rpZY9ld/6tKBxVtYsa5DyLgOhPYgk/I1kbN3zBGO5egWS
99ebvwSfgiwCKy7ycxSmKSRt8S+2X9tOKljf3Qq8uVzaU+n78zd5JYsxboQNsGOf
+jRB0Auh/N+Lv/Ft2xf6ZVuIzelJcQ==
=2woI
-----END PGP SIGNATURE-----

--Sig_/=X_A6SiEkTk9=qGJcP.jJFt--
