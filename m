Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 578F6EFBA2
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 11:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388469AbfKEKnN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 05:43:13 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:53085 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388203AbfKEKnM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 5 Nov 2019 05:43:12 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 476mTj4Z4Nz9s4Y;
        Tue,  5 Nov 2019 21:43:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572950585;
        bh=p7BN/j1XU42fKHKtXYzsK37nOAc29mRChQ0QeHc+dWI=;
        h=Date:From:To:Cc:Subject:From;
        b=QyXBL9T/dB0/yQYRKn7tpcphtnJDLz+bBYJUid8I+jK5fHQ9jUOrBRzPtVJdf1QyY
         /0TTqxtxuVW+6uPlBNHL+Cul5kkpRaYJMW9hZDlsT/zseFCEsJoqQkb7JjgZ6OBiUe
         yHJEbYSdMt7RYgZv5vMdcfcVC4ZIx0Bs5U2nw7pUbm2CuGb1dHnx4ogy/6S/so2lUp
         rNA7tKUTFggstQiRyZWxq8tFwXB2cNh/n81CM8sVvCjHJwCC4c5LD2naTv5niJO+KD
         b7ROBHvOtkmrb42VZD0REMP8kLoj1ZBBdnUtcPoNcYbrHGJDBFubP1cKRwBp1o/Pgq
         cDkadEPyn80GQ==
Date:   Tue, 5 Nov 2019 21:43:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 5
Message-ID: <20191105214300.76263573@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Es4=xsSGmjb218.YmkWO+2p";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Es4=xsSGmjb218.YmkWO+2p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20191031:

The qcom tree gained a conflict against the arm-soc tree.

The mips tree gained a conflict against the mips-fixes tree.

The jc_docs tree gained a conflict against the arm-perf tree.

The rdma tree gained a conflict against Linus' tree.

The net-next tree gained a conflict against the staging.current tree.
It also gained a build failure for which I applied a patch.

The crypto tree gained a conflict against Linus' tree.

The drm tree gained a build failure so I used the version from
next-20191031.

The staging tree gained a conflict against the staging.current and
net-next trees.

The hmm tree gained conflicts against the drm and rdma trees.

The cel tree gained a conflict against the rdma tree.

The akpm-current tree gained a build failure for which I reverted
a commit.

The akpm tree gained a conflict against the kunit tree.

