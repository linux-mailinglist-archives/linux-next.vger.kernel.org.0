Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27942D382D
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2019 06:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbfJKEF2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Oct 2019 00:05:28 -0400
Received: from ozlabs.org ([203.11.71.1]:58271 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725830AbfJKEF1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 11 Oct 2019 00:05:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46qDrJ1l1rz9sDB;
        Fri, 11 Oct 2019 15:05:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570766720;
        bh=vV8MEkKXhiwvXm5OHsxA64G1METXpa9LVOnFzu8R2BA=;
        h=Date:From:To:Cc:Subject:From;
        b=Fkm3N/hQ/dDuZKu+1EwxbHY9rD9iqgIYGhM/gK5m37D0UxQ759eVK8BWzYSKZI/E9
         yWs6qm4Xjvu3PwUtxgtWU2PkXIQFaX3qMcbI+cy9hY5w0e85tbuuWrwlKnXcMWmotI
         mEaUiHN6jYeuPmfmn4nuIPehPF+SyRklVXvf/hxg0klauGcTe8WIUu/jeguQW/ezrk
         zFl5SJUfB35UmltBzM0BAIe+X9y7p0oqW+qSzNOlQ5cKtn8INBxKtEoXVoACQmbvTR
         5lokhytc33BSIxr29e1PNt5X6Q7WC8ikw1w4/AEUPXNjwTU97N2HK10eeUGYsGo8Co
         B/iHKpnFyhOQA==
Date:   Fri, 11 Oct 2019 15:05:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 11
Message-ID: <20191011150519.54db5e2c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GMAhfifi2RJ.yq9e1UaSTad";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GMAhfifi2RJ.yq9e1UaSTad
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20191010:

Removed tree: renesas
Renamed tree: rensess-geert to rensesas

The tip tree gained a conflict against the net tree.

Non-merge commits (relative to Linus' tree): 3634
 3829 files changed, 122027 insertions(+), 62286 deletions(-)

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

I am currently merging 313 trees (counting Linus' and 78 trees of bug
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
Merging origin/master (9e208aa06c21 Merge tag 'xfs-5.4-fixes-3' of git://gi=
t.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging fixes/master (54ecb8f7028c Linux 5.4-rc1)
Merging kbuild-current/fixes (b8d5e105ebbf scripts: setlocalversion: fix a =
bashism)
Merging arc-current/for-curr (41277ba7eb4e ARC: mm: tlb flush optim: elide =
redundant uTLB invalidates for MMUv3)
Merging arm-current/fixes (4d856f72c10e Linux 5.3)
Merging arm-soc-fixes/arm/fixes (60c1b3e25728 ARM: multi_v7_defconfig: Fix =
SPI_STM32_QSPI support)
Merging arm64-fixes/for-next/fixes (3e7c93bd04ed arm64: armv8_deprecated: C=
hecking return value for memory allocation)
Merging m68k-current/for-linus (0f1979b402df m68k: Remove ioremap_fullcache=
())
Merging powerpc-fixes/fixes (3439595d5b85 selftests/powerpc: Fix compile er=
ror on tlbie_test due to newer gcc)
Merging s390-fixes/fixes (05668e1d74b8 s390/cio: fix virtio-ccw DMA without=
 PV)
Merging sparc/master (038029c03e21 sparc: remove unneeded uapi/asm/statfs.h)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (70c2655849a2 net: silence KCSAN warnings about sk->sk_b=
acklog.len reads)
Merging bpf/master (106c35dda32f selftests/bpf: More compatible nc options =
in test_lwt_ip_encap)
Merging ipsec/master (68ce6688a5ba net: sched: taprio: Fix potential intege=
r overflow in taprio_set_picos_per_byte)
Merging netfilter/master (503c9addef61 ptp: fix typo of "mechanism" in Kcon=
fig help text)
Merging ipvs/master (503c9addef61 ptp: fix typo of "mechanism" in Kconfig h=
elp text)
Merging wireless-drivers/master (3aed88373bda Merge tag 'iwlwifi-for-kalle-=
2019-10-09' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwif=
i-fixes)
Merging mac80211/master (4123f637a512 ip6erspan: remove the incorrect mtu l=
imit for ip6erspan)
Merging rdma-fixes/for-rc (0417791536ae RDMA/mlx5: Add missing synchronize_=
srcu() for MW cases)
Merging sound-current/for-linus (130bce3afbbb ALSA: hdac: clear link output=
 stream mapping)
Merging sound-asoc-fixes/for-linus (3e722e0e81ca Merge branch 'asoc-5.4' in=
to asoc-linus)
Merging regmap-fixes/for-linus (da0c9ea146cb Linux 5.4-rc2)
Merging regulator-fixes/for-linus (ca32f845a865 Merge branch 'regulator-5.4=
' into regulator-linus)
Merging spi-fixes/for-linus (f4192468460d Merge branch 'spi-5.4' into spi-l=
inus)
Merging pci-current/for-linus (54ecb8f7028c Linux 5.4-rc1)
Merging driver-core.current/driver-core-linus (82af5b660967 sysfs: Fixes __=
BIN_ATTR_WO() macro)
Merging tty.current/tty-linus (31a8d8fa84c5 tty: serial: imx: Use platform_=
get_irq_optional() for optional IRQs)
Merging usb.current/usb-linus (aafb00a977cf USB: yurex: fix NULL-derefs on =
disconnect)
Merging usb-gadget-fixes/fixes (4a56a478a525 usb: gadget: mass_storage: Fix=
 races between fsg_disable and fsg_set_alt)
Merging usb-serial-fixes/usb-linus (7d7e21fafdbc USB: serial: keyspan: fix =
NULL-derefs on open() and write())
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (a8c267546ac0 phy: renesas: phy-rcar-gen2: Fix the array =
off by one warning)
Merging staging.current/staging-linus (3f3d31622a2c Merge tag 'iio-fixes-fo=
r-5.4a' of https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into s=
taging-linus)
Merging char-misc.current/char-misc-linus (b058b2552edb w1: ds250x: Fix bui=
ld error without CRC16)
Merging soundwire-fixes/fixes (d1abaeb3be7b Linux 5.3-rc5)
Merging thunderbolt-fixes/fixes (747125db6dcd thunderbolt: Drop unnecessary=
 read when writing LC command in Ice Lake)
Merging input-current/for-linus (bcf059578980 Input: soc_button_array - par=
tial revert of support for newer surface devices)
Merging crypto-current/master (f703964fc668 crypto: arm/aes-ce - add depend=
ency on AES library)
Merging ide/master (baf6722aa0cb ide: Use dev_get_drvdata where possible)
Merging vfio-fixes/for-linus (5715c4dd66a3 vfio/mdev: Synchronize device cr=
eate/remove with parent removal)
Merging kselftest-fixes/fixes (ce3a67780212 selftests: watchdog: Add comman=
d line option to show watchdog_info)
Merging modules-fixes/modules-linus (fcfacb9f8374 doc: move namespaces.rst =
from kbuild/ to core-api/)
Merging slave-dma-fixes/fixes (04cbfba62085 Merge tag 'dmaengine-5.4-rc1' o=
f git://git.infradead.org/users/vkoul/slave-dma)
Merging backlight-fixes/for-backlight-fixes (e93c9c99a629 Linux 5.1)
Merging mtd-fixes/mtd/fixes (df8fed831cbc mtd: rawnand: au1550nd: Fix au_re=
ad_buf16() prototype)
Merging mfd-fixes/for-mfd-fixes (4d82fa67dd6b mfd: rk808: Make PM function =
declaration static)
Merging v4l-dvb-fixes/fixes (3e84a18a259e media: meson/ao-cec: move cec_not=
ifier_cec_adap_register after hw setup)
Merging reset-fixes/reset/fixes (a71dcd3757e2 reset: remove redundant null =
check on pointer dev)
Merging mips-fixes/mips-fixes (efcb529694c3 MIPS: fw: sni: Fix out of bound=
s init of o32 stack)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (647c8977e111 ARM: dts: am3874-iceboard: Fix 'i2c-=
mux-idle-disconnect' usage)
Merging kvm-fixes/master (da0c9ea146cb Linux 5.4-rc2)
Merging kvms390-fixes/master (53936b5bf35e KVM: s390: Do not leak kernel st=
ack data in the KVM_S390_INTERRUPT ioctl)
Merging hwmon-fixes/hwmon (11c943a1a635 hwmon: docs: Extend inspur-ipsps1 t=
itle underline)
Merging nvdimm-fixes/libnvdimm-fixes (4c806b897d60 libnvdimm/region: Enable=
 MAP_SYNC for volatile regions)
Merging btrfs-fixes/next-fixes (26966e98a28b Merge branch 'misc-5.4' into n=
ext-fixes)
Merging vfs-fixes/fixes (d4f4de5e5ef8 Fix the locking in dcache_readdir() a=
nd friends)
Merging dma-mapping-fixes/for-linus (2cf2aa6a69db dma-mapping: fix false po=
sitivse warnings in dma_common_free_remap())
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (71eea7071583 platform/x86: intel_punit_ipc=
: Avoid error message when retrieving IRQ)
Merging samsung-krzk-fixes/fixes (54ecb8f7028c Linux 5.4-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging devicetree-fixes/dt/linus (f437ade3296b dt-bindings: phy: lantiq: F=
ix Property Name)
Merging scsi-fixes/fixes (6a0990eaa768 scsi: ch: Make it possible to open a=
 ch device multiple times again)
Merging drm-fixes/drm-fixes (da0c9ea146cb Linux 5.4-rc2)
Merging amdgpu-fixes/drm-fixes (c0e70e10b11b drm/amd/display: fix dcn21 Mak=
efile for clang)
Merging drm-intel-fixes/for-linux-next-fixes (e137d3abdfca drm/i915/gt: exe=
clists->active is serialised by the tasklet)
Merging mmc-fixes/fixes (28c9fac09ab0 memstick: jmb38x_ms: Fix an error han=
dling path in 'jmb38x_ms_probe()')
Merging rtc-fixes/rtc-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging gnss-fixes/gnss-linus (54ecb8f7028c Linux 5.4-rc1)
Merging hyperv-fixes/hyperv-fixes (83b50f83a968 Drivers: hv: vmbus: Fix har=
mless building warnings without CONFIG_PM_SLEEP)
Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe=
_pin_request())
Merging risc-v-fixes/fixes (152d8737c6aa RISC-V: entry: Remove unneeded nee=
d_resched() loop)
Merging pidfd-fixes/fixes (ee05c7eed5e1 taskstats: fix data-race)
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (02dc96ef6c25 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/netdev/net)
Merging gpio-intel-fixes/fixes (da90555f587a gpio: merrifield: Move hardwar=
e initialization to callback)
Merging pinctrl-intel-fixes/fixes (260996c30f4f pinctrl: cherryview: restor=
e Strago DMI workaround for all versions)
Merging erofs-fixes/fixes (da0c9ea146cb Linux 5.4-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (c3d79a83ca10 dma-buf/resv: fix=
 exclusive fence get)
Merging kspp-gustavo/for-next/kspp (da0c9ea146cb Linux 5.4-rc2)
Merging kbuild/for-next (da676aa92374 kconfig: split util.c out of parser.y)
Merging compiler-attributes/compiler-attributes (54ecb8f7028c Linux 5.4-rc1)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (c7d9eccb3c1e mmc: renesas_sdhi_internal_dmac:=
 Add MMC_CAP2_MERGE_CAPABLE)
Merging asm-generic/master (9b87647c665d asm-generic: add unlikely to defau=
lt BUG_ON(x))
Merging arc/for-next (6fbc7275c7a9 Linux 5.2-rc7)
Merging arm/for-next (259f8de193b3 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (e376897f424a arm64: remove __iounmap)
Merging arm-perf/for-next/perf (c8b0de762e0b perf/smmuv3: use devm_platform=
_ioremap_resource() to simplify code)
Merging arm-soc/for-next (be78662f5e30 Merge branch 'arm/fixes' into for-ne=
xt)
Merging actions/for-next (fb9c1c1deb5e Merge branch 'v4.20/drivers+s900-sps=
' into next)
Merging amlogic/for-next (31e508a2bfdb Merge branch 'v5.5/dt64' into tmp/am=
l-rebuild)
Merging aspeed/for-next (70b422265e72 ARM: dts: vesnin: Add power_green led)
Merging at91/at91-next (9072e308f698 Merge branches 'at91-drivers', 'at91-s=
oc' and 'at91-dt' into at91-next)
Merging bcm2835/for-next (7c1f7a6a7116 Merge branch 'bcm2835-maintainers-ne=
xt' into for-next)
Merging imx-mxs/for-next (fade20c4077b Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (35096b5f4619 Merge branch 'for_5.5/driver-soc' into =
next)
Merging mediatek/for-next (4ae1ce88e9a0 Merge branch 'v5.3-next/soc' into f=
or-next)
Merging mvebu/for-next (3aa22be2d6b1 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (7968f13dadce Merge branch 'omap-for-v5.5/ti-sysc' in=
to for-next)
Merging qcom/for-next (88ee75ba303d Merge branches 'arm64-for-5.5', 'defcon=
fig-for-5.5' 'drivers-for-5.5' and 'dts-for-5.5' into for-next)
Merging renesas/next (aca0770d9702 Merge branches 'renesas-arm-dt-for-v5.5'=
, 'renesas-arm64-defconfig-for-v5.5', 'renesas-arm64-dt-for-v5.5', 'renesas=
-drivers-for-v5.5' and 'renesas-dt-bindings-for-v5.5' into renesas-next)
Merging reset/reset/next (bdb369e1e98a reset: add support for the Meson-A1 =
SoC Reset Controller)
Merging rockchip/for-next (84b268b90f24 Merge branch 'v5.5-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (0228b0ee789c Merge branch 'next/defconfig' i=
nto for-next)
CONFLICT (content): Merge conflict in arch/arm/configs/multi_v7_defconfig
Merging scmi/for-linux-next (8a8c600de5dc Merge tag 'for-linus' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/rdma/rdma)
Merging sunxi/sunxi/for-next (d49380083493 Merge branch 'sunxi/dt-for-5.5' =
into sunxi/for-next)
Merging tegra/for-next (d40c8de825cc Merge branch for-5.5/arm64/dt into for=
-next)
Merging clk/clk-next (51f9d768d5b8 Merge branch 'clk-marvell' into clk-next)
Merging clk-samsung/for-next (a188339ca5a3 Linux 5.2-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (f7dafb0af1de csky: Add setup_initrd check code)
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (0d3d343560ba genirq: remove the is_affinity_mask_valid h=
ook)
Merging m68k/for-next (0f1979b402df m68k: Remove ioremap_fullcache())
Merging m68knommu/for-next (da0c9ea146cb Linux 5.4-rc2)
Merging microblaze/next (39014c45467f microblaze: entry: Remove unneeded ne=
ed_resched() loop)
Merging mips/mips-next (df3da04880b4 mips: Fix unroll macro when building w=
ith Clang)
Merging nds32/next (932296120543 nds32: add new emulations for floating poi=
nt instruction)
Merging nios2/for-next (91d99a724e9c nios2: force the string buffer NULL-te=
rminated)
Merging openrisc/for-next (f3b17320db25 openrisc: map as uncached in iorema=
p)
Merging parisc-hd/for-next (0836e665ade9 parisc: Fix vmap memory leak in io=
remap()/iounmap())
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
Merging cifs/for-next (c8b288d708e8 cifs: Handle -EINPROGRESS only when nob=
lockcnt is set)
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
Merging fuse/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging jfs/jfs-next (a5fdd713d256 jfs: fix bogus variable self-initializat=
ion)
Merging nfs/linux-next (da0c9ea146cb Linux 5.4-rc2)
Merging nfs-anna/linux-next (af84537dbd1b SUNRPC: fix race to sk_err after =
xs_error_report)
Merging nfsd/nfsd-next (832b2cb95543 svcrdma: Improve DMA mapping trace poi=
nts)
Merging orangefs/for-next (e6b998ab62be orangefs: remove redundant assignme=
nt to err)
Merging overlayfs/overlayfs-next (5c2e9f346b81 ovl: filter of trusted xattr=
 results in audit)
Merging ubifs/linux-next (6a379f67454a jffs2: Fix memory leak in jffs2_scan=
_eraseblock() error path)
Merging v9fs/9p-next (aafee43b7286 9p/vfs_super.c: Remove unused parameter =
data in v9fs_fill_super)
Merging xfs/for-next (aeea4b75f045 xfs: move local to extent inode logging =
into bmap helper)
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
Merging hid/for-next (dcd66320eb96 Merge branch 'for-5.5/whiskers' into for=
-next)
Merging i2c/i2c/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging i3c/i3c/next (f12b524ea386 i3c: master: use i3c_dev_get_master())
Merging dmi/master (c11f2bc422b9 firmware: dmi: Fix unlikely out-of-bounds =
read in save_mem_devices)
Merging hwmon-staging/hwmon-next (b2a7ca7a1322 hwmon: abituguru: make array=
 probe_order static, makes object smaller)
Merging jc_docs/docs-next (0a6f33dba4ee dm dust: convert documentation to R=
eST)
CONFLICT (content): Merge conflict in Documentation/admin-guide/cgroup-v2.r=
st
Merging v4l-dvb/master (3ff3a712a9ea media: ti-vpe: vpe: don't rely on colo=
rspace member for conversion)
Merging v4l-dvb-next/master (167f4555184b Merge branch fixes_for_upstream i=
nto to_next)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (b89deb903046 Merge branch 'pm-sleep' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (09865094536c ARM: dts: Add OPP-=
V2 table for AM3517)
Merging cpupower/cpupower (7e5705c635ec tools/power/cpupower: Fix initializ=
er override in hsw_ext_cstates)
Merging opp/opp/linux-next (f2edbb6699b0 opp: of: drop incorrect lockdep_as=
sert_held())
Merging thermal/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (812cd88749e0 firewire: mark expected switch fall=
-throughs)
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (909624d8db5b IB/cm: Use container_of() instead of ty=
pecast)
Merging net-next/master (c17e26ddc795 team: call RCU read lock when walking=
 the port_list)
Applying: rxrpc: fix up for "rxrpc: Fix trace-after-put looking at the put =
peer record"
Merging bpf-next/master (e0b68fb186b2 scripts/bpf: Fix xdp_md forward decla=
ration typo)
CONFLICT (content): Merge conflict in tools/lib/bpf/Makefile
Merging ipsec-next/master (fd1ac07f3f17 xfrm: ifdef setsockopt(UDP_ENCAP_ES=
PINUDP/UDP_ENCAP_ESPINUDP_NON_IKE))
Merging mlx5-next/mlx5-next (7d47433cf74f net/mlx5: Expose optimal performa=
nce scatter entries capability)
Merging netfilter-next/master (f8615bf8a3da netfilter: ipset: move ip_set_g=
et_ip_port() to ip_set_bitmap_port.c.)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (ac524481d7f7 ipvs: batch __ip_vs_dev_cleanup)
Merging wireless-drivers-next/master (ac8efe4f4a84 rtlwifi: rtl8192ee: Remo=
ve set but not used variable 'cur_tx_wp')
Merging bluetooth/master (840aff3994c8 Bluetooth: btusb: Use IS_ENABLED ins=
tead of #ifdef)
Merging mac80211-next/master (2ce113de3132 mac80211: simplify TX aggregatio=
n start)
Merging gfs2/for-next (f6ef4bff81cc gfs2: Fix memory leak when gfs2meta's f=
s_context is freed)
Merging mtd/mtd/next (b34c095ca609 mtd: st_spi_fsm: remove unused field fro=
m struct stfsm)
Merging nand/nand/next (5121b4219972 dt-bindings: mtd: Add Cadence NAND con=
troller driver)
Merging spi-nor/spi-nor/next (54ecb8f7028c Linux 5.4-rc1)
Merging crypto/master (504582e8e40b crypto: geode-aes - switch to skcipher =
for cbc(aes) fallback)
Merging drm/drm-next (97ea56540ffc Merge tag 'drm-intel-next-2019-10-07' of=
 git://anongit.freedesktop.org/drm/drm-intel into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/selftests/i915_g=
em.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_request.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_lrc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_mma=
n.c
Merging amdgpu/drm-next (bfb10825fe14 drm/amdgpu: move gpu reset out of amd=
gpu_device_suspend)
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
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/selftests/i915_g=
em.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_request.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_mma=
n.c
Merging drm-tegra/drm/tegra/for-next (9d5a54987265 drm/tegra: Fix ordering =
of cleanup code)
Merging drm-misc/for-linux-next (2636a5172da2 drm/scheduler: make unexporte=
d items static)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_vma.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem_gtt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_exe=
cbuffer.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm_mst_types.c
Applying: cec: fix up for "cec: add cec_adapter to cec_notifier_cec_adap_un=
register()"
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
Merging sound/for-next (82e8d723e9e6 sound: Fix Kconfig indentation)
Merging sound-asoc/for-next (bdb75341f74a Merge branch 'asoc-5.5' into asoc=
-next)
CONFLICT (content): Merge conflict in sound/soc/samsung/Kconfig
Applying: ASOC: SOF: dai-imx.h needs linux/types.h
Merging modules/modules-next (54ecb8f7028c Linux 5.4-rc1)
Merging input/next (792e154c4814 Input: pixcir_i2c_ts - remove platform dat=
a)
Merging block/for-next (9f3e9e7c13e7 Merge branch 'for-5.5/block' into for-=
next)
Merging device-mapper/for-next (b21555786f18 dm snapshot: rework COW thrott=
ling to fix deadlock)
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
Merging battery/for-next (7f7378618b41 power: supply: cpcap-charger: Enable=
 vbus boost voltage)
Merging regulator/for-next (daeaf06841a7 Merge branch 'regulator-5.5' into =
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
Merging selinux/next (42345b68c2e3 selinux: default_range glblub implementa=
tion)
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (23641a048089 printk: Monitor change of console logle=
vel.)
Merging tpmdd/next (e13cd21ffd50 tpm: Wrap the buffer from the caller to tp=
m_buf in tpm_send())
Merging watchdog/master (ca2fc5efffde watchdog: f71808e_wdt: Add F81803 sup=
port)
Merging iommu/next (142dfcda5a35 Merge branch 'iommu/fixes' into next)
Merging vfio/next (e6c5d727db0a Merge branches 'v5.4/vfio/alexey-tce-memory=
-free-v1', 'v5.4/vfio/connie-re-arrange-v2', 'v5.4/vfio/hexin-pci-reset-v3'=
, 'v5.4/vfio/parav-mtty-uuid-v2' and 'v5.4/vfio/shameer-iova-list-v8' into =
v5.4/vfio/next)
Merging audit/next (245d73698ed7 audit: Report suspicious O_CREAT usage)
Merging devicetree/for-next (951d48855d86 of: Make of_dma_get_range() work =
on bus nodes)
Merging mailbox/mailbox-for-next (556a0964e28c mailbox: qcom-apcs: fix max_=
register value)
Merging spi/for-next (e9a535bc7c7b Merge remote-tracking branch 'spi/topic/=
ptp' into spi-next)
Merging tip/auto-latest (7d698727fda5 Merge branch 'core/objtool')
CONFLICT (content): Merge conflict in net/core/sock.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_shr=
inker.c
Applying: drm/i915: update for mutex_release API change
Merging clockevents/clockevents/next (befd04abfbe4 clocksource/drivers/sh_c=
mt: Document "cmt-48" as deprecated)
CONFLICT (content): Merge conflict in kernel/time/posix-timers.c
Merging edac/edac-for-next (9816b4af4351 EDAC/device: Rework error logging =
API)
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
Merging drivers-x86/for-next (5c28c4e2111d platform/x86: dell-laptop: disab=
le kbd backlight on Inspiron 10xx)
Merging chrome-platform/for-next (e6679fd1e2fc platform/chrome: wilco_ec: A=
dd debugfs test_event file)
Merging hsi/for-next (c1030cd45619 HSI: Remove dev_err() usage after platfo=
rm_get_irq())
Merging leds/for-next (7ae4717cb9cb leds: core: Fix leds.h structure docume=
ntation)
Merging ipmi/for-next (c9acc3c4f8e4 ipmi_si_intf: Fix race in timer shutdow=
n handling)
Merging driver-core/driver-core-next (201e91091b1d sh: add the sh_ prefix t=
o early platform symbols)
Merging usb/usb-next (1141a7522e39 usb: typec: remove duplicated include fr=
om hd3ss3220.c)
Merging usb-gadget/next (18a93cd38be3 usb: gadget: net2280: Add workaround =
for AB chip Errata 11)
Merging usb-serial/usb-next (54ecb8f7028c Linux 5.4-rc1)
Merging usb-chipidea-next/ci-for-usb-next (973ce009b308 usb: chipidea: imx:=
 check data->usbmisc_data against NULL before access)
Merging phy-next/next (54ecb8f7028c Linux 5.4-rc1)
Merging tty/tty-next (7726fb53e75f tty:n_gsm.c: destroy port by tty_port_de=
stroy())
Merging char-misc/char-misc-next (3e917975b7cd mei: me: fix me_intr_clear f=
unction name in KDoc)
Merging extcon/extcon-next (e81b88932985 extcon-intel-cht-wc: Don't reset U=
SB data connection at probe)
Merging soundwire/next (dfcff3f8a5f1 soundwire: stream: make stream name a =
const pointer)
Merging thunderbolt/next (b406357c572b thunderbolt: Add 'generation' attrib=
ute for devices)
Merging staging/staging-next (d13cf9eae444 staging: wfx: fix spelling mista=
ke "non existant" -> "non-existent")
Merging mux/for-next (05fb8284a417 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (44223a8b45d7 interconnect: qcom: Fix icc_onecell_data=
 allocation)
Merging slave-dma/next (c5c6faaee6e0 dmaengine: ti: edma: Use bitmap_set() =
instead of open coded edma_set_bits())
Merging cgroup/for-next (1a99fcc035fb selftests: cgroup: Run test_core unde=
r interfering stress)
Merging scsi/for-next (dda08a80d659 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (41ace3742291 Merge branch '5.4/scsi-fixes' into =
5.5/scsi-next)
Merging vhost/linux-next (0d4a3f2abbef Revert "vhost: block speculation of =
translated descriptors")
Merging rpmsg/for-next (741dc0aa4122 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (4002d58d2f8d Merge branch 'devel' into for-next)
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
Merging rtc/rtc-next (147dae76dbb9 rtc: ds1347: handle century register)
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
Merging pidfd/for-next (c90012ac85c2 lib: test_user_copy: style cleanup)
Merging devfreq/for-next (d2f5fccd1ac9 PM / devfreq: Make log message more =
explicit when devfreq device already exists)
Merging hmm/hmm (54ecb8f7028c Linux 5.4-rc1)
Merging fpga/for-next (d20c0da8b202 fpga: Remove dev_err() usage after plat=
form_get_irq())
Merging kunit/test (d460623c5fa1 Documentation: kunit: Fix verification com=
mand)
Merging akpm-current/current (7afbb1970dd9 ipc/msg.c: consolidate all xxxct=
l_down() functions)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: samples/watch_queue/watch_test: fix build
Applying: pinctrl: fix pxa2xx.c build warnings
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
Applying: kernel-hacking: move DEBUG_FS to 'Generic Kernel Debugging Instru=
ments'
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (4ca79c152dc5 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/GMAhfifi2RJ.yq9e1UaSTad
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2f/38ACgkQAVBC80lX
0GxRDAf/ZiycDVXg5XGM7oxntg+QlDHbcpblYCRjFfz0ru+FJ2o9PbsQDkHeeg65
HYNnrGxFsja91aCYmu5MOUoKIQ6jPQbeDRmips9h8H0RDhbPCS0lr22VFQOrswn1
2Wk5uAux+yIE0sz1PjWV/ZBxyYaZ3Fw8eR9GITcV7rrBD6YrCCB94PGSoiTEm3/Y
zAA70+fjFj0PBEnIrw0ZgKiGtS+vdWmVnyB1ikPTvhW2nNjQko8di7hmUTR67Uod
fE39YqmQNY9Id4lLmWwXFuuV7hIVkw4VPXMip8r6UAftCz5zAOw0sy/9KwG+bk9F
ua0l2HE9JKKFN7OvoeIqAc1cdY3F4A==
=oM5p
-----END PGP SIGNATURE-----

--Sig_/GMAhfifi2RJ.yq9e1UaSTad--
