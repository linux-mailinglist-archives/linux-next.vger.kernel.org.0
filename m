Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9510C977F
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2019 06:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbfJCEeq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Oct 2019 00:34:46 -0400
Received: from ozlabs.org ([203.11.71.1]:39435 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725613AbfJCEeq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Oct 2019 00:34:46 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46kKsp1rcDz9sDB;
        Thu,  3 Oct 2019 14:34:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570077278;
        bh=CT+Seq2jyTNwW6OVu76bkjFO3cPw4cxcztppmUrT1SY=;
        h=Date:From:To:Cc:Subject:From;
        b=LKPg7fYVCiRWH8LTADC4Qfl4CJ6S5XZ5zO5DIBUyShEsBjAIRsVJukkwQeInMPb6R
         dxRmQWKxV8pdbC5yxgsVx4z0PdrjpgDXWiZgEhGUyBX8twA7gmj0l26e8hDoPAvSvS
         Lu4Ic3BAFHt0JIfHcNSu3VKZ5pkJ5gAALxx0jvFZbynu/uKT1a8qiObfxhaKyiI25c
         j9DCI4UiN8qYZxpc0iXjVb8YCATH9CJGSWiHLBSjQdk1H8kKCZp/m+xKCZnw087031
         qKXfczqtcdnw605S9wfbfLbI0dxJEMRlAt4YDME7MeyAu5izMr+exn5hzByHPw9+U4
         aEBB5b8Lld27A==
Date:   Thu, 3 Oct 2019 14:34:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 3
Message-ID: <20191003143437.06872ca9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zoY/7NOwm+nW/BCqIImK=Yc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zoY/7NOwm+nW/BCqIImK=Yc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20191002:

New tree: tomoyo

My fixes tree contains:

  04e6dac68d9b ("powerpc/64s/radix: fix for "tidy up TLB flushing code" and=
 !CONFIG_PPC_RADIX_MMU")

The amdgpu tree gained a conflict against Linus' tree.

The keys tree with gained a conflict against mips-fixes tree.

Non-merge commits (relative to Linus' tree): 1484
 1654 files changed, 44635 insertions(+), 19751 deletions(-)

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

I am currently merging 314 trees (counting Linus' and 78 trees of bug
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
Merging origin/master (65aa35c93cc0 Merge tag 'erofs-for-5.4-rc2-fixes' of =
git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs)
Merging fixes/master (04e6dac68d9b powerpc/64s/radix: fix for "tidy up TLB =
flushing code" and !CONFIG_PPC_RADIX_MMU)
Merging kbuild-current/fixes (d159d87700e9 namespace: fix namespace.pl scri=
pt to support relative paths)
Merging arc-current/for-curr (41277ba7eb4e ARC: mm: tlb flush optim: elide =
redundant uTLB invalidates for MMUv3)
Merging arm-current/fixes (5b3efa4f1479 ARM: 8901/1: add a criteria for pfn=
_valid of arm)
Merging arm-soc-fixes/arm/fixes (cdee3b60af59 ARM: dts: ux500: Fix up the C=
PU thermal zone)
Merging arm64-fixes/for-next/fixes (a2b99dcac36c docs: arm64: Fix indentati=
on and doc formatting)
Merging m68k-current/for-linus (0f1979b402df m68k: Remove ioremap_fullcache=
())
Merging powerpc-fixes/fixes (253c892193ab powerpc/eeh: Fix eeh eeh_debugfs_=
break_device() with SRIOV devices)
Merging s390-fixes/fixes (9f494438d4bc s390/qdio: clarify size of the QIB p=
arm area)
Merging sparc/master (038029c03e21 sparc: remove unneeded uapi/asm/statfs.h)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (53de429f4e88 net: hisilicon: Fix usage of uninitialized=
 variable in function mdio_sc_cfg_reg_write())
Merging bpf/master (a2d074e4c6e8 selftests/bpf: test_progs: Don't leak serv=
er_fd in test_sockopt_inherit)
Merging ipsec/master (68ce6688a5ba net: sched: taprio: Fix potential intege=
r overflow in taprio_set_picos_per_byte)
Merging netfilter/master (34a4c95abd25 netfilter: nft_connlimit: disable bh=
 on garbage collection)
Merging ipvs/master (02dc96ef6c25 Merge git://git.kernel.org/pub/scm/linux/=
kernel/git/netdev/net)
Merging wireless-drivers/master (c91a9cfe9f6d rt2x00: initialize last_reset)
Merging mac80211/master (569aad4fcd82 net: ag71xx: fix mdio subnode support)
Merging rdma-fixes/for-rc (b66f31efbdad RDMA/iwcm: Fix a lock inversion iss=
ue)
Merging sound-current/for-linus (f41f900568d9 ALSA: usb-audio: Add DSD supp=
ort for EVGA NU Audio)
Merging sound-asoc-fixes/for-linus (bbb90c4ed03b Merge branch 'asoc-5.4' in=
to asoc-linus)
Merging regmap-fixes/for-linus (54ecb8f7028c Linux 5.4-rc1)
Merging regulator-fixes/for-linus (c3f1e312854c Merge branch 'regulator-5.4=
' into regulator-linus)
Merging spi-fixes/for-linus (6efab62559b1 Merge branch 'spi-5.4' into spi-l=
inus)
Merging pci-current/for-linus (54ecb8f7028c Linux 5.4-rc1)
Merging driver-core.current/driver-core-linus (82af5b660967 sysfs: Fixes __=
BIN_ATTR_WO() macro)
Merging tty.current/tty-linus (54ecb8f7028c Linux 5.4-rc1)
Merging usb.current/usb-linus (54ecb8f7028c Linux 5.4-rc1)
Merging usb-gadget-fixes/fixes (4a56a478a525 usb: gadget: mass_storage: Fix=
 races between fsg_disable and fsg_set_alt)
Merging usb-serial-fixes/usb-linus (5eb3f4b87a0e USB: serial: option: add T=
elit FN980 compositions)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (609488bc979f Linux 5.3-rc2)
Merging staging.current/staging-linus (22d67a01d8d8 staging: rtl8188eu: fix=
 HighestRate check in odm_ARFBRefresh_8188E())
Merging char-misc.current/char-misc-linus (54ecb8f7028c Linux 5.4-rc1)
Merging soundwire-fixes/fixes (d1abaeb3be7b Linux 5.3-rc5)
Merging thunderbolt-fixes/fixes (54ecb8f7028c Linux 5.4-rc1)
Merging input-current/for-linus (bd3b84802376 Input: goodix - add support f=
or 9-bytes reports)
Merging crypto-current/master (f703964fc668 crypto: arm/aes-ce - add depend=
ency on AES library)
Merging ide/master (baf6722aa0cb ide: Use dev_get_drvdata where possible)
Merging vfio-fixes/for-linus (5715c4dd66a3 vfio/mdev: Synchronize device cr=
eate/remove with parent removal)
Merging kselftest-fixes/fixes (ce3a67780212 selftests: watchdog: Add comman=
d line option to show watchdog_info)
Merging modules-fixes/modules-linus (be71eda5383f module: Fix display of wr=
ong module .text address)
Merging slave-dma-fixes/fixes (04cbfba62085 Merge tag 'dmaengine-5.4-rc1' o=
f git://git.infradead.org/users/vkoul/slave-dma)
Merging backlight-fixes/for-backlight-fixes (e93c9c99a629 Linux 5.1)
Merging mtd-fixes/mtd/fixes (dc9cfd269222 mtd: hyperbus: fix dependency and=
 build error)
Merging mfd-fixes/for-mfd-fixes (4d82fa67dd6b mfd: rk808: Make PM function =
declaration static)
Merging v4l-dvb-fixes/fixes (63ad05e36ec5 media: cec-notifier: clear cec_ad=
ap in cec_notifier_unregister)
Merging reset-fixes/reset/fixes (a71dcd3757e2 reset: remove redundant null =
check on pointer dev)
Merging mips-fixes/mips-fixes (8919975b6171 MIPS: VDSO: Fix build for binut=
ils < 2.25)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (f90ec6cdf674 ARM: dts: am4372: Set memory bandwid=
th limit for DISPC)
Merging kvm-fixes/master (fd3edd4a9066 KVM: nVMX: cleanup and fix host 64-b=
it mode checks)
Merging kvms390-fixes/master (53936b5bf35e KVM: s390: Do not leak kernel st=
ack data in the KVM_S390_INTERRUPT ioctl)
Merging hwmon-fixes/hwmon (98d1a3c245e4 hwmon: (nct7904) Fix the incorrect =
value of vsen_mask in nct7904_data struct)
Merging nvdimm-fixes/libnvdimm-fixes (4c806b897d60 libnvdimm/region: Enable=
 MAP_SYNC for volatile regions)
Merging btrfs-fixes/next-fixes (a73d7fe3072f Merge branch 'misc-5.4' into n=
ext-fixes)
Merging vfs-fixes/fixes (d4f4de5e5ef8 Fix the locking in dcache_readdir() a=
nd friends)
Merging dma-mapping-fixes/for-linus (33dcb37cef74 dma-mapping: fix page att=
ributes for dma_mmap_*)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (54ecb8f7028c Linux 5.4-rc1)
Merging samsung-krzk-fixes/fixes (54ecb8f7028c Linux 5.4-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging devicetree-fixes/dt/linus (f437ade3296b dt-bindings: phy: lantiq: F=
ix Property Name)
Merging scsi-fixes/fixes (9bc6157f5fd0 scsi: qla2xxx: Remove WARN_ON_ONCE i=
n qla2x00_status_cont_entry())
Merging drm-fixes/drm-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging amdgpu-fixes/drm-fixes (c0e70e10b11b drm/amd/display: fix dcn21 Mak=
efile for clang)
Merging drm-intel-fixes/for-linux-next-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging mmc-fixes/fixes (e51df6ce668a mmc: host: sdhci-pci: Add Genesys Log=
ic GL975x support)
Merging rtc-fixes/rtc-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging gnss-fixes/gnss-linus (54ecb8f7028c Linux 5.4-rc1)
Merging hyperv-fixes/hyperv-fixes (83b50f83a968 Drivers: hv: vmbus: Fix har=
mless building warnings without CONFIG_PM_SLEEP)
Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe=
_pin_request())
Merging risc-v-fixes/fixes (922b0375fc93 riscv: Fix memblock reservation fo=
r device tree blob)
Merging pidfd-fixes/fixes (3969e76909d3 selftests: pidfd: Fix undefined ref=
erence to pthread_create())
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (02dc96ef6c25 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/netdev/net)
Merging gpio-intel-fixes/fixes (54ecb8f7028c Linux 5.4-rc1)
Merging pinctrl-intel-fixes/fixes (260996c30f4f pinctrl: cherryview: restor=
e Strago DMI workaround for all versions)
Merging erofs-fixes/fixes (65aa35c93cc0 Merge tag 'erofs-for-5.4-rc2-fixes'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs)
Merging drm-misc-fixes/for-linux-next-fixes (a0ecd6fdbf5d drm/komeda: preve=
nt memory leak in komeda_wb_connector_add)
Merging kspp-gustavo/for-next/kspp (609488bc979f Linux 5.3-rc2)
Merging kbuild/for-next (8c0c37466a7b kconfig: split util.c out of parser.y)
Merging compiler-attributes/compiler-attributes (54ecb8f7028c Linux 5.4-rc1)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (c7d9eccb3c1e mmc: renesas_sdhi_internal_dmac:=
 Add MMC_CAP2_MERGE_CAPABLE)
Merging asm-generic/master (9b87647c665d asm-generic: add unlikely to defau=
lt BUG_ON(x))
Merging arc/for-next (6fbc7275c7a9 Linux 5.2-rc7)
Merging arm/for-next (3a6d5fc43760 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (e376897f424a arm64: remove __iounmap)
Merging arm-perf/for-next/perf (c8b0de762e0b perf/smmuv3: use devm_platform=
_ioremap_resource() to simplify code)
Merging arm-soc/for-next (546d1f246e93 Merge branch 'arm/fixes' into for-ne=
xt)
Merging actions/for-next (fb9c1c1deb5e Merge branch 'v4.20/drivers+s900-sps=
' into next)
Merging amlogic/for-next (d1150f2a0bba Merge branch 'v5.5/drivers' into tmp=
/aml-rebuild)
Merging aspeed/for-next (ba0fdbb07d05 Merge branch 'dt-for-v5.4' into for-n=
ext)
Merging at91/at91-next (3253ffa16c9a Merge branches 'at91-drivers' and 'at9=
1-soc' into at91-next)
Merging bcm2835/for-next (c165c01bb6f7 Merge branch 'bcm2835-dt-next' into =
for-next)
Merging imx-mxs/for-next (a70642cb3c1d Merge branch 'imx/dt' into for-next)
Merging keystone/next (78145dbeaea1 Merge branch 'for_5.3/driver-soc' into =
next)
Merging mediatek/for-next (4ae1ce88e9a0 Merge branch 'v5.3-next/soc' into f=
or-next)
Merging mvebu/for-next (153e97d3bdf3 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (75e66cd99933 Merge branch 'fixes' into for-next)
CONFLICT (content): Merge conflict in arch/arm/mach-omap2/Makefile
Merging qcom/for-next (63e584644247 Merge tag 'qcom-arm64-defconfig-for-5.4=
' into all-for-5.4)
Merging renesas/next (ae688e1720fd arm64: dts: renesas: hihope-common: Fix =
eMMC status)
Merging renesas-geert/next (aca0770d9702 Merge branches 'renesas-arm-dt-for=
-v5.5', 'renesas-arm64-defconfig-for-v5.5', 'renesas-arm64-dt-for-v5.5', 'r=
enesas-drivers-for-v5.5' and 'renesas-dt-bindings-for-v5.5' into renesas-ne=
xt)
Merging reset/reset/next (2d94bccca49f reset: uniphier-glue: Add Pro5 USB3 =
support)
Merging rockchip/for-next (155cb7cd4cd4 Merge branch 'v5.4-clk/next' into f=
or-next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/arm=
/rockchip.yaml
Merging samsung-krzk/for-next (2924a93b4c2b Merge branch 'for-v5.5/memory-s=
amsung-dmc-dt' into for-next)
Merging scmi/for-linux-next (54ecb8f7028c Linux 5.4-rc1)
Merging sunxi/sunxi/for-next (f29e294b3f53 Merge branches 'sunxi/clk-for-5.=
5' and 'sunxi/fixes-for-5.4' into sunxi/for-next)
Merging tegra/for-next (d40c8de825cc Merge branch for-5.5/arm64/dt into for=
-next)
Merging clk/clk-next (54ecb8f7028c Linux 5.4-rc1)
Merging clk-samsung/for-next (a188339ca5a3 Linux 5.2-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (e2c750853b66 csky: Fixup csky_pmu.max_period assig=
nment)
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (0d3d343560ba genirq: remove the is_affinity_mask_valid h=
ook)
Merging m68k/for-next (0f1979b402df m68k: Remove ioremap_fullcache())
Merging m68knommu/for-next (372ea263b3d9 m68k: coldfire: Include the GPIO d=
river header)
Merging microblaze/next (7cca9b8b7c5b microblaze: Switch to standard restar=
t handler)
Merging mips/mips-next (05d013a0366d MIPS: Detect bad _PFN_SHIFT values)
Merging nds32/next (932296120543 nds32: add new emulations for floating poi=
nt instruction)
Merging nios2/for-next (91d99a724e9c nios2: force the string buffer NULL-te=
rminated)
Merging openrisc/for-next (f3b17320db25 openrisc: map as uncached in iorema=
p)
Merging parisc-hd/for-next (e563af53af8b parisc: Do not hardcode registers =
in checksum functions)
Merging powerpc/next (45824fc0da6e Merge tag 'powerpc-5.4-1' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/powerpc/linux)
Merging fsl/next (63d86876f324 Revert "powerpc/fsl_pci: simplify fsl_pci_dm=
a_set_mask")
Merging soc-fsl/next (eadf0b17b43d bus: fsl-mc: remove explicit device_link=
_del)
Merging risc-v/for-next (9ce06497c272 irqchip/sifive-plic: set max threshol=
d for ignored handlers)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (ab5758848039 s390/cio: exclude subchannels with no p=
arent from pseudo check)
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
Merging xtensa/xtensa-for-next (ede62d7397ec Merge branch 'xtensa-5.5' into=
 xtensa-for-next)
Merging fscrypt/master (0642ea2409f3 ext4 crypto: fix to check feature stat=
us before get policy)
Merging afs/afs-next (a0753c29004f afs: Support RCU pathwalk)
Merging btrfs/next (29dcea88779c Linux 4.17)
Merging btrfs-kdave/for-next (f41d3117280a Merge branch 'for-next-next-v5.4=
-20191001' into for-next-20191001)
Merging ceph/master (3ee5a7015c8b ceph: call ceph_mdsc_destroy from destroy=
_fs_client)
Merging cifs/for-next (f076b72e54c6 smb3: cleanup some recent endian errors=
 spotted by updated sparse)
Merging configfs/for-next (e9c03af21cc7 configfs: calculate the symlink tar=
get only once)
Merging ecryptfs/next (b4a81b87a4cf ecryptfs: fix a memory leak bug in ecry=
ptfs_init_messaging())
Merging erofs/dev (54ecb8f7028c Linux 5.4-rc1)
Merging ext3/for_next (0f7dbaee76f4 Merge quota initialization check fix fr=
om Chao Yu.)
Merging ext4/dev (040823b5372b Merge tag 'unicode-next-v5.4' of https://git=
.kernel.org/pub/scm/linux/kernel/git/krisman/unicode into dev)
Merging f2fs/dev (619e17cf75dd Merge tag 'for-v5.4' of git://git.kernel.org=
/pub/scm/linux/kernel/git/sre/linux-power-supply)
Merging fsverity/fsverity (95ae251fe828 f2fs: add fs-verity support)
Merging fuse/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging jfs/jfs-next (a5fdd713d256 jfs: fix bogus variable self-initializat=
ion)
Merging nfs/linux-next (54ecb8f7028c Linux 5.4-rc1)
Merging nfs-anna/linux-next (a8fd0feeca35 pNFS/filelayout: enable LAYOUTGET=
 on OPEN)
Merging nfsd/nfsd-next (e41f9efb85d3 sunrpc: clean up indentation issue)
Merging orangefs/for-next (e6b998ab62be orangefs: remove redundant assignme=
nt to err)
Merging overlayfs/overlayfs-next (5c2e9f346b81 ovl: filter of trusted xattr=
 results in audit)
Merging ubifs/linux-next (6a379f67454a jffs2: Fix memory leak in jffs2_scan=
_eraseblock() error path)
Merging v9fs/9p-next (aafee43b7286 9p/vfs_super.c: Remove unused parameter =
data in v9fs_fill_super)
Merging xfs/for-next (88d32d3983e7 xfs: avoid unused to_mp() function warni=
ng)
Merging iomap/iomap-for-next (838c4f3d7515 iomap: move the iomap_dio_rw ->e=
nd_io callback into a structure)
Merging djw-vfs/vfs-for-next (dc617f29dbe5 vfs: don't allow writes to swap =
files)
Merging file-locks/locks-next (b41dae061bbd Merge tag 'xfs-5.4-merge-7' of =
git://git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging vfs/for-next (3e501af8dd7b Merge branches 'work.misc', 'work.mount3=
', 'work.namei', 'work.dcache' and 'work.autofs' into for-next)
Merging printk/for-next (c38822ab9bd6 Merge branch 'for-5.4' into for-next)
Merging pci/next (da9c3eaa31f2 Merge branch 'pci/virtualization')
Merging pstore/for-next/pstore (609488bc979f Linux 5.3-rc2)
Merging hid/for-next (d789dc30163d Merge branch 'for-5.5/hidraw' into for-n=
ext)
Merging i2c/i2c/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging i3c/i3c/next (6030f42d20ce i3c: master: Use dev_to_i3cmaster())
Merging dmi/master (57361846b52b Linux 4.19-rc2)
Merging hwmon-staging/hwmon-next (4e19e72f45d3 hwmon: submitting-patches: A=
dd note on comment style)
Merging jc_docs/docs-next (e07f7927d52b docs: No structured comments in ker=
nel/dma/coherent.c)
Merging v4l-dvb/master (503e59365dd1 media: i2c: ov2659: Switch to SPDX Lic=
ensing)
Merging v4l-dvb-next/master (167f4555184b Merge branch fixes_for_upstream i=
nto to_next)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (315ea754a4c4 Merge branch 'pm-cpuidle' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (f75d2accca77 Merge branch 'cpuf=
req/qcom-updates' into cpufreq/arm/linux-next)
Merging cpupower/cpupower (7e5705c635ec tools/power/cpupower: Fix initializ=
er override in hsw_ext_cstates)
Merging opp/opp/linux-next (071afa50609d Merge branch 'opp/qcom-updates' in=
to opp/linux-next)
Merging thermal/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (812cd88749e0 firewire: mark expected switch fall=
-throughs)
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (f3fceba5da5e RDMA/rxe: Verify modify_device mask)
Merging net-next/master (80f60a911e5e mvpp2: remove misleading comment)
Merging bpf-next/master (03bd4773d898 libbpf: Bump current version to v0.0.=
6)
Merging ipsec-next/master (02dc96ef6c25 Merge git://git.kernel.org/pub/scm/=
linux/kernel/git/netdev/net)
Merging mlx5-next/mlx5-next (fc603294267f net/mlx5: Set only stag for match=
 untagged packets)
Merging netfilter-next/master (67e80b99a554 net: phylink: clarify where phy=
link should be used)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (e5dc8d0d2672 ipvs: batch __ip_vs_dev_cleanup)
Merging wireless-drivers-next/master (4a50d454502f cw1200: Fix a signedness=
 bug in cw1200_load_firmware())
Merging bluetooth/master (840aff3994c8 Bluetooth: btusb: Use IS_ENABLED ins=
tead of #ifdef)
Merging mac80211-next/master (02dc96ef6c25 Merge git://git.kernel.org/pub/s=
cm/linux/kernel/git/netdev/net)
Merging gfs2/for-next (f0b444b349e3 gfs2: clear buf_in_tr when ending a tra=
nsaction in sweep_bh_for_rgrps)
Merging mtd/mtd/next (2cfcfadb8e13 mtd: pmc551: Remove set but not used var=
iable 'soff_lo')
Merging nand/nand/next (f480b969448e mtd: rawnand: omap2: Fix number of bit=
flips reporting with ELM)
Merging spi-nor/spi-nor/next (9607af6f857f mtd: spi-nor: Rename "n25q512a" =
to "mt25qu512a (n25q512a)")
Merging crypto/master (9575d1a5c078 crypto: caam - Cast to long first befor=
e pointer conversion)
Merging drm/drm-next (54ecb8f7028c Linux 5.4-rc1)
Merging amdgpu/drm-next (b93f2237cbe2 drm/amdgpu: work around llvm bug #425=
76)
CONFLICT (content): Merge conflict in include/uapi/linux/kfd_ioctl.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/renoir_=
ppt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdkfd/kfd_priv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdkfd/kfd_charde=
v.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_drv=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/Makefile
Merging drm-intel/for-linux-next (458863e08e13 drm/i915: Mark contents as d=
irty on a write fault)
Merging drm-tegra/drm/tegra/for-next (9d5a54987265 drm/tegra: Fix ordering =
of cleanup code)
Merging drm-misc/for-linux-next (d7d44b6fe40a drm/tilcdc: include linux/pin=
ctrl/consumer.h again)
Merging drm-msm/msm-next (9f614197c744 drm/msm: Use the correct dma_sync ca=
lls harder)
Merging hdlcd/for-upstream/hdlcd (d664b851eb2b drm/arm/hdlcd: Reject atomic=
 commits that disable only the plane)
Merging mali-dp/for-upstream/mali-dp (4cf643a39221 Merge tag 'drm-next-5.3-=
2019-06-27' of git://people.freedesktop.org/~agd5f/linux into drm-next)
Merging imx-drm/imx-drm/next (4d24376370fb gpu: ipu-v3: image-convert: only=
 sample into the next tile if necessary)
Merging etnaviv/etnaviv/next (dbcc574a4bfa drm/etnaviv: fix missing unlock =
on error in etnaviv_iommuv1_context_alloc())
Merging regmap/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging sound/for-next (f41f900568d9 ALSA: usb-audio: Add DSD support for E=
VGA NU Audio)
Merging sound-asoc/for-next (18762dd37fe7 Merge branch 'asoc-5.5' into asoc=
-next)
Merging modules/modules-next (54ecb8f7028c Linux 5.4-rc1)
Merging input/next (463fa44eec2f Input: atmel_mxt_ts - disable IRQ across s=
uspend)
Merging block/for-next (dd8f920bbca1 Merge branch 'for-5.4/io_uring' into f=
or-next)
Merging device-mapper/for-next (afa179eb6038 dm: introduce DM_GET_TARGET_VE=
RSION)
Merging pcmcia/pcmcia-next (95691e3eddc4 pcmcia: Implement CLKRUN protocol =
disabling for Ricoh bridges)
Merging mmc/next (e51df6ce668a mmc: host: sdhci-pci: Add Genesys Logic GL97=
5x support)
Merging kgdb/kgdb-next (3bd67b37e350 kdb: print real address of pointers in=
stead of hashed addresses)
CONFLICT (content): Merge conflict in kernel/debug/kdb/kdb_bt.c
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (8391c6cb2414 mfd: mt6323: Add MT6323 RTC and PWRC)
Merging backlight/for-backlight-next (c0b64faf0fe6 backlight: pwm_bl: Set s=
cale type for brightness curves specified in the DT)
Merging battery/for-next (7f7378618b41 power: supply: cpcap-charger: Enable=
 vbus boost voltage)
Merging regulator/for-next (f9f6bfdb3c19 Merge branch 'regulator-5.5' into =
regulator-next)
Merging security/next-testing (45893a0abee6 kexec: Fix file verification on=
 S390)
Merging apparmor/apparmor-next (136db994852a apparmor: increase left match =
history buffer size)
Merging integrity/next-integrity (2a7f0e53daf2 ima: ima_api: Use struct_siz=
e() in kzalloc())
Merging keys/keys-next (1f96e0f129eb Merge branch 'keys-acl' into keys-next)
CONFLICT (content): Merge conflict in include/linux/key.h
CONFLICT (modify/delete): fs/crypto/keyinfo.c deleted in HEAD and modified =
in keys/keys-next. Version keys/keys-next of fs/crypto/keyinfo.c left in tr=
ee.
CONFLICT (content): Merge conflict in fs/afs/security.c
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_o32=
.tbl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_n64=
.tbl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_n32=
.tbl
$ git rm -f fs/crypto/keyinfo.c
Applying: fsverity: merge fix for keyring_alloc API change
Applying: fscrypt: merge resolution for "keys: Replace uid/gid/perm permiss=
ions checking with an ACL"
Applying: dm verity: merge fix for "keys: Replace uid/gid/perm permissions =
checking with an ACL"
Merging selinux/next (3e3e24b42043 selinux: allow labeling before policy is=
 loaded)
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (dc6b8f4f1579 Merge remote-tracking branch 'upstream/=
master')
Merging tpmdd/next (e13cd21ffd50 tpm: Wrap the buffer from the caller to tp=
m_buf in tpm_send())
Merging watchdog/master (ca2fc5efffde watchdog: f71808e_wdt: Add F81803 sup=
port)
Merging iommu/next (142dfcda5a35 Merge branch 'iommu/fixes' into next)
Merging vfio/next (e6c5d727db0a Merge branches 'v5.4/vfio/alexey-tce-memory=
-free-v1', 'v5.4/vfio/connie-re-arrange-v2', 'v5.4/vfio/hexin-pci-reset-v3'=
, 'v5.4/vfio/parav-mtty-uuid-v2' and 'v5.4/vfio/shameer-iova-list-v8' into =
v5.4/vfio/next)
Merging audit/next (54ecb8f7028c Linux 5.4-rc1)
Merging devicetree/for-next (7329c06816a4 dt-bindings: watchdog: meson-gxbb=
-wdt: Include generic watchdog bindings)
Merging mailbox/mailbox-for-next (556a0964e28c mailbox: qcom-apcs: fix max_=
register value)
Merging spi/for-next (18b9802df190 Merge branch 'spi-5.5' into spi-next)
Merging tip/auto-latest (4a6158fb485e Merge branch 'timers/urgent')
Merging clockevents/clockevents/next (befd04abfbe4 clocksource/drivers/sh_c=
mt: Document "cmt-48" as deprecated)
CONFLICT (content): Merge conflict in kernel/time/posix-timers.c
Merging edac/edac-for-next (f05390d30e20 EDAC: skx_common: get rid of unuse=
d type var)
Merging irqchip/irq/irqchip-next (bb0fed1c60cc irqchip/sifive-plic: Switch =
to fasteoi flow)
Merging ftrace/for-next (8ed4889eb831 selftests/ftrace: Fix same probe erro=
r test)
Merging rcu/rcu/next (049b405029c0 MAINTAINERS: Update from paulmck@linux.i=
bm.com to paulmck@kernel.org)
Merging kvm/linux-next (fd3edd4a9066 KVM: nVMX: cleanup and fix host 64-bit=
 mode checks)
Merging kvm-arm/next (aac60f1a8677 KVM: arm/arm64: vgic: Use the appropriat=
e TRACE_INCLUDE_PATH)
Merging kvm-ppc/kvm-ppc-next (ff42df49e75f KVM: PPC: Book3S HV: Don't lose =
pending doorbell request on migration on P9)
Merging kvms390/next (0af2889f89bb KVM: s390: Remove unused parameter from =
__inject_sigp_restart())
Merging xen-tip/linux-next (a8fabb38525c xen/xenbus: fix self-deadlock afte=
r killing user process)
Merging percpu/for-next (69f98a60cdbb Merge branch 'for-5.4' into for-next)
Merging workqueues/for-next (30ae2fc0a75e workqueue: Minor follow-ups to th=
e rescuer destruction change)
Merging drivers-x86/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging chrome-platform/for-next (e6679fd1e2fc platform/chrome: wilco_ec: A=
dd debugfs test_event file)
Merging hsi/for-next (c1030cd45619 HSI: Remove dev_err() usage after platfo=
rm_get_irq())
Merging leds/for-next (30f071356d9d leds: flash: Convert non extended regis=
tration to inline)
Merging ipmi/for-next (c9acc3c4f8e4 ipmi_si_intf: Fix race in timer shutdow=
n handling)
Merging driver-core/driver-core-next (54ecb8f7028c Linux 5.4-rc1)
Merging usb/usb-next (54ecb8f7028c Linux 5.4-rc1)
Merging usb-gadget/next (18a93cd38be3 usb: gadget: net2280: Add workaround =
for AB chip Errata 11)
Merging usb-serial/usb-next (54ecb8f7028c Linux 5.4-rc1)
Merging usb-chipidea-next/ci-for-usb-next (f14ac41f977f usb: chipidea: core=
: change vbus-regulator as optional)
Merging phy-next/next (5af67635c36e phy: marvell: phy-mvebu-cp110-comphy: r=
ename instances of DLT)
Merging tty/tty-next (54ecb8f7028c Linux 5.4-rc1)
Merging char-misc/char-misc-next (54ecb8f7028c Linux 5.4-rc1)
Merging extcon/extcon-next (e81b88932985 extcon-intel-cht-wc: Don't reset U=
SB data connection at probe)
Merging soundwire/next (dfcff3f8a5f1 soundwire: stream: make stream name a =
const pointer)
Merging thunderbolt/next (54ecb8f7028c Linux 5.4-rc1)
Merging staging/staging-next (9cc05ed4df03 staging: fieldbus: move "offline=
 mode" definition to fieldbus core)
Merging mux/for-next (05fb8284a417 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (6311b6521bcc drivers: qcom: Add BCM vote macro to hea=
der)
Merging slave-dma/next (c5c6faaee6e0 dmaengine: ti: edma: Use bitmap_set() =
instead of open coded edma_set_bits())
Merging cgroup/for-next (275278e1525a Merge branch 'for-5.3-fixes' into for=
-next)
Merging scsi/for-next (e41df1533a4f Merge remote-tracking branch 'mkp-scsi/=
5.4/scsi-postmerge' into for-next)
Merging scsi-mkp/for-next (d4717f27dbd0 Merge branch '5.5/scsi-queue' into =
5.5/scsi-next)
Merging vhost/linux-next (0d4a3f2abbef Revert "vhost: block speculation of =
translated descriptors")
Merging rpmsg/for-next (741dc0aa4122 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (367677d49839 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (bcc6d99ac913 gpiolib: sanitize flags befor=
e allocating memory in lineevent_create())
Merging gpio-intel/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging pinctrl/for-next (cb0438e44360 pinctrl: meson-gxbb: Fix wrong pinni=
ng definition for uart_c)
Merging pinctrl-intel/for-next (54ecb8f7028c Linux 5.4-rc1)
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
Merging y2038/y2038 (870e0167cd9c Merge tag 'compat-ioctl-5.4-2' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/arnd/playground into y2038)
Merging livepatching/for-next (1cfe141e1715 Merge branch 'for-5.4-core' int=
o for-next)
Merging coresight/next (acfec525a78a coresight: etm4x: Add support for Thun=
derX2)
Merging rtc/rtc-next (54ecb8f7028c Linux 5.4-rc1)
Merging nvdimm/libnvdimm-for-next (4c806b897d60 libnvdimm/region: Enable MA=
P_SYNC for volatile regions)
Merging at24/at24/for-next (54ecb8f7028c Linux 5.4-rc1)
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
Merging hyperv/hyperv-next (54ac450feb7f video: hyperv: hyperv_fb: Support =
deferred IO for Hyper-V frame buffer driver)
Merging auxdisplay/auxdisplay (54ecb8f7028c Linux 5.4-rc1)
Merging kgdb-dt/kgdb/for-next (d8a050f5a3e8 kgdb: fix comment regarding sta=
tic function)
Merging pidfd/for-next (c2ba8f41ad36 perf_event_open: switch to copy_struct=
_from_user())
Merging devfreq/for-next (d2f5fccd1ac9 PM / devfreq: Make log message more =
explicit when devfreq device already exists)
Merging hmm/hmm (54ecb8f7028c Linux 5.4-rc1)
Merging fpga/for-next (e56476897448 fpga: Remove dev_err() usage after plat=
form_get_irq())
Merging kunit/test (741a98d02236 kunit: fix failure to build without printk)
Merging akpm-current/current (580a3a106e1d ipc/msg.c: consolidate all xxxct=
l_down() functions)
CONFLICT (content): Merge conflict in Documentation/admin-guide/cgroup-v2.r=
st
$ git checkout -b akpm remotes/origin/akpm/master
Applying: pinctrl: fix pxa2xx.c build warnings
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (16402313e729 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/zoY/7NOwm+nW/BCqIImK=Yc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2Vel0ACgkQAVBC80lX
0GxKVgf/QKZTqedhhrbbJd+4EqAOOsn6ksxpzc8PALcEP6vfniSZUjxmNA/nJWKZ
sw8qZ9iMDV48RYJfrDI+40G7fCbjnoJ+TWHZgzVzwP5PJYokVlHXygMchgq50lG/
7DVumMmEVITWGkwMaQxHs+/09ADrMpL1mwwQpDslxbMR1BrExv2RlFRk//UzDjX6
JylUdeL7pVtgLx2uRnF+keqs57j7PKfISiA1TIuw4BjA+likOOsZKVBEtc3iYikv
z9HXcuvbJO+OZ8nqrsuyzXmErnCe9Ba1hjBMpvN586bc/EgczSRg8VTqNCP9dSXw
5MXztzj3V2ySNLMPzLFF/LmGF+t/lw==
=/y+2
-----END PGP SIGNATURE-----

--Sig_/zoY/7NOwm+nW/BCqIImK=Yc--