Non-merge commits (relative to Linus' tree): 7979
 7364 files changed, 318617 insertions(+), 132797 deletions(-)

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

I am currently merging 310 trees (counting Linus' and 78 trees of bug
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
Merging origin/master (a99d8080aaf3 Linux 5.4-rc6)
Merging fixes/master (54ecb8f7028c Linux 5.4-rc1)
Merging kbuild-current/fixes (d6d5df1db6e9 Linux 5.4-rc5)
Merging arc-current/for-curr (5effc09c4907 ARC: perf: Accommodate big-endia=
n CPU)
Merging arm-current/fixes (39f4d4410484 Merge branch 'misc' into fixes)
Merging arm-soc-fixes/arm/fixes (3a82cd448489 Merge tag 'imx-fixes-5.4-3' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fix=
es)
Merging arm64-fixes/for-next/fixes (1cf45b8fdbb8 arm64: apply ARM64_ERRATUM=
_843419 workaround for Brahma-B53 core)
Merging m68k-current/for-linus (0f1979b402df m68k: Remove ioremap_fullcache=
())
Merging powerpc-fixes/fixes (7d6475051fb3 powerpc/powernv: Fix CPU idle to =
be called with IRQs disabled)
Merging s390-fixes/fixes (3d7efa4edd07 s390/idle: fix cpu idle time calcula=
tion)
Merging sparc/master (038029c03e21 sparc: remove unneeded uapi/asm/statfs.h)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (3d1e5039f5f8 dccp: do not leak jiffies on the wire)
Merging bpf/master (7de086909365 powerpc/bpf: Fix tail call implementation)
Merging ipsec/master (68ce6688a5ba net: sched: taprio: Fix potential intege=
r overflow in taprio_set_picos_per_byte)
Merging netfilter/master (1204c70d9dcb Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/netdev/net)
Merging ipvs/master (c24b75e0f923 ipvs: move old_secure_tcp into struct net=
ns_ipvs)
Merging wireless-drivers/master (3d206e6899a0 iwlwifi: fw api: support new =
API for scan config cmd)
Merging mac80211/master (1fab1b89e2e8 nl80211: fix validation of mesh path =
nexthop)
Merging rdma-fixes/for-rc (b681a0529968 RDMA/hns: Prevent memory leaks of e=
q->buf_list)
Merging sound-current/for-linus (706ad6746a66 ALSA: bebob: fix to detect co=
nfigured source of sampling clock for Focusrite Saffire Pro i/o series)
Merging sound-asoc-fixes/for-linus (315ebd829f73 Merge branch 'asoc-5.4' in=
to asoc-linus)
Merging regmap-fixes/for-linus (da0c9ea146cb Linux 5.4-rc2)
Merging regulator-fixes/for-linus (51e53e6f6be8 Merge branch 'regulator-5.4=
' into regulator-linus)
Merging spi-fixes/for-linus (3482f557c303 Merge branch 'spi-5.4' into spi-l=
inus)
Merging pci-current/for-linus (54ecb8f7028c Linux 5.4-rc1)
Merging driver-core.current/driver-core-linus (d6d5df1db6e9 Linux 5.4-rc5)
Merging tty.current/tty-linus (d6d5df1db6e9 Linux 5.4-rc5)
Merging usb.current/usb-linus (a99d8080aaf3 Linux 5.4-rc6)
Merging usb-gadget-fixes/fixes (f3fb802efaef usb: cdns3: gadget: Don't mana=
ge pullups)
Merging usb-serial-fixes/usb-linus (bc25770f00d3 USB: serial: ti_usb_3410_5=
052: clean up serial data access)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (54ecb8f7028c Linux 5.4-rc1)
Merging staging.current/staging-linus (fe4c59394ede Merge tag 'iio-fixes-fo=
r-5.4b' of https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into s=
taging-linus)
Merging char-misc.current/char-misc-linus (9d55499d8da4 intel_th: pci: Add =
Jasper Lake PCH support)
Merging soundwire-fixes/fixes (7b47ad3322d1 soundwire: slave: fix scanf for=
mat)
Merging thunderbolt-fixes/fixes (747125db6dcd thunderbolt: Drop unnecessary=
 read when writing LC command in Ice Lake)
Merging input-current/for-linus (b1a402e75a5f Input: st1232 - fix reporting=
 multitouch coordinates)
Merging crypto-current/master (f703964fc668 crypto: arm/aes-ce - add depend=
ency on AES library)
Merging ide/master (baf6722aa0cb ide: Use dev_get_drvdata where possible)
Merging vfio-fixes/for-linus (95f89e090618 vfio/type1: Initialize resv_msi_=
base)
Merging kselftest-fixes/fixes (303e6218ecec selftests: Fix O=3D and KBUILD_=
OUTPUT handling for relative paths)
Merging modules-fixes/modules-linus (09684950050b scripts/nsdeps: use alter=
native sed delimiter)
Merging slave-dma-fixes/fixes (bacdcb6675e1 dmaengine: cppi41: Fix cppi41_d=
ma_prep_slave_sg() when idle)
Merging backlight-fixes/for-backlight-fixes (e93c9c99a629 Linux 5.1)
Merging mtd-fixes/mtd/fixes (df8fed831cbc mtd: rawnand: au1550nd: Fix au_re=
ad_buf16() prototype)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (3e84a18a259e media: meson/ao-cec: move cec_not=
ifier_cec_adap_register after hw setup)
Merging reset-fixes/reset/fixes (f430c7ed8bc2 reset: fix reset_control_ops =
kerneldoc comment)
Merging mips-fixes/mips-fixes (f6929c92e283 MAINTAINERS: Remove Kevin as ma=
intainer of BMIPS generic platforms)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (6aed5a0e0f56 Merge branch 'watchdog-fix' into fix=
es)
Merging kvm-fixes/master (671ddc700fd0 KVM: nVMX: Don't leak L1 MMIO region=
s to L2)
Merging kvms390-fixes/master (53936b5bf35e KVM: s390: Do not leak kernel st=
ack data in the KVM_S390_INTERRUPT ioctl)
Merging hwmon-fixes/hwmon (a99d8080aaf3 Linux 5.4-rc6)
Merging nvdimm-fixes/libnvdimm-fixes (6370740e5f8e fs/dax: Fix pmd vs pte c=
onflict detection)
Merging btrfs-fixes/next-fixes (e05781a99fd5 Merge branch 'misc-5.4' into n=
ext-fixes)
Merging vfs-fixes/fixes (03ad0d703df7 autofs: fix a leak in autofs_expire_i=
ndirect())
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (7d194c2100ad Linux 5.4-rc4)
Merging samsung-krzk-fixes/fixes (54ecb8f7028c Linux 5.4-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging devicetree-fixes/dt/linus (5dba51754b04 of: reserved_mem: add missi=
ng of_node_put() for proper ref-counting)
Merging scsi-fixes/fixes (d3566abb1a1e scsi: qla2xxx: stop timer in shutdow=
n path)
Merging drm-fixes/drm-fixes (a99d8080aaf3 Linux 5.4-rc6)
Merging amdgpu-fixes/drm-fixes (c0e70e10b11b drm/amd/display: fix dcn21 Mak=
efile for clang)
Merging drm-intel-fixes/for-linux-next-fixes (a99d8080aaf3 Linux 5.4-rc6)
Merging mmc-fixes/fixes (a99d8080aaf3 Linux 5.4-rc6)
Merging rtc-fixes/rtc-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging gnss-fixes/gnss-linus (54ecb8f7028c Linux 5.4-rc1)
Merging hyperv-fixes/hyperv-fixes (590c28b9199c Drivers: hv: vmbus: Fix har=
mless building warnings without CONFIG_PM_SLEEP)
Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe=
_pin_request())
Merging risc-v-fixes/fixes (1d9b0b66c3ef MAINTAINERS: Change to my personal=
 email address)
Merging pidfd-fixes/fixes (913fe0eb39c6 clone3: validate stack arguments)
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (02dc96ef6c25 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/netdev/net)
Merging gpio-intel-fixes/fixes (7d194c2100ad Linux 5.4-rc4)
Merging pinctrl-intel-fixes/fixes (67d33aecd030 pinctrl: cherryview: Alloca=
te IRQ chip dynamic)
Merging erofs-fixes/fixes (da0c9ea146cb Linux 5.4-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (b330f3972f4f fbdev: c2p: Fix l=
ink failure on non-inlining)
Merging kspp-gustavo/for-next/kspp (da0c9ea146cb Linux 5.4-rc2)
Merging kbuild/for-next (5bf9e7d8f8b7 kbuild: Extend defconfig field size f=
rom 24 to 27)
Merging compiler-attributes/compiler-attributes (54ecb8f7028c Linux 5.4-rc1)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (b3d53f5fce5d usb: core: Remove redundant vmap=
 checks)
Merging asm-generic/master (9b87647c665d asm-generic: add unlikely to defau=
lt BUG_ON(x))
Merging arc/for-next (2f4ecf68a048 ARC: mm: tlb flush optim: elide redundan=
t uTLB invalidates for MMUv3)
Merging arm/for-next (cb73737ea1d2 ARM: 8928/1: ARM_ERRATA_775420: Spelling=
 s/date/data/)
Merging arm64/for-next/core (a2ffd8ebdcb8 Merge branch 'for-next/elf-hwcap-=
docs' into for-next/core)
Merging arm-perf/for-next/perf (f1d303a1b5dd perf/imx_ddr: Dump AXI ID filt=
er info to userspace)
Merging arm-soc/for-next (06fd047bde63 Merge branch 'arm/fixes' into for-ne=
xt)
Merging amlogic/for-next (7c37bc96b8e0 Merge branch 'v5.5/dt64' into tmp/am=
l-rebuild)
Merging aspeed/for-next (7671be39c4d9 ARM: dts: aspeed-g5: Add SGPIO descri=
ption)
Merging at91/at91-next (ba9b1009f561 Merge branches 'at91-drivers', 'at91-s=
oc', 'at91-dt' and 'at91-defconfig' into at91-next)
Merging bcm2835/for-next (f14234184671 Merge branch 'bcm2835-maintainers-ne=
xt' into for-next)
Merging imx-mxs/for-next (71918b15d58f Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (2af8e1f26c65 Merge branch 'for_5.5/driver-soc' into =
next)
Merging mediatek/for-next (4ae1ce88e9a0 Merge branch 'v5.3-next/soc' into f=
or-next)
Merging mvebu/for-next (3aa22be2d6b1 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (0adbc8292201 Merge branch 'omap-for-v5.5/prm' into f=
or-next)
Merging qcom/for-next (4d35d4201bc1 Merge branches 'arm64-for-5.5', 'arm64-=
defconfig-for-5.5', 'defconfig-for-5.5' 'drivers-for-5.5' and 'dts-for-5.5'=
 into for-next)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging realtek/for-next (6a41c7019bca Merge branch 'v5.5/dt64' into next)
Merging renesas/next (9c45f53abb97 Merge branches 'renesas-arm-defconfig-fo=
r-v5.5', 'renesas-arm64-defconfig-for-v5.5', 'renesas-arm64-dt-for-v5.5', '=
renesas-drivers-for-v5.5' and 'renesas-dt-bindings-for-v5.5' into renesas-n=
ext)
Merging reset/reset/next (c2ffa00ad615 reset: document (devm_)reset_control=
_get_optional variants)
Merging rockchip/for-next (9e86089c7f14 Merge branch 'v5.5-clk/next' into f=
or-next)
Merging samsung-krzk/for-next (a4276bb320c4 Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (a99d8080aaf3 Linux 5.4-rc6)
Merging sunxi/sunxi/for-next (5da8253c3f5a Merge branches 'sunxi/clk-fixes-=
for-5.4', 'sunxi/config-for-5.5', 'sunxi/config64-for-5.5', 'sunxi/dt-for-5=
.5' and 'sunxi/fixes-for-5.4' into sunxi/for-next)
Merging tegra/for-next (6c7c92944894 Merge branch for-5.5/cpufreq into for-=
next)
Merging clk/clk-next (8d3a12f3fb68 Merge branch 'clk-fixes' into clk-next)
CONFLICT (content): Merge conflict in drivers/clk/imx/clk-imx8mn.c
Merging clk-samsung/for-next (45f10dabb56b clk: samsung: exynos5420: Add SE=
T_RATE_PARENT flag to clocks on G3D path)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (044cf5e15357 csky: Initial stack protector support)
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (0d3d343560ba genirq: remove the is_affinity_mask_valid h=
ook)
Merging m68k/for-next (7cf78b6b12fd m68k: q40: Fix info-leak in rtc_ioctl)
Merging m68knommu/for-next (dd13a0f1d3f8 m68k/coldfire: Use CONFIG_PREEMPTI=
ON)
Merging microblaze/next (22648c989cb8 microblaze: Increase max dtb size to =
64K from 32K)
Merging mips/mips-next (dece3c2a320b MIPS: Loongson: Fix return value of lo=
ongson_hwmon_init)
CONFLICT (content): Merge conflict in arch/mips/sgi-ip27/ip27-init.c
Merging nds32/next (932296120543 nds32: add new emulations for floating poi=
nt instruction)
Merging nios2/for-next (91d99a724e9c nios2: force the string buffer NULL-te=
rminated)
Merging openrisc/for-next (f3b17320db25 openrisc: map as uncached in iorema=
p)
Merging parisc-hd/for-next (e9c837c6ab07 parisc: Avoid spurious inequivalen=
t alias kernel error messages)
Merging powerpc/next (d78d5dace539 powerpc/book3s64/hash: Use secondary has=
h for bolted mapping if the primary is full)
Merging fsl/next (8a35879a60be powerpc/fsl_booke/32: Document KASLR impleme=
ntation)
Merging soc-fsl/next (36f6cf9dc2f5 soc: fsl: add RCPM driver)
Merging risc-v/for-next (a4531f3dba5f Merge branch 'next/tlb-opt' into dev/=
riscv/for-v5.5-rc1)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (effb83ccc83a s390: add error handling to perf_callch=
ain_kernel)
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
Merging xtensa/xtensa-for-next (c61b02fb6c43 Merge branch 'xtensa-5.5-asm-m=
emopt' into xtensa-for-next)
Merging fscrypt/master (065ab4c4701f docs: ioctl-number: document fscrypt i=
octl numbers)
Merging afs/afs-next (a0753c29004f afs: Support RCU pathwalk)
Merging btrfs/for-next (6eb305c9273a Merge branch 'for-next-next-v5.4-20191=
104' into for-next-20191104)
Merging ceph/master (1f08529c84cf ceph: add missing check in d_revalidate s=
napdir handling)
Merging cifs/for-next (404e73aaeaa0 cifs: move cifsFileInfo_put logic into =
a work-queue)
Merging configfs/for-next (e9c03af21cc7 configfs: calculate the symlink tar=
get only once)
Merging ecryptfs/next (b4a81b87a4cf ecryptfs: fix a memory leak bug in ecry=
ptfs_init_messaging())
Merging erofs/dev (0602fc8bb4f2 erofs: support superblock checksum)
Merging ext3/for_next (7f494a73ee5a Pull MAINTAINERS file update.)
Merging ext4/dev (0d0a60c92fed Merge branch 'rh/dioread-nolock-1k' into dev)
Merging f2fs/dev (a5f7bc69e7e7 f2fs: support aligned pinned file)
Merging fsverity/fsverity (95ae251fe828 f2fs: add fs-verity support)
Merging fuse/for-next (091d1a726772 fuse: redundant get_fuse_inode() calls =
in fuse_writepages_fill())
Merging jfs/jfs-next (a5fdd713d256 jfs: fix bogus variable self-initializat=
ion)
Merging nfs/linux-next (a99d8080aaf3 Linux 5.4-rc6)
Merging nfs-anna/linux-next (79cc55422ce9 NFS: Fix an RCU lock leak in nfs4=
_refresh_delegation_stateid())
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
Merging xfs/for-next (c34d570d1586 xfs: cleanup use of the XFS_ALLOC_ flags)
Merging iomap/iomap-for-next (a90100421499 fs/iomap: remove redundant check=
 in iomap_dio_rw())
Merging djw-vfs/vfs-for-next (7118dd2d41af splice: only read in as much inf=
ormation as there is pipe buffer space)
Merging file-locks/locks-next (b41dae061bbd Merge tag 'xfs-5.4-merge-7' of =
git://git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging vfs/for-next (3e501af8dd7b Merge branches 'work.misc', 'work.mount3=
', 'work.namei', 'work.dcache' and 'work.autofs' into for-next)
Merging printk/for-next (4a6442ff627f Merge branch 'for-5.5-pr-warn' into f=
or-next)
Merging pci/next (59a426f044a4 Merge branch 'pci/trivial')
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/amlogic/meson-sm1=
.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/amlogic/meson-g12=
-common.dtsi
Merging pstore/for-next/pstore (8d82cee2f8aa pstore: Make pstore_choose_com=
pression() static)
Merging hid/for-next (e0316fc294a6 Merge branch 'for-5.5/ish' into for-next)
Merging i2c/i2c/for-next (70d0b04517cd Merge branch 'i2c/for-current-fixed'=
 into i2c/for-next)
Merging i3c/i3c/next (469191c7fcd0 MAINTAINERS: Mark linux-i3c mailing list=
 moderated)
Merging dmi/master (9a85ac3936ad firmware: dmi: Add dmi_memdev_handle)
Merging hwmon-staging/hwmon-next (93a794f1b785 docs: hwmon: Document bel-pf=
e pmbus driver)
Merging jc_docs/docs-next (1c16b3d58681 docs/core-api: memory-allocation: m=
ention size helpers)
CONFLICT (content): Merge conflict in Documentation/networking/device_drive=
rs/pensando/ionic.rst
CONFLICT (content): Merge conflict in Documentation/networking/device_drive=
rs/intel/ixgbevf.rst
CONFLICT (content): Merge conflict in Documentation/networking/device_drive=
rs/intel/ixgbe.rst
CONFLICT (content): Merge conflict in Documentation/networking/device_drive=
rs/intel/igbvf.rst
CONFLICT (content): Merge conflict in Documentation/networking/device_drive=
rs/intel/igb.rst
CONFLICT (content): Merge conflict in Documentation/networking/device_drive=
rs/intel/ice.rst
CONFLICT (content): Merge conflict in Documentation/networking/device_drive=
rs/intel/iavf.rst
CONFLICT (content): Merge conflict in Documentation/networking/device_drive=
rs/intel/i40e.rst
CONFLICT (content): Merge conflict in Documentation/networking/device_drive=
rs/intel/fm10k.rst
CONFLICT (content): Merge conflict in Documentation/networking/device_drive=
rs/intel/e1000e.rst
CONFLICT (content): Merge conflict in Documentation/networking/device_drive=
rs/intel/e1000.rst
CONFLICT (content): Merge conflict in Documentation/networking/device_drive=
rs/intel/e100.rst
CONFLICT (content): Merge conflict in Documentation/admin-guide/perf/imx-dd=
r.rst
Merging v4l-dvb/master (a4260ea49547 media: sun4i: Add H3 deinterlace drive=
r)
Merging v4l-dvb-next/master (d45331b00ddb Linux 5.3-rc4)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (7dba3cb7cc3a Merge branch 'pm-cpufreq-fixes' into li=
nux-next)
CONFLICT (content): Merge conflict in lib/test_printf.c
Merging cpufreq-arm/cpufreq/arm/linux-next (e32beb064105 cpufreq: vexpress-=
spc: find and skip duplicates when merging frequencies)
Merging cpupower/cpupower (d80a4ac20800 cpupower : Handle set and info subc=
ommands correctly)
Merging opp/opp/linux-next (c86487ec42bd Merge branch 'opp/fixes' into opp/=
linux-next)
Merging thermal/thermal/linux-next (7d0f31b2fee5 drivers: thermal: tsens: f=
ix potential integer overflow on multiply)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (812cd88749e0 firewire: mark expected switch fall=
-throughs)
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (84a92ffd0eea RDMA/qedr: Add iWARP doorbell recovery =
support)
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx5/mr.c
Merging net-next/master (56c1291ee48b bpf: re-fix skip write only files in =
debugfs)
CONFLICT (content): Merge conflict in samples/bpf/Makefile
CONFLICT (content): Merge conflict in drivers/staging/Makefile
CONFLICT (content): Merge conflict in drivers/staging/Kconfig
Merging bpf-next/master (f23c7ce341c2 Merge branch 'bpf-libbpf-bitfield-siz=
e-relo')
Merging ipsec-next/master (fd1ac07f3f17 xfrm: ifdef setsockopt(UDP_ENCAP_ES=
PINUDP/UDP_ENCAP_ESPINUDP_NON_IKE))
Merging mlx5-next/mlx5-next (e53a9d26cf80 IB/mlx5: Introduce and use mlx5_c=
ore_is_vf())
Merging netfilter-next/master (1574cf83c7a0 Merge tag 'mlx5-updates-2019-11=
-01' of git://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (086ddf860650 mt7601u: use DEFINE_DEBU=
GFS_ATTRIBUTE to define debugfs fops)
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/iwlwifi/mv=
m/mvm.h
Merging bluetooth/master (cf94da6f502d Bluetooth: Fix invalid-free in bcsp_=
close())
Merging mac80211-next/master (3f2aef10ffad mac80211: fix a typo of "functio=
n")
Merging gfs2/for-next (1a48049adb98 gfs2: make gfs2_fs_parameters static)
Merging mtd/mtd/next (267c1d772380 MAINTAINERS: ubi/ubifs: Update the Git r=
epository)
Merging nand/nand/next (777260a5c992 mtd: rawnand: remove unecessary checki=
ng if dmac is NULL)
Merging spi-nor/spi-nor/next (3d63ee5deb46 mtd: spi-nor: fix silent truncat=
ion in spi_nor_read_raw())
Merging crypto/master (298b4c604008 crypto: amcc - restore CRYPTO_AES depen=
dency)
CONFLICT (content): Merge conflict in arch/arm/crypto/Kconfig
Merging drm/drm-next (8a86b00a437e Merge tag 'drm-next-5.5-2019-11-01' of g=
it://people.freedesktop.org/~agd5f/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_vce=
.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_vce=
.c
Applying: cec: fix up for "cec: add cec_adapter to cec_notifier_cec_adap_un=
register()"
Applying: drm/v3d: Fix double free in v3d_submit_cl_ioctl()
$ git reset --hard HEAD^
Merging next-20191031 version of drm
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_vce=
.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_vce=
.c
[master 675dc5e99294] next-20191031/drm
Applying: cec: fix up for "cec: add cec_adapter to cec_notifier_cec_adap_un=
register()"
[master e12bf70240d4] next-20191031/drm
Applying: drm/v3d: Fix double free in v3d_submit_cl_ioctl()
[master db05ff64c1d8] next-20191031/drm
Merging amdgpu/drm-next (93e6e11732b6 drm/radeon: fix si_enable_smc_cac() f=
ailed issue)
CONFLICT (content): Merge conflict in include/uapi/linux/kfd_ioctl.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/inc/amd=
gpu_smu.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn21/=
Makefile
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn20/=
Makefile
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdkfd/kfd_charde=
v.c
Merging drm-intel/for-linux-next (458863e08e13 drm/i915: Mark contents as d=
irty on a write fault)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/selftests/i915_g=
em.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_request.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_mma=
n.c
Merging drm-tegra/drm/tegra/for-next (84db889e6d82 drm/tegra: Unconditional=
ly select IOMMU_IOVA)
Merging drm-misc/for-linux-next (8a537de0f3d8 drm/doc: Update IGT documenta=
tion)
CONFLICT (content): Merge conflict in drivers/gpu/drm/ttm/ttm_bo_util.c
Merging drm-msm/msm-next (e20c9284c8f2 drm/msm/adreno: Add support for Adre=
no 510 GPU)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (4d24376370fb gpu: ipu-v3: image-convert: only=
 sample into the next tile if necessary)
Merging etnaviv/etnaviv/next (22567d017c2c dt-bindings: etnaviv: Add #cooli=
ng-cells)
Merging regmap/for-next (da0c9ea146cb Linux 5.4-rc2)
Merging sound/for-next (6111fd2370ee ALSA: pcm: Fix missing check of the ne=
w non-cached buffer type)
Merging sound-asoc/for-next (b0e42496a9e4 Merge branch 'asoc-5.5' into asoc=
-next)
CONFLICT (content): Merge conflict in sound/soc/samsung/Kconfig
CONFLICT (content): Merge conflict in sound/soc/intel/boards/Kconfig
Merging modules/modules-next (c3a6cf19e695 export: avoid code duplication i=
n include/linux/export.h)
Merging input/next (d843304b22e8 Input: synaptics-rmi4 - simplify data read=
 in rmi_f54_work)
Merging block/for-next (8f027e5994f7 Merge branch 'for-5.5/block' into for-=
next)
Merging device-mapper/for-next (13bd677a472d dm cache: fix bugs when a GFP_=
NOWAIT allocation fails)
Merging mmc/next (3a07e0b48c98 mmc: renesas_sdhi_internal_dmac: Add r8a774b=
1 support)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (1f98ed315b06 mfd: mfd-core: Move pdev->mfd_cell c=
reation back into mfd_add_device())
CONFLICT (content): Merge conflict in drivers/mfd/mt6397-core.c
Merging backlight/for-backlight-next (53e492915061 backlight: Kconfig: jorn=
ada720: Use CONFIG_PREEMPTION)
Merging battery/for-next (9480029fe5c2 power: supply: bd70528: Add MODULE_A=
LIAS to allow module auto loading)
Merging regulator/for-next (3151d022d740 Merge branch 'regulator-5.5' into =
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
Merging tpmdd/next (6ffdd4c0e27e KEYS: trusted: Remove set but not used var=
iable 'keyhndl')
Merging watchdog/master (ca2fc5efffde watchdog: f71808e_wdt: Add F81803 sup=
port)
Merging iommu/next (50f07c7db715 Merge branches 'iommu/fixes', 'arm/qcom', =
'arm/renesas', 'arm/rockchip', 'arm/mediatek', 'arm/tegra', 'x86/amd', 'x86=
/vt-d', 'virtio' and 'core' into next)
Merging vfio/next (026948f01eac vfio/type1: remove hugepage checks in is_in=
valid_reserved_pfn())
Merging audit/next (c34c78dfc1fc audit: remove redundant condition check in=
 kauditd_thread())
Merging devicetree/for-next (067c650c456e dtc: Use pkg-config to locate lib=
yaml)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/usb=
/generic-ehci.yaml
Merging mailbox/mailbox-for-next (556a0964e28c mailbox: qcom-apcs: fix max_=
register value)
Merging spi/for-next (e2787cbf4bf7 Merge remote-tracking branch 'spi/topic/=
ptp' into spi-next)
Merging tip/auto-latest (013bfb619229 Merge branch 'core/objtool')
CONFLICT (content): Merge conflict in samples/bpf/Makefile
CONFLICT (content): Merge conflict in include/linux/security.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_shr=
inker.c
Applying: drm/i915: update for mutex_release API change
Merging clockevents/timers/drivers/next (6e001f6a4cc7 clocksource/drivers/a=
sm9260: Add a check for of_clk_get)
Merging edac/edac-for-next (466503d6b1b3 EDAC/amd64: Set grain per DIMM)
Merging irqchip/irq/irqchip-next (41860cc44704 irqchip/sifive-plic: Skip co=
ntexts except supervisor in plic_init())
Merging ftrace/for-next (8ed4889eb831 selftests/ftrace: Fix same probe erro=
r test)
Merging rcu/rcu/next (8dcdfb7096a3 Merge branches 'doc.2019.10.29a', 'fixes=
.2019.10.30a', 'nohz.2019.10.28a', 'replace.2019.10.30a', 'torture.2019.10.=
05a' and 'lkmm.2019.10.05a' into HEAD)
Merging kvm/linux-next (20baa8e515a5 Merge tag 'kvm-ppc-fixes-5.4-1' of git=
://git.kernel.org/pub/scm/linux/kernel/git/paulus/powerpc into HEAD)
Merging kvm-arm/next (ab71d9531316 Merge remote-tracking branch 'kvmarm/mis=
c-5.5' into kvmarm/next)
Merging kvm-ppc/kvm-ppc-next (55d7004299eb KVM: PPC: Book3S HV: Reject mfla=
gs=3D2 (LPCR[AIL]=3D2) ADDR_TRANS_MODE mode)
CONFLICT (content): Merge conflict in include/uapi/linux/kvm.h
Merging kvms390/next (c7b7de631246 KVM: s390: Do not yield when target is a=
lready running)
Merging xen-tip/linux-next (6ccae60d014d xen: issue deprecation warning for=
 32-bit pv guest)
Merging percpu/for-next (825dbc6ff7a3 percpu: add __percpu to SHIFT_PERCPU_=
PTR)
Merging workqueues/for-next (30ae2fc0a75e workqueue: Minor follow-ups to th=
e rescuer destruction change)
Merging drivers-x86/for-next (fa2a590d0d02 platform/x86: intel_punit_ipc: D=
rop useless label)
Merging chrome-platform/for-next (3ea09dfacaa3 platform/chrome: wilco_ec: A=
dd charging config driver)
Merging hsi/for-next (c1030cd45619 HSI: Remove dev_err() usage after platfo=
rm_get_irq())
Merging leds/for-next (448d6fcb7a52 leds: pca953x: Use of_device_get_match_=
data())
Merging ipmi/for-next (4aa7afb0ee20 ipmi: Fix memory leak in __ipmi_bmc_reg=
ister)
Merging driver-core/driver-core-next (09b0965ee8cc IB: mlx5: no need to che=
ck return value of debugfs_create functions)
CONFLICT (content): Merge conflict in Documentation/filesystems/debugfs.txt
Merging usb/usb-next (16c8373ecf7b Merge 5.4-rc6 into usb-next)
Merging usb-gadget/next (726b4fba94be usb: dwc3: of-simple: add a shutdown)
Merging usb-serial/usb-next (35714565089e USB: serial: ch341: reimplement l=
ine-speed handling)
Merging usb-chipidea-next/ci-for-usb-next (973ce009b308 usb: chipidea: imx:=
 check data->usbmisc_data against NULL before access)
Merging phy-next/next (4569e64ab6a5 phy: phy-rockchip-inno-usb2: add phy de=
scription for px30)
Merging tty/tty-next (c2a552197106 Merge 5.4-rc5 into tty-next)
Merging char-misc/char-misc-next (891e60368ba1 drivers: mcb: use symbol nam=
espaces)
CONFLICT (content): Merge conflict in samples/Makefile
CONFLICT (content): Merge conflict in samples/Kconfig
Merging extcon/extcon-next (ddd1bbbae486 extcon: sm5502: remove redundant a=
ssignment to variable cable_type)
Merging soundwire/next (3ccb8551f52e soundwire: cadence_master: make clock =
stop exit configurable on init)
Merging thunderbolt/next (354a7a7716ed thunderbolt: Do not start firmware u=
nless asked by the user)
Merging staging/staging-next (6647e4e84501 staging: exfat: Ensure we unlock=
 upon error in ffsReadFile)
CONFLICT (content): Merge conflict in drivers/staging/Makefile
CONFLICT (content): Merge conflict in drivers/staging/Kconfig
Merging mux/for-next (05fb8284a417 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (0bf9146d94a0 docs: driver-api: make interconnect titl=
e quieter)
Merging slave-dma/next (7208474d1c7a dmaengine: fsl-dpaa2-qdma: Remove unne=
cessary local variables in DPDMAI_CMD_CREATE macro)
Merging cgroup/for-next (8c26b3a71bdf Merge branch 'for-5.5' into for-next)
Merging scsi/for-next (4b9029e0a68d Merge branch 'misc' into for-next)
CONFLICT (content): Merge conflict in drivers/scsi/scsi_sysfs.c
Merging scsi-mkp/for-next (c2a18e314332 Merge branch '5.4/scsi-fixes' into =
5.5/scsi-next)
Merging vhost/linux-next (8766aecd61f7 vhost: last descriptor must have NEX=
T clear)
Merging rpmsg/for-next (1587a11907d8 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (1723e834a4aa Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (2b9f48e93407 gpio: rcar: Use proper irq_ch=
ip name)
Merging gpio-intel/for-next (7d194c2100ad Linux 5.4-rc4)
Merging pinctrl/for-next (bf74543583fa Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (c9ccf71fc807 pinctrl: intel: Add Intel Tige=
r Lake pin controller support)
Merging pinctrl-samsung/for-next (a322b3377f4b pinctrl: samsung: Fix device=
 node refcount leaks in init code)
Merging pwm/for-next (9e1b4999a169 pwm: stm32: Pass breakinput instead of i=
ts values)
Merging userns/for-next (318759b4737c signal/x86: Move tsk inside of CONFIG=
_MEMORY_FAILURE in do_sigbus)
Merging ktest/for-next (aecea57f84b0 ktest: Fix some typos in config-bisect=
.pl)
Merging random/dev (58be0106c530 random: fix soft lockup when trying to rea=
d from an uninitialized blocking pool)
Merging kselftest/next (54ecb8f7028c Linux 5.4-rc1)
Merging y2038/y2038 (0682b746099a Merge tag 'compat-ioctl-5.5' of git://git=
.kernel.org/pub/scm/linux/kernel/git/arnd/playground into y2038)
CONFLICT (content): Merge conflict in fs/compat_ioctl.c
Applying: fix up for "compat: move FS_IOC_RESVSP_32 handling to fs/ioctl.c"
Merging livepatching/for-next (8b65d6ab9d70 Merge remote-tracking branch 'f=
or-5.5/system-state' into for-next)
Merging coresight/next (d87f04ffb55b coresight: etm4x: Fix BMVAL misuse)
Merging rtc/rtc-next (c6c2d36bc46f rtc: fsl-ftm-alarm: Fix build error with=
out PM_SLEEP)
Merging nvdimm/libnvdimm-for-next (4c806b897d60 libnvdimm/region: Enable MA=
P_SYNC for volatile regions)
Merging at24/at24/for-next (285be87c79e1 eeprom: at24: Improve confusing lo=
g message)
Merging ntb/ntb-next (54ecb8f7028c Linux 5.4-rc1)
Merging kspp/for-next/kspp (ec2f877856e0 treewide: Use sizeof_member() macr=
o)
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (54ecb8f7028c Linux 5.4-rc1)
Merging fsi/next (ca9902e3140e fsi: core: Fix small accesses and unaligned =
offsets via sysfs)
Merging slimbus/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging nvmem/for-next (6bd17868c992 nvmem: add Rockchip OTP driver)
Merging xarray/xarray (b7e9728f3d7f idr: Fix idr_alloc_u32 on 32-bit system=
s)
Merging hyperv/hyperv-next (94f90545a08f Drivers: hv: balloon: Remove depen=
dencies on guest page size)
Merging auxdisplay/auxdisplay (54ecb8f7028c Linux 5.4-rc1)
Merging kgdb/kgdb/for-next (c58ff643763c kdb: Tweak escape handling for vi =
users)
Merging pidfd/for-next (1282387e9dca Merge branch 'pidfd' into for-next)
Merging devfreq/for-next (d2f5fccd1ac9 PM / devfreq: Make log message more =
explicit when devfreq device already exists)
Merging hmm/hmm (bbe3329e354d mm/hmm: remove hmm_mirror and related)
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx5/odp.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
Merging fpga/for-next (fddc9fcbe69a fpga: dfl: fme: add power management su=
pport)
Merging kunit/test (ea2dd7c0875e lib/list-test: add a test for the 'list' d=
oubly linked list)
Merging cel/cel-next (fd86460a2c94 xprtrdma: Replace dprintk in xprt_rdma_s=
et_port)
CONFLICT (content): Merge conflict in drivers/infiniband/core/Makefile
Applying: fix up for "net: of_get_phy_mode: Change API to solve int/unit wa=
rnings"
Merging akpm-current/current (867a29bb95b6 ipc/msg.c: consolidate all xxxct=
l_down() functions)
CONFLICT (content): Merge conflict in lib/ubsan.c
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/block/null_blk_main.c: fix layout
Applying: drivers/block/null_blk_main.c: fix uninitialized var warnings
Applying: pinctrl: fix pxa2xx.c build warnings
Applying: lib/genalloc.c: export symbol addr_in_gen_pool
Applying: lib/genalloc.c: rename addr_in_gen_pool to gen_pool_has_addr
Applying: Documentation: rename addr_in_gen_pool to gen_pool_has_addr
Applying: kernel-hacking: group sysrq/kgdb/ubsan into 'Generic Kernel Debug=
ging Instruments'
Applying: kernel-hacking: create submenu for arch special debugging options
CONFLICT (content): Merge conflict in lib/Kconfig.debug
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
Applying: bitops: introduce the for_each_set_clump8 macro
Applying: linux/bitmap.h: fix potential sign-extension overflow
Applying: bitops-introduce-the-for_each_set_clump8-macro-fix-fix
Applying: linux/bitopts.h: Add for_each_set_clump8 documentation
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
Applying: lib/test_bitmap: force argument of bitmap_parselist_user() to pro=
per address space
Applying: lib/test_bitmap: undefine macros after use
Applying: lib/test_bitmap: name EXP_BYTES properly
Applying: lib/test_bitmap: rename exp to exp1 to avoid ambiguous name
Applying: lib/test_bitmap: move exp1 and exp2 upper for others to use
Applying: lib/test_bitmap: fix comment about this file
Applying: lib/bitmap: introduce bitmap_replace() helper
Applying: gpio: pca953x: remove redundant variable and check in IRQ handler
Applying: gpio: pca953x: use input from regs structure in pca953x_irq_pendi=
ng()
Applying: gpio: pca953x: convert to use bitmap API
Applying: gpio: pca953x: reduce stack usage in couple of functions
Applying: gpio: pca953x: tighten up indentation
Applying: mm: add generic p?d_leaf() macros
Applying: arc: mm: add p?d_leaf() definitions
Applying: arm: mm: add p?d_leaf() definitions
Applying: arm64: mm: add p?d_leaf() definitions
Applying: mips: mm: add p?d_leaf() definitions
Applying: powerpc: mm: add p?d_leaf() definitions
Applying: riscv: mm: add p?d_leaf() definitions
Applying: s390: mm: add p?d_leaf() definitions
Applying: sparc: mm: add p?d_leaf() definitions
Applying: x86: mm: add p?d_leaf() definitions
Applying: mm: pagewalk: add p4d_entry() and pgd_entry()
Applying: mm: pagewalk: allow walking without vma
Applying: mm: pagewalk: add test_p?d callbacks
Applying: mm: pagewalk: add 'depth' parameter to pte_hole
Applying: x86: mm: point to struct seq_file from struct pg_state
Applying: x86: mm+efi: convert ptdump_walk_pgd_level() to take a mm_struct
Applying: x86: mm: convert ptdump_walk_pgd_level_debugfs() to take an mm_st=
ruct
Applying: x86: mm: convert ptdump_walk_pgd_level_core() to take an mm_struct
Applying: mm: add generic ptdump
Applying: x86: mm: convert dump_pagetables to use walk_page_range
Applying: arm64: mm: convert mm/dump.c to use walk_page_range()
Applying: arm64: mm: display non-present entries in ptdump
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (ba0a1688b438 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)
Applying: Revert "hugetlbfs: convert macros to static inline, fix sparse wa=
rning"

--Sig_/Es4=xsSGmjb218.YmkWO+2p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3BUjQACgkQAVBC80lX
0GyTVwf/SWh0+kqdFpWdwiS7IXyGWpqyVicC8wRBmkQbLI+YFBWh22jPOxiGh0CL
rRuBj2OrXmh1sJPBBIl8oB8gZe0limPEB2HU+ttJFGJViiDoYKV0vPMMFRDMwVbI
cNXDeXgsQ70lFVbEiytwFV8+s0K//lugnkvfQydxZCFNJx6SJW2GSwlag3O2rU04
WDoYk+bFQ/v3OSPuVj47gmVRmfzvA3buQSeo540Apd+12+ja1y4g+//F6jV30zcC
dges1D2m113x73d0UY5SuOT+ltnk9c+wwA4U/iXxksXjP9th3+dHFml2wS4fJh1h
pKpcZkVrmgfQbQWyBR0mSSeiFxXxqA==
=Wqjg
-----END PGP SIGNATURE-----

--Sig_/Es4=xsSGmjb218.YmkWO+2p--
