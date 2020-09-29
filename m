Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2BE27C128
	for <lists+linux-next@lfdr.de>; Tue, 29 Sep 2020 11:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbgI2J3u (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Sep 2020 05:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727780AbgI2J3u (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Sep 2020 05:29:50 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB32C061755;
        Tue, 29 Sep 2020 02:29:49 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C0vHD2lSrz9ryj;
        Tue, 29 Sep 2020 19:29:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601371784;
        bh=mbSEzKb+a2dcYc2TEFEt2iBJNMB929xlTzH1z+c6Q4U=;
        h=Date:From:To:Cc:Subject:From;
        b=ff98bZNXxT/3QSsQEJrpB2s4X2IL0z905ZyKhhCt8xmVDx63AK/4/WSiXQnPgMwBE
         PPzXO+0tg1pMcnST7owavMx2SjW4i5hB8n6oIYlqEcxrNC1osyqVO1PxLiFCXqW+4q
         e0Jd/omzqLdIKj7movdvIBQvtaf54/orOb3rkzlQawWF469XfvMx7nEnlk5g4zTIxx
         8SgRPxOtthloMpASRyu0HqJuFBWyRJfnNRq7dBvKarsd7jcWHFXYXiDs9qtLf0UFNA
         5joLXJfPn+MG79rJ6JCk66TR2lLlE616rUc0zsQ7RXyd/eIJAZVr6axJi1SzKIC5Pn
         c2FAOMkVfQkCg==
Date:   Tue, 29 Sep 2020 19:29:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 29
Message-ID: <20200929192941.3a93423c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e5oDPsb1JAFu14_lsBhmSB6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/e5oDPsb1JAFu14_lsBhmSB6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20200928:

The vfs tree still had its build failure.

The net-next tree gained a build failure for which I applied a fix patch.

Non-merge commits (relative to Linus' tree): 10675
 10918 files changed, 406903 insertions(+), 204193 deletions(-)

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

I am currently merging 328 trees (counting Linus' and 86 trees of bug
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
Merging origin/master (fb0155a09b02 Merge tag 'nfs-for-5.9-3' of git://git.=
linux-nfs.org/projects/trondmy/linux-nfs)
Merging fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging kbuild-current/fixes (e30d694c3381 Documentation/llvm: Fix clang ta=
rget examples)
Merging arc-current/for-curr (db320a000251 ARC: [dts] fix the errors detect=
ed by dtbs_check)
Merging arm-current/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging arm64-fixes/for-next/fixes (75df529bec91 arm64: paravirt: Initializ=
e steal time when cpu is online)
Merging arm-soc-fixes/arm/fixes (f1466cdd82f4 Merge tag 'actions-drivers-fi=
xes-for-v5.9' of git://git.kernel.org/pub/scm/linux/kernel/git/mani/linux-a=
ctions into arm/fixes)
Merging uniphier-fixes/fixes (48778464bb7d Linux 5.8-rc2)
Merging drivers-memory-fixes/fixes (7ff3a2a626f7 memory: jz4780_nemc: Fix a=
n error pointer vs NULL check in probe())
Merging m68k-current/for-linus (382f429bb559 m68k: defconfig: Update defcon=
figs for v5.8-rc3)
Merging powerpc-fixes/fixes (0460534b532e powerpc/papr_scm: Limit the reada=
bility of 'perf_stats' sysfs attribute)
Merging s390-fixes/fixes (f7e80983f0cf s390/zcrypt: Fix ZCRYPT_PERDEV_REQCN=
T ioctl)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (0ba56b89fabc Merge branch 'net-core-fix-a-lockdep-splat=
-in-the-dev_addr_list')
Merging bpf/master (87f92ac4c127 libbpf: Fix XDP program load regression fo=
r old kernels)
Merging ipsec/master (e94ee171349d xfrm: Use correct address family in xfrm=
_state_find)
Merging netfilter/master (d30a7d54e848 selftests: netfilter: remove unused =
cnt and simplify command testing)
Merging ipvs/master (d30a7d54e848 selftests: netfilter: remove unused cnt a=
nd simplify command testing)
Merging wireless-drivers/master (efb1676306f6 mt76: mt7615: reduce maximum =
VHT MPDU length to 7991)
Merging mac80211/master (709a16be0593 r8169: fix RTL8168f/RTL8411 EPHY conf=
ig)
Merging rdma-fixes/for-rc (4aa1615268a8 RDMA/core: Fix ordering of CQ pool =
destruction)
Merging sound-current/for-linus (c413c3102703 Revert "ALSA: usb-audio: Disa=
ble Lenovo P620 Rear line-in volume control")
Merging sound-asoc-fixes/for-linus (58b819e85258 Merge remote-tracking bran=
ch 'asoc/for-5.9' into asoc-linus)
Merging regmap-fixes/for-linus (a1b8638ba132 Linux 5.9-rc7)
Merging regulator-fixes/for-linus (a1b8638ba132 Linux 5.9-rc7)
Merging spi-fixes/for-linus (b21588b7a768 Merge remote-tracking branch 'spi=
/for-5.9' into spi-linus)
Merging pci-current/for-linus (e338eecf3fe7 PCI: rockchip: Fix bus checks i=
n rockchip_pcie_valid_device())
Merging driver-core.current/driver-core-linus (856deb866d16 Linux 5.9-rc5)
Merging tty.current/tty-linus (ba4f184e126b Linux 5.9-rc6)
Merging usb.current/usb-linus (3fce39601a1a usbcore/driver: Accommodate usb=
ip)
Merging usb-gadget-fixes/fixes (51609fba0cca usb: dwc3: simple: add support=
 for Hikey 970)
Merging usb-serial-fixes/usb-linus (856deb866d16 Linux 5.9-rc5)
Merging usb-chipidea-fixes/ci-for-usb-stable (2d79b3360dcc usb: chipidea: c=
ore: add wakeup support for extcon)
Merging phy/fixes (850280156f64 phy: ti: am654: Fix a leak in serdes_am654_=
probe())
Merging staging.current/staging-linus (52a035235ed5 Merge tag 'iio-fixes-fo=
r-5.9b-take2' of https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio =
into staging-linus)
Merging char-misc.current/char-misc-linus (856deb866d16 Linux 5.9-rc5)
Merging soundwire-fixes/fixes (3fbbf2148a40 soundwire: fix double free of d=
angling pointer)
Merging thunderbolt-fixes/fixes (ba4f184e126b Linux 5.9-rc6)
Merging input-current/for-linus (6c77545af100 Input: trackpoint - add new t=
rackpoint variant IDs)
Merging crypto-current/master (1b0df11fde0f padata: fix possible padata_wor=
ks_lock deadlock)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (aae7a75a821a vfio/type1: Add proper error unw=
ind for vfio_iommu_replay())
Merging kselftest-fixes/fixes (c8bd596f9388 selftests/harness: Flush stdout=
 before forking)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (ce65d55f92a6 dmaengine: dmatest: Prevent to =
run on misconfigured channel)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (1afc0c89f6a1 Revert "mtd: spi-nor: Add capabil=
ity to disable flash quad mode")
Merging mfd-fixes/for-mfd-fixes (22380b65dc70 mfd: mfd-core: Ensure disable=
d devices are ignored without error)
Merging v4l-dvb-fixes/fixes (d0254f82d702 media: dt-bindings: media: imx274=
: Convert to json-schema)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (be090fa62080 MIPS: BCM47XX: Remove the needl=
ess check with the 1074K)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (6542e2b613c2 ARM: dts: omap5: Fix DSI base addres=
s and clocks)
Merging kvm-fixes/master (4bb05f30483f KVM: SVM: Add a dedicated INVD inter=
cept routine)
Merging kvms390-fixes/master (f20d4e924b44 docs: kvm: add documentation for=
 KVM_CAP_S390_DIAG318)
Merging hwmon-fixes/hwmon (18360b33a071 hwmon: (w83627ehf) Fix a resource l=
eak in probe)
Merging nvdimm-fixes/libnvdimm-fixes (88b67edd7247 dax: Fix compilation for=
 CONFIG_DAX && !CONFIG_FS_DAX)
Merging btrfs-fixes/next-fixes (8dc572e81eec Merge branch 'misc-5.9' into n=
ext-fixes)
Merging vfs-fixes/fixes (933a3752babc fuse: fix the ->direct_IO() treatment=
 of iov_iter)
Merging dma-mapping-fixes/for-linus (892fc9f6835e dma-pool: Fix an uninitia=
lized variable bug in atomic_pool_expand())
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (938835aa903a platform/x86: intel_pmc_core:=
 do not create a static struct device)
Merging samsung-krzk-fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging devicetree-fixes/dt/linus (7e2521a85c98 scripts/dtc: only append to=
 HOST_EXTRACFLAGS instead of overwriting)
Merging scsi-fixes/fixes (149415586243 scsi: target: Fix lun lookup for TAR=
GET_SCF_LOOKUP_LUN_FROM_TAG case)
Merging drm-fixes/drm-fixes (a1b8638ba132 Linux 5.9-rc7)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (a1b8638ba132 Linux 5.9-rc7)
Merging mmc-fixes/fixes (afd7f30886b0 mmc: sdhci: Workaround broken command=
 queuing on Intel GLK based IRBIS models)
Merging rtc-fixes/rtc-fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging gnss-fixes/gnss-linus (48778464bb7d Linux 5.8-rc2)
Merging hyperv-fixes/hyperv-fixes (911e1987efc8 Drivers: hv: vmbus: Add tim=
eout to vmbus_wait_for_unload)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (d5be89a8d118 RISC-V: Resurrect the MMIO timer i=
mplementation for M-mode systems)
Merging pidfd-fixes/fixes (bda4c60d02e9 sys: Convert to the new fallthrough=
 notation)
Merging fpga-fixes/fixes (8614afd689df fpga: dfl: fix bug in port reset han=
dshake)
Merging spdx/spdx-linus (5ec4f0ce4221 net/mlx5: IPsec: make spdxcheck.py ha=
ppy)
Merging gpio-intel-fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging pinctrl-intel-fixes/fixes (3488737093e7 pinctrl: cherryview: Preser=
ve CHV_PADCTRL1_INVRXTX_TXDATA flag on GPIOs)
Merging erofs-fixes/fixes (9ebcfadb0610 Linux 5.8-rc3)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (67e2fae3b767 kunit: tool: fix --alltests f=
lag)
Merging ubifs-fixes/fixes (121b8fcbf988 ubifs: setflags: Don't show error m=
essage when vfs_ioc_setflags_prepare() fails)
Merging memblock-fixes/fixes (5f7b81c18366 ia64: fix min_low_pfn/max_low_pf=
n build errors)
Merging drm-misc-fixes/for-linux-next-fixes (5af08640795b fbcon: Fix global=
-out-of-bounds read in fbcon_get_font())
Merging kspp-gustavo/for-next/kspp (cb0938372de0 Merge branch 'for-next/cla=
ng' into for-next/kspp)
Merging kbuild/for-next (e42c8717dace Merge branch 'kconfig' into for-next)
Merging compiler-attributes/compiler-attributes (e5fc436f06ee sparse: use s=
tatic inline for __chk_{user,io}_ptr())
Merging dma-mapping/for-next (c51a9868d361 firewire-ohci: use dma_alloc_pag=
es)
Merging asm-generic/master (060dc911501f nds32: fix build failure caused by=
 page table folding updates)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (adc5f7029376 ARM: add malloc size to decompressor kex=
ec size structure)
Merging arm64/for-next/core (1a59d9ff29a0 Merge branch 'for-next/mte' into =
for-next/core)
Merging arm-perf/for-next/perf (d8f6267f7ce5 arm_pmu: arm64: Use NMIs for P=
MU)
Merging arm-soc/for-next (182e2c08a87a ARM: Document merges)
Merging amlogic/for-next (e40c6f685cc6 Merge branch 'v5.10/drivers' into tm=
p/aml-rebuild)
Merging aspeed/for-next (48127d01a153 Merge branch 'soc-for-v5.10' into for=
-next)
Merging at91/at91-next (d1f170f8447d Merge branches 'at91-soc' and 'at91-dt=
' into at91-next)
Merging drivers-memory/for-next (94ca85733699 memory: emif: Convert to DEFI=
NE_SHOW_ATTRIBUTE)
Merging imx-mxs/for-next (bc421f7da477 Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (703dff8cb900 Merge branch 'for_5.10/drivers-soc' int=
o next)
Merging mediatek/for-next (b05dfbba9c46 Merge branch 'v5.9-next/soc' into f=
or-next)
Merging mvebu/for-next (68892adbb39a Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (aadc9c01ed69 Merge branch 'omap-for-v5.10/dt' into f=
or-next)
Merging qcom/for-next (abea2a011c54 Merge branches 'arm64-for-5.10', 'arm64=
-defconfig-for-5.10' and 'drivers-for-5.10' into for-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging raspberrypi/for-next (4564363351e2 ARM: dts: bcm2711: Enable the di=
splay pipeline)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (1ff27687ae7e Merge branch 'renesas-fixes-for-v5.9' in=
to renesas-next)
Merging reset/reset/next (68a215164e19 reset: sti: reset-syscfg: fix struct=
 description warnings)
CONFLICT (content): Merge conflict in drivers/reset/reset-imx7.c
Merging rockchip/for-next (ba0ceb95f560 Merge branch 'v5.10-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (9cce89dffafa Merge branch 'next/dt' into for=
-next)
Merging scmi/for-linux-next (a1b8638ba132 Linux 5.9-rc7)
Merging sunxi/sunxi/for-next (a01689716384 Merge branch 'sunxi/dt-for-5.10'=
 into sunxi/for-next)
Merging tegra/for-next (9ea55312ba10 Merge branch for-5.10/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (278901327ca6 Merge branch 'ti-k3-dts-next' in=
to ti-k3-next)
Merging uniphier/for-next (4f8fb65af529 Merge branch 'dt64' into for-next)
Merging clk/clk-next (426eab515007 Merge branch 'clk-rockchip' into clk-nex=
t)
Merging clk-samsung/for-next (ff8e0ff9b996 clk: samsung: Use cached clk_hws=
 instead of __clk_lookup() calls)
Merging csky/linux-next (bdcd93ef9afb csky: Add context tracking support)
Merging h8300/h8300-next (8808515be0ed h8300: Replace <linux/clk-provider.h=
> by <linux/of_clk.h>)
Merging ia64/next (c331649e6371 ia64: Use libata instead of the legacy ide =
driver in defconfigs)
Merging m68k/for-next (50c5feeea0af ide/macide: Convert Mac IDE driver to p=
latform driver)
Merging m68knommu/for-next (af1e432b6a7c m68knommu: include SDHC support on=
ly when hardware has it)
CONFLICT (content): Merge conflict in arch/m68k/Kconfig
Merging microblaze/next (4a17e8513376 microblaze: fix kbuild redundant file=
 warning)
Merging mips/mips-next (925b68822397 MIPS: idle: Add prototype for function=
 check_wait)
Merging nds32/next (54bde873682b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (55b2662ec665 openrisc: uaccess: Add user address=
 space check to access_ok)
Merging parisc-hd/for-next (c71fcd3c4fcf parisc: disable CONFIG_IDE in defc=
onfigs)
Merging powerpc/next (ebbfeef0d809 powerpc/32: Declare stack_overflow_excep=
tion() prototype)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (d97b957e32b1 soc: fsl: qe: Remove unnessesary check i=
n ucc_set_tdm_rxtx_clk)
Merging risc-v/for-next (54701a0d12e2 RISC-V: Fix duplicate included thread=
_info.h)
Merging s390/for-next (5a3b83f30b5f Merge branch 'features' into for-next)
Merging sh/for-next (b0cfc315ff38 sh: fix syscall tracing)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (f6e8c474390b um: virtio: Replace zero-length array =
with flexible-array)
Merging xtensa/xtensa-for-next (4ca4c562efb6 xtensa: uaccess: Add missing _=
_user to strncpy_from_user() prototype)
Merging fscrypt/master (5b2a828b98ec fscrypt: export fscrypt_d_revalidate())
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (d6e05fb2b680 Merge branch 'for-next-next-v5.9-20200=
923' into for-next-20200923)
CONFLICT (content): Merge conflict in fs/btrfs/dev-replace.c
Merging ceph/master (f44d04e696fe rbd: require global CAP_SYS_ADMIN for map=
ping and unmapping)
Merging cifs/for-next (76be5a01a6c3 cifs: update internal module version nu=
mber)
Merging configfs/for-next (059ccbfff8a8 configfs: use flush file op to comm=
it writes to a binary file)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (6ea5aad32dd8 erofs: add REQ_RAHEAD flag to readahead req=
uests)
Merging exfat/dev (dce83b6b0a03 exfat: remove 'rwoffset' in exfat_inode_inf=
o)
Merging ext3/for_next (4443390e08d3 reiserfs: Initialize inode keys properl=
y)
Merging ext4/dev (27bc446e2def ext4: limit the length of per-inode prealloc=
 list)
Merging f2fs/dev (ef571f530032 f2fs: remove unneeded parameter in find_in_b=
lock())
Merging fsverity/fsverity (f3db0bed4583 fs-verity: use smp_load_acquire() f=
or ->i_verity_info)
Merging fuse/for-next (d78092e4937d fuse: fix page dereference after free)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (fb0155a09b02 Merge tag 'nfs-for-5.9-3' of git://git=
.linux-nfs.org/projects/trondmy/linux-nfs)
Merging nfs-anna/linux-next (d8b15267af18 nfs: remove incorrect fallthrough=
 label)
Merging nfsd/nfsd-next (856deb866d16 Linux 5.9-rc5)
Merging cel/cel-next (13a9a9d74d4d SUNRPC: Fix svc_flush_dcache())
Merging orangefs/for-next (e848643b524b orangefs: remove unnecessary assign=
ment to variable ret)
Merging overlayfs/overlayfs-next (8f6ee74c2786 ovl: rearrange ovl_can_list(=
))
Merging ubifs/next (b30e2238b7ff ubifs: Fix some kernel-doc warnings in tnc=
.c)
Merging v9fs/9p-next (2ed0b7578170 9p: Remove unneeded cast from memory all=
ocation)
Merging xfs/for-next (fe341eb151ec xfs: ensure that fpunch, fcollapse, and =
finsert operations are aligned to rt extent size)
Merging zonefs/for-next (48bfd5c6fac1 zonefs: document the explicit-open mo=
unt option)
Merging iomap/iomap-for-next (1a31182edd00 iomap: Call inode_dio_end() befo=
re generic_write_sync())
Merging djw-vfs/vfs-for-next (e4f9ba20d3b8 fs/xfs: Update xfs_ioctl_setattr=
_dax_invalidate())
Merging file-locks/locks-next (1ad5f100e3ba locks: Remove extra "0x" in tra=
cepoint format specifier)
Merging vfs/for-next (e62cd5eb88e6 Merge branch 'work.misc' into for-next)
CONFLICT (content): Merge conflict in arch/s390/include/asm/checksum.h
CONFLICT (content): Merge conflict in arch/m68k/Kconfig
Applying: iov_iter: fix build when CONFIG_COMPAT is not set
Merging printk/for-next (6579e79e7a8a Merge branch 'printk-rework' into for=
-next)
Merging pci/next (3ef0a955e2e0 Merge branch 'remotes/lorenzo/pci/xilinx')
CONFLICT (content): Merge conflict in drivers/pci/controller/dwc/pci-imx6.c
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/freescale/fsl-ls1=
088a.dtsi
Merging pstore/for-next/pstore (137c6236aeec mailmap: Add WeiXiong Liao)
CONFLICT (content): Merge conflict in .mailmap
Merging hid/for-next (5fcdafd39b50 Merge branch 'for-5.9/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (d68387642d8e Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (cc3a392d69b6 i3c: master: fix for SETDASA and DAA pro=
cess)
Merging dmi/dmi-for-next (a3d13a0a23ea Replace HTTP links with HTTPS ones: =
DMI/SMBIOS SUPPORT)
Merging hwmon-staging/hwmon-next (df885d912f67 hwmon: (adm9240) Convert to =
regmap)
Merging jc_docs/docs-next (e0bc9cf0a7d5 docs: trace: ring-buffer-design.rst=
: use the new SPDX tag)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging v4l-dvb/master (c0c8db7bc953 media: MAINTAINERS: remove Maxime Jour=
dan as maintainer of Amlogic VDEC)
Merging v4l-dvb-next/master (0d6db85131e0 Revert "media: atomisp: keep the =
ISP powered on when setting it")
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (eb6335b68ce3 Merge branch 'pnp' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (bc9b9c5ab9d8 cpufreq: qcom: Don=
't add frequencies without an OPP)
Merging cpupower/cpupower (527b7779e5ec cpupower: speed up generating git v=
ersion string)
Merging devfreq/devfreq-next (f47f9e822568 PM / devfreq: tegra30: Improve i=
nitial hardware resetting)
Merging opp/opp/linux-next (a5663c9b1e31 opp: Allow opp-level to be set to =
0)
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
Merging rdma/for-next (3de3c4785b10 RDMA/efa: Drop double zeroing for sg_in=
it_table())
Merging net-next/master (280095713ce2 Merge branch 'ibmvnic-refactor-some-s=
end-handle-functions')
CONFLICT (content): Merge conflict in drivers/net/phy/Kconfig
Applying: merge fix for "mdio: fix mdio-thunder.c dependency & build error"
Applying: fix up for "net: core: introduce struct netdev_nested_priv for ne=
sted interface infrastructure"
Merging bpf-next/master (bc6009086588 Merge branch 'libbpf: BTF writer APIs=
')
Merging ipsec-next/master (61e7113e48d3 Merge 'xfrm: Add compat layer')
Merging mlx5-next/mlx5-next (9d8feb460adb RDMA/mlx5: Add sw_owner_v2 bit ca=
pability)
Merging netfilter-next/master (18cd9b00fffe ipvs: Remove unused macros)
Merging ipvs-next/master (3fc826f121d8 Merge branch 'net-dsa-bcm_sf2-Additi=
onal-DT-changes')
Merging wireless-drivers-next/master (0675c285ea65 net: vlan: Fixed signedn=
ess in vlan_group_prealloc_vid())
Merging bluetooth/master (b560a208cda0 Bluetooth: MGMT: Fix not checking if=
 BT_HS is enabled)
Merging mac80211-next/master (f5bec330e301 nl80211: extend support to confi=
g spatial reuse parameter set)
Merging gfs2/for-next (4d53c8279a20 gfs2: call truncate_inode_pages_final f=
or address space glocks)
Merging mtd/mtd/next (670c898cee31 mtd: spear_smi: use for_each_child_of_no=
de() macro)
Merging nand/nand/next (1c7a273925ee mtd: onenand: simplify the return expr=
ession of onenand_transfer_auto_oob)
Merging spi-nor/spi-nor/next (e93a977367b2 mtd: revert "spi-nor: intel: pro=
vide a range for poll_timout")
Merging crypto/master (0b7e44d39c8a integrity: Asymmetric digsig supports S=
M2-with-SM3 algorithm)
CONFLICT (content): Merge conflict in drivers/crypto/Kconfig
Merging drm/drm-next (06c14f5c2d31 Merge tag 'mediatek-drm-next-5.10' of ht=
tps://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux into drm-n=
ext)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/selftests/mock_g=
em_device.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_con=
text.c
Applying: mark DRM_INGENIC as BROKEN
Merging amdgpu/drm-next (f4a336053725 drm/amdgpu/display: fix CFLAGS setup =
for DCN30)
Merging drm-intel/for-linux-next (ef80c1a1d21b drm/i915: Fix state checker =
hw.active/hw.enable readout)
Merging drm-tegra/drm/tegra/for-next (d9f980ebcd01 drm/tegra: output: rgb: =
Wrap directly-connected panel into DRM bridge)
Merging drm-misc/for-linux-next (de1945613597 drm/vc4: kms: Assign a FIFO t=
o enabled CRTCs instead of active)
Merging drm-msm/msm-next (d1ea91492585 drm/msm/dp: fix incorrect function p=
rototype of dp_debug_get())
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (efd5a93d2a89 drm/imx: drop explicit drm_mode_=
config_cleanup)
Merging etnaviv/etnaviv/next (3136fed4f91e drm/etnaviv: Drop local dma_parm=
s)
Merging regmap/for-next (3ea4a8eab86e Merge remote-tracking branch 'regmap/=
for-5.10' into regmap-next)
Merging sound/for-next (502f389a0fd2 ALSA: hda - remove kerneldoc for inter=
nal hdac_i915 function)
Merging sound-asoc/for-next (5d11f297dfcd Merge remote-tracking branch 'aso=
c/for-5.10' into asoc-next)
Merging modules/modules-next (14721add58ef module: Add more error message f=
or failed kernel module loading)
Merging input/next (2c2b364fddd5 Input: joystick - add ADC attached joystic=
k driver.)
Merging block/for-next (0678846ad55d Merge branch 'for-5.10/drivers' into f=
or-next)
Merging device-mapper/for-next (b1dadb8f3c4e dm snap persistent: simplify a=
rea_io())
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (764384d06403 mmc: sdhci_am654: Enable tuning for SDR50)
CONFLICT (content): Merge conflict in drivers/mmc/host/Kconfig
Merging mfd/for-mfd-next (59306d7db654 mfd: sprd: Add wakeup capability for=
 PMIC IRQ)
Merging backlight/for-backlight-next (7eb99a39ef76 video: backlight: cr_bll=
cd: Remove unused variable 'intensity')
Merging battery/for-next (d8483f31487c dt-bindings: power: supply: Cleanup =
charger-manager bindings)
Merging regulator/for-next (7e3d84c7536c Merge remote-tracking branch 'regu=
lator/for-5.10' into regulator-next)
Merging security/next-testing (bc62d68e2a0a device_cgroup: Fix RCU list deb=
ugging warning)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (aa662fc04f5b ima: Fix NULL pointer derefe=
rence in ima_file_hash)
Merging keys/keys-next (b6f61c314649 keys: Implement update for the big_key=
 type)
Merging safesetid/safesetid-next (0476c865ded6 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (8861d0af642c selinux: Add helper functions to get and=
 set checkreqprot)
Merging smack/next (bf0afe673b99 Smack: Fix build when NETWORK_SECMARK is n=
ot set)
Merging tomoyo/master (5384d92e4e02 tomoyo: Loosen pathname/domainname vali=
dation.)
Merging tpmdd/next (eb8b1a24ff23 tpm: use %*ph to print small buffer)
Merging watchdog/master (a1b8638ba132 Linux 5.9-rc7)
Merging iommu/next (530e6e5ac27d Merge branches 'iommu/fixes', 'arm/allwinn=
er', 'arm/mediatek', 'arm/renesas', 'arm/tegra', 'arm/qcom', 'ppc/pamu', 'x=
86/amd', 'x86/vt-d' and 'core' into next)
Applying: merge fix upt for iommu_flush_iotlb_all() rename
Merging vfio/next (3de066f8f86b Merge branches 'v5.10/vfio/bardirty', 'v5.1=
0/vfio/dma_avail', 'v5.10/vfio/misc', 'v5.10/vfio/no-cmd-mem' and 'v5.10/vf=
io/yan_zhao_fixes' into v5.10/vfio/next)
CONFLICT (content): Merge conflict in arch/s390/pci/pci_bus.c
Merging audit/next (c07203516439 audit: Remove redundant null check)
Merging devicetree/for-next (eab1de67d292 dt-bindings: sp804: add support f=
or Hisilicon sp804 timer)
Merging mailbox/mailbox-for-next (884996986347 mailbox: mediatek: cmdq: cle=
ar task in channel before shutdown)
Merging spi/for-next (05f488639208 Merge remote-tracking branch 'spi/for-5.=
10' into spi-next)
Merging tip/auto-latest (0248dedd12d4 Merge branch 'linus')
CONFLICT (content): Merge conflict in drivers/pci/controller/vmd.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdkfd/kfd_priv.h
CONFLICT (content): Merge conflict in arch/x86/kernel/apic/msi.c
CONFLICT (content): Merge conflict in arch/s390/Kconfig
CONFLICT (content): Merge conflict in arch/ia64/Kconfig
CONFLICT (content): Merge conflict in arch/arm/Makefile
Merging clockevents/timers/drivers/next (f087e452f27e clocksource: sp804: e=
nable Hisilicon sp804 timer 64bit mode)
Merging edac/edac-for-next (34e06e4faf3f Merge branch 'edac-misc' into edac=
-for-next)
Merging irqchip/irq/irqchip-next (9b64efa83726 Merge branch 'irq/ipi-as-irq=
', remote-tracking branches 'origin/irq/dw' and 'origin/irq/owl' into irq/i=
rqchip-next)
Merging ftrace/for-next (fd264ce96c38 Documentation: tracing: Add the start=
up timing of boot-time tracing)
Merging rcu/rcu/next (f794b4082071 locktorture: Invoke percpu_free_rwsem() =
to do percpu-rwsem cleanup)
Merging kvm/linux-next (e792415c5d3e KVM: MIPS/VZ: Fix build error caused b=
y 'kvm_run' cleanup)
Merging kvm-arm/next (41fa0f597150 Merge branch 'kvm-arm64/misc-5.10' into =
kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (cf59eb13e151 KVM: PPC: Book3S: Fix symbol und=
eclared warnings)
Merging kvms390/next (23a60f834406 s390/kvm: diagnose 0x318 sync and reset)
Merging xen-tip/linux-next (9e2369c06c8a xen: add helpers to allocate unpop=
ulated memory)
Merging percpu/for-next (eff623d602db Merge branch 'for-5.9-fixes' into for=
-next)
Merging workqueues/for-next (10cdb1575954 workqueue: use BUILD_BUG_ON() for=
 compile time test instead of WARN_ON())
Merging drivers-x86/for-next (938835aa903a platform/x86: intel_pmc_core: do=
 not create a static struct device)
Merging chrome-platform/for-next (6b194ee98646 platform/chrome: cros_ec_pro=
to: Drop cros_ec_cmd_xfer())
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (1a351609f0bd ledtrig-cpu: Limit to 8 CPUs)
Merging ipmi/for-next (42d8a346c5c0 ipmi: add retry in try_get_dev_id())
Merging driver-core/driver-core-next (e5e5fcef600e dyndbg: use keyword, arg=
 varnames for query term pairs)
Merging usb/usb-next (bf1c67449833 USB: cdc-acm: clean up no-union-descript=
or handling)
CONFLICT (content): Merge conflict in drivers/pci/controller/pcie-brcmstb.c
Merging usb-gadget/next (1b28687a9c67 usb: dwc3: gadget: Rename misleading =
function names)
CONFLICT (content): Merge conflict in drivers/usb/dwc3/gadget.c
CONFLICT (content): Merge conflict in drivers/usb/cdns3/gadget.c
Merging usb-serial/usb-next (856deb866d16 Linux 5.9-rc5)
Merging usb-chipidea-next/ci-for-usb-next (71ac680e6339 usb: chipidea: ci_h=
drc_imx: restore pinctrl)
Merging phy-next/next (7612f4e2bc0e phy: qcom-qmp: Add support for sc7180 D=
P phy)
Merging tty/tty-next (988d0763361b vt_ioctl: make VT_RESIZEX behave like VT=
_RESIZE)
Merging char-misc/char-misc-next (fc9eec4d6435 nvmem: core: fix possibly me=
mleak when use nvmem_cell_info_to_nvmem_cell())
Merging extcon/extcon-next (8ce177237d90 extcon: axp288: Use module_platfor=
m_driver to simplify the code)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging soundwire/next (0173f525b2c1 soundwire: sysfs: add slave status and=
 device number before probe)
Merging thunderbolt/next (810278da901c thunderbolt: Capitalize comment on t=
op of QUIRK_FORCE_POWER_LINK_CONTROLLER)
Merging staging/staging-next (eca1d82ea858 staging: rtl8188eu: Reapply "sta=
ging:r8188eu: Use lib80211 to encrypt (CCMP) tx frames")
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (86d6e5793e0f interconnect: imx: simplify the return e=
xpression of imx_icc_unregister)
Merging dmaengine/next (da75ba248265 dmaengine: dmatest: Return boolean res=
ult directly in filter())
Merging cgroup/for-next (936f2a70f207 cgroup: add cpu.stat file to root cgr=
oup)
Merging scsi/for-next (fd9863c8ea0e Merge branch 'fixes' into for-next)
CONFLICT (content): Merge conflict in drivers/scsi/aacraid/aachba.c
Merging scsi-mkp/for-next (c1a3bf99d76e scsi: ufs-mediatek: dt-bindings: Ad=
d mt8192-ufshci compatible string)
Merging vhost/linux-next (8a7c3213db06 vdpa/mlx5: fix up endian-ness for mt=
u)
Merging rpmsg/for-next (62180d7eae2f Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (764e64fcda54 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (587823d39f85 gpiolib: check for parent dev=
ice in devprop_gpiochip_set_names())
Merging gpio-intel/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging pinctrl/for-next (abcef6a24347 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (a0bf06dc51db pinctrl: cherryview: Preserve =
CHV_PADCTRL1_INVRXTX_TXDATA flag on GPIOs)
Merging pinctrl-samsung/for-next (9123e3a74ec7 Linux 5.9-rc1)
Merging pwm/for-next (1f2bd2271a10 pwm: Allow store 64-bit duty cycle from =
sysfs interface)
Merging userns/for-next (7fce69dff8db Implement kernel_execve)
Merging ktest/for-next (ff131efff141 ktest.pl: Fix spelling mistake "Cant" =
-> "Can't")
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (ab535b27a586 Revert "selftests/run_kselftest.sh: ma=
ke each test individually selectable")
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (59fc1e476962 Merge branch 'for-5.10/flive-pa=
tching' into for-next)
Merging coresight/next (6bc1d1906065 coresight: etm4x: Fix save and restore=
 of TRCVMIDCCTLR1 register)
Merging rtc/rtc-next (0026f1604c9b rtc: ds1307: enable rx8130's backup batt=
ery, make it chargeable optionally)
Merging nvdimm/libnvdimm-for-next (03b68d5d7d4b Merge branch 'for-5.9/copy_=
mc' into libnvdimm-for-next)
Merging at24/at24/for-next (61f764c307f6 eeprom: at24: Support custom devic=
e names for AT24 EEPROMs)
Merging ntb/ntb-next (b8e2c8bbdf77 NTB: Use struct_size() helper in devm_kz=
alloc())
Merging seccomp/for-next/seccomp (c3c9c2df3636 seccomp: Move config option =
SECCOMP to arch/Kconfig)
Merging kspp/for-next/kspp (55dde35fdb7f overflow: Add __must_check attribu=
te to check_*() helpers)
Merging gnss/gnss-next (48778464bb7d Linux 5.8-rc2)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (1cf257875246 slimbus: qcom-ngd-ctrl: disable ngd =
in qmi server down callback)
Merging nvmem/for-next (02200a863b9a nvmem: core: fix missing of_node_put()=
 in of_nvmem_device_get())
Merging xarray/xarray (27586ca786a7 XArray: Handle retry entries within xas=
_find_marked)
Merging hyperv/hyperv-next (1f3aed01473c hv: clocksource: Add notrace attri=
bute to read_hv_sched_clock_*() functions)
Merging auxdisplay/auxdisplay (46d4a403a04c auxdisplay: Replace HTTP links =
with HTTPS ones)
Merging kgdb/kgdb/for-next (1fd112a3759b kernel: debug: Centralize dbg_[de]=
activate_sw_breakpoints)
Merging pidfd/for-next (e06ce5515b74 Merge branch 'pidfd_o_nonblock' into f=
or-next)
Merging hmm/hmm (9123e3a74ec7 Linux 5.9-rc1)
Merging fpga/for-next (9ba3a0aa09fe fpga: dfl: create a dfl bus type to sup=
port DFL devices)
Merging kunit/test (9123e3a74ec7 Linux 5.9-rc1)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (11399346ac39 mtd: Replace zero-length array with flex=
ible-array)
Merging kunit-next/kunit (9123e3a74ec7 Linux 5.9-rc1)
Merging trivial/for-next (2a9b29b28983 xtensa: fix Kconfig typo)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (6c4d313c5e3a net: qrtr: Start MHI channels during ini=
t)
Applying: fix up for "ath11k: register MHI controller device for QCA6390"
Merging notifications/notifications-pipe-core (841a0dfa5113 watch_queue: sa=
mple: Display mount tree change notifications)
Merging memblock/for-next (762d4d1a174c arch/ia64: Restore arch-specific pg=
d_offset_k implementation)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging akpm-current/current (cf6576ff4b27 x86: add failure injection to ge=
t/put/clear_user)
CONFLICT (content): Merge conflict in mm/page-writeback.c
CONFLICT (content): Merge conflict in mm/filemap.c
CONFLICT (content): Merge conflict in drivers/acpi/numa/hmat.c
CONFLICT (content): Merge conflict in arch/powerpc/platforms/pseries/hotplu=
g-memory.c
CONFLICT (content): Merge conflict in arch/powerpc/mm/kasan/kasan_init_32.c
CONFLICT (content): Merge conflict in arch/arm64/mm/mmu.c
Applying: merge fix up for "mm/memremap_pages: convert to 'struct range'"
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (aaa8254fe967 secretmem: test: add basic selftest for m=
emfd_secret(2))

--Sig_/e5oDPsb1JAFu14_lsBhmSB6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9y/oUACgkQAVBC80lX
0GzcUwf/WmAmS1U+YD/IDtufxH/A4FnnUVOIiIW664ok4O49l8nQbc3T7uFghE1F
RKa8bmWEcTgsDz4B9u8MhHPmIPoq3MyJS5iLf8lRR0baYWkFC1aHPuf6dx0q/NYY
AjmhGzpkR9CsGSpXX+ZDWhHUTGCoTCEAkAQIJT08dM+xU6T5GdPDF3rv/EWs/Lg+
bqYd951H4WBmc9W4lZaOrDIIL46WIMib3sWCqjErVgL4pqC8XgNqKhpM9Bz7HXEe
dA3xq/1vEHbI3qHXrGiLL1k+APPbhduybMli7f2p2PacV98KhgfKD6gNaSYQqCtU
XXGlQTbviz/LW9TsnkeCXSlPniCk+A==
=W6xN
-----END PGP SIGNATURE-----

--Sig_/e5oDPsb1JAFu14_lsBhmSB6--
