Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC30C1A64
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2019 05:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728522AbfI3DpG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 29 Sep 2019 23:45:06 -0400
Received: from ozlabs.org ([203.11.71.1]:50369 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726360AbfI3DpF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 29 Sep 2019 23:45:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46hSvv2sM1z9sP7;
        Mon, 30 Sep 2019 13:44:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1569815099;
        bh=K/rqsc77/3bApaBS/qTt5b1oiY/s/9fXl6te7houMAk=;
        h=Date:From:To:Cc:Subject:From;
        b=lI7b3pbPNul/RsQZiWHGS8Q1s0VxebWIZD3ONMXTbambi7OSSmMORQB1veDE34YGd
         yjGx4jSRbpPGQPyZQdEHrrlbMJvUxT+I5y5I05v72r9aILUN/671OxctJdjpLCTzGS
         sqf8Mz5otpDOtp+BeRlOzX8w6mqDzHcX0IKZLRV5e8ibg/yhcZvXOBG4oVYiabAJwI
         jgXFDzG/9cuui4N62kmPTY+OBg1u059iq0UH/P7GCX1JL/2wmmoj1FKwbqCuXbf6/Z
         BZg6mZG37CTMc60zq54PVkGcwFlX1KJQGt8vGndDDKUrXkXM5P8ct27QnBZJ3nX2t2
         uiKKGumpVBYzQ==
Date:   Mon, 30 Sep 2019 13:44:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 30
Message-ID: <20190930134458.7e872c46@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5lri6dl+OLtcDKIPj06F9Pp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5lri6dl+OLtcDKIPj06F9Pp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20190926:

The powerpc tree (well, Linus' tree really) gained a build failure for
which I applied a patch.

Non-merge commits (relative to Linus' tree): 462
 574 files changed, 9710 insertions(+), 4176 deletions(-)

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

I am currently merging 310 trees (counting Linus' and 77 trees of bug
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
Merging origin/master (a3c0e7b1fe1f Merge tag 'libnvdimm-fixes-5.4-rc1' of =
git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm)
Merging fixes/master (609488bc979f Linux 5.3-rc2)
Merging kbuild-current/fixes (f97c81dc6ca5 Merge tag 'armsoc-late' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/soc/soc)
Merging arc-current/for-curr (089cf7f6ecb2 Linux 5.3-rc7)
Merging arm-current/fixes (5b3efa4f1479 ARM: 8901/1: add a criteria for pfn=
_valid of arm)
Merging arm-soc-fixes/arm/fixes (9bfd7319e8d3 Merge tag 'fixes-5.4-merge-wi=
ndow' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap in=
to arm/fixes)
Merging arm64-fixes/for-next/fixes (799c85105233 arm64: Fix reference to do=
cs for ARM64_TAGGED_ADDR_ABI)
Merging m68k-current/for-linus (0f1979b402df m68k: Remove ioremap_fullcache=
())
Merging powerpc-fixes/fixes (253c892193ab powerpc/eeh: Fix eeh eeh_debugfs_=
break_device() with SRIOV devices)
Merging s390-fixes/fixes (d45331b00ddb Linux 5.3-rc4)
Merging sparc/master (038029c03e21 sparc: remove unneeded uapi/asm/statfs.h)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (02dc96ef6c25 Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/netdev/net)
Merging bpf/master (3c30819dc68a Merge git://git.kernel.org/pub/scm/linux/k=
ernel/git/bpf/bpf)
Merging ipsec/master (00b368502d18 xen-netfront: do not assume sk_buff_head=
 list is empty in error handling)
Merging netfilter/master (faeacb6ddb13 net: tap: clean up an indentation is=
sue)
Merging ipvs/master (58e8b37069ff Merge branch 'net-phy-dp83867-add-some-fi=
xes')
Merging wireless-drivers/master (2b481835cf4e wil6210: use after free in wi=
l_netif_rx_any())
Merging mac80211/master (f794dc2304d8 sctp: fix the missing put_user when d=
umping transport thresholds)
Merging rdma-fixes/for-rc (531a64e4c35b RDMA/siw: Fix IPv6 addr_list lockin=
g)
Merging sound-current/for-linus (f41f900568d9 ALSA: usb-audio: Add DSD supp=
ort for EVGA NU Audio)
Merging sound-asoc-fixes/for-linus (84b66885fdcf Merge branch 'asoc-5.4' in=
to asoc-linus)
Merging regmap-fixes/for-linus (0161b8716465 Merge branch 'regmap-5.3' into=
 regmap-linus)
Merging regulator-fixes/for-linus (f9a60abc26d9 Merge branch 'regulator-5.4=
' into regulator-linus)
Merging spi-fixes/for-linus (60b76d1c3b0a Merge branch 'spi-5.4' into spi-l=
inus)
Merging pci-current/for-linus (5184d449600f Merge tag 'microblaze-v5.4-rc1'=
 of git://git.monstr.eu/linux-2.6-microblaze)
Merging driver-core.current/driver-core-linus (02dc96ef6c25 Merge git://git=
.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging tty.current/tty-linus (02dc96ef6c25 Merge git://git.kernel.org/pub/=
scm/linux/kernel/git/netdev/net)
Merging usb.current/usb-linus (02dc96ef6c25 Merge git://git.kernel.org/pub/=
scm/linux/kernel/git/netdev/net)
Merging usb-gadget-fixes/fixes (4a56a478a525 usb: gadget: mass_storage: Fix=
 races between fsg_disable and fsg_set_alt)
Merging usb-serial-fixes/usb-linus (d1abaeb3be7b Linux 5.3-rc5)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (609488bc979f Linux 5.3-rc2)
Merging staging.current/staging-linus (02dc96ef6c25 Merge git://git.kernel.=
org/pub/scm/linux/kernel/git/netdev/net)
Merging char-misc.current/char-misc-linus (dc925a36060e Documentation/proce=
ss: Clarify disclosure rules)
Merging soundwire-fixes/fixes (d1abaeb3be7b Linux 5.3-rc5)
Merging thunderbolt-fixes/fixes (4d856f72c10e Linux 5.3)
Merging input-current/for-linus (0898782247ae Merge branch 'next' into for-=
linus)
Merging crypto-current/master (bf6a7a5ad6fa crypto: hisilicon - avoid unuse=
d function warning)
Merging ide/master (baf6722aa0cb ide: Use dev_get_drvdata where possible)
Merging vfio-fixes/for-linus (5715c4dd66a3 vfio/mdev: Synchronize device cr=
eate/remove with parent removal)
Merging kselftest-fixes/fixes (fbb01c52471c selftests/livepatch: push and p=
op dynamic debug config)
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
Merging mips-fixes/mips-fixes (74034a09267c MIPS: BCM63XX: Mark expected sw=
itch fall-through)
Merging at91-fixes/at91-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging omap-fixes/fixes (1d70ded8567c ARM: omap2plus_defconfig: Enable mor=
e droid4 devices as loadable modules)
Merging kvm-fixes/master (fd3edd4a9066 KVM: nVMX: cleanup and fix host 64-b=
it mode checks)
Merging kvms390-fixes/master (53936b5bf35e KVM: s390: Do not leak kernel st=
ack data in the KVM_S390_INTERRUPT ioctl)
Merging hwmon-fixes/hwmon (98d1a3c245e4 hwmon: (nct7904) Fix the incorrect =
value of vsen_mask in nct7904_data struct)
Merging nvdimm-fixes/libnvdimm-fixes (4c806b897d60 libnvdimm/region: Enable=
 MAP_SYNC for volatile regions)
Merging btrfs-fixes/next-fixes (47e95c92bce8 Merge branch 'misc-5.4' into n=
ext-fixes)
Merging vfs-fixes/fixes (d4f4de5e5ef8 Fix the locking in dcache_readdir() a=
nd friends)
Merging dma-mapping-fixes/for-linus (33dcb37cef74 dma-mapping: fix page att=
ributes for dma_mmap_*)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (4d856f72c10e Linux 5.3)
Merging samsung-krzk-fixes/fixes (5f9e832c1370 Linus 5.3-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging devicetree-fixes/dt/linus (83f82d7a4258 of: irq: fix a trivial typo=
 in a doc comment)
Merging scsi-fixes/fixes (0aabb6b699f7 scsi: qla2xxx: Fix Nport ID display =
value)
Merging drm-fixes/drm-fixes (e6bb711600db Merge tag 'drm-misc-fixes-2019-09=
-12' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes)
Merging amdgpu-fixes/drm-fixes (104c307147ad drm/amd/display: prevent memor=
y leak)
Merging drm-intel-fixes/for-linux-next-fixes (4d856f72c10e Linux 5.3)
Merging mmc-fixes/fixes (e51df6ce668a mmc: host: sdhci-pci: Add Genesys Log=
ic GL975x support)
Merging rtc-fixes/rtc-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging gnss-fixes/gnss-linus (f2c7c76c5d0a Linux 5.2-rc3)
Merging hyperv-fixes/hyperv-fixes (e395071a12f9 HID: hyperv: Use in-place i=
terator API in the channel callback)
Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe=
_pin_request())
Merging risc-v-fixes/fixes (c82dd6d078a2 riscv: Avoid interrupts being erro=
neously enabled in handle_exception())
Merging pidfd-fixes/fixes (27d969a2d997 selftests: pidfd: Fix undefined ref=
erence to pthread_create())
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (02dc96ef6c25 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/netdev/net)
Merging gpio-intel-fixes/fixes (5f9e832c1370 Linus 5.3-rc1)
Merging pinctrl-intel-fixes/fixes (4d856f72c10e Linux 5.3)
Merging drm-misc-fixes/for-linux-next-fixes (a0ecd6fdbf5d drm/komeda: preve=
nt memory leak in komeda_wb_connector_add)
Merging kspp-gustavo/for-next/kspp (609488bc979f Linux 5.3-rc2)
Merging kbuild/for-next (337bf824b735 Corrected formatting of header in kbu=
ild module docs)
Merging compiler-attributes/compiler-attributes (32ee8230b2b0 x86: bug.h: u=
se asm_inline in _BUG_FLAGS definitions)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (c7d9eccb3c1e mmc: renesas_sdhi_internal_dmac:=
 Add MMC_CAP2_MERGE_CAPABLE)
Merging asm-generic/master (9b87647c665d asm-generic: add unlikely to defau=
lt BUG_ON(x))
Merging arc/for-next (6fbc7275c7a9 Linux 5.2-rc7)
Merging arm/for-next (3a6d5fc43760 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (e376897f424a arm64: remove __iounmap)
Merging arm-perf/for-next/perf (3724e186fead docs/perf: Add documentation f=
or the i.MX8 DDR PMU)
Merging arm-soc/for-next (8c3e4c106c06 ARM: Document merges)
Merging actions/for-next (fb9c1c1deb5e Merge branch 'v4.20/drivers+s900-sps=
' into next)
Merging amlogic/for-next (d1150f2a0bba Merge branch 'v5.5/drivers' into tmp=
/aml-rebuild)
Merging aspeed/for-next (ba0fdbb07d05 Merge branch 'dt-for-v5.4' into for-n=
ext)
Merging at91/at91-next (1069a5a3f3d8 Merge branches 'at91-soc' and 'at91-dt=
' into at91-next)
Merging bcm2835/for-next (c165c01bb6f7 Merge branch 'bcm2835-dt-next' into =
for-next)
Merging imx-mxs/for-next (d26d83e3e1fc Merge branch 'imx/defconfig' into fo=
r-next)
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
Merging renesas-geert/next (e180e8bda829 Merge remote-tracking branch 'orig=
in/fixes-for-v5.3' into renesas-next)
Merging reset/reset/next (2d94bccca49f reset: uniphier-glue: Add Pro5 USB3 =
support)
Merging rockchip/for-next (155cb7cd4cd4 Merge branch 'v5.4-clk/next' into f=
or-next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/arm=
/rockchip.yaml
Merging samsung-krzk/for-next (2f776c5a7270 Merge branch 'next/defconfig' i=
nto for-next)
Merging scmi/for-linux-next (a561f1ecaee0 Merge tag 'scmi-fixes-5.4' of git=
://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linu=
x-next)
Merging sunxi/sunxi/for-next (15ea63583bfb Merge branch 'sunxi/dt-for-5.4' =
into sunxi/for-next)
Merging tegra/for-next (6290ae1fb7e2 Merge branch for-5.4/firmware into for=
-next)
Merging clk/clk-next (ebd47c843406 Merge branches 'clk-bulk-fix', 'clk-at91=
' and 'clk-sprd' into clk-next)
Merging clk-samsung/for-next (a188339ca5a3 Linux 5.2-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (e2c750853b66 csky: Fixup csky_pmu.max_period assig=
nment)
CONFLICT (content): Merge conflict in arch/csky/mm/dma-mapping.c
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
Merging xtensa/xtensa-for-next (1fd2295cb0fb Merge branch 'xtensa-5.5' into=
 xtensa-for-next)
Merging fscrypt/master (0642ea2409f3 ext4 crypto: fix to check feature stat=
us before get policy)
Merging afs/afs-next (a0753c29004f afs: Support RCU pathwalk)
Merging btrfs/next (29dcea88779c Linux 4.17)
Merging btrfs-kdave/for-next (feee7d2306b2 Merge branch 'misc-5.4' into for=
-next-20190924)
Merging ceph/master (3ee5a7015c8b ceph: call ceph_mdsc_destroy from destroy=
_fs_client)
Merging cifs/for-next (a016e2794fc3 CIFS: Fix oplock handling for SMB 2.1+ =
protocols)
Merging configfs/for-next (e9c03af21cc7 configfs: calculate the symlink tar=
get only once)
Merging ecryptfs/next (b4a81b87a4cf ecryptfs: fix a memory leak bug in ecry=
ptfs_init_messaging())
Merging ext3/for_next (0f7dbaee76f4 Merge quota initialization check fix fr=
om Chao Yu.)
Merging ext4/dev (040823b5372b Merge tag 'unicode-next-v5.4' of https://git=
.kernel.org/pub/scm/linux/kernel/git/krisman/unicode into dev)
Merging f2fs/dev (619e17cf75dd Merge tag 'for-v5.4' of git://git.kernel.org=
/pub/scm/linux/kernel/git/sre/linux-power-supply)
Merging fsverity/fsverity (95ae251fe828 f2fs: add fs-verity support)
Merging fuse/for-next (b7c8525a97d7 Merge branch 'virtio-fs' into for-next)
Merging jfs/jfs-next (a5fdd713d256 jfs: fix bogus variable self-initializat=
ion)
Merging nfs/linux-next (a3c0e7b1fe1f Merge tag 'libnvdimm-fixes-5.4-rc1' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm)
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
Merging pci/next (5184d449600f Merge tag 'microblaze-v5.4-rc1' of git://git=
.monstr.eu/linux-2.6-microblaze)
Merging pstore/for-next/pstore (609488bc979f Linux 5.3-rc2)
Merging hid/for-next (8c97be0a0aa0 Merge branch 'for-5.4/core' into for-nex=
t)
Merging i2c/i2c/for-next (11af27f49408 i2c: slave-eeprom: Add read only mod=
e)
Merging i3c/i3c/next (6030f42d20ce i3c: master: Use dev_to_i3cmaster())
Merging dmi/master (57361846b52b Linux 4.19-rc2)
Merging hwmon-staging/hwmon-next (4e19e72f45d3 hwmon: submitting-patches: A=
dd note on comment style)
Merging jc_docs/docs-next (fe013f8bc160 Documentation: kbuild: Add document=
 about reproducible builds)
Merging v4l-dvb/master (6f51fdfd8229 media: videobuf-core.c: poll_wait need=
s a non-NULL buf pointer)
Merging v4l-dvb-next/master (5f9e832c1370 Linus 5.3-rc1)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (315ea754a4c4 Merge branch 'pm-cpuidle' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (f75d2accca77 Merge branch 'cpuf=
req/qcom-updates' into cpufreq/arm/linux-next)
Merging cpupower/cpupower (87ce24320694 cpupower: update German translation)
Merging opp/opp/linux-next (071afa50609d Merge branch 'opp/qcom-updates' in=
to opp/linux-next)
Merging thermal/next (f1f2f614d535 Merge branch 'next-integrity' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (812cd88749e0 firewire: mark expected switch fall=
-throughs)
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (3eca7fc2d8d1 RDMA: Fix double-free in srq creation e=
rror flow)
Merging net-next/master (02dc96ef6c25 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/netdev/net)
Merging bpf-next/master (b41dae061bbd Merge tag 'xfs-5.4-merge-7' of git://=
git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging ipsec-next/master (990925fad5c2 Merge branch 'mlxsw-spectrum_buffer=
s-Add-the-ability-to-query-the-CPU-ports-shared-buffer')
Merging mlx5-next/mlx5-next (fc603294267f net/mlx5: Set only stag for match=
 untagged packets)
Merging netfilter-next/master (67e80b99a554 net: phylink: clarify where phy=
link should be used)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (1b0b807dd746 Merge branch 'r8169-fw')
Merging wireless-drivers-next/master (aa2eaa8c272a Merge git://git.kernel.o=
rg/pub/scm/linux/kernel/git/netdev/net)
Merging bluetooth/master (d51608af91b5 Bluetooth: btusb: avoid unused funct=
ion warning)
Merging mac80211-next/master (c1d3ad84eae3 cfg80211: Purge frame registrati=
ons on iftype change)
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
Merging drm/drm-next (3e2cb6d89325 Merge tag 'drm-fixes-5.4-2019-09-25' of =
git://people.freedesktop.org/~agd5f/linux into drm-next)
Merging amdgpu/drm-next (9c9284f9cee9 drm/amdgpu: Move null pointer derefer=
ence check)
Merging drm-intel/for-linux-next (458863e08e13 drm/i915: Mark contents as d=
irty on a write fault)
Merging drm-tegra/drm/tegra/for-next (2a6fc3cb5cb6 drm/tegra: Fix gpiod_get=
_from_of_node() regression)
Merging drm-misc/for-linux-next (65e51e30d862 drm/panfrost: Prevent race wh=
en handling page fault)
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
Merging regmap/for-next (1bd4584626a9 Merge branch 'regmap-5.4' into regmap=
-next)
Merging sound/for-next (f41f900568d9 ALSA: usb-audio: Add DSD support for E=
VGA NU Audio)
Merging sound-asoc/for-next (84b66885fdcf Merge branch 'asoc-5.4' into asoc=
-linus)
Merging modules/modules-next (2e6fcfeb9df6 module: Remove leftover '#undef'=
 from export header)
Merging input/next (410f25de467e Input: sidewinder - make array seq static =
const, makes object smaller)
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
Merging regulator/for-next (f9a60abc26d9 Merge branch 'regulator-5.4' into =
regulator-linus)
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
$ git rm -f fs/crypto/keyinfo.c
Applying: fsverity: merge fix for keyring_alloc API change
Applying: fscrypt: merge resolution for "keys: Replace uid/gid/perm permiss=
ions checking with an ACL"
Applying: dm verity: merge fix for "keys: Replace uid/gid/perm permissions =
checking with an ACL"
Merging selinux/next (15322a0d90b6 lsm: remove current_security())
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tpmdd/next (e13cd21ffd50 tpm: Wrap the buffer from the caller to tp=
m_buf in tpm_send())
Merging watchdog/master (ca2fc5efffde watchdog: f71808e_wdt: Add F81803 sup=
port)
Merging iommu/next (142dfcda5a35 Merge branch 'iommu/fixes' into next)
Merging vfio/next (e6c5d727db0a Merge branches 'v5.4/vfio/alexey-tce-memory=
-free-v1', 'v5.4/vfio/connie-re-arrange-v2', 'v5.4/vfio/hexin-pci-reset-v3'=
, 'v5.4/vfio/parav-mtty-uuid-v2' and 'v5.4/vfio/shameer-iova-list-v8' into =
v5.4/vfio/next)
Merging audit/next (5f9e832c1370 Linus 5.3-rc1)
Merging devicetree/for-next (59e9fcf8772b of: restore old handling of cells=
_name=3DNULL in of_*_phandle_with_args())
Merging mailbox/mailbox-for-next (556a0964e28c mailbox: qcom-apcs: fix max_=
register value)
Merging spi/for-next (60b76d1c3b0a Merge branch 'spi-5.4' into spi-linus)
Merging tip/auto-latest (4a6158fb485e Merge branch 'timers/urgent')
Merging clockevents/clockevents/next (befd04abfbe4 clocksource/drivers/sh_c=
mt: Document "cmt-48" as deprecated)
CONFLICT (content): Merge conflict in kernel/time/posix-timers.c
Merging edac/edac-for-next (3e443eb353ed EDAC/amd64: Add PCI device IDs for=
 family 17h, model 70h)
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
Merging xen-tip/linux-next (a4098bc6eed5 xen/pci: reserve MCFG areas earlie=
r)
Merging percpu/for-next (69f98a60cdbb Merge branch 'for-5.4' into for-next)
Merging workqueues/for-next (30ae2fc0a75e workqueue: Minor follow-ups to th=
e rescuer destruction change)
Merging drivers-x86/for-next (24a8d78a9aff platform/x86: i2c-multi-instanti=
ate: Derive the device name from parent)
Merging chrome-platform/for-next (4c1fde5077dc platform/chrome: cros_usbpd_=
logger: null check create_singlethread_workqueue)
Merging hsi/for-next (c1030cd45619 HSI: Remove dev_err() usage after platfo=
rm_get_irq())
Merging leds/for-next (6d4faf3b6b6e leds: lm3532: Fix optional led-max-micr=
oamp prop error handling)
Merging ipmi/for-next (c9acc3c4f8e4 ipmi_si_intf: Fix race in timer shutdow=
n handling)
Merging driver-core/driver-core-next (02dc96ef6c25 Merge git://git.kernel.o=
rg/pub/scm/linux/kernel/git/netdev/net)
Merging usb/usb-next (02dc96ef6c25 Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/netdev/net)
Merging usb-gadget/next (18a93cd38be3 usb: gadget: net2280: Add workaround =
for AB chip Errata 11)
Merging usb-serial/usb-next (7a786b847907 USB: serial: ftdi_sio: add suppor=
t for FT232H CBUS gpios)
Merging usb-chipidea-next/ci-for-usb-next (f14ac41f977f usb: chipidea: core=
: change vbus-regulator as optional)
Merging phy-next/next (5af67635c36e phy: marvell: phy-mvebu-cp110-comphy: r=
ename instances of DLT)
Merging tty/tty-next (02dc96ef6c25 Merge git://git.kernel.org/pub/scm/linux=
/kernel/git/netdev/net)
Merging char-misc/char-misc-next (02dc96ef6c25 Merge git://git.kernel.org/p=
ub/scm/linux/kernel/git/netdev/net)
Merging extcon/extcon-next (f25379de4123 extcon-intel-cht-wc: Don't reset U=
SB data connection at probe)
Merging soundwire/next (dfcff3f8a5f1 soundwire: stream: make stream name a =
const pointer)
Merging thunderbolt/next (dfda20419884 ACPI / property: Add two new Thunder=
bolt property GUIDs to the list)
Merging staging/staging-next (02dc96ef6c25 Merge git://git.kernel.org/pub/s=
cm/linux/kernel/git/netdev/net)
Merging mux/for-next (05fb8284a417 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (6311b6521bcc drivers: qcom: Add BCM vote macro to hea=
der)
Merging slave-dma/next (c5c6faaee6e0 dmaengine: ti: edma: Use bitmap_set() =
instead of open coded edma_set_bits())
Merging cgroup/for-next (275278e1525a Merge branch 'for-5.3-fixes' into for=
-next)
Merging scsi/for-next (ae7ccd015ece Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (4f38b20f40c2 Merge branch '5.4/scsi-fixes' into =
5.4/scsi-next)
CONFLICT (content): Merge conflict in drivers/scsi/lpfc/lpfc_sli4.h
Merging vhost/linux-next (0d4a3f2abbef Revert "vhost: block speculation of =
translated descriptors")
Merging rpmsg/for-next (741dc0aa4122 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (367677d49839 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (b630cea7bee7 gpio: mxc: Only get the secon=
d IRQ when there is more than one IRQ)
Merging gpio-intel/for-next (85af79659f45 MAINTAINERS: Remove stale record =
for gpio-intel-mid.c)
Merging pinctrl/for-next (cb0438e44360 pinctrl: meson-gxbb: Fix wrong pinni=
ng definition for uart_c)
Merging pinctrl-intel/for-next (55dac43747be pinctrl: intel: mark intel_pin=
_to_gpio __maybe_unused)
Merging pinctrl-samsung/for-next (10971e2ab6eb pinctrl: samsung: Fix device=
 node refcount leaks in init code)
Merging pwm/for-next (da635e7abe3f MAINTAINERS: Add myself as reviewer for =
the PWM subsystem)
Merging userns/for-next (318759b4737c signal/x86: Move tsk inside of CONFIG=
_MEMORY_FAILURE in do_sigbus)
Merging ktest/for-next (aecea57f84b0 ktest: Fix some typos in config-bisect=
.pl)
Merging random/dev (58be0106c530 random: fix soft lockup when trying to rea=
d from an uninitialized blocking pool)
Merging kselftest/next (721cb3c8bc88 selftests: tpm2: install python files)
Merging y2038/y2038 (870e0167cd9c Merge tag 'compat-ioctl-5.4-2' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/arnd/playground into y2038)
Merging livepatching/for-next (1cfe141e1715 Merge branch 'for-5.4-core' int=
o for-next)
Merging coresight/next (c165d8947bc4 eeprom: Deprecate the legacy eeprom dr=
iver)
Merging rtc/rtc-next (b99a3120f9a3 rtc: meson: mark PM functions as __maybe=
_unused)
Merging nvdimm/libnvdimm-for-next (4c806b897d60 libnvdimm/region: Enable MA=
P_SYNC for volatile regions)
Merging at24/at24/for-next (10742fee98eb eeprom: at24: remove unneeded incl=
ude)
Merging ntb/ntb-next (e58aa8d1e578 NTB: fix IDT Kconfig typos/spellos)
Merging kspp/for-next/kspp (6f88ed285e67 Merge branch 'fixes/usercopy/highm=
em-fromlist' into for-next/kspp)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (f2c7c76c5d0a Linux 5.2-rc3)
Merging fsi/next (799e064cc79e fsi: scom: Don't abort operations for minor =
errors)
Merging siox/siox/next (1e4b044d2251 Linux 4.18-rc4)
Merging slimbus/for-next (0a43bffb7e21 slimbus: fix slim_tid_txn())
Merging nvmem/for-next (ad732da57bde nvmem: core: fix nvmem_cell_write inli=
ne function)
Merging xarray/xarray (91abab83839a XArray: Fix xas_next() with a single en=
try at 0)
Merging hyperv/hyperv-next (d8bd2d442bb2 Drivers: hv: vmbus: Resume after f=
ixing up old primary channels)
Merging auxdisplay/auxdisplay (4d856f72c10e Linux 5.3)
Merging kgdb-dt/kgdb/for-next (d8a050f5a3e8 kgdb: fix comment regarding sta=
tic function)
Merging pidfd/for-next (590ef0128b42 waitid: Add support for waiting for th=
e current process group)
Merging devfreq/for-next (d2f5fccd1ac9 PM / devfreq: Make log message more =
explicit when devfreq device already exists)
Merging hmm/hmm (62974fc389b3 libnvdimm: Enable unit test infrastructure co=
mpile checks)
Merging fpga/for-next (e56476897448 fpga: Remove dev_err() usage after plat=
form_get_irq())
Applying: powerpc/64s/radix: fix for "tidy up TLB flushing code" and !CONFI=
G_PPC_RADIX_MMU
Merging akpm-current/current (580a3a106e1d ipc/msg.c: consolidate all xxxct=
l_down() functions)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: pinctrl: fix pxa2xx.c build warnings
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (ed9c4f28223d drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/5lri6dl+OLtcDKIPj06F9Pp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2RejoACgkQAVBC80lX
0GxbOwf9GFSOe5tnpgBzjvFrrvsqlK2CYyYncwHUpc8vj6Y8/gTnGLEjV93l6ns2
7jp8ipaEj4xo6vBU5sGNqaP4gADpMNsTV7ORsJXswff56V/RztXLvF5qt8kBGhEt
P7hdhr7c6pYTia+tydlyKNII9eJo59kNxMs9sDmaxN57mkNLjL7G6VSYW+pL/fq9
dCt5EPNH8N0aEW6fdRB+xPS45GRN2iOsyMOxmRIW7Rx4MSfsJHiQMgNQ/Ga80G0P
NYP0ghacgsEO45aqb/a02FATbECksUCSBrCqWXqYQ13z9ak0I8Hxl1Xo/U5BLiiK
GyxFmwWUwq4nubj0wwSU+1QGFhcC/A==
=ElJ5
-----END PGP SIGNATURE-----

--Sig_/5lri6dl+OLtcDKIPj06F9Pp--
