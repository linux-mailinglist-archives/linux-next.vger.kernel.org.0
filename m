Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E80EBA848F
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2019 15:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729626AbfIDNev (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Sep 2019 09:34:51 -0400
Received: from ozlabs.org ([203.11.71.1]:53675 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729798AbfIDNev (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Sep 2019 09:34:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46NlDP5PYjz9s7T;
        Wed,  4 Sep 2019 23:34:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567604085;
        bh=0ebl7LH1qP01XTlbRqqTQSvt/4P9q8FFBVZGz09Os/I=;
        h=Date:From:To:Cc:Subject:From;
        b=ivjNK64EN9CTE5mS77J8zwgnzkY6Y9y3J+pgXnKVggj56KXwAtUYZIACN0tvPCTI6
         Easz2p92zuiv5syktieppvc0sYiFBrTHWjreU2KhCwbCSLOiw0OqYqtcMSCD9gNgXi
         cuTENllnNjY4W94f+yMfMLq0xqDucQ3+B8PBYWg0RjtZMWgg+f3Oy/IMK15MS6pfgB
         RX/uvR8dnwN+bgxDQu16YmLNtATpxqgzY+FsL/raLZzBnATGBq/gfUypTyZNUnsed/
         QIgU0MuDWCqhJVYtyaAafLpbu36lRP1CFLrbiBB+TjIyMsLjDa4Clz4BQwCcuQGsds
         k7P5ofjzVx2Gg==
Date:   Wed, 4 Sep 2019 23:34:43 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 4
Message-ID: <20190904233443.3f73c46b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rNu1zoW3aahnuFceb/XYv2.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rNu1zoW3aahnuFceb/XYv2.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

News: this will be the last linux-next I will release until Sept 30.

Changes since 20190903:

The regulator tree lost its build failure.

The net-next tree gained a build failure due to an interaction with
the kbuild tree for which I applied a patch.

The drm tree gained conflicts against the kbuild tree.

The amdgpu tree gained a conflict against the kbuild tree.

The usb tree gained a conflict against the pm tree.

The slave-dma tree gained a conflict against the arm-soc tree.

Non-merge commits (relative to Linus' tree): 10370
 10166 files changed, 606905 insertions(+), 279867 deletions(-)

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
Merging origin/master (089cf7f6ecb2 Linux 5.3-rc7)
Merging fixes/master (609488bc979f Linux 5.3-rc2)
Merging kbuild-current/fixes (d45331b00ddb Linux 5.3-rc4)
Merging arc-current/for-curr (089cf7f6ecb2 Linux 5.3-rc7)
Merging arm-current/fixes (5b3efa4f1479 ARM: 8901/1: add a criteria for pfn=
_valid of arm)
Merging arm-soc-fixes/arm/fixes (7a6c9dbb36a4 soc: ixp4xx: Protect IXP4xx S=
oC drivers by ARCH_IXP4XX || COMPILE_TEST)
Merging arm64-fixes/for-next/fixes (82e40f558de5 KVM: arm/arm64: vgic-v2: H=
andle SGI bits in GICD_I{S,C}PENDR0 as WI)
Merging m68k-current/for-linus (f28a1f16135c m68k: Don't select ARCH_HAS_DM=
A_PREP_COHERENT for nommu or coldfire)
Merging powerpc-fixes/fixes (b9ee5e04fd77 powerpc/64e: Drop stale call to s=
mp_processor_id() which hangs SMP startup)
Merging s390-fixes/fixes (d45331b00ddb Linux 5.3-rc4)
Merging sparc/master (038029c03e21 sparc: remove unneeded uapi/asm/statfs.h)
Merging fscrypt-current/for-stable (ae64f9bd1d36 Linux 4.15-rc2)
Merging net/master (e33b4325e60e net: stmmac: dwmac-sun8i: Variable "val" i=
n function sun8i_dwmac_set_syscon() could be uninitialized)
Merging bpf/master (e33b4325e60e net: stmmac: dwmac-sun8i: Variable "val" i=
n function sun8i_dwmac_set_syscon() could be uninitialized)
Merging ipsec/master (769a807d0b41 xfrm: policy: avoid warning splat when m=
erging nodes)
Merging netfilter/master (110e48725db6 netfilter: nf_flow_table: set defaul=
t timeout after successful insertion)
Merging ipvs/master (58e8b37069ff Merge branch 'net-phy-dp83867-add-some-fi=
xes')
Merging wireless-drivers/master (8b51dc729147 rsi: fix a double free bug in=
 rsi_91x_deinit())
Merging mac80211/master (869326532956 Merge tag 'mac80211-for-davem-2019-08=
-29' of git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211)
Merging rdma-fixes/for-rc (531a64e4c35b RDMA/siw: Fix IPv6 addr_list lockin=
g)
Merging sound-current/for-linus (60083f9e94b2 ALSA: hda/realtek - Enable in=
ternal speaker & headset mic of ASUS UX431FL)
Merging sound-asoc-fixes/for-linus (0e1ddad9e134 Merge branch 'asoc-5.3' in=
to asoc-linus)
Merging regmap-fixes/for-linus (0161b8716465 Merge branch 'regmap-5.3' into=
 regmap-linus)
Merging regulator-fixes/for-linus (1c20c0bbe76f Merge branch 'regulator-5.3=
' into regulator-linus)
Merging spi-fixes/for-linus (6b2a5f487ce6 Merge branch 'spi-5.3' into spi-l=
inus)
Merging pci-current/for-linus (7bafda88de20 Documentation PCI: Fix pciebus-=
howto.rst filename typo)
Merging driver-core.current/driver-core-linus (d45331b00ddb Linux 5.3-rc4)
Merging tty.current/tty-linus (d45331b00ddb Linux 5.3-rc4)
Merging usb.current/usb-linus (089cf7f6ecb2 Linux 5.3-rc7)
Merging usb-gadget-fixes/fixes (4a56a478a525 usb: gadget: mass_storage: Fix=
 races between fsg_disable and fsg_set_alt)
Merging usb-serial-fixes/usb-linus (d1abaeb3be7b Linux 5.3-rc5)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (609488bc979f Linux 5.3-rc2)
Merging staging.current/staging-linus (d1abaeb3be7b Linux 5.3-rc5)
Merging char-misc.current/char-misc-linus (089cf7f6ecb2 Linux 5.3-rc7)
Merging soundwire-fixes/fixes (d1abaeb3be7b Linux 5.3-rc5)
Merging thunderbolt-fixes/fixes (089cf7f6ecb2 Linux 5.3-rc7)
Merging input-current/for-linus (849f5ae3a513 Input: iforce - add sanity ch=
ecks)
Merging crypto-current/master (5871cd93692c crypto: ccp - Ignore unconfigur=
ed CCP device on suspend/resume)
Merging ide/master (baf6722aa0cb ide: Use dev_get_drvdata where possible)
Merging vfio-fixes/for-linus (5715c4dd66a3 vfio/mdev: Synchronize device cr=
eate/remove with parent removal)
Merging kselftest-fixes/fixes (fbb01c52471c selftests/livepatch: push and p=
op dynamic debug config)
Merging modules-fixes/modules-linus (be71eda5383f module: Fix display of wr=
ong module .text address)
Merging slave-dma-fixes/fixes (962411b05a6d dmaengine: ti: omap-dma: Add cl=
eanup in omap_dma_probe())
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
Merging omap-fixes/fixes (4a65bbb9109e soc: ti: pm33xx: Make two symbols st=
atic)
Merging kvm-fixes/master (75ee23b30dc7 KVM: x86: Don't update RIP or do sin=
gle-step on faulting emulation)
Merging kvms390-fixes/master (a86cb413f4bf KVM: s390: Do not report unusabl=
ed IDs via KVM_CAP_MAX_VCPU_ID)
Merging hwmon-fixes/hwmon (e027a2dea5fd hwmon (coretemp) Fix a memory leak =
bug)
Merging nvdimm-fixes/libnvdimm-fixes (274b924088e9 libnvdimm/pfn: Fix names=
pace creation on misaligned addresses)
Merging btrfs-fixes/next-fixes (2384eefd74b8 Merge branch 'misc-5.3' into n=
ext-fixes)
Merging vfs-fixes/fixes (e272d4fb74d6 configfs: fix a deadlock in configfs_=
symlink())
Merging dma-mapping-fixes/for-linus (33dcb37cef74 dma-mapping: fix page att=
ributes for dma_mmap_*)
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (d45331b00ddb Linux 5.3-rc4)
Merging samsung-krzk-fixes/fixes (5f9e832c1370 Linus 5.3-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging devicetree-fixes/dt/linus (83f82d7a4258 of: irq: fix a trivial typo=
 in a doc comment)
Merging scsi-fixes/fixes (0622800d2ebc scsi: lpfc: Raise config max for lpf=
c_fcp_mq_threshold variable)
Merging drm-fixes/drm-fixes (b0dfce90e342 Merge branch 'linux-5.3' of git:/=
/github.com/skeggsb/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (41940ff50f6c drm/amdgpu: fix GFXOFF on Pica=
sso and Raven2)
Merging drm-intel-fixes/for-linux-next-fixes (089cf7f6ecb2 Linux 5.3-rc7)
Merging mmc-fixes/fixes (8ad8e02c2fa7 Revert "mmc: core: do not retry CMD6 =
in __mmc_switch()")
Merging rtc-fixes/rtc-fixes (5f9e832c1370 Linus 5.3-rc1)
Merging gnss-fixes/gnss-linus (f2c7c76c5d0a Linux 5.2-rc3)
Merging hyperv-fixes/hyperv-fixes (a9fc4340aee0 Drivers: hv: vmbus: Fix vir=
t_to_hvpfn() for X86_PAE)
Merging soc-fsl-fixes/fix (5674a92ca4b7 soc/fsl/qe: Fix an error code in qe=
_pin_request())
Merging risc-v-fixes/fixes (a256f2e329df RISC-V: Fix FIXMAP area corruption=
 on RV32 systems)
Merging pidfd-fixes/fixes (d45331b00ddb Linux 5.3-rc4)
Merging fpga-fixes/fixes (dec43da46f63 fpga: altera-ps-spi: Fix getting of =
optional confd gpio)
Merging spdx/spdx-linus (d1abaeb3be7b Linux 5.3-rc5)
Merging gpio-intel-fixes/fixes (5f9e832c1370 Linus 5.3-rc1)
Merging pinctrl-intel-fixes/fixes (089cf7f6ecb2 Linux 5.3-rc7)
Merging drm-misc-fixes/for-linux-next-fixes (424c38a4e325 drm/selftests: mo=
des: Add more unit tests for the cmdline parser)
Merging kspp-gustavo/for-next/kspp (609488bc979f Linux 5.3-rc2)
Merging kbuild/for-next (06cfead32f09 merge_config.sh: ignore unwanted grep=
 errors)
Merging compiler-attributes/compiler-attributes (c4814af0b75c compiler_attr=
ibutes.h: add note about __section)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (392e879a4450 dma-mapping: fix filename refere=
nces)
Merging asm-generic/master (9b87647c665d asm-generic: add unlikely to defau=
lt BUG_ON(x))
Merging arc/for-next (6fbc7275c7a9 Linux 5.2-rc7)
Merging arm/for-next (e36b90e24fe4 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (61b7cddfe861 Merge branch 'for-next/atomics' i=
nto for-next/core)
Merging arm-perf/for-next/perf (3724e186fead docs/perf: Add documentation f=
or the i.MX8 DDR PMU)
Merging arm-soc/for-next (f119c164735d arm-soc: document merges)
CONFLICT (modify/delete): arch/arm/mach-iop13xx/pci.c deleted in arm-soc/fo=
r-next and modified in HEAD. Version HEAD of arch/arm/mach-iop13xx/pci.c le=
ft in tree.
$ git rm -f arch/arm/mach-iop13xx/pci.c
Merging actions/for-next (fb9c1c1deb5e Merge branch 'v4.20/drivers+s900-sps=
' into next)
Merging amlogic/for-next (db1564abbd33 Merge branch 'v5.4/drivers' into tmp=
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
Merging omap/for-next (345b1bdaa219 Merge branch 'omap-for-v5.4/ti-sysc-dro=
p-pdata' into for-next)
Merging qcom/for-next (63e584644247 Merge tag 'qcom-arm64-defconfig-for-5.4=
' into all-for-5.4)
Merging renesas/next (ae688e1720fd arm64: dts: renesas: hihope-common: Fix =
eMMC status)
Merging renesas-geert/next (e180e8bda829 Merge remote-tracking branch 'orig=
in/fixes-for-v5.3' into renesas-next)
Merging reset/reset/next (33385da8d218 dt-bindings: reset: pdc: Convert PDC=
 Global bindings to yaml)
Merging rockchip/for-next (de9183bca276 Merge branch 'v5.4-armsoc/dts64' in=
to for-next)
CONFLICT (content): Merge conflict in Documentation/devicetree/bindings/arm=
/rockchip.yaml
Merging samsung-krzk/for-next (c6712d640fa5 Merge branch 'next/defconfig' i=
nto for-next)
Merging scmi/for-linux-next (a55aa89aab90 Linux 5.3-rc6)
Merging sunxi/sunxi/for-next (15ea63583bfb Merge branch 'sunxi/dt-for-5.4' =
into sunxi/for-next)
Merging tegra/for-next (6290ae1fb7e2 Merge branch for-5.4/firmware into for=
-next)
Merging clk/clk-next (4c1fc2c811fb Merge branch 'clk-doc' into clk-next)
Merging clk-samsung/for-next (a188339ca5a3 Linux 5.2-rc1)
Merging c6x/for-linux-next (8adcc59974b8 Merge branch 'work.misc' of git://=
git.kernel.org/pub/scm/linux/kernel/git/viro/vfs)
Merging csky/linux-next (4ad35c1f5638 csky: Fixup 610 vipt cache flush mech=
anism)
CONFLICT (content): Merge conflict in arch/csky/mm/dma-mapping.c
Merging h8300/h8300-next (a5de8865cb3e h8300: move definition of __kernel_s=
ize_t etc. to posix_types.h)
Merging ia64/next (0d3d343560ba genirq: remove the is_affinity_mask_valid h=
ook)
Merging m68k/for-next (0f1979b402df m68k: Remove ioremap_fullcache())
Merging m68knommu/for-next (cf0a88c66f59 m68k: coldfire: Include the GPIO d=
river header)
Merging microblaze/next (c709bf455d60 microblaze: remove ioremap_fullcache)
Merging mips/mips-next (932bb934ed4d mips: compat: vdso: Use legacy syscall=
s as fallback)
CONFLICT (content): Merge conflict in arch/mips/include/asm/vdso/vdso.h
CONFLICT (content): Merge conflict in arch/mips/Kconfig
CONFLICT (content): Merge conflict in Documentation/index.rst
Merging nds32/next (932296120543 nds32: add new emulations for floating poi=
nt instruction)
Merging nios2/for-next (f017da5c7077 nios2: configs: Remove useless UEVENT_=
HELPER_PATH)
Merging openrisc/for-next (f3b17320db25 openrisc: map as uncached in iorema=
p)
Merging parisc-hd/for-next (a5ff2130a4d9 parisc: speed up flush_tlb_all_loc=
al with qemu)
Merging powerpc/next (9b123d1ea237 powerpc/64s/exception: reduce page fault=
 unnecessary loads)
CONFLICT (content): Merge conflict in arch/powerpc/kvm/book3s_64_vio_hv.c
CONFLICT (content): Merge conflict in arch/powerpc/kvm/book3s_64_vio.c
CONFLICT (content): Merge conflict in arch/Kconfig
Applying: merge fixes for "dma-mapping: make dma_atomic_pool_init self-cont=
ained"
Merging fsl/next (63d86876f324 Revert "powerpc/fsl_pci: simplify fsl_pci_dm=
a_set_mask")
Merging soc-fsl/next (eadf0b17b43d bus: fsl-mc: remove explicit device_link=
_del)
Merging risc-v/for-next (909548d6c578 riscv: add arch/riscv/Kbuild)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (512222789ce8 s390/base: remove unused s390_base_mcck=
_handler)
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
Merging uml/linux-next (e0917f879536 um: fix time travel mode)
Merging xtensa/xtensa-for-next (9c2ec7545cbd Merge branch 'xtensa-call0' in=
to xtensa-for-next)
Merging fscrypt/master (0642ea2409f3 ext4 crypto: fix to check feature stat=
us before get policy)
Merging afs/afs-next (a0753c29004f afs: Support RCU pathwalk)
Merging btrfs/next (29dcea88779c Linux 4.17)
Merging btrfs-kdave/for-next (a406b66710ba Merge branch 'for-next-next-v5.3=
-20190828' into for-next-20190828)
Merging ceph/master (de4c5bafb6d5 libceph: drop unused con parameter of cal=
c_target())
Merging cifs/for-next (bacd85ed69f2 smb3: add dynamic tracepoints for flush=
 and close)
Merging configfs/for-next (46058b2f01c2 configfs: provide exclusion between=
 IO and removals)
Merging ecryptfs/next (b4a81b87a4cf ecryptfs: fix a memory leak bug in ecry=
ptfs_init_messaging())
Merging ext3/for_next (7f0676e30885 Pull fanotify compiler warning fix from=
 Zhengbin.)
Merging ext4/dev (15c497e97e1a ext4: fix potential use after free after rem=
ounting with noblock_validity)
CONFLICT (content): Merge conflict in fs/ext4/ioctl.c
Merging f2fs/dev (497dd8f203e6 f2fs: add missing documents of reserve_root/=
resuid/resgid)
Merging fsverity/fsverity (95ae251fe828 f2fs: add fs-verity support)
CONFLICT (content): Merge conflict in fs/f2fs/inode.c
CONFLICT (content): Merge conflict in fs/f2fs/file.c
CONFLICT (content): Merge conflict in fs/ext4/ioctl.c
Merging fuse/for-next (21742d9ad76a virtio-fs: add Documentation/filesystem=
s/virtiofs.rst)
CONFLICT (content): Merge conflict in Documentation/filesystems/index.rst
Merging jfs/jfs-next (a5fdd713d256 jfs: fix bogus variable self-initializat=
ion)
Merging nfs/linux-next (eb3d8f42231a NFS: Fix inode fileid checks in attrib=
ute revalidation code)
Merging nfs-anna/linux-next (f836b27ecad9 NFS: Have nfs4_proc_get_lease_tim=
e() call nfs4_call_sync_custom())
Merging nfsd/nfsd-next (bb13f35b96f4 nfsd: remove duplicated include from f=
ilecache.c)
Merging orangefs/for-next (e65682b55956 orangefs: eliminate needless variab=
le assignments)
Merging overlayfs/overlayfs-next (0be0bfd2de9d ovl: fix regression caused b=
y overlapping layers detection)
Merging ubifs/linux-next (0af83abbd4a6 ubifs: Limit the number of pages in =
shrink_liability)
Merging v9fs/9p-next (aafee43b7286 9p/vfs_super.c: Remove unused parameter =
data in v9fs_fill_super)
Merging xfs/for-next (eb77b23b565e xfs: add a xfs_valid_startblock helper)
Merging iomap/iomap-for-next (32e3cf9f41c7 tracing: fix iomap.h build warni=
ngs)
Merging djw-vfs/vfs-for-next (dc617f29dbe5 vfs: don't allow writes to swap =
files)
Merging file-locks/locks-next (cfddf9f4c9f0 locks: fix a memory leak bug in=
 __break_lease())
Merging vfs/for-next (d3215f78f06f Merge branches 'work.misc', 'work.mount'=
, 'work.namei', 'work.dcache' and 'work.autofs' into for-next)
CONFLICT (content): Merge conflict in include/linux/fs_context.h
CONFLICT (content): Merge conflict in fs/ceph/super.c
Applying: docs: filesystems: vfs: update for "vfs: Kill mount_single()"
Merging printk/for-next (ba174ef6d224 Merge branch 'for-5.3-fixes' into for=
-next)
Merging pci/next (325eb5b9b37b Merge branch 'pci/trivial')
Merging pstore/for-next/pstore (609488bc979f Linux 5.3-rc2)
Merging hid/for-next (3915f097340a Merge branch 'for-5.4/sb0540' into for-n=
ext)
Merging i2c/i2c/for-next (fbd9bdb540fd Merge branch 'i2c/for-5.4' into i2c/=
for-next)
Merging i3c/i3c/next (6030f42d20ce i3c: master: Use dev_to_i3cmaster())
Merging dmi/master (57361846b52b Linux 4.19-rc2)
Merging hwmon-staging/hwmon-next (cf48d1762328 hwmon: (w83793d) convert to =
use devm_i2c_new_dummy_device)
Merging jc_docs/docs-next (5aff7c46172b docs: process: fix broken link)
CONFLICT (add/add): Merge conflict in Documentation/mips/index.rst
CONFLICT (content): Merge conflict in Documentation/admin-guide/cifs/todo.r=
st
Merging v4l-dvb/master (20a438d53fd9 media: sun4i: Make sun4i_csi_formats s=
tatic)
Merging v4l-dvb-next/master (5f9e832c1370 Linus 5.3-rc1)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (b89823861e09 Merge branch 'acpi-cppc' into linux-nex=
t)
Merging cpufreq-arm/cpufreq/arm/linux-next (f75d2accca77 Merge branch 'cpuf=
req/qcom-updates' into cpufreq/arm/linux-next)
Merging cpupower/cpupower (87ce24320694 cpupower: update German translation)
Merging opp/opp/linux-next (071afa50609d Merge branch 'opp/qcom-updates' in=
to opp/linux-next)
Merging thermal/next (0ca7ab5b0092 Merge branch 'thermal-soc' into next)
CONFLICT (content): Merge conflict in Documentation/driver-api/thermal/inde=
x.rst
Merging thermal-soc/next (4cb9f043447e thermal: thermal_mmio: remove some d=
ead code)
Merging ieee1394/for-next (812cd88749e0 firewire: mark expected switch fall=
-throughs)
Merging dlm/next (a48f9721e6db dlm: no need to check return value of debugf=
s_create functions)
Merging swiotlb/linux-next (4cdfb27ba80d xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging rdma/for-next (98c09b8c9767 RDMA/hns: Fix wrong assignment of qp_ac=
cess_flags)
CONFLICT (content): Merge conflict in drivers/infiniband/hw/mlx5/mlx5_ib.h
Merging net-next/master (2c1f9e263444 Merge branch '100GbE' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/jkirsher/next-queue)
CONFLICT (content): Merge conflict in scripts/link-vmlinux.sh
CONFLICT (content): Merge conflict in drivers/pci/controller/pci-hyperv.c
CONFLICT (content): Merge conflict in drivers/pci/Kconfig
Applying: link-vmlinux.sh is now a bash script
Merging bpf-next/master (110509df4540 Merge branch 'bpf-selftest-endianess-=
fixes')
Merging ipsec-next/master (00ebd4998b53 Merge branch 'stmmac-Add-EHL-and-TG=
L-PCI-info-and-PCI-ID')
Merging mlx5-next/mlx5-next (fc603294267f net/mlx5: Set only stag for match=
 untagged packets)
Merging netfilter-next/master (85936e56e923 netfilter: nft_quota: add quota=
 object update support)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (1b0b807dd746 Merge branch 'r8169-fw')
Merging wireless-drivers-next/master (84b0b6635247 zd1211rw: zd_usb: Use st=
ruct_size() helper)
Merging bluetooth/master (657fb9c74266 Bluetooth: btrtl: Remove trailing ne=
wline from calls to rtl_dev macros)
Merging mac80211-next/master (c8cd6e7f159e cfg80211: add local BSS receive =
time to survey information)
Merging gfs2/for-next (a362042561bd gfs2: Use async glocks for rename)
Merging mtd/mtd/next (5f9e832c1370 Linus 5.3-rc1)
Merging nand/nand/next (f480b969448e mtd: rawnand: omap2: Fix number of bit=
flips reporting with ELM)
Merging spi-nor/spi-nor/next (9607af6f857f mtd: spi-nor: Rename "n25q512a" =
to "mt25qu512a (n25q512a)")
Merging crypto/master (1bbbbcfdc0f0 crypto: hisilicon - select CRYPTO_LIB_D=
ES while compiling SEC driver)
CONFLICT (content): Merge conflict in arch/x86/purgatory/Makefile
Merging drm/drm-next (c7eb7c12fddc Merge tag 'exynos-drm-next-for-v5.4' of =
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-n=
ext)
CONFLICT (content): Merge conflict in drivers/gpu/drm/mediatek/mtk_drm_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/arm/display/komeda/ko=
meda_dev.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/navi10_=
ppt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dsc/Ma=
kefile
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dml/Ma=
kefile
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/calcs/=
Makefile
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/soc15.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_vcn=
.h
Merging amdgpu/drm-next (9c9284f9cee9 drm/amdgpu: Move null pointer derefer=
ence check)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dml/Ma=
kefile
Merging drm-intel/for-linux-next (578d2342ec70 Merge tag 'drm-next-5.4-2019=
-08-23' of git://people.freedesktop.org/~agd5f/linux into drm-next)
Merging drm-tegra/drm/tegra/for-next (2a6fc3cb5cb6 drm/tegra: Fix gpiod_get=
_from_of_node() regression)
Merging drm-misc/for-linux-next (45d0dbd15a3b drm/panfrost: Remove unnecess=
ary hwaccess_lock spin_lock)
Merging drm-msm/msm-next (5fb9b797d5cc drm/msm/dsi: Fix return value check =
for clk_get_parent)
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
Merging sound/for-next (06f1449a2eaa MAINTAINERS: update entry for firewire=
 audio drivers with UAPI header)
Merging sound-asoc/for-next (2bad859fb513 Merge branch 'asoc-5.4' into asoc=
-next)
CONFLICT (modify/delete): Documentation/devicetree/bindings/sound/sun8i-a33=
-codec.txt deleted in sound-asoc/for-next and modified in HEAD. Version HEA=
D of Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt left in tr=
ee.
$ git rm -f Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt
Merging modules/modules-next (3b5be16c7e90 modules: page-align module secti=
on allocations only for arches supporting strict module rwx)
Merging input/next (4b6253fa7364 Input: bu21013_ts - switch to using standa=
rd touchscreen properties)
Merging block/for-next (35e7ae82f62b Merge branch 'for-5.4/block' into for-=
next)
Merging device-mapper/for-next (0acfb2d92b3d dm stats: use struct_size() he=
lper)
Merging pcmcia/pcmcia-next (95691e3eddc4 pcmcia: Implement CLKRUN protocol =
disabling for Ricoh bridges)
Merging mmc/next (a2dc559c78c6 mmc: sdhci: Fix incorrect switch to HS mode)
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
CONFLICT (content): Merge conflict in drivers/power/supply/ab8500_charger.c
Merging regulator/for-next (d4989abf927a Merge branch 'regulator-5.4' into =
regulator-next)
Merging security/next-testing (b602614a8107 lockdown: Print current->comm i=
n restriction messages)
CONFLICT (content): Merge conflict in security/integrity/ima/Kconfig
CONFLICT (content): Merge conflict in kernel/trace/trace_kprobe.c
CONFLICT (content): Merge conflict in fs/tracefs/inode.c
CONFLICT (modify/delete): arch/s390/configs/performance_defconfig deleted i=
n HEAD and modified in security/next-testing. Version security/next-testing=
 of arch/s390/configs/performance_defconfig left in tree.
CONFLICT (content): Merge conflict in arch/s390/configs/defconfig
CONFLICT (content): Merge conflict in arch/s390/configs/debug_defconfig
$ git rm -f arch/s390/configs/performance_defconfig
Merging apparmor/apparmor-next (136db994852a apparmor: increase left match =
history buffer size)
Merging integrity/next-integrity (2a7f0e53daf2 ima: ima_api: Use struct_siz=
e() in kzalloc())
CONFLICT (content): Merge conflict in arch/s390/kernel/machine_kexec_file.c
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
Merging selinux/next (116f21bb967f selinux: avoid atomic_t usage in sidtab)
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tpmdd/next (e8bd417aab0c tpm/tpm_ftpm_tee: Document fTPM TEE driver)
Merging watchdog/master (194108705c9e watchdog: remove w90x900 driver)
Merging iommu/next (f58f821fd69a Merge branches 'iommu/fixes', 'arm/omap', =
'arm/exynos', 'arm/smmu', 'arm/mediatek', 'arm/qcom', 'x86/amd', 'x86/vt-d'=
 and 'core' into next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/panfrost/panfrost_mmu=
.c
Merging vfio/next (e6c5d727db0a Merge branches 'v5.4/vfio/alexey-tce-memory=
-free-v1', 'v5.4/vfio/connie-re-arrange-v2', 'v5.4/vfio/hexin-pci-reset-v3'=
, 'v5.4/vfio/parav-mtty-uuid-v2' and 'v5.4/vfio/shameer-iova-list-v8' into =
v5.4/vfio/next)
Merging audit/next (5f9e832c1370 Linus 5.3-rc1)
Merging devicetree/for-next (1be5b54d26ae dt-bindings: gpu: mali-midgard: A=
dd samsung exynos5250 compatible)
CONFLICT (add/add): Merge conflict in Documentation/devicetree/writing-sche=
ma.rst
CONFLICT (modify/delete): Documentation/devicetree/bindings/gpu/arm,mali-mi=
dgard.txt deleted in devicetree/for-next and modified in HEAD. Version HEAD=
 of Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt left in tree.
$ git rm -f Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
Merging mailbox/mailbox-for-next (25777e5784a7 mailbox: handle failed named=
 mailbox channel request)
Merging spi/for-next (20fe14afc278 Merge branch 'spi-5.4' into spi-next)
Merging tip/auto-latest (83d78a86fa8b Merge branch 'core/headers')
CONFLICT (content): Merge conflict in arch/ia64/include/asm/sn/sn_sal.h
Applying: ASoC: Intel: boards: merge fix for INTEL_FAM6_KABYLAKE_MOBILE -> =
INTEL_FAM6_KABYLAKE_L change
Merging clockevents/clockevents/next (befd04abfbe4 clocksource/drivers/sh_c=
mt: Document "cmt-48" as deprecated)
CONFLICT (content): Merge conflict in kernel/time/posix-timers.c
Merging edac/edac-for-next (81f5090db843 EDAC/amd64: Support asymmetric dua=
l-rank DIMMs)
Merging irqchip/irq/irqchip-next (711419e504eb irqdomain: Add the missing a=
ssignment of domain->fwnode for named fwnode)
CONFLICT (content): Merge conflict in drivers/pci/controller/pci-hyperv.c
Merging ftrace/for-next (6d54ceb539aa tracing: Fix user stack trace "??" ou=
tput)
Merging rcu/rcu/next (049b405029c0 MAINTAINERS: Update from paulmck@linux.i=
bm.com to paulmck@kernel.org)
Merging kvm/linux-next (b6852ae75d4b KVM: VMX: Fix and tweak the comments f=
or VM-Enter)
Merging kvm-arm/next (e8688ba38749 arm64: KVM: Device mappings should be ex=
ecute-never)
Merging kvm-ppc/kvm-ppc-next (ff42df49e75f KVM: PPC: Book3S HV: Don't lose =
pending doorbell request on migration on P9)
Merging kvms390/next (be6f55a60d28 KVM: selftests: Add a test for the KVM_S=
390_MEM_OP ioctl)
Merging xen-tip/linux-next (b877ac9815a8 xen/swiotlb: remember having calle=
d xen_create_contiguous_region())
Merging percpu/for-next (7eebb3ad9742 Merge branch 'for-5.4' into for-next)
Merging workqueues/for-next (be69d00d9769 workqueue: Remove GPF argument fr=
om alloc_workqueue_attrs())
Merging drivers-x86/for-next (109e8adfbc66 platform/x86: asus-wmi: Remove u=
nnecessary blank lines)
Merging chrome-platform/for-next (7e0bb52d0df9 Merge tag 'ib-mfd-extcon-hid=
-i2c-iio-input-media-chrome-power-pwm-rtc-sound-v5.4' into chrome-platform/=
for-next)
Merging hsi/for-next (c1030cd45619 HSI: Remove dev_err() usage after platfo=
rm_get_irq())
Merging leds/for-next (ba7eb84f7169 leds: ti-lmu-common: Move static keywor=
d to the front of declaration)
Merging ipmi/for-next (383035211c79 ipmi: move message error checking to av=
oid deadlock)
Merging driver-core/driver-core-next (d9430f96c051 driver core: platform: E=
xport platform_get_irq_optional())
CONFLICT (content): Merge conflict in drivers/base/power/runtime.c
Merging usb/usb-next (815cdcc33404 usb: cdns3: Remove redundant dev_err cal=
l in cdns3_probe())
CONFLICT (content): Merge conflict in drivers/usb/roles/intel-xhci-usb-role=
-switch.c
CONFLICT (content): Merge conflict in drivers/staging/Makefile
CONFLICT (content): Merge conflict in drivers/staging/Kconfig
Merging usb-gadget/next (18a93cd38be3 usb: gadget: net2280: Add workaround =
for AB chip Errata 11)
Merging usb-serial/usb-next (7a786b847907 USB: serial: ftdi_sio: add suppor=
t for FT232H CBUS gpios)
Merging usb-chipidea-next/ci-for-usb-next (ecd55e367f3d usb: chipidea: msm:=
 Use device-managed registration API)
Merging phy-next/next (5af67635c36e phy: marvell: phy-mvebu-cp110-comphy: r=
ename instances of DLT)
Merging tty/tty-next (591f4ea2ed61 serial: 8250_pci: Add F81504A series Sup=
port)
Merging char-misc/char-misc-next (ec13c78d7b45 coresight: tmc-etr: Add barr=
ier packets when moving offset forward)
Merging extcon/extcon-next (a3fc57233977 extcon: adc-jack: Remove dev_err()=
 usage after platform_get_irq())
Merging soundwire/next (dfcff3f8a5f1 soundwire: stream: make stream name a =
const pointer)
Merging thunderbolt/next (dfda20419884 ACPI / property: Add two new Thunder=
bolt property GUIDs to the list)
Merging staging/staging-next (74eb9c06b1d7 Merge tag 'iio-for-5.4b-take3' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into staging-next)
CONFLICT (content): Merge conflict in drivers/staging/Makefile
CONFLICT (content): Merge conflict in drivers/staging/Kconfig
Merging mux/for-next (05fb8284a417 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (6311b6521bcc drivers: qcom: Add BCM vote macro to hea=
der)
Merging slave-dma/next (c5c6faaee6e0 dmaengine: ti: edma: Use bitmap_set() =
instead of open coded edma_set_bits())
CONFLICT (content): Merge conflict in drivers/dma/iop-adma.c
Merging cgroup/for-next (653a23ca7e1e Use kvmalloc in cgroups-v1)
Merging scsi/for-next (22d48c3e8eb4 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (cb9e763ed9eb Merge branch '5.4/scsi-queue' into =
5.4/scsi-next)
CONFLICT (content): Merge conflict in drivers/scsi/lpfc/lpfc_sli4.h
Merging vhost/linux-next (ae8afb2aa159 mm/balloon_compaction: suppress allo=
cation warnings)
Merging rpmsg/for-next (0431e0d0926d Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (0f40dd225a88 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in drivers/gpio/gpio-ixp4xx.c
Merging gpio-brgl/gpio/for-next (f2ee73147a3f gpio: lpc32xx: allow building=
 on non-lpc32xx targets)
Merging gpio-intel/for-next (85af79659f45 MAINTAINERS: Remove stale record =
for gpio-intel-mid.c)
Merging pinctrl/for-next (bacada1c3fb4 Merge tag 'intel-pinctrl-v5.4' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel)
Merging pinctrl-intel/for-next (6cb0880f0822 pinctrl: intel: remap the pin =
number to gpio offset for irq enabled pin)
Merging pinctrl-samsung/for-next (10971e2ab6eb pinctrl: samsung: Fix device=
 node refcount leaks in init code)
Merging pwm/for-next (6cf9481b440d pwm: Fallback to the static lookup-list =
when acpi_pwm_get fails)
Merging userns/for-next (318759b4737c signal/x86: Move tsk inside of CONFIG=
_MEMORY_FAILURE in do_sigbus)
Merging ktest/for-next (aecea57f84b0 ktest: Fix some typos in config-bisect=
.pl)
Merging random/dev (58be0106c530 random: fix soft lockup when trying to rea=
d from an uninitialized blocking pool)
Merging kselftest/next (9659ef791c3f selftests: tpm2: install python files)
Merging y2038/y2038 (9d14545b05f9 Merge branch 'limits' of https://github.c=
om/deepa-hub/vfs into y2038)
Merging livepatching/for-next (1cfe141e1715 Merge branch 'for-5.4-core' int=
o for-next)
Merging coresight/next (eb748213be48 coresight: tmc-etr: Add barrier packet=
s when moving offset forward)
Merging rtc/rtc-next (4a9eb8154ffd dt-bindings: rtc: ds1307: add rx8130 com=
patible)
Merging nvdimm/libnvdimm-for-next (7b60422cb796 libnvdimm/security: Consoli=
date 'security' operations)
Merging at24/at24/for-next (10742fee98eb eeprom: at24: remove unneeded incl=
ude)
Merging ntb/ntb-next (5f9e832c1370 Linus 5.3-rc1)
Merging kspp/for-next/kspp (60f2c82ed20b randstruct: Check member structs i=
n is_pure_ops_struct())
Merging cisco/for-next (9e98c678c2d6 Linux 5.1-rc1)
Merging gnss/gnss-next (f2c7c76c5d0a Linux 5.2-rc3)
Merging fsi/next (799e064cc79e fsi: scom: Don't abort operations for minor =
errors)
Merging siox/siox/next (1e4b044d2251 Linux 4.18-rc4)
Merging slimbus/for-next (0a43bffb7e21 slimbus: fix slim_tid_txn())
Merging nvmem/for-next (8555b95dbd8b nvmem: imx: add i.MX8QM platform suppo=
rt)
Merging xarray/xarray (91abab83839a XArray: Fix xas_next() with a single en=
try at 0)
Merging hyperv/hyperv-next (345f0254e5b2 HID: hv: Remove dependencies on PA=
GE_SIZE for ring buffer)
Merging auxdisplay/auxdisplay (a180d023ec7b auxdisplay: ht16k33: Make ht16k=
33_fb_fix and ht16k33_fb_var constant)
Merging kgdb-dt/kgdb/for-next (d8a050f5a3e8 kgdb: fix comment regarding sta=
tic function)
Merging pidfd/for-next (590ef0128b42 waitid: Add support for waiting for th=
e current process group)
Merging devfreq/for-next (38f6a046f023 include: dt-bindings: add Performanc=
e Monitoring Unit for Exynos)
Merging hmm/hmm (a2ea3cd78abd drm/radeon: guard against calling an unpaired=
 radeon_mn_unregister())
Merging fpga/for-next (e56476897448 fpga: Remove dev_err() usage after plat=
form_get_irq())
Applying: temporary update for kbuild change
Merging akpm-current/current (f7dcf869ad39 ipc/msg.c: consolidate all xxxct=
l_down() functions)
CONFLICT (content): Merge conflict in include/linux/memremap.h
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
CONFLICT (content): Merge conflict in arch/arm64/include/asm/processor.h
Applying: mm: merge fix for "pagewalk: separate function pointers from iter=
ator data"
$ git checkout -b akpm remotes/origin/akpm/master
Applying: pinctrl: fix pxa2xx.c build warnings
Applying: lib: untag user pointers in strn*_user
Applying: mm: untag user pointers passed to memory syscalls
Applying: mm: untag user pointers in mm/gup.c
Applying: mm: untag user pointers in get_vaddr_frames
Applying: fs/namespace: untag user pointers in copy_mount_options
Applying: userfaultfd: untag user pointers
Applying: drm/amdgpu: untag user pointers
Applying: drm/radeon: untag user pointers in radeon_gem_userptr_ioctl
Applying: media/v4l2-core: untag user pointers in videobuf_dma_contig_user_=
get
Applying: tee/shm: untag user pointers in tee_shm_register
Applying: vfio/type1: untag user pointers in vaddr_get_pfn
Applying: mm: untag user pointers in mmap/munmap/mremap/brk
Applying: hexagon: drop empty and unused free_initrd_mem
Applying: mm: treewide: clarify pgtable_page_{ctor,dtor}() naming
Applying: drivers/tty/serial/sh-sci.c: suppress warning
Applying: drivers/media/platform/sti/delta/delta-ipc.c: fix read buffer ove=
rflow
Merging akpm/master (443981ca1e0a drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/rNu1zoW3aahnuFceb/XYv2.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1vvXMACgkQAVBC80lX
0GyZewf+KRjp4kE1nPpnKGFRL0/NTS/Bv9Lcwf4xSQdDD3mdwAkFClAS/WmBXRK3
30nqppVQ14xXiFhsqejB5fWclEXxhtxGwhxn+UY/GCfJOzr9qnGPwG07PtIt3hOK
S36xynnM8xZKGE9DKpvBBBMrqT9Q67Aq+D1z5NV6kMGrTgu8URkc+K+WVhtu+98a
PuseDNOzWGMXMZL6vD4pcC8ePaZIHmYU2lr7JL2ZM6Lz5fFo7h1v+NfpuNRtADWq
IgfNDfbqvHcH0MraIxnuPmnJJskADAcMMVcrHtHoHisx4iYtoEdlFKdqwieQR/KD
1L0TvpyKFoUeJcRuCTQSGedUi1aGuQ==
=Jyve
-----END PGP SIGNATURE-----

--Sig_/rNu1zoW3aahnuFceb/XYv2.--
