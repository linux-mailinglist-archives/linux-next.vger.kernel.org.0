Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C481326BE47
	for <lists+linux-next@lfdr.de>; Wed, 16 Sep 2020 09:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgIPHkB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Sep 2020 03:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726159AbgIPHj6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Sep 2020 03:39:58 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A5CC06174A;
        Wed, 16 Sep 2020 00:39:57 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BrsST04y5z9sSW;
        Wed, 16 Sep 2020 17:39:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600241993;
        bh=g29eQvjl3RaFuL8D62SvOJBOe1YqY9zpZDa4Tc45xC4=;
        h=Date:From:To:Cc:Subject:From;
        b=Lp7JpG0x3enH0IJaSYF3ymD8taYyuD79sGfFoBngiZ5Hmvju/h2qt1u+jVarMii11
         qxSBLVTK9LOT5ooC99IwCIWojQGcA2VgavMxsENESProBhkhBFl5wRoV9RV4AI1YQt
         h+MDru384+ESIaZiJWFOvsImOsu7N0V2mpxYhZYZ31uC9itbmjCtqJhGCbEJNCvLdh
         6I/SMbTE8xHmPTmppqeq9Bo3ndQ2Z+zbO2EzAKi6Svd8k5cNlpheGc1fOFvdaT/51a
         Mo7/MHPTsqBaq2bCdTV6+4wnmgbZ2PZqVOACbjcl8OEJh3+6rDHFmLdJ0e17hR+SQ8
         FKD38xkYKkaDw==
Date:   Wed, 16 Sep 2020 17:39:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 16
Message-ID: <20200916173949.215fcfdf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ep4hD8O1_Ye5OWBlVzljG=G";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ep4hD8O1_Ye5OWBlVzljG=G
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200915:

New tree: s390-setfs

The akpm-current tree gained a conflict against the dma-mapping tree.

