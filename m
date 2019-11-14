Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3DD8FC194
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 09:31:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbfKNIbo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 03:31:44 -0500
Received: from ozlabs.org ([203.11.71.1]:57641 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725920AbfKNIbn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Nov 2019 03:31:43 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47DF7p0kGBz9sNT;
        Thu, 14 Nov 2019 19:31:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573720294;
        bh=pvX6h+/RZd8rptPNiRYds1VjRbvTA3nb+gNHyReQc48=;
        h=Date:From:To:Cc:Subject:From;
        b=LSCAFgTWzpOph0aWgyn4UZmYg4VX+SUwjRMwYdeO/oST7jNLireo3aqUv9wdZJzo0
         irmFBE1nBkLf8O/TqA5GLRjjNUSO/N2AK8Gygcx7GG+KLEV5Nwmv1s2a3DItwyrZQw
         ZahUFWJiAWlDYMWLLi2ApBqYsY2n2RyluC9LrPEhUjoYmTnKXX7V+B8VH4hbNapyQo
         jQ+12aT6TzGiFQvjpsXSrnY0Oxp6ffw7/GZDC3fILBJ1YT47bXGOmV8Gy92s6IR101
         uQaI/Pvwx7bxICmcF3J6teMwZnfrOy8D2WwnCUFyNmtxuip7nZBnfB9Ji8vr8SqXN/
         3fQANxkxRnLmA==
Date:   Thu, 14 Nov 2019 19:31:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 14
Message-ID: <20191114193132.5de921a7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KTWgMpCAwH0maF7jW9tCX7R";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/KTWgMpCAwH0maF7jW9tCX7R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20191113:

The sound-asoc-fixes tree still had its build failure for which I reverted
a commit.

The net-next tree still had its build failure for which I applied a patch.

The devicetree tree gained a conflict against the arm-soc tree.

The y2038 tree gained a build failure for which I applied a patch.

The hmm tree gained a conflict against the drm tree and a build failure
so I used the version from next-20191113.

The akpm-current tree gained a conflict against the y2038 tree.

Non-merge commits (relative to Linus' tree): 10388
 9238 files changed, 397357 insertions(+), 174171 deletions(-)

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

I am currently merging 312 trees (counting Linus' and 78 trees of bug
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
Merging origin/master (0e3f1ad80fc8 Remove VirtualBox guest shared folders =
filesystem)
Merging fixes/master (54ecb8f7028c Linux 5.4-rc1)
Merging kbuild-current/fixes (d6d5df1db6e9 Linux 5.4-rc5)
Merging arc-current/for-curr (5effc09c4907 ARC: perf: Accommodate big-endia=
n CPU)
Merging arm-current/fixes (39f4d4410484 Merge branch 'misc' into fixes)
Merging arm-soc-fixes/arm/fixes (002d3c65ee81 MAINTAINERS: update Cavium Th=
underX2 maintainers)
Merging arm64-fixes/for-next/fixes (65e1f38d9a2f scripts/tools-support-relr=
.sh: un-quote variables)
Merging m68k-current/for-linus (0f1979b402df m68k: Remove ioremap_fullcache=
())
Merging powerpc-fixes/fixes (7d6475051fb3 powerpc/powernv: Fix CPU idle to =
be called with IRQs disabled)
Merging s390-fixes/fixes (a99d8080aaf3 Linux 5.4-rc6)
Merging sparc/master (038029c03e21 sparc: remove unneeded uapi/asm/statfs.h)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (3b5a39979daf slip: Fix memory leak in slip_open error p=
ath)
Merging bpf/master (d0fbb51dfaa6 bpf, offload: Unlock on error in bpf_offlo=
ad_dev_create())
Merging ipsec/master (4944a4b1077f xfrm: release device reference for inval=
id state)
Merging netfilter/master (1d4639567d97 mdio_bus: Fix PTR_ERR applied after =
initialization to constant)
Merging ipvs/master (c24b75e0f923 ipvs: move old_secure_tcp into struct net=
ns_ipvs)
Merging wireless-drivers/master (cb1a4badf592 iwlwifi: pcie: don't consider=
 IV len in A-MSDU)
Merging mac80211/master (285531f9e677 mac80211: fix station inactive_time s=
hortly after boot)
Merging rdma-fixes/for-rc (411c1e6774e2 RDMA/hns: Correct the value of srq_=
desc_size)
Merging sound-current/for-linus (f5cdc9d4003a ALSA: pcm: Fix stream lock us=
age in snd_pcm_period_elapsed())
Merging sound-asoc-fixes/for-linus (df24a159eafa Merge branch 'asoc-5.4' in=
to asoc-linus)
Applying: Revert "ASoC: SOF: Intel: Fix CFL and CML FW nocodec binary names=
."
Merging regmap-fixes/for-linus (da0c9ea146cb Linux 5.4-rc2)
Merging regulator-fixes/for-linus (28930998c4e2 Merge branch 'regulator-5.4=
' into regulator-linus)
Merging spi-fixes/for-linus (0cf144e49f31 Merge branch 'spi-5.4' into spi-l=
inus)
Merging pci-current/for-linus (54ecb8f7028c Linux 5.4-rc1)
Merging driver-core.current/driver-core-linus (d6d5df1db6e9 Linux 5.4-rc5)
Merging tty.current/tty-linus (d6d5df1db6e9 Linux 5.4-rc5)
Merging usb.current/usb-linus (a99d8080aaf3 Linux 5.4-rc6)
Merging usb-gadget-fixes/fixes (f3fb802efaef usb: cdns3: gadget: Don't mana=
ge pullups)
Merging usb-serial-fixes/usb-linus (a99d8080aaf3 Linux 5.4-rc6)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (54ecb8f7028c Linux 5.4-rc1)
Merging staging.current/staging-linus (31f4f5b495a6 Linux 5.4-rc7)
Merging char-misc.current/char-misc-linus (31f4f5b495a6 Linux 5.4-rc7)
Merging soundwire-fixes/fixes (7b47ad3322d1 soundwire: slave: fix scanf for=
mat)
Merging thunderbolt-fixes/fixes (31f4f5b495a6 Linux 5.4-rc7)
Merging input-current/for-linus (79aae6acbef1 Input: cyttsp4_core - fix use=
 after free bug)
Merging crypto-current/master (f703964fc668 crypto: arm/aes-ce - add depend=
ency on AES library)
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
Merging reset-fixes/reset/fixes (0258c29feddf reset: brcmstb: Remove resour=
ce checks)
Merging mips-fixes/mips-fixes (f6929c92e283 MAINTAINERS: Remove Kevin as ma=
intainer of BMIPS generic platforms)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (6aed5a0e0f56 Merge branch 'watchdog-fix' into fix=
es)
Merging kvm-fixes/master (b9876e6de123 KVM: Forbid /dev/kvm being opened by=
 a compat task when CONFIG_KVM_COMPAT=3Dn)
Merging kvms390-fixes/master (53936b5bf35e KVM: s390: Do not leak kernel st=
ack data in the KVM_S390_INTERRUPT ioctl)
Merging hwmon-fixes/hwmon (92b39ad44096 hwmon: (pmbus/ibm-cffps) Fix LED bl=
ink behavior)
Merging nvdimm-fixes/libnvdimm-fixes (6370740e5f8e fs/dax: Fix pmd vs pte c=
onflict detection)
Merging btrfs-fixes/next-fixes (bfbbf8cb43a7 Merge branch 'misc-5.4' into n=
ext-fixes)
Merging vfs-fixes/fixes (762c69685ff7 ecryptfs_lookup_interpose(): lower_de=
ntry->d_parent is not stable either)
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
Merging drm-fixes/drm-fixes (31f4f5b495a6 Linux 5.4-rc7)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (31e8d62989a7 Merge tag 'gvt-f=
ixes-2019-11-12' of https://github.com/intel/gvt-linux into drm-intel-fixes)
Merging mmc-fixes/fixes (31f4f5b495a6 Linux 5.4-rc7)
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
Merging pinctrl-intel-fixes/fixes (31f4f5b495a6 Linux 5.4-rc7)
Merging erofs-fixes/fixes (da0c9ea146cb Linux 5.4-rc2)
Merging drm-misc-fixes/for-linux-next-fixes (0b8e7bbde5e7 drm/sun4i: tcon: =
Set min division of TCON0_DCLK to 1.)
Merging kspp-gustavo/for-next/kspp (da0c9ea146cb Linux 5.4-rc2)
Merging kbuild/for-next (edd4d23d2907 kbuild: tell sparse about the $ARCH)
Merging compiler-attributes/compiler-attributes (54ecb8f7028c Linux 5.4-rc1)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (e380a0394c36 x86/PCI: sta2x11: use default DM=
A address translation)
Merging asm-generic/master (9b87647c665d asm-generic: add unlikely to defau=
lt BUG_ON(x))
Merging arc/for-next (f091d5a42644 ARC: ARCv2: jump label: implement jump l=
abel patching)
Merging arm/for-next (cb73737ea1d2 ARM: 8928/1: ARM_ERRATA_775420: Spelling=
 s/date/data/)
Merging arm64/for-next/core (32667745cab9 kselftest: arm64: fix spelling mi=
stake "contiguos" -> "contiguous")
CONFLICT (content): Merge conflict in include/linux/dma-direct.h
Merging arm-perf/for-next/perf (8703317ae576 drivers/perf: hisi: update the=
 sccl_id/ccl_id for certain HiSilicon platform)
Merging arm-soc/for-next (83a362c02a60 ARM: Document merges)
Merging amlogic/for-next (320a07ac6201 Merge branch 'v5.5/drivers' into tmp=
/aml-rebuild)
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
Merging omap/for-next (ee1340e5d505 Merge branch 'omap-for-v5.5/dt' into fo=
r-next)
Merging qcom/for-next (358b2c9ef5af Merge tag 'qcom-arm64-defconfig-for-5.5=
' into final-for-5.5)
CONFLICT (content): Merge conflict in arch/arm64/configs/defconfig
Merging realtek/for-next (6a41c7019bca Merge branch 'v5.5/dt64' into next)
Merging renesas/next (9c45f53abb97 Merge branches 'renesas-arm-defconfig-fo=
r-v5.5', 'renesas-arm64-defconfig-for-v5.5', 'renesas-arm64-dt-for-v5.5', '=
renesas-drivers-for-v5.5' and 'renesas-dt-bindings-for-v5.5' into renesas-n=
ext)
Merging reset/reset/next (b3f1d036f26d reset: npcm: add NPCM reset controll=
er driver)
Merging rockchip/for-next (a0f604d37a8d Merge branch 'v5.5-clk/next' into f=
or-next)
Merging samsung-krzk/for-next (008d87746660 Merge branch 'next/dt' into for=
-next)
Merging scmi/for-linux-next (31f4f5b495a6 Linux 5.4-rc7)
Merging sunxi/sunxi/for-next (2ddd531f8c80 Merge branches 'sunxi/clk-for-5.=
5' and 'sunxi/dt-for-5.5' into sunxi/for-next)
Merging tegra/for-next (6c7c92944894 Merge branch for-5.5/cpufreq into for-=
next)
Merging clk/clk-next (dafbb1e64737 Merge branch 'clk-ti' into clk-next)
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
Merging m68knommu/for-next (3ad3cbe305b5 m68k/coldfire: Use CONFIG_PREEMPTI=
ON)
Merging microblaze/next (22648c989cb8 microblaze: Increase max dtb size to =
64K from 32K)
Merging mips/mips-next (7d73d572111f MIPS: math-emu: Reuse name array in de=
bugfs_fpuemu())
CONFLICT (content): Merge conflict in arch/mips/sgi-ip27/ip27-init.c
Merging nds32/next (932296120543 nds32: add new emulations for floating poi=
nt instruction)
Merging nios2/for-next (91d99a724e9c nios2: force the string buffer NULL-te=
rminated)
Merging openrisc/for-next (f3b17320db25 openrisc: map as uncached in iorema=
p)
Merging parisc-hd/for-next (e9c837c6ab07 parisc: Avoid spurious inequivalen=
t alias kernel error messages)
Merging powerpc/next (565f9bc05e2d powerpc/fadump: when fadump is supported=
 register the fadump sysfs files.)
Merging fsl/next (8a35879a60be powerpc/fsl_booke/32: Document KASLR impleme=
ntation)
Merging soc-fsl/next (3b8db0348c50 soc: fsl: add RCPM driver)
Merging risc-v/for-next (349e0a04dd0b Merge branch 'next/misc' into for-nex=
t)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (8b57e7c852fc s390/pkey: use memdup_user() to simplif=
y code)
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
Merging xtensa/xtensa-for-next (271f20883fc5 Merge branch 'xtensa-5.5' into=
 xtensa-for-next)
Merging fscrypt/master (0eee17e33226 f2fs: add support for IV_INO_LBLK_64 e=
ncryption policies)
Merging afs/afs-next (a0753c29004f afs: Support RCU pathwalk)
Merging btrfs/for-next (51a3801b3831 Merge branch 'for-next-next-v5.4-20191=
111' into for-next-20191111)
Merging ceph/master (ff29fde84d1f ceph: return -EINVAL if given fsc mount o=
ption on kernel w/o support)
Merging cifs/for-next (216b3584aeef cifs: update internal module version nu=
mber)
Merging configfs/for-next (e2f238f7d5a1 configfs: calculate the depth of pa=
rent item)
Merging ecryptfs/next (b4a81b87a4cf ecryptfs: fix a memory leak bug in ecry=
ptfs_init_messaging())
Merging erofs/dev (0602fc8bb4f2 erofs: support superblock checksum)
Merging ext3/for_next (18bc9f55c654 Pull ext2 allocation cleanup patches.)
Merging ext4/dev (8d0d47ea1640 Merge branch 'mb/dio' into master)
Merging f2fs/dev (7c15ed5f37a3 f2fs: avoid kernel panic on corruption test)
Merging fsverity/fsverity (73f0ec02d670 docs: fs-verity: mention statx() su=
pport)
Merging fuse/for-next (00929447f575 virtiofs: Fix old-style declaration)
Merging jfs/jfs-next (a5fdd713d256 jfs: fix bogus variable self-initializat=
ion)
Merging nfs/linux-next (634d811c619b nfsv4: Move NFSPROC4_CLNT_COPY_NOTIFY =
to end of list)
Merging nfs-anna/linux-next (79cc55422ce9 NFS: Fix an RCU lock leak in nfs4=
_refresh_delegation_stateid())
Merging nfsd/nfsd-next (a2e2f2dc77a1 nfsd: v4 support requires CRYPTO_SHA25=
6)
Merging orangefs/for-next (e6b998ab62be orangefs: remove redundant assignme=
nt to err)
Merging overlayfs/overlayfs-next (5c2e9f346b81 ovl: filter of trusted xattr=
 results in audit)
Merging ubifs/linux-next (6a379f67454a jffs2: Fix memory leak in jffs2_scan=
_eraseblock() error path)
Merging v9fs/9p-next (aafee43b7286 9p/vfs_super.c: Remove unused parameter =
data in v9fs_fill_super)
Merging xfs/for-next (23220fe260c4 xfs: always pass a valid hdr to xfs_dir3=
_leaf_check_int)
Merging iomap/iomap-for-next (e9f930ac88a8 iomap: fix return value of iomap=
_dio_bio_actor on 32bit systems)
Merging djw-vfs/vfs-for-next (7118dd2d41af splice: only read in as much inf=
ormation as there is pipe buffer space)
Merging file-locks/locks-next (b41dae061bbd Merge tag 'xfs-5.4-merge-7' of =
git://git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging vfs/for-next (3e501af8dd7b Merge branches 'work.misc', 'work.mount3=
', 'work.namei', 'work.dcache' and 'work.autofs' into for-next)
Merging printk/for-next (7653416fedb5 Merge branch 'for-5.5' into for-next)
Merging pci/next (5889765e7165 Merge branch 'pci/trivial')
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/amlogic/meson-sm1=
.dtsi
CONFLICT (content): Merge conflict in arch/arm64/boot/dts/amlogic/meson-g12=
-common.dtsi
Merging pstore/for-next/pstore (8d82cee2f8aa pstore: Make pstore_choose_com=
pression() static)
Merging hid/for-next (c3e664e6024e Merge branch 'for-5.5/core' into for-nex=
t)
Merging i2c/i2c/for-next (786ad52d529f Merge branch 'i2c/for-5.5' into i2c/=
for-next)
Merging i3c/i3c/next (469191c7fcd0 MAINTAINERS: Mark linux-i3c mailing list=
 moderated)
Merging dmi/master (9a85ac3936ad firmware: dmi: Add dmi_memdev_handle)
Merging hwmon-staging/hwmon-next (61412ef12a84 docs: hwmon: Document bel-pf=
e pmbus driver)
Merging jc_docs/docs-next (14d3fe428be5 Revert "Documentation: admin-guide:=
 add earlycon documentation for RISC-V")
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
Merging v4l-dvb/master (dca6b3733a4a media: Revert "media: mtk-vcodec: Remo=
ve extra area allocation in an input buffer on encoding")
Merging v4l-dvb-next/master (d45331b00ddb Linux 5.3-rc4)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (238eb524d5af Merge branch 'acpi-mm' into linux-next)
CONFLICT (content): Merge conflict in lib/test_printf.c
Merging cpufreq-arm/cpufreq/arm/linux-next (c23734487fb4 cpufreq: sun50i: F=
ix CPU speed bin detection)
Merging cpupower/cpupower (4611a4fb0cce cpupower: ToDo: Update ToDo with id=
eas for per_cpu_schedule handling)
Merging opp/opp/linux-next (25cb20a212a1 PM / OPP: Support adjusting OPP vo=
ltages at runtime)
Merging thermal/thermal/linux-next (a4e893e802e6 thermal: cpu_cooling: Migr=
ate to using the EM framework)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (7807759e4ad8 firewire: core: code cleanup after =
vm_map_pages_zero introduction)
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (d11769fdc1bb RDMA/hns: Modify appropriate printings)
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx5/mr.c
Merging net-next/master (75a1ccfe6c72 mscc.c: Add support for additional VS=
C PHYs)
CONFLICT (content): Merge conflict in include/uapi/linux/devlink.h
CONFLICT (content): Merge conflict in include/net/devlink.h
CONFLICT (content): Merge conflict in drivers/net/netdevsim/dev.c
Applying: powerpc: local_read() should take a const local_t argument
Merging bpf-next/master (e47a179997ce bpf, testing: Add missing object file=
 to TEST_FILES)
Merging ipsec-next/master (fd1ac07f3f17 xfrm: ifdef setsockopt(UDP_ENCAP_ES=
PINUDP/UDP_ENCAP_ESPINUDP_NON_IKE))
Merging mlx5-next/mlx5-next (975b992fdd4b net/mlx5: Add new chain for netfi=
lter flow table offload)
Merging netfilter-next/master (3944a4fd0d70 Merge branch 'master' of git://=
blackhole.kfki.hu/nf-next)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (d54725cd11a5 netfilter: nf_tables: support for mu=
ltiple devices per netdev hook)
Merging wireless-drivers-next/master (21c60a28af58 rtw88: signal completion=
 even on firmware-request failure)
Merging bluetooth/master (90bc72b13c08 Merge branch 'ARM-Enable-GENET-suppo=
rt-for-RPi-4')
Merging mac80211-next/master (14f34e36b36c cfg80211: VLAN offload support f=
or set_key and set_sta_vlan)
Merging gfs2/for-next (19ebc050e48c gfs2: Remove active journal side effect=
 from gfs2_write_log_header)
Merging mtd/mtd/next (f3ede1651005 mtd: devices: fix mchp23k256 read and wr=
ite)
Merging nand/nand/next (777260a5c992 mtd: rawnand: remove unecessary checki=
ng if dmac is NULL)
Merging spi-nor/spi-nor/next (83cba933a6db mtd: spi-nor: Set default Quad E=
nable method for ISSI flashes)
Merging crypto/master (d158367682cd crypto: atmel - Fix selection of CRYPTO=
_AUTHENC)
CONFLICT (content): Merge conflict in arch/arm/crypto/Kconfig
Merging drm/drm-next (94bc7f56a8af Merge tag 'arcpgu-updates-2019.07.18' of=
 github.com:abrodkin/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_pm.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/intel_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_reg.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/i915_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_gt_pm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gt/intel_engine_=
types.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_con=
text.c
Applying: cec: fix up for "cec: add cec_adapter to cec_notifier_cec_adap_un=
register()"
Applying: drm/v3d: Fix double free in v3d_submit_cl_ioctl()
Applying: revert teh rest of "drm/i915/gen8+: Add RC6 CTX corruption WA"
Merging amdgpu/drm-next (c03cb6930190 drm/amdgpu/nv: add asic func for fetc=
hing vbios from rom directly)
Merging drm-intel/for-linux-next (789c4aea3f08 drm/i915: Split a setting of=
 MSA to MST and SST)
Merging drm-tegra/drm/tegra/for-next (84db889e6d82 drm/tegra: Unconditional=
ly select IOMMU_IOVA)
Merging drm-misc/for-linux-next (a64fc11b9a52 drm/msm: fix memleak on relea=
se)
Merging drm-msm/msm-next (e20c9284c8f2 drm/msm/adreno: Add support for Adre=
no 510 GPU)
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (4d24376370fb gpu: ipu-v3: image-convert: only=
 sample into the next tile if necessary)
Merging etnaviv/etnaviv/next (22567d017c2c dt-bindings: etnaviv: Add #cooli=
ng-cells)
Merging regmap/for-next (da0c9ea146cb Linux 5.4-rc2)
Merging sound/for-next (509526706e68 ALSA: au88x0: Fix incorrect device poi=
nter for preallocation)
Merging sound-asoc/for-next (023eb3970cdc Merge branch 'asoc-5.5' into asoc=
-next)
CONFLICT (content): Merge conflict in sound/soc/codecs/Kconfig
Merging modules/modules-next (e2854a1054ab moduleparam: fix parameter descr=
iption mismatch)
Merging input/next (cc12ba1872c6 Input: ili210x - optionally show calibrate=
 sysfs attribute)
Merging block/for-next (39ea175edf03 Merge branch 'for-5.5/drivers' into fo=
r-next)
Merging device-mapper/for-next (35ad035b8398 dm raid: Remove unnecessary ne=
gation of a shift in raid10_format_to_md_layout)
Merging mmc/next (253e2606a0e6 mmc: core: Re-work HW reset for SDIO cards)
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (de98a43eb76b mfd: ti_am335x_tscadc: Fix static ch=
ecker warning)
CONFLICT (content): Merge conflict in drivers/mfd/mt6397-core.c
Merging backlight/for-backlight-next (9afa302473f3 backlight: gpio: Pull gp=
io_backlight_initial_power_state() into probe)
Merging battery/for-next (9480029fe5c2 power: supply: bd70528: Add MODULE_A=
LIAS to allow module auto loading)
Merging regulator/for-next (910c17a5403a Merge branch 'regulator-5.5' into =
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
Merging tpmdd/next (0b40dbcbba92 KEYS: trusted: Remove set but not used var=
iable 'keyhndl')
Merging watchdog/master (31f4f5b495a6 Linux 5.4-rc7)
Merging iommu/next (9b3a713feef8 Merge branches 'iommu/fixes', 'arm/qcom', =
'arm/renesas', 'arm/rockchip', 'arm/mediatek', 'arm/tegra', 'arm/smmu', 'x8=
6/amd', 'x86/vt-d', 'virtio' and 'core' into next)
Merging vfio/next (026948f01eac vfio/type1: remove hugepage checks in is_in=
valid_reserved_pfn())
Merging audit/next (c34c78dfc1fc audit: remove redundant condition check in=
 kauditd_thread())
Merging devicetree/for-next (3afd6389f320 dt-bindings: gpu: mali-midgard: a=
dd samsung exynos 5420 compatible)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/usb=
/generic-ehci.yaml
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/usb=
/amlogic,dwc3.txt
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/gpu=
/arm,mali-midgard.yaml
Merging mailbox/mailbox-for-next (556a0964e28c mailbox: qcom-apcs: fix max_=
register value)
Merging spi/for-next (be648a29d8cc Merge remote-tracking branch 'spi/topic/=
ptp' into spi-next)
Merging tip/auto-latest (7d0b5a17c79c Merge branch 'core/stacktrace')
CONFLICT (content): Merge conflict in include/linux/security.h
CONFLICT (content): Merge conflict in fs/jbd2/transaction.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gem/i915_gem_shr=
inker.c
CONFLICT (content): Merge conflict in arch/xtensa/kernel/vmlinux.lds.S
Applying: drm/i915: update for mutex_release API change
Merging clockevents/timers/drivers/next (6e001f6a4cc7 clocksource/drivers/a=
sm9260: Add a check for of_clk_get)
Merging edac/edac-for-next (dfb48b0a04a8 EDAC/altera: Use the Altera System=
 Manager driver)
Merging irqchip/irq/irqchip-next (761becb29183 irqchip/ti-sci-inta: Use ERR=
_CAST inlined function instead of ERR_PTR(PTR_ERR(...)))
Merging ftrace/for-next (8ed4889eb831 selftests/ftrace: Fix same probe erro=
r test)
Merging rcu/rcu/next (8dcdfb7096a3 Merge branches 'doc.2019.10.29a', 'fixes=
.2019.10.30a', 'nohz.2019.10.28a', 'replace.2019.10.30a', 'torture.2019.10.=
05a' and 'lkmm.2019.10.05a' into HEAD)
Merging kvm/linux-next (20baa8e515a5 Merge tag 'kvm-ppc-fixes-5.4-1' of git=
://git.kernel.org/pub/scm/linux/kernel/git/paulus/powerpc into HEAD)
Merging kvm-arm/next (cd7056ae34af Merge remote-tracking branch 'kvmarm/mis=
c-5.5' into kvmarm/next)
Merging kvm-ppc/kvm-ppc-next (55d7004299eb KVM: PPC: Book3S HV: Reject mfla=
gs=3D2 (LPCR[AIL]=3D2) ADDR_TRANS_MODE mode)
CONFLICT (content): Merge conflict in include/uapi/linux/kvm.h
Merging kvms390/next (c7b7de631246 KVM: s390: Do not yield when target is a=
lready running)
Merging xen-tip/linux-next (fa6614d8ef13 xen/gntdev: Use select for DMA_SHA=
RED_BUFFER)
Merging percpu/for-next (825dbc6ff7a3 percpu: add __percpu to SHIFT_PERCPU_=
PTR)
Merging workqueues/for-next (e66b39af00f4 workqueue: Fix pwq ref leak in re=
scuer_thread())
Merging drivers-x86/for-next (3caa6f39e059 Add touchscreen platform data fo=
r the Schneider SCT101CTM tablet)
Merging chrome-platform/for-next (6d2a736e2b65 platform/chrome: wilco_ec: A=
dd keyboard backlight LED support)
Merging hsi/for-next (c1030cd45619 HSI: Remove dev_err() usage after platfo=
rm_get_irq())
Merging leds/for-next (5f820ed52371 leds: trigger: netdev: fix handling on =
interface rename)
Merging ipmi/for-next (8d73b2aeb808 ipmi: kill off 'timespec' usage again)
Merging driver-core/driver-core-next (bee3bbe616a2 driver core: Clarify doc=
umentation for fwnode_operations.add_links())
CONFLICT (content): Merge conflict in Documentation/filesystems/debugfs.txt
Merging usb/usb-next (2a9125317b24 usbip: Fix uninitialized symbol 'nents' =
in stub_recv_cmd_submit())
Merging usb-gadget/next (726b4fba94be usb: dwc3: of-simple: add a shutdown)
Merging usb-serial/usb-next (f0797095423e USB: serial: option: add support =
for Foxconn T77W968 LTE modules)
Merging usb-chipidea-next/ci-for-usb-next (196c90220a85 usb: chipidea: imx:=
 pinctrl for HSIC is optional)
Merging phy-next/next (4569e64ab6a5 phy: phy-rockchip-inno-usb2: add phy de=
scription for px30)
Merging tty/tty-next (19b6ecfca6b8 tty: serial: msm_serial: Use dma_request=
_chan() directly for channel request)
Merging char-misc/char-misc-next (60f8a59ddcdc parport: daisy: use new parp=
ort device model)
CONFLICT (content): Merge conflict in samples/Makefile
CONFLICT (content): Merge conflict in samples/Kconfig
Merging extcon/extcon-next (ddd1bbbae486 extcon: sm5502: remove redundant a=
ssignment to variable cable_type)
Merging soundwire/next (2e8c4ad1f044 soundwire: ignore uniqueID when irrele=
vant)
Merging thunderbolt/next (354a7a7716ed thunderbolt: Do not start firmware u=
nless asked by the user)
Merging staging/staging-next (8bde9f3d2a21 Merge tag 'iio-for-5.5c' of http=
s://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-next)
CONFLICT (content): Merge conflict in drivers/staging/Makefile
Merging mux/for-next (05fb8284a417 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (a99d8080aaf3 Linux 5.4-rc6)
Merging slave-dma/next (cdc3e306236b dmaengine: milbeaut-xdmac: remove redu=
ndant error log)
Merging cgroup/for-next (cc56b5387518 Merge branch 'for-5.5' into for-next)
Merging scsi/for-next (b2e47d8d392d Merge branch 'misc' into for-next)
CONFLICT (content): Merge conflict in drivers/scsi/scsi_sysfs.c
Merging scsi-mkp/for-next (35c3363363ac scsi: core: Clean up SG_NONE)
Merging vhost/linux-next (8766aecd61f7 vhost: last descriptor must have NEX=
T clear)
Merging rpmsg/for-next (73faac719425 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (6b240aeb121e Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in drivers/gpio/gpio-tegra186.c
Merging gpio-brgl/gpio/for-next (0f67f16a6e88 gpio: mmio: remove untrue lef=
tover comment)
Merging gpio-intel/for-next (4a5e0f9e7351 gpio: merrifield: Pass irqchip wh=
en adding gpiochip)
Merging pinctrl/for-next (bf74543583fa Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (8ae93b5ed9be pinctrl: cherryview: Missed ty=
pe change to unsigned int)
Merging pinctrl-samsung/for-next (a322b3377f4b pinctrl: samsung: Fix device=
 node refcount leaks in init code)
Merging pwm/for-next (9e1b4999a169 pwm: stm32: Pass breakinput instead of i=
ts values)
Merging userns/for-next (318759b4737c signal/x86: Move tsk inside of CONFIG=
_MEMORY_FAILURE in do_sigbus)
Merging ktest/for-next (9b5f852ae20d ktest: Make default build option oldco=
nfig not randconfig)
Merging random/dev (58be0106c530 random: fix soft lockup when trying to rea=
d from an uninitialized blocking pool)
Merging kselftest/next (54ecb8f7028c Linux 5.4-rc1)
Merging y2038/y2038 (5856ac283e74 Merge tag 'y2038-cleanups-5.5' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/arnd/playground into y2038)
CONFLICT (content): Merge conflict in fs/compat_ioctl.c
CONFLICT (content): Merge conflict in drivers/scsi/sg.c
Applying: fix up for "compat: move FS_IOC_RESVSP_32 handling to fs/ioctl.c"
Applying: fix up for "y2038: vdso: powerpc: avoid timespec references"
Merging livepatching/for-next (7f436b3066e3 Merge branch 'for-5.5/core' int=
o for-next)
Merging coresight/next (960e7b9d108a coresight: replicator: Fix missing spi=
n_lock_init())
Merging rtc/rtc-next (7ad295d5196a rtc: Fix the AltCentury value on AMD/Hyg=
on platform)
Merging nvdimm/libnvdimm-for-next (4c806b897d60 libnvdimm/region: Enable MA=
P_SYNC for volatile regions)
Merging at24/at24/for-next (285be87c79e1 eeprom: at24: Improve confusing lo=
g message)
Merging ntb/ntb-next (54ecb8f7028c Linux 5.4-rc1)
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
Merging hyperv/hyperv-next (94f90545a08f Drivers: hv: balloon: Remove depen=
dencies on guest page size)
Merging auxdisplay/auxdisplay (54ecb8f7028c Linux 5.4-rc1)
Merging kgdb/kgdb/for-next (c58ff643763c kdb: Tweak escape handling for vi =
users)
Merging pidfd/for-next (7acdfe534e72 Merge branch 'pidfd' into for-next)
Merging devfreq/devfreq-next (5fe5cf67efd7 PM / devfreq: Kconfig: Drop expl=
icit selection of PM_OPP)
Merging hmm/hmm (95418e7768bf xen/gntdev: use mmu_interval_notifier_insert)
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx5/odp.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
$ git reset --hard HEAD^
Merging next-20191113 version of hmm
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx5/odp.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
[master f52e0e1e85ea] next-20191113/hmm
Merging fpga/for-next (fddc9fcbe69a fpga: dfl: fme: add power management su=
pport)
Merging kunit/test (ea2dd7c0875e lib/list-test: add a test for the 'list' d=
oubly linked list)
Merging cel/cel-next (a99d8080aaf3 Linux 5.4-rc6)
Merging kasan-bitops/topic/kasan-bitops (5bece3d66153 powerpc: support KASA=
N instrumentation of bitops)
Merging generic-ioremap/for-next (eafee5944062 nds32: use generic ioremap)
Merging akpm-current/current (8b4f8867eb94 ipc/msg.c: consolidate all xxxct=
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
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (14a98b5b8b4d drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/KTWgMpCAwH0maF7jW9tCX7R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3NEOQACgkQAVBC80lX
0GzbJgf6AueKwKIQMS/2qkY7+p7HuzviLKnvXMpZtCcLX83r3Evhv3dvvTPzJS2X
BbE4xtFqGmajWGRO8Nu43CD46JqraLVK86hYYOV9i21V5NlgQYUb/kVIpHqKmOgH
XRFuS54kYl0mqSpqZnPsrGw5WL5617bYVa8lbr8nhAwNIvk5vR5NntaJ7fe8WKZj
4oFpEevlIpuaGnEHOTr66dvLebB0kCjRieROzex8jErFpzn413FIC1ZnuDVEeAA9
i1Q+ozGDPk6Hu17OodONPdSsruByfPKjEstCOdAIiaGvccvGBiFUu6UtIUcKSyee
BYKBM1RCFir+D4+8QKfARRNJZbmtog==
=CceK
-----END PGP SIGNATURE-----

--Sig_/KTWgMpCAwH0maF7jW9tCX7R--
