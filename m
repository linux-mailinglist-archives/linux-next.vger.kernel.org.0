Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F19E4DBDFC
	for <lists+linux-next@lfdr.de>; Fri, 18 Oct 2019 09:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409573AbfJRHDK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Oct 2019 03:03:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44433 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409557AbfJRHDJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 18 Oct 2019 03:03:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46vcS535F4z9sCJ;
        Fri, 18 Oct 2019 18:03:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571382181;
        bh=hKJ/kzP+1CiFuujx4j0u8GtYM3FyWNNRoQ4sO9JOWws=;
        h=Date:From:To:Cc:Subject:From;
        b=FVq2D1aFRbzPXqqvjKjFmdeFtHAid6OUzNpuzZPI/MogiCxnzYUY9t04WPaqfZnDs
         gH/Xgfc0kWaHhcwzAWZfcLdVbQTthtukCmPB31ti2363mySPrSdgM6z+blsgi1pDVR
         zKtMX33LtKva9hAVjzWJYCM++kQt0FiTdZrtQTAlLE1Ryz4sjfRSGWUYQf8LRtreg4
         Kzx0iRJdraE1HEtUp8IocglI694cJ63pntqX33+7fQ35GsB2EtsPCDX/wbQXKavcXG
         B9eCq/paJEtpsyLH/4ZOC/nFAGZ5/zQOTzPznTkc5low/lZUkeaaMR9D12qEdiBa9p
         MMmvROaDHgCjA==
Date:   Fri, 18 Oct 2019 18:03:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 18
Message-ID: <20191018180300.090dbcb9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T+mqny15+YtI6CAOjSIu616";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/T+mqny15+YtI6CAOjSIu616
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20191017:

The clk tree gained a conflict against the imx-mxs tree.

The pm tree gained a conflict against the printk tree.

The tip tree gained a conflict against the net-next tree.

The char-misc tree gained a conflict against the char-misc.current tree.

The akpm tree gained a conflict against the printk tree.

