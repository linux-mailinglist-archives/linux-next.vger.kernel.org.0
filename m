Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E42BCE1142
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2019 06:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733236AbfJWEz2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Oct 2019 00:55:28 -0400
Received: from ozlabs.org ([203.11.71.1]:38561 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732261AbfJWEz1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Oct 2019 00:55:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46ydNS2pgXz9sNw;
        Wed, 23 Oct 2019 15:55:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571806520;
        bh=f4eAjlL9XX5d4OYoFl+FWXxAMvJxP4UtE98PU79u2aU=;
        h=Date:From:To:Cc:Subject:From;
        b=uIc3HmbcMrVWgPeq8PyIIsXD9A/6czr6L18LYBrc/OuVQKzYTm3NU7ma1pEbMFioH
         8ZKCNMRXFLTzDmJtabMwGuWlADcl+qVJF+sn0sIcV2yrhtFeKzrcx+nqUtST1CNXZP
         40UfVLGXzeU79PSCLNN7ENzOsYGPxi9FihRJ8q6HTd2c/ZCa32YHqz5um7d+wNIC/Z
         +/FWs2AX3gShp/J6FrWAAJbO8aziVxL3hQGeTOl/ToYleOwBNlZGNYvtLymcsB71DQ
         5sdRZZIA7qg46lKP/CQrmIdlYe3btNy3CcCT4RN2OY2JHFQbYKx23+BX1/YTeUIOJ8
         s5XFzBBHeieIA==
Date:   Wed, 23 Oct 2019 15:55:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 23
Message-ID: <20191023155519.2d6765d4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eUIXiafp2.+ZLsek0o61dMy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/eUIXiafp2.+ZLsek0o61dMy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20191022:

Non-merge commits (relative to Linus' tree): 5530
 5340 files changed, 192671 insertions(+), 90844 deletions(-)

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
Merging origin/master (3b7c59a1950c Merge tag 'pinctrl-v5.4-2' of git://git=
.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl)
Merging fixes/master (54ecb8f7028c Linux 5.4-rc1)
Merging kbuild-current/fixes (7d194c2100ad Linux 5.4-rc4)
Merging arc-current/for-curr (5effc09c4907 ARC: perf: Accommodate big-endia=
n CPU)
Merging arm-current/fixes (39f4d4410484 Merge branch 'misc' into fixes)
Merging arm-soc-fixes/arm/fixes (cc3fafdaf5cb Merge tag 'arm-soc/for-5.4/de=
vicetree-fixes-part2' of https://github.com/Broadcom/stblinux into arm/fixe=
s)
Merging arm64-fixes/for-next/fixes (777d062e5bee Merge branch 'errata/tx2-2=
19' into for-next/fixes)
Merging m68k-current/for-linus (0f1979b402df m68k: Remove ioremap_fullcache=
())
Merging powerpc-fixes/fixes (d10f60ae27d2 powerpc/32s: fix allow/prevent_us=
er_access() when crossing segment boundaries.)
Merging s390-fixes/fixes (ac49303d9ef0 s390/kaslr: add support for R_390_GL=
OB_DAT relocation type)
Merging sparc/master (038029c03e21 sparc: remove unneeded uapi/asm/statfs.h)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (b30605319794 r8152: add device id for Lenovo ThinkPad U=
SB-C Dock Gen 2)
Merging bpf/master (cd7455f1013e bpf: Fix use after free in subprog's jited=
 symbol removal)
Merging ipsec/master (68ce6688a5ba net: sched: taprio: Fix potential intege=
r overflow in taprio_set_picos_per_byte)
Merging netfilter/master (503c9addef61 ptp: fix typo of "mechanism" in Kcon=
fig help text)
Merging ipvs/master (503c9addef61 ptp: fix typo of "mechanism" in Kconfig h=
elp text)
Merging wireless-drivers/master (d79749f7716d ath10k: fix latency issue for=
 QCA988x)
Merging mac80211/master (82ad862115c2 Merge branch 'smc-fixes')
Merging rdma-fixes/for-rc (777a8b32bc0f IB/core: Use rdma_read_gid_l2_field=
s to compare GID L2 fields)
Merging sound-current/for-linus (ba8bf0967a15 ALSA: usb-audio: Fix copy&pas=
te error in the validator)
Merging sound-asoc-fixes/for-linus (38dd8f172b2d Merge branch 'asoc-5.4' in=
to asoc-linus)
Merging regmap-fixes/for-linus (da0c9ea146cb Linux 5.4-rc2)
Merging regulator-fixes/for-linus (d730b0dd62b4 Merge branch 'regulator-5.4=
' into regulator-linus)
Merging spi-fixes/for-linus (44885b636ef0 Merge branch 'spi-5.4' into spi-l=
inus)
Merging pci-current/for-linus (54ecb8f7028c Linux 5.4-rc1)
Merging driver-core.current/driver-core-linus (82af5b660967 sysfs: Fixes __=
BIN_ATTR_WO() macro)
Merging tty.current/tty-linus (f50b6805dbb9 8250-men-mcb: fix error checkin=
g when get_num_ports returns -ENODEV)
Merging usb.current/usb-linus (9794476942d8 usb: cdns3: Error out if USB_DR=
_MODE_UNKNOWN in cdns3_core_init_role())
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
Merging soundwire-fixes/fixes (cf9249626f72 soundwire: intel: fix intel_reg=
ister_dai PDI offsets and numbers)
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
Merging modules-fixes/modules-linus (69923208431e symbol namespaces: revert=
 to previous __ksymtab name scheme)
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
Merging mips-fixes/mips-fixes (8a1bef4193e8 mips: vdso: Fix __arch_get_hw_c=
ounter())
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (6aed5a0e0f56 Merge branch 'watchdog-fix' into fix=
es)
Merging kvm-fixes/master (20baa8e515a5 Merge tag 'kvm-ppc-fixes-5.4-1' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/paulus/powerpc into HEAD)
Merging kvms390-fixes/master (53936b5bf35e KVM: s390: Do not leak kernel st=
ack data in the KVM_S390_INTERRUPT ioctl)
Merging hwmon-fixes/hwmon (6fc28b7e0aac hwmon: (nct7904) Fix the incorrect =
value of vsen_mask & tcpu_mask & temp_mode in nct7904_data struct.)
Merging nvdimm-fixes/libnvdimm-fixes (4c806b897d60 libnvdimm/region: Enable=
 MAP_SYNC for volatile regions)
Merging btrfs-fixes/next-fixes (9b2a091c6b3c Merge branch 'misc-5.4' into n=
ext-fixes)
Merging vfs-fixes/fixes (97eba80fcca7 aio: Fix io_pgetevents() struct __com=
pat_aio_sigset layout)
Merging dma-mapping-fixes/for-linus (9c24eaf81cc4 iommu/vt-d: Return the co=
rrect dma mask when we are bypassing the IOMMU)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (7d194c2100ad Linux 5.4-rc4)
Merging samsung-krzk-fixes/fixes (54ecb8f7028c Linux 5.4-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging devicetree-fixes/dt/linus (f437ade3296b dt-bindings: phy: lantiq: F=
ix Property Name)
Merging scsi-fixes/fixes (74e5e468b664 scsi: ufs-bsg: Wake the device befor=
e sending raw upiu commands)
Merging drm-fixes/drm-fixes (7d194c2100ad Linux 5.4-rc4)
Merging amdgpu-fixes/drm-fixes (c0e70e10b11b drm/amd/display: fix dcn21 Mak=
efile for clang)
Merging drm-intel-fixes/for-linux-next-fixes (7d194c2100ad Linux 5.4-rc4)
Merging mmc-fixes/fixes (2bb9f7566ba7 mmc: mxs: fix flags passed to dmaengi=
ne_prep_slave_sg)
Merging rtc-fixes/rtc-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging gnss-fixes/gnss-linus (54ecb8f7028c Linux 5.4-rc1)
Merging hyperv-fixes/hyperv-fixes (83b50f83a968 Drivers: hv: vmbus: Fix har=
mless building warnings without CONFIG_PM_SLEEP)
Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe=
_pin_request())
Merging risc-v-fixes/fixes (2919fb6a05c6 riscv: for C functions called only=
 from assembly, mark with __visible)
Merging pidfd-fixes/fixes (28f9baed3d50 pidfd: avoid linux/wait.h and sys/w=
ait.h name clashes)
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (02dc96ef6c25 Merge git://git.kernel.org/pub/scm/li=
nux/kernel/git/netdev/net)
Merging gpio-intel-fixes/fixes (7d194c2100ad Linux 5.4-rc4)
Merging pinctrl-intel-fixes/fixes (63bdef6cd694 pinctrl: cherryview: Fix ir=
q_valid_mask calculation)
Merging erofs-fixes/fixes (da0c9ea146cb Linux 5.4-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (8ae501e295cc drm/komeda: Fix t=
ypos in komeda_splitter_validate)
Merging kspp-gustavo/for-next/kspp (da0c9ea146cb Linux 5.4-rc2)
Merging kbuild/for-next (f99cf1320f6a modpost: do not set ->preloaded for s=
ymbols from Module.symvers)
Merging compiler-attributes/compiler-attributes (54ecb8f7028c Linux 5.4-rc1)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (c7d9eccb3c1e mmc: renesas_sdhi_internal_dmac:=
 Add MMC_CAP2_MERGE_CAPABLE)
Merging asm-generic/master (9b87647c665d asm-generic: add unlikely to defau=
lt BUG_ON(x))
Merging arc/for-next (6fbc7275c7a9 Linux 5.2-rc7)
Merging arm/for-next (d91230f0a3aa Merge branch 'fixes' into for-next)
Merging arm64/for-next/core (485fadf618d9 Merge branches 'for-next/elf-hwca=
p-docs', 'for-next/smccc-conduit-cleanup', 'for-next/zone-dma', 'for-next/r=
elax-icc_pmr_el1-sync' and 'for-next/misc' into for-next/core)
Merging arm-perf/for-next/perf (c8b0de762e0b perf/smmuv3: use devm_platform=
_ioremap_resource() to simplify code)
Merging arm-soc/for-next (d6534b72a576 ARM: Document merges)
Merging amlogic/for-next (df9fc09d8a5d Merge branch 'v5.5/dt64' into tmp/am=
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
Merging omap/for-next (c2222cbf21e1 Merge branch 'omap-for-v5.5/dt' into fo=
r-next)
Merging qcom/for-next (5d15b432b91b Merge branches 'arm64-for-5.5', 'arm64-=
defconfig-for-5.5', 'defconfig-for-5.5' 'drivers-for-5.5' and 'dts-for-5.5'=
 into for-next)
Merging realtek/for-next (dac6491ec7b9 Merge branch 'v5.5/arm64' into next)
Merging renesas/next (117ae53b4376 Merge branch 'renesas-arm64-dt-for-v5.5'=
 into renesas-next)
Merging reset/reset/next (96a2f50305d1 reset: build simple reset controller=
 driver for Agilex)
Merging rockchip/for-next (c188a2514213 Merge branch 'v5.5-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (0228b0ee789c Merge branch 'next/defconfig' i=
nto for-next)
Merging scmi/for-linux-next (9ce4d38e6dc3 Merge branch 'for-next/juno' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-li=
nux-next)
Merging sunxi/sunxi/for-next (cbff93b859d0 Merge branch 'sunxi/dt-for-5.5' =
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
Merging m68k/for-next (7cf78b6b12fd m68k: q40: Fix info-leak in rtc_ioctl)
Merging m68knommu/for-next (0e6e793c1872 m68k/coldfire: Use CONFIG_PREEMPTI=
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
Merging risc-v/for-next (06aab885d13c RISC-V: Remove unsupported isa string=
 info print)
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
Merging fscrypt/master (065ab4c4701f docs: ioctl-number: document fscrypt i=
octl numbers)
Merging afs/afs-next (a0753c29004f afs: Support RCU pathwalk)
Merging btrfs/for-next (d817e55254a9 Merge branch 'for-next-next-v5.4-20191=
017' into for-next-20191017)
Merging ceph/master (25e6be21230d rbd: cancel lock_dwork if the wait is int=
errupted)
Merging cifs/for-next (7e0b8a0fadfe cifs: Don't display RDMA transport on r=
econnect)
Merging configfs/for-next (e9c03af21cc7 configfs: calculate the symlink tar=
get only once)
Merging ecryptfs/next (b4a81b87a4cf ecryptfs: fix a memory leak bug in ecry=
ptfs_init_messaging())
Merging erofs/dev (6b42c3370e83 erofs: set iowait for sync decompression)
Merging ext3/for_next (3c30ca1854eb Merge sparse fixes from Ben Dooks.)
Merging ext4/dev (040823b5372b Merge tag 'unicode-next-v5.4' of https://git=
.kernel.org/pub/scm/linux/kernel/git/krisman/unicode into dev)
Merging f2fs/dev (b145b0eb2031 Merge tag 'for-linus' of git://git.kernel.or=
g/pub/scm/virt/kvm/kvm)
Merging fsverity/fsverity (95ae251fe828 f2fs: add fs-verity support)
Merging fuse/for-next (a9bfd9dd3417 virtiofs: Retry request submission from=
 worker context)
Merging jfs/jfs-next (a5fdd713d256 jfs: fix bogus variable self-initializat=
ion)
Merging nfs/linux-next (4f5cafb5cb84 Linux 5.4-rc3)
Merging nfs-anna/linux-next (e6687f43745b SUNRPC: Destroy the back channel =
when we destroy the host transport)
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
Merging xfs/for-next (1e190f8e8098 xfs: improve the IOMAP_NOWAIT check for =
COW inodes)
Merging iomap/iomap-for-next (c039b9979272 iomap: use a srcmap for a read-m=
odify-write I/O)
Merging djw-vfs/vfs-for-next (7118dd2d41af splice: only read in as much inf=
ormation as there is pipe buffer space)
Merging file-locks/locks-next (b41dae061bbd Merge tag 'xfs-5.4-merge-7' of =
git://git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging vfs/for-next (3e501af8dd7b Merge branches 'work.misc', 'work.mount3=
', 'work.namei', 'work.dcache' and 'work.autofs' into for-next)
Merging printk/for-next (4a6442ff627f Merge branch 'for-5.5-pr-warn' into f=
or-next)
Merging pci/next (444aedb8242c Merge branch 'remotes/lorenzo/pci/misc')
Merging pstore/for-next/pstore (609488bc979f Linux 5.3-rc2)
Merging hid/for-next (1b8e121a4d7e Merge branch 'for-5.4/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (5cf1d40fc564 Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (f12b524ea386 i3c: master: use i3c_dev_get_master())
Merging dmi/master (c11f2bc422b9 firmware: dmi: Fix unlikely out-of-bounds =
read in save_mem_devices)
Merging hwmon-staging/hwmon-next (ce94d84d98fb hwmon: (ina3221) Add summati=
on feature support)
Merging jc_docs/docs-next (85c2a0edcd5f docs: remove :c:func: from generici=
rq.rst)
CONFLICT (content): Merge conflict in Documentation/admin-guide/cgroup-v2.r=
st
Merging v4l-dvb/master (6ce1d376d33e media: docs-rst: Document m2m stateles=
s video decoder interface)
Merging v4l-dvb-next/master (167f4555184b Merge branch fixes_for_upstream i=
nto to_next)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (994ea865d32b Merge branch 'pm-cpufreq' into linux-ne=
xt)
CONFLICT (content): Merge conflict in lib/test_printf.c
Merging cpufreq-arm/cpufreq/arm/linux-next (af44d180e3de cpufreq: imx-cpufr=
eq-dt: Correct i.MX8MN's default speed grade value)
Merging cpupower/cpupower (7e5705c635ec tools/power/cpupower: Fix initializ=
er override in hsw_ext_cstates)
Merging opp/opp/linux-next (c86487ec42bd Merge branch 'opp/fixes' into opp/=
linux-next)
Merging thermal/thermal/linux-next (e63721e1b4bd cpufreq: qcom-hw: Move dri=
ver initialization earlier)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (812cd88749e0 firewire: mark expected switch fall=
-throughs)
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (5a0d52378107 ib/srp: Add missing new line after disp=
laying fast_io_fail_tmo param)
Merging net-next/master (685df9c39f70 Merge branch 'net-dsa-turn-arrays-of-=
ports-into-a-list')
Merging bpf-next/master (5e5b03d163e1 xdp: Fix type of string pointer in __=
XDP_ACT_SYM_TAB)
Merging ipsec-next/master (fd1ac07f3f17 xfrm: ifdef setsockopt(UDP_ENCAP_ES=
PINUDP/UDP_ENCAP_ESPINUDP_NON_IKE))
Merging mlx5-next/mlx5-next (7d47433cf74f net/mlx5: Expose optimal performa=
nce scatter entries capability)
Merging netfilter-next/master (0a9b33850073 netfilter: nft_tproxy: Fix typo=
 in IPv6 module description.)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (0a9b33850073 netfilter: nft_tproxy: Fix typo in I=
Pv6 module description.)
Merging wireless-drivers-next/master (0eeb91ade90c rtl8xxxu: fix RTL8723BU =
connection failure issue after warm reboot)
Merging bluetooth/master (3347a80965b3 Bluetooth: hci_bcm: Fix RTS handling=
 during startup)
Merging mac80211-next/master (7dfd8ac32730 mac80211_hwsim: add support for =
OCB)
Merging gfs2/for-next (821087444e4d gfs2: make gfs2_fs_parameters static)
Merging mtd/mtd/next (b34c095ca609 mtd: st_spi_fsm: remove unused field fro=
m struct stfsm)
Merging nand/nand/next (5121b4219972 dt-bindings: mtd: Add Cadence NAND con=
troller driver)
Merging spi-nor/spi-nor/next (7d194c2100ad Linux 5.4-rc4)
Merging crypto/master (1510fd40471a crypto: inside-secure - Made locally us=
ed safexcel_pci_remove() static)
Merging drm/drm-next (f1b4a9217efd Merge tag 'du-next-20191016' of git://li=
nuxtv.org/pinchartl/media into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/selftests/i915_g=
em.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_request.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_gem.h
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
Merging drm-misc/for-linux-next (cb8763724965 drm/vc4: Use drm_hdmi_avi_inf=
oframe_bars())
CONFLICT (content): Merge conflict in drivers/gpu/drm/panfrost/panfrost_job=
.c
Merging drm-msm/msm-next (8856c5064834 drm/msm/mdp5: make config variables =
static)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (4d24376370fb gpu: ipu-v3: image-convert: only=
 sample into the next tile if necessary)
Merging etnaviv/etnaviv/next (22567d017c2c dt-bindings: etnaviv: Add #cooli=
ng-cells)
Merging regmap/for-next (da0c9ea146cb Linux 5.4-rc2)
Merging sound/for-next (46b4bff6572b PCI: Fix missing inline for pci_pr3_pr=
esent())
Merging sound-asoc/for-next (45bc9c35cfdf Merge branch 'asoc-5.5' into asoc=
-next)
CONFLICT (content): Merge conflict in sound/soc/samsung/Kconfig
CONFLICT (content): Merge conflict in sound/soc/intel/boards/Kconfig
Applying: ASOC: SOF: dai-imx.h needs linux/types.h
Merging modules/modules-next (54ecb8f7028c Linux 5.4-rc1)
Merging input/next (688f1dfb69b4 Input: keyboard - imx_sc: Add i.MX system =
controller key support)
Merging block/for-next (5c60226fe407 Merge branch 'for-5.5/io_uring' into f=
or-next)
Merging device-mapper/for-next (13bd677a472d dm cache: fix bugs when a GFP_=
NOWAIT allocation fails)
Merging mmc/next (bc33efde76e9 Merge branch 'fixes' into next)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (72303a6a9c80 mfd: twl: Endian fixups in i2c write=
 and read wrappers)
Merging backlight/for-backlight-next (c0b64faf0fe6 backlight: pwm_bl: Set s=
cale type for brightness curves specified in the DT)
Merging battery/for-next (e3da2ce04e12 power: supply: cpcap-charger: cpcap_=
charger_voltage_to_regval() can be static)
Merging regulator/for-next (4c96365fbfaf Merge branch 'regulator-5.5' into =
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
Merging iommu/next (313df38144c8 Merge branches 'iommu/fixes', 'arm/qcom', =
'arm/renesas', 'arm/rockchip', 'arm/mediatek', 'arm/tegra', 'x86/amd', 'x86=
/vt-d' and 'core' into next)
Merging vfio/next (026948f01eac vfio/type1: remove hugepage checks in is_in=
valid_reserved_pfn())
Merging audit/next (245d73698ed7 audit: Report suspicious O_CREAT usage)
Merging devicetree/for-next (e5367b4f6153 dt-bindings: gpu: samsung-rotator=
: Fix indentation)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/usb=
/generic-ehci.yaml
Merging mailbox/mailbox-for-next (556a0964e28c mailbox: qcom-apcs: fix max_=
register value)
Merging spi/for-next (d5a8bfdd6dc5 Merge remote-tracking branch 'spi/topic/=
ptp' into spi-next)
Merging tip/auto-latest (9bd999c60e93 Merge branch 'linus')
CONFLICT (content): Merge conflict in samples/bpf/Makefile
CONFLICT (content): Merge conflict in include/linux/security.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_shr=
inker.c
Applying: drm/i915: update for mutex_release API change
Merging clockevents/timers/drivers/next (97c18a4b4c87 clocksource/drivers/r=
enesas-ostm: Use unique device name instead of ostm)
Merging edac/edac-for-next (e80634a75aba EDAC, skx: Retrieve and print retr=
y_rd_err_log registers)
Merging irqchip/irq/irqchip-next (bb0fed1c60cc irqchip/sifive-plic: Switch =
to fasteoi flow)
Merging ftrace/for-next (8ed4889eb831 selftests/ftrace: Fix same probe erro=
r test)
Merging rcu/rcu/next (049b405029c0 MAINTAINERS: Update from paulmck@linux.i=
bm.com to paulmck@kernel.org)
Merging kvm/linux-next (20baa8e515a5 Merge tag 'kvm-ppc-fixes-5.4-1' of git=
://git.kernel.org/pub/scm/linux/kernel/git/paulus/powerpc into HEAD)
Merging kvm-arm/next (2b82590ba231 Merge branch 'kvm-arm64/stolen-time' int=
o kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (ff42df49e75f KVM: PPC: Book3S HV: Don't lose =
pending doorbell request on migration on P9)
Merging kvms390/next (c7b7de631246 KVM: s390: Do not yield when target is a=
lready running)
Merging xen-tip/linux-next (ee7f5225dc3c xen: Stop abusing DT of_dma_config=
ure API)
Merging percpu/for-next (825dbc6ff7a3 percpu: add __percpu to SHIFT_PERCPU_=
PTR)
Merging workqueues/for-next (30ae2fc0a75e workqueue: Minor follow-ups to th=
e rescuer destruction change)
Merging drivers-x86/for-next (1aa7177cdcb3 tools/power/x86/intel-speed-sele=
ct: Implement base-freq commands on CascadeLake-N)
Merging chrome-platform/for-next (fdf0fe2df3e3 platform/chrome: wilco_ec: A=
dd Dell's USB PowerShare Policy control)
Merging hsi/for-next (c1030cd45619 HSI: Remove dev_err() usage after platfo=
rm_get_irq())
Merging leds/for-next (448d6fcb7a52 leds: pca953x: Use of_device_get_match_=
data())
Merging ipmi/for-next (4aa7afb0ee20 ipmi: Fix memory leak in __ipmi_bmc_reg=
ister)
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
Merging char-misc/char-misc-next (6859eba4f6fb samples: mei: use hostprogs =
kbuild constructs)
CONFLICT (content): Merge conflict in samples/Makefile
CONFLICT (content): Merge conflict in samples/Kconfig
CONFLICT (content): Merge conflict in drivers/android/binder.c
Merging extcon/extcon-next (6942635032cf extcon: sm5502: Reset registers du=
ring initialization)
Merging soundwire/next (3fc40449a06b soundwire: intel: use correct header f=
or io calls)
Merging thunderbolt/next (b406357c572b thunderbolt: Add 'generation' attrib=
ute for devices)
Merging staging/staging-next (8193e6ad6916 staging: sm750fb: Fix lines over=
 80 characters)
Merging mux/for-next (05fb8284a417 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (a8dfe193a60c interconnect: Add locking in icc_set_tag=
())
Merging slave-dma/next (7fdf9b05c73b dmaengine: fsl-dpaa2-qdma: Add NXP dpa=
a2 qDMA controller driver for Layerscape SoCs)
Merging cgroup/for-next (1a99fcc035fb selftests: cgroup: Run test_core unde=
r interfering stress)
Merging scsi/for-next (253c0dec9496 Merge remote-tracking branch 'mkp-scsi/=
5.4/scsi-postmerge' into for-next)
Merging scsi-mkp/for-next (99a3a7459071 Merge branch '5.5/scsi-queue' into =
5.5/scsi-next)
Merging vhost/linux-next (32a1c795917b vhost: last descriptor must have NEX=
T clear)
Merging rpmsg/for-next (6018d5342dbe Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (7c547cb52849 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (228fc0104070 gpio: of: don't warn if ignor=
ed GPIO flag matches the behavior)
Merging gpio-intel/for-next (7d194c2100ad Linux 5.4-rc4)
Merging pinctrl/for-next (551d5106b732 Revert "pinctrl: iproc: use unique n=
ame for irq chip")
Merging pinctrl-intel/for-next (7d194c2100ad Linux 5.4-rc4)
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
Merging y2038/y2038 (2fd0a2f95ad9 Merge tag 'compat-ioctl-5.5' of git://git=
.kernel.org/pub/scm/linux/kernel/git/arnd/playground into y2038)
Merging livepatching/for-next (1cfe141e1715 Merge branch 'for-5.4-core' int=
o for-next)
Merging coresight/next (a6de75a39059 coresight: etm4x: Add missing single-s=
hot control API to sysfs)
Merging rtc/rtc-next (71b81448abf5 rtc: cros-ec: let the core handle rtc ra=
nge)
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
Merging slimbus/for-next (54ecb8f7028c Linux 5.4-rc1)
Merging nvmem/for-next (6bd17868c992 nvmem: add Rockchip OTP driver)
Merging xarray/xarray (91abab83839a XArray: Fix xas_next() with a single en=
try at 0)
Merging hyperv/hyperv-next (41928dfdf5bd Drivers: hv: balloon: Remove depen=
dencies on guest page size)
Merging auxdisplay/auxdisplay (54ecb8f7028c Linux 5.4-rc1)
Merging kgdb/kgdb/for-next (2277b492582d kdb: Fix stack crawling on 'runnin=
g' CPUs that aren't the master)
Merging pidfd/for-next (1282387e9dca Merge branch 'pidfd' into for-next)
Merging devfreq/for-next (d2f5fccd1ac9 PM / devfreq: Make log message more =
explicit when devfreq device already exists)
Merging hmm/hmm (54ecb8f7028c Linux 5.4-rc1)
Merging fpga/for-next (fddc9fcbe69a fpga: dfl: fme: add power management su=
pport)
Merging kunit/test (d460623c5fa1 Documentation: kunit: Fix verification com=
mand)
Merging cel/cel-next (f12883d6d3f2 xprtrdma: Replace dprintk in xprt_rdma_s=
et_port)
Merging akpm-current/current (f4c2491ec2ed ipc/msg.c: consolidate all xxxct=
l_down() functions)
$ git checkout -b akpm remotes/origin/akpm/master
Applying: drivers/block/null_blk_main.c: fix layout
Applying: drivers/block/null_blk_main.c: fix uninitialized var warnings
Applying: pinctrl: fix pxa2xx.c build warnings
Applying: lib/list-test.c: add a test for the 'list' doubly linked list
Applying: lib/list-test: add a test for the 'list' doubly linked list
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
Applying: gpio: pca953x: tighten up indentation
Applying: treewide: cleanup: replace prefered with preferred
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (2edc778fe4c3 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/eUIXiafp2.+ZLsek0o61dMy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2v3TcACgkQAVBC80lX
0GyUKAf+NO0vvpimY35LS7a0kMBFLRaISQfleVYfibhDkXYCTEjjIp6TmTM4Y1wY
RYVyZ0pTFDmWxOcfslhtZCWKeTCrkE/ODSpRrXlJrDYZ6C3IczUgpL08KnBOxz7b
xuKAiL3mdVmCpMq0s+oxdbv1Q8ifMBNJsOSUoIIHuTXziVtsHOBxjT3jdH5HD+pL
5tu2QG/2bCpMvYxNK+kp2ycr39rM1rH1vT8z8hOIfq76gx7FolAPmk+N9QqWMmI6
kp7IN3tDzEq9emsCua50zZuCnJD57Zn6uze40cpKAe3XZXc+BaeTm0TNhp2SE6Fu
zdRg/uafRGTMjD7hawDgTetV7eUbcw==
=UMFJ
-----END PGP SIGNATURE-----

--Sig_/eUIXiafp2.+ZLsek0o61dMy--