Non-merge commits (relative to Linus' tree): 7322
 8259 files changed, 258836 insertions(+), 146908 deletions(-)

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

I am currently merging 329 trees (counting Linus' and 86 trees of bug
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
Merging origin/master (fc4f28bb3daf Merge tag 'for-5.9-rc5-tag' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/kdave/linux)
Merging fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging kbuild-current/fixes (f4d51dffc6c0 Linux 5.9-rc4)
Merging arc-current/for-curr (f4d51dffc6c0 Linux 5.9-rc4)
Merging arm-current/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging arm64-fixes/for-next/fixes (ed888cb0d1eb arm64: Allow CPUs unffecte=
d by ARM erratum 1418040 to come in late)
Merging arm-soc-fixes/arm/fixes (a4da411e4189 Merge tag 'arm-soc/for-5.9/de=
vicetree-fixes' of https://github.com/Broadcom/stblinux into arm/fixes)
Merging uniphier-fixes/fixes (48778464bb7d Linux 5.8-rc2)
Merging drivers-memory-fixes/fixes (7ff3a2a626f7 memory: jz4780_nemc: Fix a=
n error pointer vs NULL check in probe())
Merging m68k-current/for-linus (382f429bb559 m68k: defconfig: Update defcon=
figs for v5.8-rc3)
Merging powerpc-fixes/fixes (0460534b532e powerpc/papr_scm: Limit the reada=
bility of 'perf_stats' sysfs attribute)
Merging s390-fixes/fixes (cd4d3d5f21dd s390: add 3f program exception handl=
er)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (2e5117ba9f58 net: tipc: kerneldoc fixes)
Merging bpf/master (65dce596e2b8 docs/bpf: Remove source code links)
Merging ipsec/master (8366685b2883 xfrm: clone whole liftime_cur structure =
in xfrm_do_migrate)
Merging netfilter/master (9b29e26f7934 Merge branch 'net-qed-disable-aRFS-i=
n-NPAR-and-100G')
Merging ipvs/master (7c7ab580db49 net: Convert to use the fallthrough macro)
Merging wireless-drivers/master (1264c1e0cfe5 Revert "wlcore: Adding suppop=
rt for IGTK key in wlcore driver")
Merging mac80211/master (c8146fe292a7 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/bpf/bpf)
Merging rdma-fixes/for-rc (856deb866d16 Linux 5.9-rc5)
Merging sound-current/for-linus (8949b6660c3c Merge tag 'asoc-fix-v5.9-rc4'=
 of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-=
linus)
Merging sound-asoc-fixes/for-linus (e841ab6475e7 Merge remote-tracking bran=
ch 'asoc/for-5.9' into asoc-linus)
Merging regmap-fixes/for-linus (f75aef392f86 Linux 5.9-rc3)
Merging regulator-fixes/for-linus (856deb866d16 Linux 5.9-rc5)
Merging spi-fixes/for-linus (a67ea3c79f01 Merge remote-tracking branch 'spi=
/for-5.9' into spi-linus)
Merging pci-current/for-linus (e338eecf3fe7 PCI: rockchip: Fix bus checks i=
n rockchip_pcie_valid_device())
Merging driver-core.current/driver-core-linus (856deb866d16 Linux 5.9-rc5)
Merging tty.current/tty-linus (f75aef392f86 Linux 5.9-rc3)
Merging usb.current/usb-linus (bf638d736e3e Merge tag 'thunderbolt-for-v5.9=
-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt =
into usb-linus)
Merging usb-gadget-fixes/fixes (51609fba0cca usb: dwc3: simple: add support=
 for Hikey 970)
Merging usb-serial-fixes/usb-linus (2bb70f0a4b23 USB: serial: option: suppo=
rt dynamic Quectel USB compositions)
Merging usb-chipidea-fixes/ci-for-usb-stable (2d79b3360dcc usb: chipidea: c=
ore: add wakeup support for extcon)
Merging phy/fixes (850280156f64 phy: ti: am654: Fix a leak in serdes_am654_=
probe())
Merging staging.current/staging-linus (856deb866d16 Linux 5.9-rc5)
Merging char-misc.current/char-misc-linus (856deb866d16 Linux 5.9-rc5)
Merging soundwire-fixes/fixes (3fbbf2148a40 soundwire: fix double free of d=
angling pointer)
Merging thunderbolt-fixes/fixes (f022ff7bf377 thunderbolt: Retry DROM read =
once if parsing fails)
Merging input-current/for-linus (6c77545af100 Input: trackpoint - add new t=
rackpoint variant IDs)
Merging crypto-current/master (1b0df11fde0f padata: fix possible padata_wor=
ks_lock deadlock)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (aae7a75a821a vfio/type1: Add proper error unw=
ind for vfio_iommu_replay())
Merging kselftest-fixes/fixes (5c1e4f7e9e49 selftests/timers: Turn off time=
out setting)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (f4d51dffc6c0 Linux 5.9-rc4)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (f7e6b19bc764 mtd: properly check all write ioc=
tls for permissions)
Merging mfd-fixes/for-mfd-fixes (22380b65dc70 mfd: mfd-core: Ensure disable=
d devices are ignored without error)
Merging v4l-dvb-fixes/fixes (129134e5415d media: media/v4l2: remove V4L2_FL=
AG_MEMORY_NON_CONSISTENT flag)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (baf5cb30fbd1 MIPS: SNI: Fix SCSI interrupt)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (6542e2b613c2 ARM: dts: omap5: Fix DSI base addres=
s and clocks)
Merging kvm-fixes/master (37f66bbef092 KVM: emulator: more strict rsm check=
s.)
Merging kvms390-fixes/master (f20d4e924b44 docs: kvm: add documentation for=
 KVM_CAP_S390_DIAG318)
Merging hwmon-fixes/hwmon (d50e0d750004 hwmon: (sparx5) Fix initial reading=
 of temperature)
Merging nvdimm-fixes/libnvdimm-fixes (6180bb446ab6 dax: fix detection of da=
x support for non-persistent memory block devices)
Merging btrfs-fixes/next-fixes (15d5ea19f76c Merge branch 'misc-5.9' into n=
ext-fixes)
Merging vfs-fixes/fixes (9d682ea6bcc7 vboxsf: Fix the check for the old bin=
ary mount-arguments struct)
Merging dma-mapping-fixes/for-linus (892fc9f6835e dma-pool: Fix an uninitia=
lized variable bug in atomic_pool_expand())
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging samsung-krzk-fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging devicetree-fixes/dt/linus (d89a80ddbfd8 dt-bindings: crypto: sa2ul:=
 fix a DT binding check warning)
Merging scsi-fixes/fixes (244359c99fd9 scsi: libsas: Fix error path in sas_=
notify_lldd_dev_found())
Merging drm-fixes/drm-fixes (7f7a47952c0f Merge tag 'drm-misc-fixes-2020-09=
-09' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (856deb866d16 Linux 5.9-rc5)
Merging mmc-fixes/fixes (14801c624066 mmc: mmc_spi: Fix mmc_spi_dma_alloc()=
 return type for !HAS_DMA)
Merging rtc-fixes/rtc-fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging gnss-fixes/gnss-linus (48778464bb7d Linux 5.8-rc2)
Merging hyperv-fixes/hyperv-fixes (911e1987efc8 Drivers: hv: vmbus: Add tim=
eout to vmbus_wait_for_unload)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (66d18dbda846 RISC-V: Take text_mutex in ftrace_=
init_nop())
Merging pidfd-fixes/fixes (bda4c60d02e9 sys: Convert to the new fallthrough=
 notation)
Merging fpga-fixes/fixes (8614afd689df fpga: dfl: fix bug in port reset han=
dshake)
Merging spdx/spdx-linus (856deb866d16 Linux 5.9-rc5)
Merging gpio-intel-fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging pinctrl-intel-fixes/fixes (3488737093e7 pinctrl: cherryview: Preser=
ve CHV_PADCTRL1_INVRXTX_TXDATA flag on GPIOs)
Merging erofs-fixes/fixes (9ebcfadb0610 Linux 5.8-rc3)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (21a6d1780d5b kunit: tool: allow generating=
 test results in JSON)
Merging ubifs-fixes/fixes (f37e99aca03f Merge tag 's390-5.8-6' of git://git=
.kernel.org/pub/scm/linux/kernel/git/s390/linux into master)
Merging memblock-fixes/fixes (5f7b81c18366 ia64: fix min_low_pfn/max_low_pf=
n build errors)
Merging drm-misc-fixes/for-linux-next-fixes (74ea06164cda drm/sun4i: mixer:=
 Extend regmap max_register)
Merging kspp-gustavo/for-next/kspp (cb0938372de0 Merge branch 'for-next/cla=
ng' into for-next/kspp)
Merging kbuild/for-next (26bde0ed700d Merge branch 'kbuild' (early part) in=
to for-next)
Merging compiler-attributes/compiler-attributes (e5fc436f06ee sparse: use s=
tatic inline for __chk_{user,io}_ptr())
Merging dma-mapping/for-next (a92df4f62fda dma-mapping: move the dma_declar=
e_coherent_memory documentation)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (adc5f7029376 ARM: add malloc size to decompressor kex=
ec size structure)
Merging arm64/for-next/core (e35928ce20ba Merge branches 'for-next/acpi', '=
for-next/cpuinfo', 'for-next/misc', 'for-next/mm', 'for-next/perf', 'for-ne=
xt/topology', 'for-next/tpyos' and 'for-next/vdso' into for-next/core)
Merging arm-perf/for-next/perf (2b694fc92a34 perf: arm_dsu: Support DSU ACP=
I devices)
Merging arm-soc/for-next (97b66548a7cc ARM: Document merges)
Merging amlogic/for-next (c943b84fab78 Merge branch 'v5.10/dt64' into tmp/a=
ml-rebuild)
Merging aspeed/for-next (315d4a38c4b6 ARM: config: aspeed_g5: Enable IBM OP=
 Panel driver)
Merging at91/at91-next (0ec63ea2b8cd Merge branches 'at91-soc' and 'at91-dt=
' into at91-next)
Merging drivers-memory/for-next (a8529f3b1cd8 memory: mtk-smi: add support =
for MT8167)
Merging imx-mxs/for-next (4f4ceed1a40f Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (36f3ea3c42ce Merge branch 'for_5.10/drivers-soc' int=
o next)
Merging mediatek/for-next (2fb345db29ad Merge branch 'v5.9-next/soc' into f=
or-next)
Merging mvebu/for-next (29bd9d8c2ac1 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (34766a7d60e9 Merge branch 'omap-for-v5.10/defconfig'=
 into for-next)
Merging qcom/for-next (3f6992f1484b Merge branches 'arm64-for-5.10', 'arm64=
-defconfig-for-5.10' and 'drivers-for-5.10' into for-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging raspberrypi/for-next (4564363351e2 ARM: dts: bcm2711: Enable the di=
splay pipeline)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (af66a5f750a1 Merge branch 'renesas-arm-dt-for-v5.10' =
into renesas-next)
Merging reset/reset/next (2983e2385ff6 reset: imx7: add the cm4 reset for i=
.MX8MQ)
CONFLICT (content): Merge conflict in drivers/reset/reset-imx7.c
Merging rockchip/for-next (5b54a6a5703f Merge branch 'v5.10-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (b8a3b763539f Merge branch 'next/dt64-schema-=
var' into for-next)
Merging scmi/for-linux-next (0d5e4b9b1bac Merge tag 'scmi-updates-5.10' of =
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-l=
inux-next)
Merging sunxi/sunxi/for-next (5bcae6ef32b0 Merge branch 'sunxi/dt-for-5.10'=
 into sunxi/for-next)
Merging tegra/for-next (05ccc6eebf8e Merge branch for-5.10/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (69fba6172b9f arm64: dts: ti: k3-am65: ringacc=
: drop ti, dma-ring-reset-quirk)
Merging uniphier/for-next (4f8fb65af529 Merge branch 'dt64' into for-next)
Merging clk/clk-next (2d0cc1cd35f2 Merge branch 'clk-fixes' into clk-next)
Merging clk-samsung/for-next (fec38565411f clk: samsung: Use cached clk_hws=
 instead of __clk_lookup() calls)
Merging csky/linux-next (bdcd93ef9afb csky: Add context tracking support)
Merging h8300/h8300-next (8808515be0ed h8300: Replace <linux/clk-provider.h=
> by <linux/of_clk.h>)
Merging ia64/next (c331649e6371 ia64: Use libata instead of the legacy ide =
driver in defconfigs)
Merging m68k/for-next (352e04291115 m68k: Replace HTTP links with HTTPS one=
s)
Merging m68knommu/for-next (858b810bf63f m68knommu: switch to using asm-gen=
eric/uaccess.h)
CONFLICT (content): Merge conflict in arch/m68k/Kconfig
Merging microblaze/next (4a17e8513376 microblaze: fix kbuild redundant file=
 warning)
Merging mips/mips-next (601637e42df0 MIPS: Remove mach-*/war.h)
Merging nds32/next (54bde873682b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (55b2662ec665 openrisc: uaccess: Add user address=
 space check to access_ok)
Merging parisc-hd/for-next (c71fcd3c4fcf parisc: disable CONFIG_IDE in defc=
onfigs)
Merging powerpc/next (dc462267d2d7 powerpc/64s: handle ISA v3.1 local copy-=
paste context switches)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e9e4ef9116b1 soc: fsl: dpio: Remove unused inline fun=
ction qbman_write_eqcr_am_rt_register)
Merging risc-v/for-next (3a822d8ea3b3 RISC-V: Fix duplicate included thread=
_info.h)
Merging s390/features (1a80b54d1ce1 s390/uv: add destroy page call)
Merging s390-setfs/set_fs (01539289d477 s390/uaccess: implement HAVE_GET_KE=
RNEL_NOFAULT support)
CONFLICT (content): Merge conflict in arch/m68k/Kconfig
Merging sh/for-next (b0cfc315ff38 sh: fix syscall tracing)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (f6e8c474390b um: virtio: Replace zero-length array =
with flexible-array)
Merging xtensa/xtensa-for-next (4ca4c562efb6 xtensa: uaccess: Add missing _=
_user to strncpy_from_user() prototype)
Merging fscrypt/master (5e895bd4d523 fscrypt: restrict IV_INO_LBLK_32 to in=
o_bits <=3D 32)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (abecc38b009f Merge branch 'for-next-next-v5.9-20200=
910' into for-next-20200910)
Merging ceph/master (f44d04e696fe rbd: require global CAP_SYS_ADMIN for map=
ping and unmapping)
Merging cifs/for-next (856deb866d16 Linux 5.9-rc5)
Merging configfs/for-next (059ccbfff8a8 configfs: use flush file op to comm=
it writes to a binary file)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (cfcedfe21820 erofs: avoid duplicated permission check fo=
r "trusted." xattrs)
Merging exfat/dev (9764d7e25a9f exfat: eliminate dead code in exfat_find())
Merging ext3/for_next (c53ec7bcc780 ext2: Fix some kernel-doc warnings in b=
alloc.c)
Merging ext4/dev (27bc446e2def ext4: limit the length of per-inode prealloc=
 list)
Merging f2fs/dev (b8ee60871d5e f2fs: compress: introduce cic/dic slab cache)
Merging fsverity/fsverity (f3db0bed4583 fs-verity: use smp_load_acquire() f=
or ->i_verity_info)
Merging fuse/for-next (9a752d18c85a virtiofs: add logic to free up a memory=
 range)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (856deb866d16 Linux 5.9-rc5)
Merging nfs-anna/linux-next (7705a4e65fc5 NFSv4.2: xattr cache: remove unus=
ed cache struct field)
Merging nfsd/nfsd-next (9123e3a74ec7 Linux 5.9-rc1)
Merging cel/cel-next (f75aef392f86 Linux 5.9-rc3)
Merging orangefs/for-next (e848643b524b orangefs: remove unnecessary assign=
ment to variable ret)
Merging overlayfs/overlayfs-next (8f6ee74c2786 ovl: rearrange ovl_can_list(=
))
Merging ubifs/next (798b7347e4f2 jffs2: fix UAF problem)
Merging v9fs/9p-next (2ed0b7578170 9p: Remove unneeded cast from memory all=
ocation)
Merging xfs/for-next (18a1031619de xfs: ensure that fpunch, fcollapse, and =
finsert operations are aligned to rt extent size)
Merging zonefs/for-next (48bfd5c6fac1 zonefs: document the explicit-open mo=
unt option)
Merging iomap/iomap-for-next (14284fedf59f iomap: Mark read blocks uptodate=
 in write_begin)
Merging djw-vfs/vfs-for-next (e4f9ba20d3b8 fs/xfs: Update xfs_ioctl_setattr=
_dax_invalidate())
Merging file-locks/locks-next (1ad5f100e3ba locks: Remove extra "0x" in tra=
cepoint format specifier)
Merging vfs/for-next (c5c8adc73309 Merge branches 'fixes', 'work.misc', 'wo=
rk.sparc', 'base.set_fs' and 'work.csum_and_copy', remote-tracking branch '=
vfs/work.epoll' into for-next)
CONFLICT (content): Merge conflict in arch/s390/include/asm/checksum.h
Merging printk/for-next (af8fbcb58191 Merge branch 'printk-rework' into for=
-next)
Merging pci/next (9a8b3f0c7abe Merge branch 'remotes/lorenzo/pci/xilinx')
CONFLICT (content): Merge conflict in drivers/pci/controller/dwc/pci-imx6.c
Merging pstore/for-next/pstore (137c6236aeec mailmap: Add WeiXiong Liao)
CONFLICT (content): Merge conflict in .mailmap
Merging hid/for-next (5bd34639e3da Merge branch 'for-5.10/core' into for-ne=
xt)
Merging i2c/i2c/for-next (ab17a48e18c4 Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (cc3a392d69b6 i3c: master: fix for SETDASA and DAA pro=
cess)
Merging dmi/dmi-for-next (a3d13a0a23ea Replace HTTP links with HTTPS ones: =
DMI/SMBIOS SUPPORT)
Merging hwmon-staging/hwmon-next (1d6baf062dee hwmon: (pmbus) Move boolean =
error condition check to generating code)
Merging jc_docs/docs-next (78ff97ebd4e9 iio: iio.h: fix a warning at the ke=
rnel-doc markup)
Merging v4l-dvb/master (741043b02c2e media: vidtv: don't initialize cnr2qua=
l var)
Merging v4l-dvb-next/master (0d6db85131e0 Revert "media: atomisp: keep the =
ISP powered on when setting it")
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (856deb866d16 Linux 5.9-rc5)
Merging cpufreq-arm/cpufreq/arm/linux-next (d168eaa6f6a1 cpufreq: qcom-hw: =
Make use of cpufreq driver_data for passing pdev)
Merging cpupower/cpupower (527b7779e5ec cpupower: speed up generating git v=
ersion string)
Merging devfreq/devfreq-next (d283fdeb22aa PM / devfreq: event: Change prot=
otype of devfreq_event_get_edev_by_phandle function)
Merging opp/opp/linux-next (257eba525a2e opp: Prevent memory leak in dev_pm=
_opp_attach_genpd())
Merging thermal/thermal/linux-next (6f55be9fd5ee Merge branch 'thermal/fixe=
s' into thermal/linux-next)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (7ae0451e2e6c fs: dlm: use free_con to free connection)
Merging swiotlb/linux-next (b51e627158cb swiotlb: Mark max_segment with sta=
tic keyword)
Merging rdma/for-next (9e054b13b2f7 RDMA/qedr: Fix function prototype param=
eters alignment)
Merging net-next/master (897dccb8db0d Merge branch 'nexthop-Small-changes')
CONFLICT (content): Merge conflict in drivers/net/dsa/microchip/ksz9477.c
Merging bpf-next/master (d317b0a8acfc libbpf: Fix a compilation error with =
xsk.c for ubuntu 16.04)
Merging ipsec-next/master (02a20d4fef3d enic: switch from 'pci_' to 'dma_' =
API)
Merging mlx5-next/mlx5-next (9123e3a74ec7 Linux 5.9-rc1)
Merging netfilter-next/master (4f6a5caf187f net: dsa: b53: Report VLAN tabl=
e occupancy via devlink)
Merging ipvs-next/master (bfdd5aaa54b0 Merge tag 'Smack-for-5.9' of git://g=
ithub.com/cschaufler/smack-next)
Merging wireless-drivers-next/master (5a6bd84f8154 net: hns: use IRQ_NOAUTO=
EN to avoid irq is enabled due to request_irq)
Merging bluetooth/master (e91172151a40 Bluetooth: btintel: Refactor firmwar=
e download function)
Merging mac80211-next/master (e059c6f340f6 tulip: switch from 'pci_' to 'dm=
a_' API)
Merging gfs2/for-next (2928eebec009 gfs2: Fix bad comment for trans_drain)
Merging mtd/mtd/next (670c898cee31 mtd: spear_smi: use for_each_child_of_no=
de() macro)
Merging nand/nand/next (3d0489c87b9a mtd: rawnand: atmel: Check return valu=
es for nand_read_data_op)
Merging spi-nor/spi-nor/next (e93a977367b2 mtd: revert "spi-nor: intel: pro=
vide a range for poll_timout")
Merging crypto/master (8db1824f5a38 crypto: ux500 - Fix sparse endianness w=
arnings)
Merging drm/drm-next (818280d5adf1 Merge v5.9-rc5 into drm-next)
Merging amdgpu/drm-next (d62c70e7f819 Revert "drm/radeon: handle PCIe root =
ports with addressing limitations")
Merging drm-intel/for-linux-next (400d4953f1f4 drm/i915/pll: Centralize PLL=
_ENABLE register lookup)
Merging drm-tegra/drm/tegra/for-next (4fba6d22ca9a drm/tegra: plane: Suppor=
t 180=C2=B0 rotation)
Merging drm-misc/for-linux-next (3312be8f6fc8 drm/ttm: move populated state=
 into page flags)
Merging drm-msm/msm-next (1ef7c99d145c drm/msm/dsi: add support for 7nm DSI=
 PHY/PLL)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (efd5a93d2a89 drm/imx: drop explicit drm_mode_=
config_cleanup)
Merging etnaviv/etnaviv/next (c5d5a32ead1e drm/etnaviv: fix ref count leak =
via pm_runtime_get_sync)
Merging regmap/for-next (b89102f28d29 Merge remote-tracking branch 'regmap/=
for-5.10' into regmap-next)
Merging sound/for-next (2b3d2987d800 ALSA: firewire: Replace tasklet with w=
ork)
Merging sound-asoc/for-next (f11cecaf4673 Merge remote-tracking branch 'aso=
c/for-5.10' into asoc-next)
Merging modules/modules-next (14721add58ef module: Add more error message f=
or failed kernel module loading)
Merging input/next (4238e52cc351 Input: elants_i2c - report resolution of A=
BS_MT_TOUCH_MAJOR by FW information.)
Merging block/for-next (99faa39ec56f Merge branch 'for-5.10/block' into for=
-next)
Merging device-mapper/for-next (3a653b205f29 dm thin metadata: Fix use-afte=
r-free in dm_bm_set_read_only)
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (878dbe426a56 mmc: core: clear 'doing_init_tune' also afte=
r failures)
CONFLICT (content): Merge conflict in drivers/mmc/host/Kconfig
Merging mfd/for-mfd-next (59306d7db654 mfd: sprd: Add wakeup capability for=
 PMIC IRQ)
Merging backlight/for-backlight-next (7eb99a39ef76 video: backlight: cr_bll=
cd: Remove unused variable 'intensity')
Merging battery/for-next (d8483f31487c dt-bindings: power: supply: Cleanup =
charger-manager bindings)
Merging regulator/for-next (4c66a0efe041 Merge remote-tracking branch 'regu=
lator/for-5.10' into regulator-next)
Merging security/next-testing (bc62d68e2a0a device_cgroup: Fix RCU list deb=
ugging warning)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (48ce1ddce16b ima: Fail rule parsing when =
asymmetric key measurement isn't supportable)
Merging keys/keys-next (b6f61c314649 keys: Implement update for the big_key=
 type)
Merging safesetid/safesetid-next (0476c865ded6 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (8861d0af642c selinux: Add helper functions to get and=
 set checkreqprot)
Merging smack/next (322dd63c7f98 Smack: Use the netlabel cache)
Merging tomoyo/master (5384d92e4e02 tomoyo: Loosen pathname/domainname vali=
dation.)
Merging tpmdd/next (9123e3a74ec7 Linux 5.9-rc1)
Merging watchdog/master (18445bf405cb Merge tag 'spi-fix-v5.9-rc1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging iommu/next (c59bc95e9144 Merge branches 'iommu/fixes', 'arm/allwinn=
er', 'arm/mediatek', 'arm/renesas', 'arm/tegra', 'arm/qcom', 'x86/amd', 'x8=
6/vt-d' and 'core' into next)
Merging vfio/next (ccd59dce1a21 vfio/type1: Refactor vfio_iommu_type1_ioctl=
())
Merging audit/next (c07203516439 audit: Remove redundant null check)
Merging devicetree/for-next (73f76a41c4ed dt-bindings: example: Extend base=
d on practice)
Merging mailbox/mailbox-for-next (884996986347 mailbox: mediatek: cmdq: cle=
ar task in channel before shutdown)
Merging spi/for-next (de0a4481dcf2 Merge remote-tracking branch 'spi/for-5.=
10' into spi-next)
Merging tip/auto-latest (e524f5c7cbd0 Merge branch 'core/build')
Merging clockevents/timers/drivers/next (9fba22584e54 clocksource: Ingenic:=
 Add support for the Ingenic X1000 OST.)
Merging edac/edac-for-next (17882485852b Merge branch 'edac-urgent' into ed=
ac-for-next)
Merging irqchip/irq/irqchip-next (96fd3d69c31f Merge branch 'irq/ipi-as-irq=
' into irq/irqchip-next)
Merging ftrace/for-next (38ce2a9e33db tracing: Add trace_array_init_printk(=
) to initialize instance trace_printk() buffers)
Merging rcu/rcu/next (953bb6292100 rcutorture: Make preemptible TRACE02 ena=
ble lockdep)
Merging kvm/linux-next (e792415c5d3e KVM: MIPS/VZ: Fix build error caused b=
y 'kvm_run' cleanup)
Merging kvm-arm/next (ae8bd85ca8a4 Merge branch 'kvm-arm64/pt-new' into kvm=
arm-master/next)
Merging kvm-ppc/kvm-ppc-next (5706d14d2a94 KVM: PPC: Book3S HV: XICS: Repla=
ce the 'destroy' method by a 'release' method)
Merging kvms390/next (23a60f834406 s390/kvm: diagnose 0x318 sync and reset)
Merging xen-tip/linux-next (9e2369c06c8a xen: add helpers to allocate unpop=
ulated memory)
Merging percpu/for-next (fbb145bcfb5e Merge branch 'for-5.9-fixes' into for=
-next)
Merging workqueues/for-next (10cdb1575954 workqueue: use BUILD_BUG_ON() for=
 compile time test instead of WARN_ON())
Merging drivers-x86/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging chrome-platform/for-next (dd92f7dfe1ba platform/chrome: Kconfig: Re=
move the transitional MFD_CROS_EC config)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (03eb2ca44a95 leds: tlc591xx: Simplify with dev_err_p=
robe())
Merging ipmi/for-next (a190db945bcc ipmi: Clean up some printks)
Merging driver-core/driver-core-next (9ef8638bd8c7 Merge 5.9-rc5 into drive=
r-core-next)
Merging usb/usb-next (f5f875b5618e usb: phy: phy-ab8500-usb: fix spello of =
"function")
Merging usb-gadget/next (f5e46aa4a124 usb: dwc3: gadget: when the started l=
ist is empty stop the active xfer)
Merging usb-serial/usb-next (9123e3a74ec7 Linux 5.9-rc1)
Merging usb-chipidea-next/ci-for-usb-next (71ac680e6339 usb: chipidea: ci_h=
drc_imx: restore pinctrl)
Merging phy-next/next (ee626660ddbd dt-binding: phy: convert ti,omap-usb2 t=
o YAML)
Merging tty/tty-next (71a174b39f10 pty: do tty_flip_buffer_push without por=
t->lock in pty_write)
Merging char-misc/char-misc-next (78ec034966b5 misc: hisi_hikey_usb: fix re=
turn of uninitialized ret status variable)
Merging extcon/extcon-next (e12334b989bc extcon: axp288: Use module_platfor=
m_driver to simplify the code)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging soundwire/next (32d2a8935bf8 soundwire: cadence: add parity error i=
njection through debugfs)
Merging thunderbolt/next (77e4907fa620 thunderbolt: debugfs: Fix uninitiali=
zed return in counters_write())
Merging staging/staging-next (4aca9e65c61d staging: rtl8723bs: remove 5 GHz=
 code)
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (f995194545ab interconnect: qcom: Add OSM L3 support o=
n SM8150)
Merging dmaengine/next (e3a52158a682 dmaengine: Kconfig: Update description=
 for RCAR_DMAC config)
Merging cgroup/for-next (936f2a70f207 cgroup: add cpu.stat file to root cgr=
oup)
Merging scsi/for-next (9d9eaf460c1d Merge branch 'misc' into for-next)
CONFLICT (content): Merge conflict in drivers/scsi/aacraid/aachba.c
Merging scsi-mkp/for-next (ed5dd6a67d5e scsi: core: Only re-run queue in sc=
si_end_request() if device queue is busy)
Merging vhost/linux-next (8a7c3213db06 vdpa/mlx5: fix up endian-ness for mt=
u)
Merging rpmsg/for-next (62180d7eae2f Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (feeaefd378ca gpio: dwapb: Use resource managed GPIO-=
chip add data method)
Merging gpio-brgl/gpio/for-next (32fc5aa2df12 gpiolib: unexport devprop_gpi=
ochip_set_names())
Merging gpio-intel/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging pinctrl/for-next (ebc2599144b6 pinctrl: mcp23s08: Improve error mes=
saging in ->probe())
Merging pinctrl-intel/for-next (a0bf06dc51db pinctrl: cherryview: Preserve =
CHV_PADCTRL1_INVRXTX_TXDATA flag on GPIOs)
Merging pinctrl-samsung/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging pwm/for-next (6ced5ff0be8e pwm: bcm-iproc: handle clk_get_rate() re=
turn)
Merging userns/for-next (7fce69dff8db Implement kernel_execve)
Merging ktest/for-next (ff131efff141 ktest.pl: Fix spelling mistake "Cant" =
-> "Can't")
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (f69237e1e954 selftests: more general make nesting s=
upport)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (59fc1e476962 Merge branch 'for-5.10/flive-pa=
tching' into for-next)
Merging coresight/next (6028dafde949 coresight: etm4x: Fix number of resour=
ces check for ETM 4.3 and above)
Merging rtc/rtc-next (35425bafc772 rtc: pcf2127: fix a bug when not specify=
 interrupts property)
Merging nvdimm/libnvdimm-for-next (03b68d5d7d4b Merge branch 'for-5.9/copy_=
mc' into libnvdimm-for-next)
Merging at24/at24/for-next (99363d1c26c8 eeprom: at24: Tidy at24_read())
Merging ntb/ntb-next (b8e2c8bbdf77 NTB: Use struct_size() helper in devm_kz=
alloc())
Merging seccomp/for-next/seccomp (a23042882ff2 selftests/seccomp: Use bitwi=
se instead of arithmetic operator for flags)
Merging kspp/for-next/kspp (55dde35fdb7f overflow: Add __must_check attribu=
te to check_*() helpers)
Merging gnss/gnss-next (48778464bb7d Linux 5.8-rc2)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging nvmem/for-next (9b7afbd83ef9 nvmem: switch to simpler IDA interface)
Merging xarray/xarray (27586ca786a7 XArray: Handle retry entries within xas=
_find_marked)
Merging hyperv/hyperv-next (49971e6bad2d drivers: hv: remove cast from hype=
rv_die_event)
Merging auxdisplay/auxdisplay (46d4a403a04c auxdisplay: Replace HTTP links =
with HTTPS ones)
Merging kgdb/kgdb/for-next (e16c33e29079 kernel/debug: Fix spelling mistake=
 in debug_core.c)
Merging pidfd/for-next (f2e9aec45e9e Merge tag 'kernel-clone-v5.9' into for=
-next)
Merging hmm/hmm (9123e3a74ec7 Linux 5.9-rc1)
Merging fpga/for-next (6b09efadb8cf fpga: dfl: move dfl bus related APIs to=
 include/linux/fpga/dfl.h)
Merging kunit/test (9123e3a74ec7 Linux 5.9-rc1)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (11399346ac39 mtd: Replace zero-length array with flex=
ible-array)
Merging kunit-next/kunit (9123e3a74ec7 Linux 5.9-rc1)
Merging trivial/for-next (2a9b29b28983 xtensa: fix Kconfig typo)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (ebbc5eba7beb bus: mhi: Remove include of rwlock_types=
.h)
Merging notifications/notifications-pipe-core (841a0dfa5113 watch_queue: sa=
mple: Display mount tree change notifications)
Merging memblock/for-next (762d4d1a174c arch/ia64: Restore arch-specific pg=
d_offset_k implementation)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging akpm-current/current (707bfd71b86d x86: add failure injection to ge=
t/put/clear_user)
CONFLICT (content): Merge conflict in mm/filemap.c
CONFLICT (content): Merge conflict in mm/Kconfig
CONFLICT (content): Merge conflict in include/linux/cma.h
CONFLICT (content): Merge conflict in arch/powerpc/platforms/pseries/hotplu=
g-memory.c
Applying: merge fix up for "mm/memremap_pages: convert to 'struct range'"
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (9153d1f18a49 mm: remove duplicate include statement in=
 mmu.c)

--Sig_/ep4hD8O1_Ye5OWBlVzljG=G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9hwUUACgkQAVBC80lX
0Gw2wgf7BC67PVPFAg72o0M5kNm1hd94rK3U/vlqyQ9HILYyn3MwAwutzPXsSGB6
+g/ce3W+6xhkONbD8wklv+QGAp3VXf8uEHeQpNe72zrj10Ry3bHvoKKiNN9eJZ5R
kV4a+E5aM2/ascrog0swYB9u43letLnhqjWA7uiIpMJ8ORGdgaU9Mw8qSWsE91Z6
oPLKmze6NyK2rYp4BQVOWfWrS8wp6ADo7gcVoYyAoC2hLNyFJ2jlBoJrcNk2ucBc
KA/kz5qJq9gdO/0FiyDtI1PDByH/lXcFLA4cg6U9xLhQU3iyuAy1SJanFWuGyUZv
UqwMW5xr1APT6IFAjYVr6z2TWlZQpA==
=L9h8
-----END PGP SIGNATURE-----

--Sig_/ep4hD8O1_Ye5OWBlVzljG=G--
