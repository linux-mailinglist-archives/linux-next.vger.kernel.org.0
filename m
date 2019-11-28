Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C138910C31F
	for <lists+linux-next@lfdr.de>; Thu, 28 Nov 2019 05:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727280AbfK1ECs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Nov 2019 23:02:48 -0500
Received: from ozlabs.org ([203.11.71.1]:55905 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727113AbfK1ECs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Nov 2019 23:02:48 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47NkW46xRyz9sPZ;
        Thu, 28 Nov 2019 15:02:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574913761;
        bh=PBEoXOoSkqoMT7Fw3j2PYxFP75eG+J8Rjgc2OT/TXnA=;
        h=Date:From:To:Cc:Subject:From;
        b=n8tnOKZkHiQEEUsKfkbqqlleUEAt+4QJ430Lip1GutUXgs9ISuKcNr9UTRPfCo8e1
         ZTK/Nd5qM6MSMVLu4R1shDMJfldqIs9/PPq29v+Ar551UDgGWjlYuyEWQqLW/Bk9r6
         xFaxJGQlhLj1zo8yFtDswJ25qsUPdV/GRs0Scifpq9993bt3ObNlT59JMfe6xomwFb
         239jJfnBax3Sd/Em3tVJA+6PBs51Cp7Z2E7ZIYbYmEh//l+B4I++rQbZjXzlgjsJvs
         2JUz0SvZM2TGrDvRv/N3YZ5qzpotXy0yyQ2ZGT5OvNuU/umf8MpKkfX9JUKs0aDUrJ
         PdN6SZGGul6sQ==
Date:   Thu, 28 Nov 2019 15:02:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 28
Message-ID: <20191128150240.07655f61@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=JMZ_8ucMQvBso8CZ0CB.4v";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=JMZ_8ucMQvBso8CZ0CB.4v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Please do not add any material for v5.6 to your linux-next included
trees until after v5.5-rc1 has been released.

Changes since 20191127:

The mailbox tree gained a conflict against the devicetree tree.

Non-merge commits (relative to Linus' tree): 6454
 5360 files changed, 212031 insertions(+), 101385 deletions(-)

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
Merging origin/master (95f1fa9e3418 Merge tag 'trace-v5.5' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging fixes/master (31f4f5b495a6 Linux 5.4-rc7)
Merging kbuild-current/fixes (80591e61a0f7 kbuild: tell sparse about the $A=
RCH)
Merging arc-current/for-curr (5effc09c4907 ARC: perf: Accommodate big-endia=
n CPU)
Merging arm-current/fixes (39f4d4410484 Merge branch 'misc' into fixes)
Merging arm-soc-fixes/arm/fixes (db6efda85437 Merge tag 'tee-fixes-for-v5.4=
' of git://git.linaro.org/people/jens.wiklander/linux-tee into arm/fixes)
Merging arm64-fixes/for-next/fixes (e50be648aaa3 arm64: uaccess: Remove uac=
cess_*_not_uao asm macros)
Merging m68k-current/for-linus (5ed0794cde59 m68k/atari: Convert Falcon IDE=
 drivers to platform drivers)
Merging powerpc-fixes/fixes (7d6475051fb3 powerpc/powernv: Fix CPU idle to =
be called with IRQs disabled)
Merging s390-fixes/fixes (a99d8080aaf3 Linux 5.4-rc6)
Merging sparc/master (038029c03e21 sparc: remove unneeded uapi/asm/statfs.h)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (b167191e2a85 net: wireless: intel: iwlwifi: fix GRO_NOR=
MAL packet stalling)
Merging bpf/master (da5fb18225b4 bpf: Support pre-2.25-binutils objcopy for=
 vmlinux BTF)
Merging ipsec/master (a56dcc6b4558 net: cdc_ncm: Signedness bug in cdc_ncm_=
set_dgram_size())
Merging netfilter/master (312434617cb1 sctp: cache netns in sctp_ep_common)
Merging ipvs/master (c24b75e0f923 ipvs: move old_secure_tcp into struct net=
ns_ipvs)
Merging wireless-drivers/master (cb1a4badf592 iwlwifi: pcie: don't consider=
 IV len in A-MSDU)
Merging mac80211/master (e58c19124189 slip: Fix use-after-free Read in slip=
_open)
Merging rdma-fixes/for-rc (411c1e6774e2 RDMA/hns: Correct the value of srq_=
desc_size)
Merging sound-current/for-linus (ae254888f3c3 ALSA: hda: hdmi - fix regress=
ion in connect list handling)
Merging sound-asoc-fixes/for-linus (3701d2cb8767 Merge branch 'asoc-5.4' in=
to asoc-linus)
Merging regmap-fixes/for-linus (af42d3466bdc Linux 5.4-rc8)
Merging regulator-fixes/for-linus (c642e8708684 Merge branch 'regulator-5.4=
' into regulator-linus)
Merging spi-fixes/for-linus (8f3ed6d0b0db Merge branch 'spi-5.4' into spi-l=
inus)
Merging pci-current/for-linus (54ecb8f7028c Linux 5.4-rc1)
Merging driver-core.current/driver-core-linus (9a3d7fd275be Merge tag 'driv=
er-core-5.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/dr=
iver-core)
Merging tty.current/tty-linus (d6d5df1db6e9 Linux 5.4-rc5)
Merging usb.current/usb-linus (9a3d7fd275be Merge tag 'driver-core-5.5-rc1'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core)
Merging usb-gadget-fixes/fixes (f3fb802efaef usb: cdns3: gadget: Don't mana=
ge pullups)
Merging usb-serial-fixes/usb-linus (a99d8080aaf3 Linux 5.4-rc6)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (54ecb8f7028c Linux 5.4-rc1)
Merging staging.current/staging-linus (9a3d7fd275be Merge tag 'driver-core-=
5.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-cor=
e)
Merging char-misc.current/char-misc-linus (9a3d7fd275be Merge tag 'driver-c=
ore-5.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver=
-core)
Merging soundwire-fixes/fixes (7b47ad3322d1 soundwire: slave: fix scanf for=
mat)
Merging thunderbolt-fixes/fixes (219d54332a09 Linux 5.4)
Merging input-current/for-linus (976e3645923b Merge branch 'next' into for-=
linus)
Merging crypto-current/master (8a6b8f4d7a89 crypto: hisilicon - fix a NULL =
vs IS_ERR() bug in sec_create_qp_ctx())
Merging ide/master (baf6722aa0cb ide: Use dev_get_drvdata where possible)
Merging vfio-fixes/for-linus (95f89e090618 vfio/type1: Initialize resv_msi_=
base)
Merging kselftest-fixes/fixes (ed2d8fa734e7 selftests: sync: Fix cast warni=
ngs on arm)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging slave-dma-fixes/fixes (bacdcb6675e1 dmaengine: cppi41: Fix cppi41_d=
ma_prep_slave_sg() when idle)
Merging backlight-fixes/for-backlight-fixes (e93c9c99a629 Linux 5.1)
Merging mtd-fixes/mtd/fixes (df8fed831cbc mtd: rawnand: au1550nd: Fix au_re=
ad_buf16() prototype)
Merging mfd-fixes/for-mfd-fixes (603d9299da32 mfd: mt6397: Fix probe after =
changing mt6397-core)
Merging v4l-dvb-fixes/fixes (3e84a18a259e media: meson/ao-cec: move cec_not=
ifier_cec_adap_register after hw setup)
Merging reset-fixes/reset/fixes (cc67d61e31ec reset: Do not register resour=
ce data for missing resets)
Merging mips-fixes/mips-fixes (87f67cc4c7b8 MIPS: Fix boot on Fuloong2 syst=
ems)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (6aed5a0e0f56 Merge branch 'watchdog-fix' into fix=
es)
Merging kvm-fixes/master (9cb09e7c1c9a KVM: Add a comment describing the /d=
ev/kvm no_compat handling)
Merging kvms390-fixes/master (53936b5bf35e KVM: s390: Do not leak kernel st=
ack data in the KVM_S390_INTERRUPT ioctl)
Merging hwmon-fixes/hwmon (92b39ad44096 hwmon: (pmbus/ibm-cffps) Fix LED bl=
ink behavior)
Merging nvdimm-fixes/libnvdimm-fixes (6370740e5f8e fs/dax: Fix pmd vs pte c=
onflict detection)
Merging btrfs-fixes/next-fixes (bfbbf8cb43a7 Merge branch 'misc-5.4' into n=
ext-fixes)
Merging vfs-fixes/fixes (3e5aeec0e267 cramfs: fix usage on non-MTD device)
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (7d194c2100ad Linux 5.4-rc4)
Merging samsung-krzk-fixes/fixes (54ecb8f7028c Linux 5.4-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging devicetree-fixes/dt/linus (5dba51754b04 of: reserved_mem: add missi=
ng of_node_put() for proper ref-counting)
Merging scsi-fixes/fixes (9393c8de628c scsi: core: Handle drivers which set=
 sg_tablesize to zero)
Merging drm-fixes/drm-fixes (51658c04c338 Merge tag 'drm-intel-fixes-2019-1=
1-21' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (71d122629c04 drm/i915/fbdev: =
Restore physical addresses for fb_mmap())
Merging mmc-fixes/fixes (fed23c5829ec mmc: sdhci-of-at91: fix quirk2 overwr=
ite)
Merging rtc-fixes/rtc-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging gnss-fixes/gnss-linus (54ecb8f7028c Linux 5.4-rc1)
Merging hyperv-fixes/hyperv-fixes (af42d3466bdc Linux 5.4-rc8)
Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe=
_pin_request())
Merging risc-v-fixes/fixes (1d9b0b66c3ef MAINTAINERS: Change to my personal=
 email address)
Merging pidfd-fixes/fixes (9e77716a75bc fork: fix pidfd_poll()'s return typ=
e)
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (bf49d9dd6fef export,module: add SPDX GPL-2.0 licen=
se identifier to headers with no license)
Merging gpio-intel-fixes/fixes (7d194c2100ad Linux 5.4-rc4)
Merging pinctrl-intel-fixes/fixes (219d54332a09 Linux 5.4)
Merging erofs-fixes/fixes (da0c9ea146cb Linux 5.4-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (6645d42d79d3 dma-buf: Fix memo=
ry leak in sync_file_merge())
Merging kspp-gustavo/for-next/kspp (da0c9ea146cb Linux 5.4-rc2)
Merging kbuild/for-next (831362fc317a scripts/kallsyms: remove redundant in=
itializers)
CONFLICT (modify/delete): include/Kbuild deleted in kbuild/for-next and mod=
ified in HEAD. Version HEAD of include/Kbuild left in tree.
$ git rm -f include/Kbuild
Merging compiler-attributes/compiler-attributes (54ecb8f7028c Linux 5.4-rc1)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (a7ba70f1787f dma-mapping: treat dev->bus_dma_=
mask as a DMA limit)
Merging asm-generic/master (9b87647c665d asm-generic: add unlikely to defau=
lt BUG_ON(x))
Merging arc/for-next (9fbea0b7e842 ARC: add kmemleak support)
Merging arm/for-next (1a70cf0e7ee6 ARM: 8940/1: ftrace: remove mcount(),ftr=
ace_caller_old() and ftrace_call_old())
Merging arm64/for-next/core (d8e85e144bbe arm64: Kconfig: add a choice for =
endianness)
Merging arm-perf/for-next/perf (8703317ae576 drivers/perf: hisi: update the=
 sccl_id/ccl_id for certain HiSilicon platform)
Merging arm-soc/for-next (e1351090dd4a ARM: Document merges)
CONFLICT (modify/delete): include/Kbuild deleted in HEAD and modified in ar=
m-soc/for-next. Version arm-soc/for-next of include/Kbuild left in tree.
$ git rm -f include/Kbuild
Merging amlogic/for-next (580f93e92c5b Merge branch 'v5.5/fixes' into tmp/a=
ml-rebuild)
Merging aspeed/for-next (2aee80727dca Merge branch 'defconfig-for-v5.5' int=
o for-next)
Merging at91/at91-next (571c4b1fe42b Merge branches 'at91-drivers', 'at91-d=
t' and 'at91-defconfig' into at91-next)
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
Merging omap/for-next (eab1cca2de62 Merge branch 'omap-for-v5.5/dt-v2' into=
 for-next)
Merging qcom/for-next (7b0e649c3511 Merge branches 'arm64-for-5.5-fixes' an=
d 'drivers-for-5.5-fixes', remote-tracking branches 'origin/arm64-defconfig=
-for-5.5', 'origin/defconfig-for-5.5' and 'origin/dts-for-5.5' into for-nex=
t)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging realtek/for-next (6a41c7019bca Merge branch 'v5.5/dt64' into next)
Merging renesas/next (9c45f53abb97 Merge branches 'renesas-arm-defconfig-fo=
r-v5.5', 'renesas-arm64-defconfig-for-v5.5', 'renesas-arm64-dt-for-v5.5', '=
renesas-drivers-for-v5.5' and 'renesas-dt-bindings-for-v5.5' into renesas-n=
ext)
Merging reset/reset/next (b3f1d036f26d reset: npcm: add NPCM reset controll=
er driver)
Merging rockchip/for-next (f0d0e0810786 Merge branch 'v5.5-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (6780daf48588 Merge branch 'next/dt' into for=
-next)
Merging scmi/for-linux-next (219d54332a09 Linux 5.4)
Merging sunxi/sunxi/for-next (2ddd531f8c80 Merge branches 'sunxi/clk-for-5.=
5' and 'sunxi/dt-for-5.5' into sunxi/for-next)
Merging tegra/for-next (e0fd54137bf5 Merge branch for-5.5/cpufreq into for-=
next)
Merging clk/clk-next (ec16ffe36d80 Merge branches 'clk-ingenic', 'clk-init-=
leak', 'clk-ux500' and 'clk-bitmain' into clk-next)
Merging clk-samsung/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (044cf5e15357 csky: Initial stack protector support)
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (0d3d343560ba genirq: remove the is_affinity_mask_valid h=
ook)
Merging m68k/for-next (5ed0794cde59 m68k/atari: Convert Falcon IDE drivers =
to platform drivers)
Merging m68knommu/for-next (3ad3cbe305b5 m68k/coldfire: Use CONFIG_PREEMPTI=
ON)
Merging microblaze/next (22648c989cb8 microblaze: Increase max dtb size to =
64K from 32K)
Merging mips/mips-next (a8d0f11ee50d MIPS: SGI-IP27: Enable ethernet phy on=
 second Origin 200 module)
Merging nds32/next (a7f96fce201c MAINTAINERS: add nds32 maintainer)
Merging nios2/for-next (91d99a724e9c nios2: force the string buffer NULL-te=
rminated)
Merging openrisc/for-next (0ecdcaa6d5e7 openrisc: Fix Kconfig indentation)
Merging parisc-hd/for-next (e9c837c6ab07 parisc: Avoid spurious inequivalen=
t alias kernel error messages)
Merging powerpc/next (8dcd71b45df3 powerpc/prom_init: Use -ffreestanding to=
 avoid a reference to bcmp)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (3b8db0348c50 soc: fsl: add RCPM driver)
Merging risc-v/for-next (070389ef0f4b Merge branch 'next/add-nonstable-guid=
ance' into for-next)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (6a82e23f45fe s390/cpumf: Adjust registration of s390=
 PMU device drivers)
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
Merging uml/linux-next (9807019a62dc um: Loadable BPF "Firmware" for vector=
 drivers)
Merging xtensa/xtensa-for-next (dc399f059900 Merge branch 'xtensa-5.5' into=
 xtensa-for-next)
CONFLICT (content): Merge conflict in arch/xtensa/kernel/vmlinux.lds.S
Merging fscrypt/master (0eee17e33226 f2fs: add support for IV_INO_LBLK_64 e=
ncryption policies)
Merging afs/afs-next (4fe171bb81b1 afs: Remove set but not used variable 'r=
et')
Merging btrfs/for-next (897636c94003 Merge branch 'misc-5.5' into for-next-=
20191119)
Merging ceph/master (196e2d6d0252 rbd: ask for a weaker incompat mask for r=
ead-only mappings)
Merging cifs/for-next (68464b88cc0a CIFS: fix a white space issue in cifs_g=
et_inode_info())
Merging configfs/for-next (e2f238f7d5a1 configfs: calculate the depth of pa=
rent item)
Merging ecryptfs/next (b4a81b87a4cf ecryptfs: fix a memory leak bug in ecry=
ptfs_init_messaging())
Merging erofs/dev (3dcb5fa23e16 erofs: remove unnecessary output in erofs_s=
how_options())
Merging ext3/for_next (15d8f21beaae Pull ext2 cleanup and quota stats fixes=
.)
Merging ext4/dev (dfdeeb41fb08 Merge branch 'tt/misc' into dev)
CONFLICT (content): Merge conflict in fs/jbd2/transaction.c
Merging f2fs/dev (803e74be04b3 f2fs: stop GC when the victim becomes fully =
valid)
Merging fsverity/fsverity (73f0ec02d670 docs: fs-verity: mention statx() su=
pport)
Merging fuse/for-next (8d66fcb74884 fuse: fix Kconfig indentation)
Merging jfs/jfs-next (a5fdd713d256 jfs: fix bogus variable self-initializat=
ion)
Merging nfs/linux-next (e8d70b321ecc SUNRPC: Fix another issue with MIC buf=
fer space)
Merging nfs-anna/linux-next (79cc55422ce9 NFS: Fix an RCU lock leak in nfs4=
_refresh_delegation_stateid())
Merging nfsd/nfsd-next (8729aaba7462 SUNRPC: Fix backchannel latency metric=
s)
Merging orangefs/for-next (e6b998ab62be orangefs: remove redundant assignme=
nt to err)
Merging overlayfs/overlayfs-next (5c2e9f346b81 ovl: filter of trusted xattr=
 results in audit)
Merging ubifs/linux-next (f9c34bb52997 ubi: Fix producing anchor PEBs)
Merging v9fs/9p-next (aafee43b7286 9p/vfs_super.c: Remove unused parameter =
data in v9fs_fill_super)
Merging xfs/for-next (2911edb653b9 xfs: remove the mappedbno argument to xf=
s_da_get_buf)
Merging iomap/iomap-for-next (419e9c38aa07 iomap: Fix pipe page leakage dur=
ing splicing)
Merging djw-vfs/vfs-for-next (3253d9d09337 splice: only read in as much inf=
ormation as there is pipe buffer space)
Merging file-locks/locks-next (b41dae061bbd Merge tag 'xfs-5.4-merge-7' of =
git://git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging vfs/for-next (3e501af8dd7b Merge branches 'work.misc', 'work.mount3=
', 'work.namei', 'work.dcache' and 'work.autofs' into for-next)
Merging printk/for-next (7c88431552f3 Merge branch 'for-5.5' into for-next)
Merging pci/next (822a43f97844 Merge branch 'pci/trivial')
CONFLICT (content): Merge conflict in arch/powerpc/include/asm/Kbuild
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/amlogic/meson-sm1=
.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/amlogic/meson-g12=
-common.dtsi
CONFLICT (content): Merge conflict in Documentation/power/pci.rst
Merging pstore/for-next/pstore (8d82cee2f8aa pstore: Make pstore_choose_com=
pression() static)
Merging hid/for-next (4b8c2dffbb85 Merge branch 'for-5.5/core' into for-nex=
t)
Merging i2c/i2c/for-next (dbbfd9a67f08 Merge branch 'i2c/for-5.5' into i2c/=
for-next)
Merging i3c/i3c/next (ae24f2b6f828 MAINTAINERS: add myself as maintainer of=
 Cadence I3C master controller driver)
Merging dmi/master (9a85ac3936ad firmware: dmi: Add dmi_memdev_handle)
Merging hwmon-staging/hwmon-next (4a1288f1c1cf dell-smm-hwmon: Add document=
ation)
Merging jc_docs/docs-next (22abcd756961 Merge branch 'maintainer-profile' i=
nto docs-next)
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
CONFLICT (content): Merge conflict in Documentation/filesystems/debugfs.txt
CONFLICT (content): Merge conflict in Documentation/admin-guide/perf/imx-dd=
r.rst
Merging v4l-dvb/master (dca6b3733a4a media: Revert "media: mtk-vcodec: Remo=
ve extra area allocation in an input buffer on encoding")
Merging v4l-dvb-next/master (d45331b00ddb Linux 5.3-rc4)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (16512c3e4523 Merge branches 'pm-cpuidle' and 'pm-doc=
s' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (c23734487fb4 cpufreq: sun50i: F=
ix CPU speed bin detection)
Merging cpupower/cpupower (4611a4fb0cce cpupower: ToDo: Update ToDo with id=
eas for per_cpu_schedule handling)
Merging opp/opp/linux-next (25cb20a212a1 PM / OPP: Support adjusting OPP vo=
ltages at runtime)
Merging thermal/thermal/linux-next (def0aa869050 thermal: Fix deadlock in t=
hermal thermal_zone_device_check)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (7807759e4ad8 firewire: core: code cleanup after =
vm_map_pages_zero introduction)
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (f295e4cece5c RDMA/hns: Delete unnecessary callback f=
unctions for cq)
Merging net-next/master (be2eca94d144 Merge tag 'for-linus-5.5-1' of git://=
github.com/cminyard/linux-ipmi)
Merging bpf-next/master (be2eca94d144 Merge tag 'for-linus-5.5-1' of git://=
github.com/cminyard/linux-ipmi)
Merging ipsec-next/master (72c996099dc6 cxgb4: Fix an error code in cxgb4_m=
qprio_alloc_hw_resources())
Merging mlx5-next/mlx5-next (9c0015ef0928 IB/mlx5: Implement callbacks for =
getting VFs GUID attributes)
Merging netfilter-next/master (f3c9a666b285 net: sfp: soft status and contr=
ol support)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (05d6c8cfdbd6 mt76: fix fix ampdu lock=
ing)
Merging bluetooth/master (eb762b94111b Bluetooth: hci_bcm: Support pcm para=
ms in dts)
Merging mac80211-next/master (7a89233ac504 mac80211: Use Airtime-based Queu=
e Limits (AQL) on packet dequeue)
Merging gfs2/for-next (ade48088937f gfs2: Don't write log headers after fil=
e system withdraw)
Merging mtd/mtd/next (589e1b6c47ce Merge tag 'nand/for-5.5' into mtd/next)
Merging nand/nand/next (777260a5c992 mtd: rawnand: remove unecessary checki=
ng if dmac is NULL)
Merging spi-nor/spi-nor/next (83cba933a6db mtd: spi-nor: Set default Quad E=
nable method for ISSI flashes)
Merging crypto/master (4ee812f6143d crypto: vmx - Avoid weird build failure=
s)
Merging drm/drm-next (acc61b892936 Merge tag 'drm-next-5.5-2019-11-22' of g=
it://people.freedesktop.org/~agd5f/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_scheduler.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_shr=
inker.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/Kconfig.debug
Applying: cec: fix up for "cec: add cec_adapter to cec_notifier_cec_adap_un=
register()"
Applying: drm/v3d: Fix double free in v3d_submit_cl_ioctl()
Applying: drm/i915: update for mutex_release API change
Merging amdgpu/drm-next (20c663059765 drm/radeon: fix r1xx/r2xx register ch=
ecker for POT textures)
Merging drm-intel/for-linux-next (3cc44feb9861 drm/i915: Reduce nested prep=
are_remote_context() to a trylock)
Merging drm-tegra/drm/tegra/for-next (84db889e6d82 drm/tegra: Unconditional=
ly select IOMMU_IOVA)
Merging drm-misc/for-linux-next (1591fadf857c drm/mgag200: Add workaround f=
or HW that does not support 'startadd')
Merging drm-msm/msm-next (e20c9284c8f2 drm/msm/adreno: Add support for Adre=
no 510 GPU)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (4d24376370fb gpu: ipu-v3: image-convert: only=
 sample into the next tile if necessary)
Merging etnaviv/etnaviv/next (22567d017c2c dt-bindings: etnaviv: Add #cooli=
ng-cells)
Merging regmap/for-next (0c4b6e03b8ad Merge branch 'regmap-5.5' into regmap=
-next)
Merging sound/for-next (ae254888f3c3 ALSA: hda: hdmi - fix regression in co=
nnect list handling)
Merging sound-asoc/for-next (8c4d2a0bfbd2 Merge branch 'asoc-5.5' into asoc=
-next)
Merging modules/modules-next (5d603311615f kernel/module.c: wakeup processe=
s in module_wq on module unload)
Merging input/next (1a26c920717a Input: snvs_pwrkey - send key events for i=
.MX6 S, DL and Q)
Merging block/for-next (e5bab666ffa7 Merge branch 'for-5.5/io_uring-post' i=
nto for-next)
Merging device-mapper/for-next (484e0d2b11e1 dm: add dm-clone to the docume=
ntation index)
Merging pcmcia/pcmcia-next (bd9d6e0371d1 pcmcia: remove unused dprintk defi=
nition)
Merging mmc/next (def7bd940f8c dt-bindings: mmc: Correct the type of the cl=
k phase properties)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (de98a43eb76b mfd: ti_am335x_tscadc: Fix static ch=
ecker warning)
CONFLICT (content): Merge conflict in drivers/mfd/mt6397-core.c
Merging backlight/for-backlight-next (9afa302473f3 backlight: gpio: Pull gp=
io_backlight_initial_power_state() into probe)
Merging battery/for-next (9480029fe5c2 power: supply: bd70528: Add MODULE_A=
LIAS to allow module auto loading)
Merging regulator/for-next (a21da94f617b Merge branch 'regulator-5.5' into =
regulator-next)
Merging security/next-testing (45893a0abee6 kexec: Fix file verification on=
 S390)
Merging apparmor/apparmor-next (341c1fda5e17 apparmor: make it so work buff=
ers can be allocated from atomic context)
Merging integrity/next-integrity (2a7f0e53daf2 ima: ima_api: Use struct_siz=
e() in kzalloc())
Merging keys/keys-next (48274e1e5d24 Merge branch 'notifications-core' into=
 keys-next)
CONFLICT (content): Merge conflict in samples/Makefile
CONFLICT (content): Merge conflict in samples/Kconfig
CONFLICT (content): Merge conflict in include/linux/security.h
Merging selinux/next (42345b68c2e3 selinux: default_range glblub implementa=
tion)
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tomoyo/master (c39593ab0500 tomoyo: Don't use nifty names on socket=
s.)
Merging tpmdd/next (0b40dbcbba92 KEYS: trusted: Remove set but not used var=
iable 'keyhndl')
Merging watchdog/master (33c26ab4d6be watchdog: jz4740: Drop dependency on =
MACH_JZ47xx)
Merging iommu/next (9b3a713feef8 Merge branches 'iommu/fixes', 'arm/qcom', =
'arm/renesas', 'arm/rockchip', 'arm/mediatek', 'arm/tegra', 'arm/smmu', 'x8=
6/amd', 'x86/vt-d', 'virtio' and 'core' into next)
Merging vfio/next (026948f01eac vfio/type1: remove hugepage checks in is_in=
valid_reserved_pfn())
Merging audit/next (c34c78dfc1fc audit: remove redundant condition check in=
 kauditd_thread())
Merging devicetree/for-next (a8de1304b7df libfdt: define INT32_MAX and UINT=
32_MAX in libfdt_env.h)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/usb=
/generic-ehci.yaml
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/usb=
/amlogic,dwc3.txt
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/gpu=
/arm,mali-midgard.yaml
Merging mailbox/mailbox-for-next (575c3c419757 mailbox: imx: add support fo=
r imx v1 mu)
CONFLICT (modify/delete): Documentation/devicetree/bindings/mailbox/stm32-i=
pcc.txt deleted in HEAD and modified in mailbox/mailbox-for-next. Version m=
ailbox/mailbox-for-next of Documentation/devicetree/bindings/mailbox/stm32-=
ipcc.txt left in tree.
$ git rm -f Documentation/devicetree/bindings/mailbox/stm32-ipcc.txt
Merging spi/for-next (e2ce328b282d Merge remote-tracking branch 'spi/topic/=
ptp' into spi-next)
Merging tip/auto-latest (e445033e5810 Merge branch 'WIP.x86/mm')
CONFLICT (content): Merge conflict in kernel/trace/trace_export.c
CONFLICT (content): Merge conflict in include/trace/events/rpcrdma.h
CONFLICT (content): Merge conflict in arch/x86/kernel/head_32.S
CONFLICT (content): Merge conflict in arch/x86/entry/entry_32.S
Merging clockevents/timers/drivers/next (6e001f6a4cc7 clocksource/drivers/a=
sm9260: Add a check for of_clk_get)
Merging edac/edac-for-next (5781823fd0d3 EDAC/altera: Use the Altera System=
 Manager driver)
Merging irqchip/irq/irqchip-next (585d1183ffee pinctrl/sdm845: Add PDC wake=
up interrupt map for GPIOs)
Merging ftrace/for-next (16c0f03f629a tracing: Enable syscall optimization =
for MIPS)
Merging rcu/rcu/next (e100e2f047de Merge commit '8dcdfb7096a304130ab36fbb0f=
2961deaf863e5a' into for-mingo)
Merging kvm/linux-next (96710247298d Merge tag 'kvm-ppc-next-5.5-2' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/paulus/powerpc into HEAD)
Merging kvm-arm/next (cd7056ae34af Merge remote-tracking branch 'kvmarm/mis=
c-5.5' into kvmarm/next)
Merging kvm-ppc/kvm-ppc-next (30486e72093e KVM: PPC: Book3S HV: XIVE: Fix p=
otential page leak on error path)
Merging kvms390/next (c7b7de631246 KVM: s390: Do not yield when target is a=
lready running)
Merging xen-tip/linux-next (23c1cce9f317 xen: Fix Kconfig indentation)
Merging percpu/for-next (fc6a00f8f3cf Merge branch 'for-5.5' into for-next)
Merging workqueues/for-next (49e9d1a9faf2 workqueue: Add RCU annotation for=
 pwq list walk)
Merging drivers-x86/for-next (f3e4f3fc8ee9 platform/x86: hp-wmi: Fix ACPI e=
rrors caused by passing 0 as input size)
Merging chrome-platform/for-next (30af09e33c82 platform/chrome: cros_ec: Ad=
d Kconfig default for cros-ec-sensorhub)
Merging hsi/for-next (c1030cd45619 HSI: Remove dev_err() usage after platfo=
rm_get_irq())
Merging leds/for-next (5f820ed52371 leds: trigger: netdev: fix handling on =
interface rename)
Merging ipmi/for-next (8e6a5c833333 ipmi: fix ipmb_poll()'s return type)
Merging driver-core/driver-core-next (9a3d7fd275be Merge tag 'driver-core-5=
.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core)
Merging usb/usb-next (9a3d7fd275be Merge tag 'driver-core-5.5-rc1' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core)
Merging usb-gadget/next (726b4fba94be usb: dwc3: of-simple: add a shutdown)
Merging usb-serial/usb-next (c1a1f273d082 USB: serial: ftdi_sio: add device=
 IDs for U-Blox C099-F9P)
Merging usb-chipidea-next/ci-for-usb-next (4d6141288c33 usb: chipidea: imx:=
 pinctrl for HSIC is optional)
Merging phy-next/next (4569e64ab6a5 phy: phy-rockchip-inno-usb2: add phy de=
scription for px30)
Merging tty/tty-next (27ed14d0ecb3 Revert "serial/8250: Add support for NI-=
Serial PXI/PXIe+485 devices")
Merging char-misc/char-misc-next (9a3d7fd275be Merge tag 'driver-core-5.5-r=
c1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core)
Merging extcon/extcon-next (ddd1bbbae486 extcon: sm5502: remove redundant a=
ssignment to variable cable_type)
Merging soundwire/next (2e8c4ad1f044 soundwire: ignore uniqueID when irrele=
vant)
Merging thunderbolt/next (b001da2905e7 thunderbolt: Power cycle the router =
if NVM authentication fails)
Merging staging/staging-next (9a3d7fd275be Merge tag 'driver-core-5.5-rc1' =
of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core)
Merging mux/for-next (05fb8284a417 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (a99d8080aaf3 Linux 5.4-rc6)
Merging slave-dma/next (67805a4b3c92 dmaengine: Fix Kconfig indentation)
Merging cgroup/for-next (899969b46c28 Merge branch 'for-5.5' into for-next)
Merging scsi/for-next (4220129431ad Merge branch 'misc' into for-next)
CONFLICT (content): Merge conflict in drivers/scsi/scsi_sysfs.c
Merging scsi-mkp/for-next (1eb9151eb7c5 scsi: MAINTAINERS: Add the linux-sc=
si mailing list to the ISCSI entry)
Merging vhost/linux-next (88d3c7697f25 vhost: last descriptor must have NEX=
T clear)
Merging rpmsg/for-next (070a8e805ff5 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
CONFLICT (modify/delete): Documentation/devicetree/bindings/remoteproc/stm3=
2-rproc.txt deleted in HEAD and modified in rpmsg/for-next. Version rpmsg/f=
or-next of Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt lef=
t in tree.
$ git rm -f Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
Merging gpio/for-next (41c4616bb81f gpio: Add TODO item for regmap helper)
Merging gpio-brgl/gpio/for-next (0f67f16a6e88 gpio: mmio: remove untrue lef=
tover comment)
Merging gpio-intel/for-next (41c4616bb81f gpio: Add TODO item for regmap he=
lper)
Merging pinctrl/for-next (f130d5fd1fa0 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (8ae93b5ed9be pinctrl: cherryview: Missed ty=
pe change to unsigned int)
Merging pinctrl-samsung/for-next (a322b3377f4b pinctrl: samsung: Fix device=
 node refcount leaks in init code)
Merging pwm/for-next (9e1b4999a169 pwm: stm32: Pass breakinput instead of i=
ts values)
CONFLICT (modify/delete): Documentation/devicetree/bindings/pwm/pwm-stm32.t=
xt deleted in HEAD and modified in pwm/for-next. Version pwm/for-next of Do=
cumentation/devicetree/bindings/pwm/pwm-stm32.txt left in tree.
$ git rm -f Documentation/devicetree/bindings/pwm/pwm-stm32.txt
Merging userns/for-next (61a47c1ad3a4 sysctl: Remove the sysctl system call)
Merging ktest/for-next (9b5f852ae20d ktest: Make default build option oldco=
nfig not randconfig)
Merging random/dev (58be0106c530 random: fix soft lockup when trying to rea=
d from an uninitialized blocking pool)
Merging kselftest/next (54ecb8f7028c Linux 5.4-rc1)
Merging y2038/y2038 (6d75353320b4 Merge tag 'y2038-cleanups-5.5' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/arnd/playground into y2038)
CONFLICT (content): Merge conflict in kernel/time/time.c
CONFLICT (content): Merge conflict in fs/compat_ioctl.c
CONFLICT (content): Merge conflict in drivers/scsi/sg.c
Applying: fix up for "compat: move FS_IOC_RESVSP_32 handling to fs/ioctl.c"
Merging livepatching/for-next (7f436b3066e3 Merge branch 'for-5.5/core' int=
o for-next)
Merging coresight/next (9a5d847c0bda coresight: replicator: Fix missing spi=
n_lock_init())
Merging rtc/rtc-next (3bc46ac3a715 rtc: Fix Kconfig indentation)
Merging nvdimm/libnvdimm-for-next (0dfbb932bb67 MAINTAINERS: Remove Keith f=
rom NVDIMM maintainers)
Merging at24/at24/for-next (285be87c79e1 eeprom: at24: Improve confusing lo=
g message)
Merging ntb/ntb-next (1ef512b16bc8 NTB: Fix an error in get link status)
Merging kspp/for-next/kspp (ec2f877856e0 treewide: Use sizeof_member() macr=
o)
CONFLICT (content): Merge conflict in arch/x86/kernel/fpu/xstate.c
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (54ecb8f7028c Linux 5.4-rc1)
Merging fsi/next (2c01397b71c5 fsi: aspeed: Fix OPB0 byte order register va=
lues)
Merging slimbus/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging nvmem/for-next (6bd17868c992 nvmem: add Rockchip OTP driver)
Merging xarray/xarray (6b81141deb73 XArray: Improve documentation of search=
 marks)
Merging hyperv/hyperv-next (7a1323b5dfe4 Drivers: hv: vmbus: Fix crash hand=
ler reset of Hyper-V synic)
Merging auxdisplay/auxdisplay (54ecb8f7028c Linux 5.4-rc1)
Merging kgdb/kgdb/for-next (c58ff643763c kdb: Tweak escape handling for vi =
users)
Merging pidfd/for-next (04882c321b26 Merge branch 'pidfd' into for-next)
Merging devfreq/devfreq-next (518e99e2a22e PM / devfreq: Add dynamic scalin=
g for imx8m ddr controller)
Merging hmm/hmm (93f4e735b6d9 mm/hmm: remove hmm_range_dma_map and hmm_rang=
e_dma_unmap)
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx5/odp.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
Merging fpga/for-next (fddc9fcbe69a fpga: dfl: fme: add power management su=
pport)
Merging kunit/test (ea2dd7c0875e lib/list-test: add a test for the 'list' d=
oubly linked list)
Merging cel/cel-next (a99d8080aaf3 Linux 5.4-rc6)
Merging kasan-bitops/topic/kasan-bitops (5bece3d66153 powerpc: support KASA=
N instrumentation of bitops)
Merging generic-ioremap/for-next (eafee5944062 nds32: use generic ioremap)
CONFLICT (content): Merge conflict in arch/riscv/mm/Makefile
CONFLICT (content): Merge conflict in arch/riscv/include/asm/io.h
Applying: fixup for moved code in riscv
Merging akpm-current/current (a4cee976e966 ipc/msg.c: consolidate all xxxct=
l_down() functions)
CONFLICT (content): Merge conflict in lib/ubsan.c
CONFLICT (content): Merge conflict in include/linux/syscalls.h
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
Applying: mm-pagewalk-allow-walking-without-vma-v15
Applying: mm-pagewalk-allow-walking-without-vma-fix
Applying: mm: pagewalk: add test_p?d callbacks
Applying: mm: pagewalk: add 'depth' parameter to pte_hole
Applying: x86: mm: point to struct seq_file from struct pg_state
Applying: x86: mm+efi: convert ptdump_walk_pgd_level() to take a mm_struct
Applying: x86: mm: convert ptdump_walk_pgd_level_debugfs() to take an mm_st=
ruct
Applying: x86: mm: convert ptdump_walk_pgd_level_core() to take an mm_struct
Applying: mm: add generic ptdump
Applying: mm-add-generic-ptdump-v15
Applying: mm/ptdump: fix a -Wold-style-declaration warning
Applying: x86: mm: convert dump_pagetables to use walk_page_range
Applying: arm64: mm: convert mm/dump.c to use walk_page_range()
Applying: arm64: mm: display non-present entries in ptdump
Applying: mm: ptdump: reduce level numbers by 1 in note_page()
Applying: alpha: use pgtable-nopud instead of 4level-fixup
Applying: arm: nommu: use pgtable-nopud instead of 4level-fixup
Applying: c6x: use pgtable-nopud instead of 4level-fixup
Applying: m68k: nommu: use pgtable-nopud instead of 4level-fixup
Applying: m68k: mm: use pgtable-nopXd instead of 4level-fixup
Applying: microblaze: use pgtable-nopmd instead of 4level-fixup
Applying: nds32: use pgtable-nopmd instead of 4level-fixup
Applying: parisc: use pgtable-nopXd instead of 4level-fixup
Applying: parisc/hugetlb: use pgtable-nopXd instead of 4level-fixup
Applying: sparc32: use pgtable-nopud instead of 4level-fixup
Applying: um: remove unused pxx_offset_proc() and addr_pte() functions
Applying: um: add support for folded p4d page tables
Applying: mm: remove __ARCH_HAS_4LEVEL_HACK and include/asm-generic/4level-=
fixup.h
Applying: kernel.h: update comment about simple_strto<foo>() functions
Applying: auxdisplay: charlcd: deduplicate simple_strtoul()
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (a7116f39f9fb drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/=JMZ_8ucMQvBso8CZ0CB.4v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3fRuAACgkQAVBC80lX
0GzAfAf9Gq4JwCHaGfd1KxKkWPEv131qeKUeE7MCnTU1Z/B2dSe0ruWosiOlIbwX
uZHWEGJD19mZUqaJmGlRJhpzmOUvioYtuVpl/rzrlb4LNqZFAi9iK6xCf9tp3lSi
md+jOdKcYFWShYLtgwybb38royPByIXDWuOGsw5wedbmOh9grS1gEixAgf19De+t
DQe5aIjb9M+O0MbEiFV3QoUsU1NwCjeyX/0l2kq4qdvPYvSkVCYptoG114/ndUnM
uFu6cevM+ugGvO0EO6zjjj6Hc+Fb8MWC2SYynnYrrW4jCGsOypY0VWMP8pLg03vX
PcK+3zLPzHDjYdrJPpbsPeCgdiWcqQ==
=h/xR
-----END PGP SIGNATURE-----

--Sig_/=JMZ_8ucMQvBso8CZ0CB.4v--