Non-merge commits (relative to Linus' tree): 4658
 4610 files changed, 160352 insertions(+), 71667 deletions(-)

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
and sparc64 defconfig. And finally, a simple boot test of the powerpc
pseries_le_defconfig kernel in qemu (with and without kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 315 trees (counting Linus' and 78 trees of bug
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
Merging origin/master (84629d4370b8 Merge branch 'for-linus' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/dtor/input)
Merging fixes/master (54ecb8f7028c Linux 5.4-rc1)
Merging kbuild-current/fixes (700dea5a0bea kheaders: substituting --sort in=
 archive creation)
Merging arc-current/for-curr (41277ba7eb4e ARC: mm: tlb flush optim: elide =
redundant uTLB invalidates for MMUv3)
Merging arm-current/fixes (4c0742f65b4e ARM: 8914/1: NOMMU: Fix exc_ret for=
 XIP)
Merging arm-soc-fixes/arm/fixes (dd163ca3fb49 Merge tag 'mvebu-fixes-5.4-1'=
 of git://git.infradead.org/linux-mvebu into arm/fixes)
Merging arm64-fixes/for-next/fixes (777d062e5bee Merge branch 'errata/tx2-2=
19' into for-next/fixes)
Merging m68k-current/for-linus (0f1979b402df m68k: Remove ioremap_fullcache=
())
Merging powerpc-fixes/fixes (2272905a4580 spufs: fix a crash in spufs_creat=
e_root())
Merging s390-fixes/fixes (062795fcdcb2 s390/uaccess: avoid (false positive)=
 compiler warnings)
Merging sparc/master (038029c03e21 sparc: remove unneeded uapi/asm/statfs.h)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (013572a236ef net: dsa: microchip: Add shared regmap mut=
ex)
Merging bpf/master (9e8acd9c44a0 bpf: lwtunnel: Fix reroute supplying inval=
id dst)
Merging ipsec/master (68ce6688a5ba net: sched: taprio: Fix potential intege=
r overflow in taprio_set_picos_per_byte)
Merging netfilter/master (503c9addef61 ptp: fix typo of "mechanism" in Kcon=
fig help text)
Merging ipvs/master (503c9addef61 ptp: fix typo of "mechanism" in Kconfig h=
elp text)
Merging wireless-drivers/master (d79749f7716d ath10k: fix latency issue for=
 QCA988x)
Merging mac80211/master (82ad862115c2 Merge branch 'smc-fixes')
Merging rdma-fixes/for-rc (0417791536ae RDMA/mlx5: Add missing synchronize_=
srcu() for MW cases)
Merging sound-current/for-linus (94989e318b2f ALSA: hda - Force runtime PM =
on Nvidia HDMI codecs)
Merging sound-asoc-fixes/for-linus (a4ff7dff4e65 Merge branch 'asoc-5.4' in=
to asoc-linus)
Merging regmap-fixes/for-linus (da0c9ea146cb Linux 5.4-rc2)
Merging regulator-fixes/for-linus (68a2d13c4d54 Merge branch 'regulator-5.4=
' into regulator-linus)
Merging spi-fixes/for-linus (09ee9e1664ba Merge branch 'spi-5.4' into spi-l=
inus)
Merging pci-current/for-linus (54ecb8f7028c Linux 5.4-rc1)
Merging driver-core.current/driver-core-linus (82af5b660967 sysfs: Fixes __=
BIN_ATTR_WO() macro)
Merging tty.current/tty-linus (f50b6805dbb9 8250-men-mcb: fix error checkin=
g when get_num_ports returns -ENODEV)
Merging usb.current/usb-linus (7a7591979748 USB: usblp: fix use-after-free =
on disconnect)
Merging usb-gadget-fixes/fixes (4a56a478a525 usb: gadget: mass_storage: Fix=
 races between fsg_disable and fsg_set_alt)
Merging usb-serial-fixes/usb-linus (bc25770f00d3 USB: serial: ti_usb_3410_5=
052: clean up serial data access)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (68eeb39a53d5 phy: qcom-usb-hs: Fix extcon double registe=
r after power cycle)
Merging staging.current/staging-linus (153c5d8191c2 staging: wlan-ng: fix e=
xit return when sme->key_idx >=3D NUM_WEPKEYS)
Merging char-misc.current/char-misc-linus (45d02f79b539 binder: Don't modif=
y VMA bounds in ->mmap handler)
Merging soundwire-fixes/fixes (0f8c0f8a7782 soundwire: depend on ACPI || OF)
Merging thunderbolt-fixes/fixes (747125db6dcd thunderbolt: Drop unnecessary=
 read when writing LC command in Ice Lake)
Merging input-current/for-linus (c324345ce89c Revert "Input: elantech - ena=
ble SMBus on new (2018+) systems")
Merging crypto-current/master (f703964fc668 crypto: arm/aes-ce - add depend=
ency on AES library)
Merging ide/master (baf6722aa0cb ide: Use dev_get_drvdata where possible)
Merging vfio-fixes/for-linus (5715c4dd66a3 vfio/mdev: Synchronize device cr=
eate/remove with parent removal)
Merging kselftest-fixes/fixes (303e6218ecec selftests: Fix O=3D and KBUILD_=
OUTPUT handling for relative paths)
Merging modules-fixes/modules-linus (fcfacb9f8374 doc: move namespaces.rst =
from kbuild/ to core-api/)
Merging slave-dma-fixes/fixes (ec1ac309596a dmaengine: sprd: Fix the possib=
le memory leak issue)
Merging backlight-fixes/for-backlight-fixes (e93c9c99a629 Linux 5.1)
Merging mtd-fixes/mtd/fixes (df8fed831cbc mtd: rawnand: au1550nd: Fix au_re=
ad_buf16() prototype)
Merging mfd-fixes/for-mfd-fixes (4d82fa67dd6b mfd: rk808: Make PM function =
declaration static)
Merging v4l-dvb-fixes/fixes (3e84a18a259e media: meson/ao-cec: move cec_not=
ifier_cec_adap_register after hw setup)
Merging reset-fixes/reset/fixes (a71dcd3757e2 reset: remove redundant null =
check on pointer dev)
Merging mips-fixes/mips-fixes (2f2b4fd674ca MIPS: Disable Loongson MMI inst=
ructions for kernel build)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (17a9e5bbbfe5 Merge tag 'wlcore-fix' into fixes)
Merging kvm-fixes/master (da0c9ea146cb Linux 5.4-rc2)
Merging kvms390-fixes/master (53936b5bf35e KVM: s390: Do not leak kernel st=
ack data in the KVM_S390_INTERRUPT ioctl)
Merging hwmon-fixes/hwmon (4f5cafb5cb84 Linux 5.4-rc3)
Merging nvdimm-fixes/libnvdimm-fixes (4c806b897d60 libnvdimm/region: Enable=
 MAP_SYNC for volatile regions)
Merging btrfs-fixes/next-fixes (9b2a091c6b3c Merge branch 'misc-5.4' into n=
ext-fixes)
Merging vfs-fixes/fixes (0ecee6699064 fs/namespace.c: fix use-after-free of=
 mount in mnt_warn_timestamp_expiry())
Merging dma-mapping-fixes/for-linus (2cf2aa6a69db dma-mapping: fix false po=
sitivse warnings in dma_common_free_remap())
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (832392db9747 platform/x86: i2c-multi-insta=
ntiate: Fail the probe if no IRQ provided)
Merging samsung-krzk-fixes/fixes (54ecb8f7028c Linux 5.4-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging devicetree-fixes/dt/linus (f437ade3296b dt-bindings: phy: lantiq: F=
ix Property Name)
Merging scsi-fixes/fixes (6a0990eaa768 scsi: ch: Make it possible to open a=
 ch device multiple times again)
Merging drm-fixes/drm-fixes (5c1e34b5159e Merge tag 'drm-misc-fixes-2019-10=
-17' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes)
Merging amdgpu-fixes/drm-fixes (c0e70e10b11b drm/amd/display: fix dcn21 Mak=
efile for clang)
Merging drm-intel-fixes/for-linux-next-fixes (0a544a2a728e drm/i915: Fixup =
preempt-to-busy vs resubmission of a virtual request)
Merging mmc-fixes/fixes (28c9fac09ab0 memstick: jmb38x_ms: Fix an error han=
dling path in 'jmb38x_ms_probe()')
Merging rtc-fixes/rtc-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging gnss-fixes/gnss-linus (54ecb8f7028c Linux 5.4-rc1)
Merging hyperv-fixes/hyperv-fixes (83b50f83a968 Drivers: hv: vmbus: Fix har=
mless building warnings without CONFIG_PM_SLEEP)
Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe=
_pin_request())
Merging risc-v-fixes/fixes (5bf4e52ff031 RISC-V: fix virtual address overla=
pped in FIXADDR_START and VMEMMAP_START)
Merging pidfd-fixes/fixes (28f9baed3d50 pidfd: avoid linux/wait.h and sys/w=
ait.h name clashes)
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (02dc96ef6c25 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/netdev/net)
Merging gpio-intel-fixes/fixes (da90555f587a gpio: merrifield: Move hardwar=
e initialization to callback)
CONFLICT (content): Merge conflict in drivers/gpio/gpio-lynxpoint.c
Merging pinctrl-intel-fixes/fixes (260996c30f4f pinctrl: cherryview: restor=
e Strago DMI workaround for all versions)
Merging erofs-fixes/fixes (da0c9ea146cb Linux 5.4-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (5b3ec8134f5f drm/panfrost: Han=
dle resetting on timeout better)
Merging kspp-gustavo/for-next/kspp (da0c9ea146cb Linux 5.4-rc2)
Merging kbuild/for-next (54d0fd65f238 modpost: do not set ->preloaded for s=
ymbols from Module.symvers)
Merging compiler-attributes/compiler-attributes (54ecb8f7028c Linux 5.4-rc1)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (c7d9eccb3c1e mmc: renesas_sdhi_internal_dmac:=
 Add MMC_CAP2_MERGE_CAPABLE)
Merging asm-generic/master (9b87647c665d asm-generic: add unlikely to defau=
lt BUG_ON(x))
Merging arc/for-next (6fbc7275c7a9 Linux 5.2-rc7)
Merging arm/for-next (ac658b7cb680 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (485fadf618d9 Merge branches 'for-next/elf-hwca=
p-docs', 'for-next/smccc-conduit-cleanup', 'for-next/zone-dma', 'for-next/r=
elax-icc_pmr_el1-sync' and 'for-next/misc' into for-next/core)
Merging arm-perf/for-next/perf (c8b0de762e0b perf/smmuv3: use devm_platform=
_ioremap_resource() to simplify code)
Merging arm-soc/for-next (843e4fa31127 Merge branch 'arm/fixes' into for-ne=
xt)
Merging actions/for-next (fb9c1c1deb5e Merge branch 'v4.20/drivers+s900-sps=
' into next)
Merging amlogic/for-next (3b2481b1af8a Merge branch 'v5.5/dt64' into tmp/am=
l-rebuild)
Merging aspeed/for-next (d547dba956ed dts: ARM: aspeed: Migrate away from a=
speed, g[45].* compatibles)
Merging at91/at91-next (ba9b1009f561 Merge branches 'at91-drivers', 'at91-s=
oc', 'at91-dt' and 'at91-defconfig' into at91-next)
Merging bcm2835/for-next (f14234184671 Merge branch 'bcm2835-maintainers-ne=
xt' into for-next)
Merging imx-mxs/for-next (1b67d0ba75fc Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (35096b5f4619 Merge branch 'for_5.5/driver-soc' into =
next)
Merging mediatek/for-next (4ae1ce88e9a0 Merge branch 'v5.3-next/soc' into f=
or-next)
Merging mvebu/for-next (3aa22be2d6b1 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (99f1f3324ae5 Merge branch 'omap-for-v5.5/pm' into fo=
r-next)
Merging qcom/for-next (5bd4bf7190ec Merge branches 'arm64-for-5.5', 'arm64-=
defconfig-for-5.5', 'defconfig-for-5.5' 'drivers-for-5.5' and 'dts-for-5.5'=
 into for-next)
Merging renesas/next (1b36aab6a7b6 Merge branch 'renesas-arm64-dt-for-v5.5'=
 into renesas-next)
Merging reset/reset/next (bdb369e1e98a reset: add support for the Meson-A1 =
SoC Reset Controller)
Merging rockchip/for-next (550e897ab346 Merge branch 'v5.5-armsoc/dts32' in=
to for-next)
Merging samsung-krzk/for-next (0228b0ee789c Merge branch 'next/defconfig' i=
nto for-next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging scmi/for-linux-next (4f5cafb5cb84 Linux 5.4-rc3)
Merging sunxi/sunxi/for-next (d49380083493 Merge branch 'sunxi/dt-for-5.5' =
into sunxi/for-next)
Merging tegra/for-next (eff2c140050c Merge branch for-5.5/arm64/dt into for=
-next)
Merging clk/clk-next (c5fd5bc400d4 Merge branch 'clk-fixes' into clk-next)
CONFLICT (content): Merge conflict in drivers/clk/imx/clk-imx8mn.c
Merging clk-samsung/for-next (a188339ca5a3 Linux 5.2-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (044cf5e15357 csky: Initial stack protector support)
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (0d3d343560ba genirq: remove the is_affinity_mask_valid h=
ook)
Merging m68k/for-next (0f1979b402df m68k: Remove ioremap_fullcache())
Merging m68knommu/for-next (09eae66f0320 m68k/coldfire: Use CONFIG_PREEMPTI=
ON)
Merging microblaze/next (39014c45467f microblaze: entry: Remove unneeded ne=
ed_resched() loop)
Merging mips/mips-next (9dd422f69777 MIPS: Make builtin_cmdline const & var=
iable length)
Merging nds32/next (932296120543 nds32: add new emulations for floating poi=
nt instruction)
Merging nios2/for-next (91d99a724e9c nios2: force the string buffer NULL-te=
rminated)
Merging openrisc/for-next (f3b17320db25 openrisc: map as uncached in iorema=
p)
Merging parisc-hd/for-next (52b2d91752a8 parisc: Do not hardcode registers =
in checksum functions)
Merging powerpc/next (612ee81b9461 powerpc/papr_scm: Fix an off-by-one chec=
k in papr_scm_meta_{get, set})
Merging fsl/next (63d86876f324 Revert "powerpc/fsl_pci: simplify fsl_pci_dm=
a_set_mask")
Merging soc-fsl/next (eadf0b17b43d bus: fsl-mc: remove explicit device_link=
_del)
Merging risc-v/for-next (9ce06497c272 irqchip/sifive-plic: set max threshol=
d for ignored handlers)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (89d0180a60fc s390/Kconfig: add z13s and z14 ZR1 to T=
UNE descriptions)
Merging sh/sh-next (baf58858e8b6 sh: prefer __section from compiler_attribu=
tes.h)
CONFLICT (modify/delete): arch/sh/include/uapi/asm/types.h deleted in sh/sh=
-next and modified in HEAD. Version HEAD of arch/sh/include/uapi/asm/types.=
h left in tree.
CONFLICT (modify/delete): arch/sh/include/uapi/asm/setup.h deleted in sh/sh=
-next and modified in HEAD. Version HEAD of arch/sh/include/uapi/asm/setup.=
h left in tree.
$ git rm -f arch/sh/include/uapi/asm/setup.h arch/sh/include/uapi/asm/types=
.h
Merging sparc-next/master (b71acb0e3721 Merge branch 'linus' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6)
Merging uml/linux-next (73625ed66389 um: irq: Fix LAST_IRQ usage in init_IR=
Q())
Merging xtensa/xtensa-for-next (d3dfad7f5d98 Merge branch 'xtensa-5.4-fixes=
' into xtensa-for-next)
Merging fscrypt/master (0642ea2409f3 ext4 crypto: fix to check feature stat=
us before get policy)
Merging afs/afs-next (a0753c29004f afs: Support RCU pathwalk)
Merging btrfs/next (29dcea88779c Linux 4.17)
Merging btrfs-kdave/for-next (d817e55254a9 Merge branch 'for-next-next-v5.4=
-20191017' into for-next-20191017)
Merging ceph/master (25e6be21230d rbd: cancel lock_dwork if the wait is int=
errupted)
Merging cifs/for-next (c53b7422df02 cifs: add support for flock)
Merging configfs/for-next (e9c03af21cc7 configfs: calculate the symlink tar=
get only once)
Merging ecryptfs/next (b4a81b87a4cf ecryptfs: fix a memory leak bug in ecry=
ptfs_init_messaging())
Merging erofs/dev (6b42c3370e83 erofs: set iowait for sync decompression)
Merging ext3/for_next (0f7dbaee76f4 Merge quota initialization check fix fr=
om Chao Yu.)
Merging ext4/dev (040823b5372b Merge tag 'unicode-next-v5.4' of https://git=
.kernel.org/pub/scm/linux/kernel/git/krisman/unicode into dev)
Merging f2fs/dev (b145b0eb2031 Merge tag 'for-linus' of git://git.kernel.or=
g/pub/scm/virt/kvm/kvm)
Merging fsverity/fsverity (95ae251fe828 f2fs: add fs-verity support)
Merging fuse/for-next (3f22c7467136 virtio-fs: don't show mount options)
Merging jfs/jfs-next (a5fdd713d256 jfs: fix bogus variable self-initializat=
ion)
Merging nfs/linux-next (4f5cafb5cb84 Linux 5.4-rc3)
Merging nfs-anna/linux-next (af84537dbd1b SUNRPC: fix race to sk_err after =
xs_error_report)
Merging nfsd/nfsd-next (5fcaf6982d11 sunrpc: fix crash when cache_head beco=
me valid before update)
Merging orangefs/for-next (e6b998ab62be orangefs: remove redundant assignme=
nt to err)
Merging overlayfs/overlayfs-next (5c2e9f346b81 ovl: filter of trusted xattr=
 results in audit)
Merging ubifs/linux-next (6a379f67454a jffs2: Fix memory leak in jffs2_scan=
_eraseblock() error path)
Merging v9fs/9p-next (aafee43b7286 9p/vfs_super.c: Remove unused parameter =
data in v9fs_fill_super)
Merging xfs/for-next (5e0cd1ef6474 xfs: change the seconds fields in xfs_bu=
lkstat to signed)
Merging iomap/iomap-for-next (906753befc4d xfs: Use iomap_dio_rw to wait fo=
r unaligned direct IO)
Merging djw-vfs/vfs-for-next (7118dd2d41af splice: only read in as much inf=
ormation as there is pipe buffer space)
Merging file-locks/locks-next (b41dae061bbd Merge tag 'xfs-5.4-merge-7' of =
git://git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging vfs/for-next (3e501af8dd7b Merge branches 'work.misc', 'work.mount3=
', 'work.namei', 'work.dcache' and 'work.autofs' into for-next)
Merging printk/for-next (bd91855d31c3 Merge branch 'for-5.5' into for-next)
Merging pci/next (444aedb8242c Merge branch 'remotes/lorenzo/pci/misc')
Merging pstore/for-next/pstore (609488bc979f Linux 5.3-rc2)
Merging hid/for-next (ced612fb3454 Merge branch 'for-5.4/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging i3c/i3c/next (f12b524ea386 i3c: master: use i3c_dev_get_master())
Merging dmi/master (c11f2bc422b9 firmware: dmi: Fix unlikely out-of-bounds =
read in save_mem_devices)
Merging hwmon-staging/hwmon-next (21a7b58ab362 hwmon: (tmp421) Allow readin=
g at 2Hz instead of 0.5Hz)
Merging jc_docs/docs-next (a016e092940f docs: admin-guide: dell_rbu: Improv=
e formatting and spelling)
CONFLICT (content): Merge conflict in Documentation/admin-guide/cgroup-v2.r=
st
Merging v4l-dvb/master (4b1d7c2760d2 media: staging: media: Make use of dev=
m_platform_ioremap_resource)
Merging v4l-dvb-next/master (167f4555184b Merge branch fixes_for_upstream i=
nto to_next)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (517775d48505 Merge branch 'acpi-cppc' into linux-nex=
t)
CONFLICT (content): Merge conflict in lib/test_printf.c
Merging cpufreq-arm/cpufreq/arm/linux-next (09865094536c ARM: dts: Add OPP-=
V2 table for AM3517)
Merging cpupower/cpupower (7e5705c635ec tools/power/cpupower: Fix initializ=
er override in hsw_ext_cstates)
Merging opp/opp/linux-next (41153c532781 PM / OPP: Support adjusting OPP vo=
ltages at runtime)
Merging thermal/thermal/linux-next (04910e267b2d thermal: qoriq: add therma=
l monitor unit version 2 support)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (812cd88749e0 firewire: mark expected switch fall=
-throughs)
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (03232cc43cff IB/mlx5: Introduce and use mkey context=
 setting helper routine)
Merging net-next/master (d9496f3ecfe4 net: netsec: Correct dma sync for XDP=
_TX frames)
CONFLICT (content): Merge conflict in tools/lib/bpf/Makefile
CONFLICT (content): Merge conflict in drivers/net/netdevsim/fib.c
Applying: rxrpc: fix up for "rxrpc: Fix trace-after-put looking at the put =
peer record"
Merging bpf-next/master (47a92ae074c3 Merge branch 'cleanup-selftests-bpf-m=
akefile')
Merging ipsec-next/master (fd1ac07f3f17 xfrm: ifdef setsockopt(UDP_ENCAP_ES=
PINUDP/UDP_ENCAP_ESPINUDP_NON_IKE))
Merging mlx5-next/mlx5-next (7d47433cf74f net/mlx5: Expose optimal performa=
nce scatter entries capability)
Merging netfilter-next/master (f8615bf8a3da netfilter: ipset: move ip_set_g=
et_ip_port() to ip_set_bitmap_port.c.)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (176a52043ab8 selftests: netfilter: add ipvs tunne=
l test case)
Merging wireless-drivers-next/master (89dca86d29b4 rtw88: mark rtw_fw_hdr _=
_packed)
Merging bluetooth/master (b9a2562f4918 Bluetooth: btusb: Trigger Intel FW d=
ownload error recovery)
Merging mac80211-next/master (7dfd8ac32730 mac80211_hwsim: add support for =
OCB)
Merging gfs2/for-next (821087444e4d gfs2: make gfs2_fs_parameters static)
Merging mtd/mtd/next (b34c095ca609 mtd: st_spi_fsm: remove unused field fro=
m struct stfsm)
Merging nand/nand/next (5121b4219972 dt-bindings: mtd: Add Cadence NAND con=
troller driver)
Merging spi-nor/spi-nor/next (4f5cafb5cb84 Linux 5.4-rc3)
Merging crypto/master (504582e8e40b crypto: geode-aes - switch to skcipher =
for cbc(aes) fallback)
Merging drm/drm-next (7ed093602e0e Merge tag 'drm-misc-next-2019-10-09-2' o=
f git://anongit.freedesktop.org/drm/drm-misc into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/selftests/i915_g=
em.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_request.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_mma=
n.c
Applying: cec: fix up for "cec: add cec_adapter to cec_notifier_cec_adap_un=
register()"
Applying: drm/i915/userptr: fix up bad automaic merge
Merging amdgpu/drm-next (4fa38f3ebd2f drm/amdgpu/powerplay: use local renoi=
r array sizes for clock fetching)
CONFLICT (content): Merge conflict in include/uapi/linux/kfd_ioctl.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/renoir_=
ppt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/amd_pow=
erplay.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm_mst_types.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdkfd/kfd_priv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdkfd/kfd_charde=
v.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_drv=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/Makefile
Merging drm-intel/for-linux-next (458863e08e13 drm/i915: Mark contents as d=
irty on a write fault)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/selftests/i915_g=
em.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_request.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_mma=
n.c
Merging drm-tegra/drm/tegra/for-next (609b7d8c1885 gpu: host1x: Make host1x=
_cdma_wait_pushbuffer_space() static)
Merging drm-misc/for-linux-next (e30b38b71294 drm/lima: add __GFP_NOWARN fl=
ag to all dma_alloc_wc)
CONFLICT (content): Merge conflict in drivers/gpu/drm/panfrost/panfrost_job=
.c
Merging drm-msm/msm-next (8856c5064834 drm/msm/mdp5: make config variables =
static)
Merging hdlcd/for-upstream/hdlcd (d664b851eb2b drm/arm/hdlcd: Reject atomic=
 commits that disable only the plane)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (4d24376370fb gpu: ipu-v3: image-convert: only=
 sample into the next tile if necessary)
Merging etnaviv/etnaviv/next (dbcc574a4bfa drm/etnaviv: fix missing unlock =
on error in etnaviv_iommuv1_context_alloc())
Merging regmap/for-next (da0c9ea146cb Linux 5.4-rc2)
Merging sound/for-next (3aac32634172 ALSA: fireface: use the same size of p=
eriod for PCM substreams in AMDTP streams)
Merging sound-asoc/for-next (94fae3e24c38 Merge branch 'asoc-5.5' into asoc=
-next)
CONFLICT (content): Merge conflict in sound/soc/samsung/Kconfig
CONFLICT (content): Merge conflict in sound/soc/intel/boards/Kconfig
Applying: ASOC: SOF: dai-imx.h needs linux/types.h
Merging modules/modules-next (54ecb8f7028c Linux 5.4-rc1)
Merging input/next (688f1dfb69b4 Input: keyboard - imx_sc: Add i.MX system =
controller key support)
Merging block/for-next (848361f33676 Merge branch 'for-5.5/io_uring' into f=
or-next)
Merging device-mapper/for-next (13bd677a472d dm cache: fix bugs when a GFP_=
NOWAIT allocation fails)
Merging pcmcia/pcmcia-next (95691e3eddc4 pcmcia: Implement CLKRUN protocol =
disabling for Ricoh bridges)
Merging mmc/next (86f294fb7949 Merge branch 'fixes' into next)
Merging kgdb/kgdb-next (3bd67b37e350 kdb: print real address of pointers in=
stead of hashed addresses)
CONFLICT (content): Merge conflict in kernel/debug/kdb/kdb_bt.c
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (38a6fc63a3ea mfd: db8500-prcmu: Example using new=
 OF_MFD_CELL/MFD_CELL_BASIC MACROs)
Merging backlight/for-backlight-next (c0b64faf0fe6 backlight: pwm_bl: Set s=
cale type for brightness curves specified in the DT)
Merging battery/for-next (f2e5c49d221b power: supply: axp20x_usb_power: ena=
ble USB BC detection on AXP813)
Merging regulator/for-next (891b853328bf Merge branch 'regulator-5.5' into =
regulator-next)
Merging security/next-testing (45893a0abee6 kexec: Fix file verification on=
 S390)
Merging apparmor/apparmor-next (136db994852a apparmor: increase left match =
history buffer size)
Merging integrity/next-integrity (2a7f0e53daf2 ima: ima_api: Use struct_siz=
e() in kzalloc())
Merging keys/keys-next (48274e1e5d24 Merge branch 'notifications-core' into=
 keys-next)
Merging selinux/next (42345b68c2e3 selinux: default_range glblub implementa=
tion)
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (79c8ca578dbf Revert "printk: Monitor change of conso=
le loglevel.")
Merging tpmdd/next (e13cd21ffd50 tpm: Wrap the buffer from the caller to tp=
m_buf in tpm_send())
Merging watchdog/master (ca2fc5efffde watchdog: f71808e_wdt: Add F81803 sup=
port)
Merging iommu/next (3c573edfb4db Merge branches 'iommu/fixes', 'arm/qcom', =
'arm/renesas', 'arm/rockchip', 'arm/mediatek', 'x86/amd', 'x86/vt-d' and 'c=
ore' into next)
Merging vfio/next (e6c5d727db0a Merge branches 'v5.4/vfio/alexey-tce-memory=
-free-v1', 'v5.4/vfio/connie-re-arrange-v2', 'v5.4/vfio/hexin-pci-reset-v3'=
, 'v5.4/vfio/parav-mtty-uuid-v2' and 'v5.4/vfio/shameer-iova-list-v8' into =
v5.4/vfio/next)
Merging audit/next (245d73698ed7 audit: Report suspicious O_CREAT usage)
Merging devicetree/for-next (e5367b4f6153 dt-bindings: gpu: samsung-rotator=
: Fix indentation)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/usb=
/generic-ehci.yaml
Merging mailbox/mailbox-for-next (556a0964e28c mailbox: qcom-apcs: fix max_=
register value)
Merging spi/for-next (11724a5ec0d9 Merge remote-tracking branch 'spi/topic/=
ptp' into spi-next)
Merging tip/auto-latest (f4feb1427b37 Merge branch 'core/objtool')
CONFLICT (content): Merge conflict in samples/bpf/Makefile
CONFLICT (content): Merge conflict in net/core/sock.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_shr=
inker.c
Applying: drm/i915: update for mutex_release API change
Merging clockevents/timers/drivers/next (97c18a4b4c87 clocksource/drivers/r=
enesas-ostm: Use unique device name instead of ostm)
Merging edac/edac-for-next (3a5e7ec9031f Merge branch 'edac-urgent' into ed=
ac-for-next)
Merging irqchip/irq/irqchip-next (bb0fed1c60cc irqchip/sifive-plic: Switch =
to fasteoi flow)
Merging ftrace/for-next (8ed4889eb831 selftests/ftrace: Fix same probe erro=
r test)
Merging rcu/rcu/next (049b405029c0 MAINTAINERS: Update from paulmck@linux.i=
bm.com to paulmck@kernel.org)
Merging kvm/linux-next (da0c9ea146cb Linux 5.4-rc2)
Merging kvm-arm/next (61f8d64aae65 arm64: KVM: Handle PMCR_EL0.LC as RES1 o=
n pure AArch64 systems)
Merging kvm-ppc/kvm-ppc-next (ff42df49e75f KVM: PPC: Book3S HV: Don't lose =
pending doorbell request on migration on P9)
Merging kvms390/next (c7b7de631246 KVM: s390: Do not yield when target is a=
lready running)
Merging xen-tip/linux-next (ee7f5225dc3c xen: Stop abusing DT of_dma_config=
ure API)
Merging percpu/for-next (69f98a60cdbb Merge branch 'for-5.4' into for-next)
Merging workqueues/for-next (30ae2fc0a75e workqueue: Minor follow-ups to th=
e rescuer destruction change)
Merging drivers-x86/for-next (fd13c8622a5a platform/x86: Add System76 ACPI =
driver)
Merging chrome-platform/for-next (fdf0fe2df3e3 platform/chrome: wilco_ec: A=
dd Dell's USB PowerShare Policy control)
Merging hsi/for-next (c1030cd45619 HSI: Remove dev_err() usage after platfo=
rm_get_irq())
Merging leds/for-next (448d6fcb7a52 leds: pca953x: Use of_device_get_match_=
data())
Merging ipmi/for-next (639fd6aa499a ipmi: bt-bmc: use devm_platform_ioremap=
_resource() to simplify code)
Merging driver-core/driver-core-next (a3caeb8ffe5d docs: driver-model: Add =
documentation for sync_state)
Merging usb/usb-next (abb0b3d96a1f usb: usbfs: Suppress problematic bind an=
d unbind uevents.)
Merging usb-gadget/next (18a93cd38be3 usb: gadget: net2280: Add workaround =
for AB chip Errata 11)
Merging usb-serial/usb-next (4f5cafb5cb84 Linux 5.4-rc3)
Merging usb-chipidea-next/ci-for-usb-next (973ce009b308 usb: chipidea: imx:=
 check data->usbmisc_data against NULL before access)
Merging phy-next/next (54ecb8f7028c Linux 5.4-rc1)
Merging tty/tty-next (9905f32aefbe serial: fsl_linflexuart: Be consistent w=
ith the name)
Merging char-misc/char-misc-next (990be7476485 binder: Use common definitio=
n of SZ_1K)
CONFLICT (content): Merge conflict in drivers/android/binder.c
Merging extcon/extcon-next (6942635032cf extcon: sm5502: Reset registers du=
ring initialization)
Merging soundwire/next (2948d1921693 soundwire: intel: remove X86 dependenc=
y)
Merging thunderbolt/next (b406357c572b thunderbolt: Add 'generation' attrib=
ute for devices)
Merging staging/staging-next (8193e6ad6916 staging: sm750fb: Fix lines over=
 80 characters)
Merging mux/for-next (05fb8284a417 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (44223a8b45d7 interconnect: qcom: Fix icc_onecell_data=
 allocation)
Merging slave-dma/next (7fdf9b05c73b dmaengine: fsl-dpaa2-qdma: Add NXP dpa=
a2 qDMA controller driver for Layerscape SoCs)
Merging cgroup/for-next (1a99fcc035fb selftests: cgroup: Run test_core unde=
r interfering stress)
Merging scsi/for-next (1b513cb52fbc Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (b3f5ef872422 Merge branch '5.4/scsi-fixes' into =
5.5/scsi-next)
Merging vhost/linux-next (32a1c795917b vhost: last descriptor must have NEX=
T clear)
Merging rpmsg/for-next (741dc0aa4122 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7c547cb52849 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (ac4062aa6c81 gpio: 104-idi-48e: make array=
 register_offset static, makes object smaller)
Merging gpio-intel/for-next (6ed26a5326f6 gpio: lynxpoint: set default hand=
ler to be handle_bad_irq())
Merging pinctrl/for-next (659e175ff44d Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (da0c9ea146cb Linux 5.4-rc2)
Merging pinctrl-samsung/for-next (a322b3377f4b pinctrl: samsung: Fix device=
 node refcount leaks in init code)
Merging pwm/for-next (81420020e691 pwm: sun4i: Drop redundant assignment to=
 variable pval)
Merging userns/for-next (318759b4737c signal/x86: Move tsk inside of CONFIG=
_MEMORY_FAILURE in do_sigbus)
Merging ktest/for-next (aecea57f84b0 ktest: Fix some typos in config-bisect=
.pl)
Merging random/dev (58be0106c530 random: fix soft lockup when trying to rea=
d from an uninitialized blocking pool)
Merging kselftest/next (54ecb8f7028c Linux 5.4-rc1)
Merging y2038/y2038 (eaaabd38cf67 Merge tag 'compat-ioctl-5.5' into y2038)
Merging livepatching/for-next (1cfe141e1715 Merge branch 'for-5.4-core' int=
o for-next)
Merging coresight/next (acfec525a78a coresight: etm4x: Add support for Thun=
derX2)
Merging rtc/rtc-next (cb0b97d68252 rtc: meson-vrtc: move config option to p=
roper location)
Merging nvdimm/libnvdimm-for-next (4c806b897d60 libnvdimm/region: Enable MA=
P_SYNC for volatile regions)
Merging at24/at24/for-next (285be87c79e1 eeprom: at24: Improve confusing lo=
g message)
Merging ntb/ntb-next (54ecb8f7028c Linux 5.4-rc1)
Merging kspp/for-next/kspp (6f88ed285e67 Merge branch 'fixes/usercopy/highm=
em-fromlist' into for-next/kspp)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (54ecb8f7028c Linux 5.4-rc1)
Merging fsi/next (799e064cc79e fsi: scom: Don't abort operations for minor =
errors)
Merging siox/siox/next (1e4b044d2251 Linux 4.18-rc4)
Merging slimbus/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging nvmem/for-next (b76e01ccc287 nvmem: imx: scu: fix dependency in Kco=
nfig)
Merging xarray/xarray (91abab83839a XArray: Fix xas_next() with a single en=
try at 0)
Merging hyperv/hyperv-next (41928dfdf5bd Drivers: hv: balloon: Remove depen=
dencies on guest page size)
Merging auxdisplay/auxdisplay (54ecb8f7028c Linux 5.4-rc1)
Merging kgdb-dt/kgdb/for-next (2277b492582d kdb: Fix stack crawling on 'run=
ning' CPUs that aren't the master)
Merging pidfd/for-next (63971aa58042 Merge branch 'pidfd' into for-next)
Merging devfreq/for-next (d2f5fccd1ac9 PM / devfreq: Make log message more =
explicit when devfreq device already exists)
Merging hmm/hmm (54ecb8f7028c Linux 5.4-rc1)
Merging fpga/for-next (fddc9fcbe69a fpga: dfl: fme: add power management su=
pport)
Merging kunit/test (d460623c5fa1 Documentation: kunit: Fix verification com=
mand)
Merging cel/cel-next (7671abdac658 xprtrdma: Replace dprintk in xprt_rdma_s=
et_port)
Merging akpm-current/current (1ead3e856d82 ipc/msg.c: consolidate all xxxct=
l_down() functions)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/block/null_blk_main.c: fix layout
Applying: drivers/block/null_blk_main.c: fix uninitialized var warnings
Applying: pinctrl: fix pxa2xx.c build warnings
Applying: lib/list-test.c: add a test for the 'list' doubly linked list
Applying: lib/genalloc.c: export symbol addr_in_gen_pool
Applying: lib/genalloc.c: rename addr_in_gen_pool to gen_pool_has_addr
Applying: Documentation: rename addr_in_gen_pool to gen_pool_has_addr
Applying: kernel-hacking: group sysrq/kgdb/ubsan into 'Generic Kernel Debug=
ging Instruments'
Applying: kernel-hacking: create submenu for arch special debugging options
Applying: kernel-hacking: group kernel data structures debugging together
Applying: kernel-hacking: move kernel testing and coverage options to same =
submenu
Applying: kernel-hacking: move Oops into 'Lockups and Hangs'
Applying: kernel-hacking: move SCHED_STACK_END_CHECK after DEBUG_STACK_USAGE
Applying: kernel-hacking: create a submenu for scheduler debugging options
Applying: kernel-hacking: move DEBUG_BUGVERBOSE to 'printk and dmesg option=
s'
CONFLICT (content): Merge conflict in lib/Kconfig.debug
Applying: kernel-hacking: move DEBUG_FS to 'Generic Kernel Debugging Instru=
ments'
Applying: bitops: introduce the for_each_set_clump8 macro
Applying: lib/test_bitmap.c: add for_each_set_clump8 test cases
Applying: gpio: 104-dio-48e: utilize for_each_set_clump8 macro
Applying: gpio: 104-idi-48: utilize for_each_set_clump8 macro
Applying: gpio: gpio-mm: utilize for_each_set_clump8 macro
Applying: gpio: ws16c48: utilize for_each_set_clump8 macro
Applying: gpio: pci-idio-16: utilize for_each_set_clump8 macro
Applying: gpio: pcie-idio-24: utilize for_each_set_clump8 macro
Applying: gpio: uniphier: utilize for_each_set_clump8 macro
Applying: gpio: 74x164: utilize the for_each_set_clump8 macro
Applying: thermal: intel: intel_soc_dts_iosf: Utilize for_each_set_clump8 m=
acro
Applying: gpio: pisosr: utilize the for_each_set_clump8 macro
Applying: gpio: max3191x: utilize the for_each_set_clump8 macro
Applying: gpio: pca953x: utilize the for_each_set_clump8 macro
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (ae2e3d1688d4 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/T+mqny15+YtI6CAOjSIu616
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2pY6QACgkQAVBC80lX
0GxbsQf/fl6dbKgV2pDefpoeBXaY7HzCufrVLcXxo50Y8MLxvDPGowyuLNrWuHrW
lTtE9CC3GrRDSuqERuwk1SNp9JoNQ9HCP6BWY5z5UglIrxpQZ3WYnNL6nknkXiE9
unFZYhCaS/qUwhYwvaCL9Zx9HjN5VqXSyQPP/xavaS5mMFcFkg2OK7ZiH199JPzc
cl/jraDRXbEpocyTPHlyD7AN4pNZuHIHYxX2IQkbsLHQyxVDxqDgaXDULsFnn8j/
e5L8/tupK5cgruJ0GCbL52RPwwAVcic+fVdomvGWbSiH1thnEEt18c0qcDY13fuF
3v3EFsWdZg1xZ4GxeMU18oAFHMSUgA==
=kJf0
-----END PGP SIGNATURE-----

--Sig_/T+mqny15+YtI6CAOjSIu616--
