Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 117B7A567A
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 14:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730111AbfIBMnV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 08:43:21 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55577 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729690AbfIBMnU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 08:43:20 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46MV9p6YKTz9s7T;
        Mon,  2 Sep 2019 22:43:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567428191;
        bh=dWekmVK6bAXiGDgx45g+GNNidx8jUKPPc3ojCuZnf7w=;
        h=Date:From:To:Subject:From;
        b=aU7XPucwa2WmNvABkcx+NdsCrvwbtNx69uPbqHx+TcqFedRr7jdWl6VBkY7iqKfWQ
         f2cmr9iJ2u0cPLVh3nFIXRFAeIgzEgs89PCv5xymBBnEtjQOdsppgvq7PF5KVQjvRX
         h1JezK11wzJ8lm8QF4uv8ky1dvpx2kjRFTqXlj0Bi25iKAF3FajtDaMvp7uyhaPyzF
         +EGoC1UA1ntJssz3z1uIdu6c67dyc4L9pZQtZKAb/Rbeu7XMByMjC/XGfcOMlpMWVB
         W/iJLUpiQGOjVR6uNkgK1eAPGOHGNrLmiFle+k+Nl3/5bOCvq4mdGANJv0RpfZisTt
         RoHGPMsQM6ojA==
Date:   Mon, 2 Sep 2019 22:43:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 2
Message-ID: <20190902224310.208575dc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zKYjYT.gAtIoQI9Q4B2RIs1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zKYjYT.gAtIoQI9Q4B2RIs1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

News: I will only be doing 2 more releases before I leave for Kernel
Summit (there may be some reports on Thursday, but I doubt I will have
time to finish the full release) and then no more until Sept 30.

Changes since 20190830:

The compiler-attributes tree lost its build failure.

The powerpc tree gained a conflict against the arm64 tree. Also a build
failure due to an interaction with the dma-mapping tree.

The afs tree gained conflicts against the net tree.

The pci tree lost its build failure.

The net-next tree lost its build failure.

The sound-asoc tree gained a conflict against the jc_docs tree.

The regulator tree lost its build failure.

The keys tree still has its build failure but I changed to applying a
fix patch.

The iommu tree gained a build failure for which I reverted a commit.

The tip tree gained conflicts against Linus' tree.

The hmm tree gained a build failure for which I reverted a commit.

The akpm-current tree gained a conflict against the risc-v tree.

Non-merge commits (relative to Linus' tree): 9928
 9748 files changed, 583587 insertions(+), 269559 deletions(-)

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
Merging origin/master (9f159ae07f07 Merge branch 'x86-urgent-for-linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging fixes/master (609488bc979f Linux 5.3-rc2)
Merging kbuild-current/fixes (d45331b00ddb Linux 5.3-rc4)
Merging arc-current/for-curr (2f029413cbfb arc: prefer __section from compi=
ler_attributes.h)
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
Merging net/master (e1e54ec7fb55 net: seeq: Fix the function used to releas=
e some memory in an error handling path)
Merging bpf/master (ede7c460b1da bpf: handle 32-bit zext during constant bl=
inding)
Merging ipsec/master (769a807d0b41 xfrm: policy: avoid warning splat when m=
erging nodes)
Merging netfilter/master (c3d7a089f945 Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/pablo/nf)
Merging ipvs/master (58e8b37069ff Merge branch 'net-phy-dp83867-add-some-fi=
xes')
Merging wireless-drivers/master (5a8c31aa6357 iwlwifi: pcie: fix recognitio=
n of QuZ devices)
Merging mac80211/master (869326532956 Merge tag 'mac80211-for-davem-2019-08=
-29' of git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211)
Merging rdma-fixes/for-rc (531a64e4c35b RDMA/siw: Fix IPv6 addr_list lockin=
g)
Merging sound-current/for-linus (89781d0806c2 ALSA: hda/realtek - Fix overr=
idden device-specific initialization)
Merging sound-asoc-fixes/for-linus (2803b0e5da24 Merge branch 'asoc-5.3' in=
to asoc-linus)
Merging regmap-fixes/for-linus (0161b8716465 Merge branch 'regmap-5.3' into=
 regmap-linus)
Merging regulator-fixes/for-linus (a380ed768064 Merge branch 'regulator-5.3=
' into regulator-linus)
Merging spi-fixes/for-linus (443929295edc Merge branch 'spi-5.3' into spi-l=
inus)
Merging pci-current/for-linus (7bafda88de20 Documentation PCI: Fix pciebus-=
howto.rst filename typo)
Merging driver-core.current/driver-core-linus (d45331b00ddb Linux 5.3-rc4)
Merging tty.current/tty-linus (d45331b00ddb Linux 5.3-rc4)
Merging usb.current/usb-linus (1426bd2c9f7e USB: cdc-wdm: fix race between =
write and disconnect due to flag abuse)
Merging usb-gadget-fixes/fixes (4a56a478a525 usb: gadget: mass_storage: Fix=
 races between fsg_disable and fsg_set_alt)
Merging usb-serial-fixes/usb-linus (d1abaeb3be7b Linux 5.3-rc5)
Merging usb-chipidea-fixes/ci-for-usb-stable (16009db47c51 usb: chipidea: u=
dc: workaround for endpoint conflict issue)
Merging phy/fixes (609488bc979f Linux 5.3-rc2)
Merging staging.current/staging-linus (d1abaeb3be7b Linux 5.3-rc5)
Merging char-misc.current/char-misc-linus (8919dfcb3116 fsi: scom: Don't ab=
ort operations for minor errors)
Merging soundwire-fixes/fixes (d1abaeb3be7b Linux 5.3-rc5)
Merging thunderbolt-fixes/fixes (a55aa89aab90 Linux 5.3-rc6)
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
Merging drm-fixes/drm-fixes (1c0d63eb0e82 Merge tag 'drm-intel-fixes-2019-0=
8-29' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes)
Merging amdgpu-fixes/drm-fixes (41940ff50f6c drm/amdgpu: fix GFXOFF on Pica=
sso and Raven2)
Merging drm-intel-fixes/for-linux-next-fixes (32f0a982650b drm/i915: Call d=
ma_set_max_seg_size() in i915_driver_hw_probe())
Merging mmc-fixes/fixes (e73a3896eaca mmc: sdhci-cadence: enable v4_mode to=
 fix ADMA 64-bit addressing)
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
Merging pinctrl-intel-fixes/fixes (5f9e832c1370 Linus 5.3-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (424c38a4e325 drm/selftests: mo=
des: Add more unit tests for the cmdline parser)
Merging kspp-gustavo/for-next/kspp (57bd739ffe7a usb: udc: lpc32xx: Silence=
 fall-through warning)
Merging kbuild/for-next (e2079e93f562 kbuild: Do not enable -Wimplicit-fall=
through for clang for now)
Merging compiler-attributes/compiler-attributes (c4814af0b75c compiler_attr=
ibutes.h: add note about __section)
Merging leaks/leaks-next (9e98c678c2d6 Linux 5.1-rc1)
Merging dma-mapping/for-next (db91427b6502 MIPS: document mixing "slightly =
different CCAs")
Merging asm-generic/master (9b87647c665d asm-generic: add unlikely to defau=
lt BUG_ON(x))
Merging arc/for-next (6fbc7275c7a9 Linux 5.2-rc7)
Merging arm/for-next (e36b90e24fe4 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (61b7cddfe861 Merge branch 'for-next/atomics' i=
nto for-next/core)
Merging arm-perf/for-next/perf (3724e186fead docs/perf: Add documentation f=
or the i.MX8 DDR PMU)
Merging arm-soc/for-next (236316d6bb48 Merge branch 'arm/fixes' into for-ne=
xt)
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
Merging renesas-geert/next (a115ec27cec7 Merge branch 'renesas-dt-bindings-=
for-v5.4' into renesas-next)
Merging reset/reset/next (ea651ffd4f7f reset: Add DesignWare IP support to =
simple reset)
Merging rockchip/for-next (de9183bca276 Merge branch 'v5.4-armsoc/dts64' in=
to for-next)
Merging samsung-krzk/for-next (b2ee857b8174 Merge branch 'next/soc' into fo=
r-next)
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
Merging m68k/for-next (49ff824a028a m68k: defconfig: Update defconfigs for =
v5.3-rc2)
Merging m68knommu/for-next (284f3a8e0947 m68k: coldfire: Include the GPIO d=
river header)
Merging microblaze/next (04e3543e228f microblaze: use the generic dma coher=
ent remap allocator)
Merging mips/mips-next (42344113ba7a mips/atomic: Fix smp_mb__{before,after=
}_atomic())
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
Merging powerpc/next (bf75a8db72e9 powerpc/configs: Enable secure guest sup=
port in pseries and ppc64 defconfigs)
CONFLICT (content): Merge conflict in arch/powerpc/kvm/book3s_64_vio_hv.c
CONFLICT (content): Merge conflict in arch/powerpc/kvm/book3s_64_vio.c
CONFLICT (content): Merge conflict in arch/Kconfig
Merging fsl/next (63d86876f324 Revert "powerpc/fsl_pci: simplify fsl_pci_dm=
a_set_mask")
Merging soc-fsl/next (eadf0b17b43d bus: fsl-mc: remove explicit device_link=
_del)
Merging risc-v/for-next (909548d6c578 riscv: add arch/riscv/Kbuild)
Merging sifive/for-next (467e050e9760 Merge branch 'i2c/for-current' of git=
://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
Merging s390/features (deffa48fb014 s390/zcrypt: fix wrong handling of cca =
cipher keygenflags)
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
Merging afs/afs-next (986d1c7de75a afs: Fix possible oops in afs_lookup tra=
ce event)
CONFLICT (content): Merge conflict in net/rxrpc/skbuff.c
CONFLICT (content): Merge conflict in net/rxrpc/recvmsg.c
CONFLICT (content): Merge conflict in net/rxrpc/input.c
CONFLICT (content): Merge conflict in net/rxrpc/conn_client.c
CONFLICT (content): Merge conflict in net/rxrpc/call_object.c
CONFLICT (content): Merge conflict in net/rxrpc/ar-internal.h
CONFLICT (content): Merge conflict in include/trace/events/rxrpc.h
$ git merge --abort
Merging btrfs/next (29dcea88779c Linux 4.17)
Merging btrfs-kdave/for-next (a406b66710ba Merge branch 'for-next-next-v5.3=
-20190828' into for-next-20190828)
Merging ceph/master (de4c5bafb6d5 libceph: drop unused con parameter of cal=
c_target())
Merging cifs/for-next (a0fe1331e3ff smb3: add some more descriptive message=
s about share when mounting cache=3Dro)
Merging configfs/for-next (f6122ed2a4f9 configfs: Fix use-after-free when a=
ccessing sd->s_dentry)
Merging ecryptfs/next (b4a81b87a4cf ecryptfs: fix a memory leak bug in ecry=
ptfs_init_messaging())
Merging ext3/for_next (8cbd9af9d208 udf: Use dynamic debug infrastructure)
Merging ext4/dev (15c497e97e1a ext4: fix potential use after free after rem=
ounting with noblock_validity)
CONFLICT (content): Merge conflict in fs/ext4/ioctl.c
Merging f2fs/dev (497dd8f203e6 f2fs: add missing documents of reserve_root/=
resuid/resgid)
Merging fsverity/fsverity (95ae251fe828 f2fs: add fs-verity support)
CONFLICT (content): Merge conflict in fs/f2fs/inode.c
CONFLICT (content): Merge conflict in fs/f2fs/file.c
CONFLICT (content): Merge conflict in fs/ext4/ioctl.c
Merging fuse/for-next (9a13698480ca virtio-fs: add Documentation/filesystem=
s/virtiofs.rst)
CONFLICT (content): Merge conflict in Documentation/filesystems/index.rst
Merging jfs/jfs-next (a5fdd713d256 jfs: fix bogus variable self-initializat=
ion)
Merging nfs/linux-next (eea173097dfb Merge branch 'i2c/for-current' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/wsa/linux)
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
Merging v9fs/9p-next (80a316ff1627 9p/xen: Add cleanup path in p9_trans_xen=
_init)
Merging xfs/for-next (1baa2800e62d xfs: remove the unused XFS_ALLOC_USERDAT=
A flag)
Merging iomap/iomap-for-next (1c1daa47a0ae xfs: refactor the ioend merging =
code)
Merging djw-vfs/vfs-for-next (dc617f29dbe5 vfs: don't allow writes to swap =
files)
Merging file-locks/locks-next (cfddf9f4c9f0 locks: fix a memory leak bug in=
 __break_lease())
Merging vfs/for-next (e4f04a87a45f Merge branches 'work.misc', 'work.mount'=
, 'work.dcache' and 'work.autofs' into for-next)
CONFLICT (content): Merge conflict in fs/fuse/inode.c
CONFLICT (content): Merge conflict in fs/ceph/super.c
Applying: docs: filesystems: vfs: update for "vfs: Kill mount_single()"
Applying: Revert "vfs: Move the subtype parameter into fuse"
Merging printk/for-next (ba174ef6d224 Merge branch 'for-5.3-fixes' into for=
-next)
Merging pci/next (325eb5b9b37b Merge branch 'pci/trivial')
Merging pstore/for-next/pstore (609488bc979f Linux 5.3-rc2)
Merging hid/for-next (5bd8d1a78c30 Merge branch 'for-5.3/upstream-fixes' in=
to for-next)
Merging i2c/i2c/for-next (26d97fe8bbed Merge branch 'i2c/for-5.4' into i2c/=
for-next)
Merging i3c/i3c/next (6030f42d20ce i3c: master: Use dev_to_i3cmaster())
Merging dmi/master (57361846b52b Linux 4.19-rc2)
Merging hwmon-staging/hwmon-next (f58a6ecaed2c pmbus: (ibm-cffps) Add suppo=
rt for version 2 of the PSU)
Merging jc_docs/docs-next (5aff7c46172b docs: process: fix broken link)
CONFLICT (add/add): Merge conflict in Documentation/mips/index.rst
CONFLICT (content): Merge conflict in Documentation/admin-guide/cifs/todo.r=
st
Merging v4l-dvb/master (20a438d53fd9 media: sun4i: Make sun4i_csi_formats s=
tatic)
Merging v4l-dvb-next/master (5f9e832c1370 Linus 5.3-rc1)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (65eaac7736ab Merge branch 'pm-devfreq' into linux-ne=
xt)
Merging cpufreq-arm/cpufreq/arm/linux-next (76e75f3b8386 Merge branch 'cpuf=
req/qcom-updates' into cpufreq/arm/linux-next)
Merging cpupower/cpupower (87ce24320694 cpupower: update German translation)
Merging opp/opp/linux-next (5ffdb1529b7f Merge branch 'opp/qcom-updates' in=
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
Merging net-next/master (4bc61b0b1695 Merge branch 'net-dsa-mv88e6xxx-centr=
alize-SERDES-IRQ-handling')
CONFLICT (content): Merge conflict in scripts/link-vmlinux.sh
CONFLICT (content): Merge conflict in drivers/pci/controller/pci-hyperv.c
CONFLICT (content): Merge conflict in drivers/pci/Kconfig
CONFLICT (content): Merge conflict in drivers/net/usb/r8152.c
Merging bpf-next/master (bdb15a29cc28 Merge branch 'bpf-xdp-unaligned-chunk=
')
Merging ipsec-next/master (00ebd4998b53 Merge branch 'stmmac-Add-EHL-and-TG=
L-PCI-info-and-PCI-ID')
Merging mlx5-next/mlx5-next (00679b631edd net/mlx5: Set ODP capabilities fo=
r DC transport to max)
Merging netfilter-next/master (d0a8d877da97 netfilter: nft_dynset: support =
for element deletion)
Merging nfc-next/master (1f008cfec5d5 NFC: fdp: Fix unused variable warning=
s)
CONFLICT (content): Merge conflict in drivers/nfc/st21nfca/se.c
Merging ipvs-next/master (1b0b807dd746 Merge branch 'r8169-fw')
Merging wireless-drivers-next/master (932630fa9028 Merge tag 'wireless-driv=
ers-next-for-davem-2019-08-19' of git://git.kernel.org/pub/scm/linux/kernel=
/git/kvalo/wireless-drivers-next)
Merging bluetooth/master (657fb9c74266 Bluetooth: btrtl: Remove trailing ne=
wline from calls to rtl_dev macros)
Merging mac80211-next/master (c8cd6e7f159e cfg80211: add local BSS receive =
time to survey information)
Merging gfs2/for-next (1c4691199fbe gfs2: Fix recovery slot bumping)
Merging mtd/mtd/next (5f9e832c1370 Linus 5.3-rc1)
Merging nand/nand/next (f480b969448e mtd: rawnand: omap2: Fix number of bit=
flips reporting with ELM)
Merging spi-nor/spi-nor/next (9607af6f857f mtd: spi-nor: Rename "n25q512a" =
to "mt25qu512a (n25q512a)")
Merging crypto/master (1bbbbcfdc0f0 crypto: hisilicon - select CRYPTO_LIB_D=
ES while compiling SEC driver)
CONFLICT (content): Merge conflict in arch/x86/purgatory/Makefile
Merging drm/drm-next (578d2342ec70 Merge tag 'drm-next-5.4-2019-08-23' of g=
it://people.freedesktop.org/~agd5f/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/mediatek/mtk_drm_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/arm/display/komeda/ko=
meda_dev.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/powerplay/navi10_=
ppt.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/soc15.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_vcn=
.h
Merging amdgpu/drm-next (9c9284f9cee9 drm/amdgpu: Move null pointer derefer=
ence check)
Merging drm-intel/for-linux-next (dffa8feb3084 drm/i915/perf: Assert lockin=
g for i915_init_oa_perf_state())
Merging drm-tegra/drm/tegra/for-next (2a6fc3cb5cb6 drm/tegra: Fix gpiod_get=
_from_of_node() regression)
Merging drm-misc/for-linux-next (45d0dbd15a3b drm/panfrost: Remove unnecess=
ary hwaccess_lock spin_lock)
Merging drm-msm/msm-next (7981dc1262f5 drm/msm: Remove Kconfig default)
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/msm_atomic.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/disp/dpu1/dpu_pla=
ne.c
Merging hdlcd/for-upstream/hdlcd (d664b851eb2b drm/arm/hdlcd: Reject atomic=
 commits that disable only the plane)
Merging mali-dp/for-upstream/mali-dp (4cf643a39221 Merge tag 'drm-next-5.3-=
2019-06-27' of git://people.freedesktop.org/~agd5f/linux into drm-next)
Merging imx-drm/imx-drm/next (4d24376370fb gpu: ipu-v3: image-convert: only=
 sample into the next tile if necessary)
Merging etnaviv/etnaviv/next (088880ddc0b2 drm/etnaviv: implement softpin)
Merging regmap/for-next (1bd4584626a9 Merge branch 'regmap-5.4' into regmap=
-next)
Merging sound/for-next (6af86bdb8ad4 ALSA: firewire-motu: add support for M=
OTU 4pre)
Merging sound-asoc/for-next (ff97ad2bc8ea Merge branch 'asoc-5.4' into asoc=
-next)
CONFLICT (modify/delete): Documentation/devicetree/bindings/sound/sun8i-a33=
-codec.txt deleted in sound-asoc/for-next and modified in HEAD. Version HEA=
D of Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt left in tr=
ee.
$ git rm -f Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt
Merging modules/modules-next (3b5be16c7e90 modules: page-align module secti=
on allocations only for arches supporting strict module rwx)
Merging input/next (e95656ea15e5 Input: add support for polling to input de=
vices)
Merging block/for-next (8ba64588ef21 Merge branch 'for-5.4/libata' into for=
-next)
Merging device-mapper/for-next (c1499a044d7c dm space map common: remove ch=
eck for impossible sm_find_free() return value)
Merging pcmcia/pcmcia-next (95691e3eddc4 pcmcia: Implement CLKRUN protocol =
disabling for Ricoh bridges)
Merging mmc/next (6078f28cf9d1 mmc: sdhci: use lower/upper_32_bits() macros=
 for DMA addresses)
Merging kgdb/kgdb-next (3bd67b37e350 kdb: print real address of pointers in=
stead of hashed addresses)
CONFLICT (content): Merge conflict in kernel/debug/kdb/kdb_bt.c
Merging md/for-next (e820d55cb99d md: fix raid10 hang issue caused by barri=
er)
Merging mfd/for-mfd-next (5cd690a308e8 mfd: asic3: Include the right header)
Merging backlight/for-backlight-next (73fbfc499448 backlight: pwm_bl: Fix h=
euristic to determine number of brightness levels)
Merging battery/for-next (e526e501f0d4 power: supply: Init device wakeup af=
ter device_add())
CONFLICT (content): Merge conflict in drivers/power/supply/ab8500_charger.c
Merging regulator/for-next (2b734b6ebb98 Merge branch 'regulator-5.4' into =
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
Merging integrity/next-integrity (cbc0425d3dd3 sefltest/ima: support append=
ed signatures (modsig))
CONFLICT (content): Merge conflict in arch/s390/kernel/machine_kexec_file.c
Merging keys/keys-next (52d865534794 Merge branch 'keys-acl' into keys-next)
CONFLICT (content): Merge conflict in include/linux/security.h
CONFLICT (modify/delete): fs/crypto/keyinfo.c deleted in HEAD and modified =
in keys/keys-next. Version keys/keys-next of fs/crypto/keyinfo.c left in tr=
ee.
$ git rm -f fs/crypto/keyinfo.c
Applying: fsverity: merge fix for keyring_alloc API change
Applying: fscrypt: merge resolution for "keys: Replace uid/gid/perm permiss=
ions checking with an ACL"
Applying: dm verity: merge fix for "keys: Replace uid/gid/perm permissions =
checking with an ACL"
Applying: usb: include watch_queue.h for needed enum
Merging selinux/next (116f21bb967f selinux: avoid atomic_t usage in sidtab)
Merging smack/for-next (92604e825304 smack: use GFP_NOFS while holding inod=
e_smack::smk_lock)
Merging tpmdd/next (8dbcb44f392e tpm_tis_core: Set TPM_CHIP_FLAG_IRQ before=
 probing for interrupts)
Merging watchdog/master (194108705c9e watchdog: remove w90x900 driver)
Merging iommu/next (aede20306942 Merge branches 'iommu/fixes', 'arm/omap', =
'arm/exynos', 'arm/mediatek', 'arm/qcom', 'x86/amd', 'x86/vt-d' and 'core' =
into next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/panfrost/panfrost_mmu=
.c
Applying: Revert "iommu: Disable passthrough mode when SME is active"
Merging vfio/next (e6c5d727db0a Merge branches 'v5.4/vfio/alexey-tce-memory=
-free-v1', 'v5.4/vfio/connie-re-arrange-v2', 'v5.4/vfio/hexin-pci-reset-v3'=
, 'v5.4/vfio/parav-mtty-uuid-v2' and 'v5.4/vfio/shameer-iova-list-v8' into =
v5.4/vfio/next)
Merging audit/next (5f9e832c1370 Linus 5.3-rc1)
Merging devicetree/for-next (146fa39943b1 dt-bindings: Convert Arm Mali Utg=
ard GPU to DT schema)
CONFLICT (add/add): Merge conflict in Documentation/devicetree/writing-sche=
ma.rst
Merging mailbox/mailbox-for-next (25777e5784a7 mailbox: handle failed named=
 mailbox channel request)
Merging spi/for-next (3b69a15d2952 Merge branch 'spi-5.4' into spi-next)
Merging tip/auto-latest (fe7c37cbabbc Merge branch 'perf/core')
CONFLICT (content): Merge conflict in tools/power/x86/turbostat/turbostat.c
CONFLICT (content): Merge conflict in arch/ia64/include/asm/sn/sn_sal.h
Applying: ASoC: Intel: boards: merge fix for INTEL_FAM6_KABYLAKE_MOBILE -> =
INTEL_FAM6_KABYLAKE_L change
Merging clockevents/clockevents/next (befd04abfbe4 clocksource/drivers/sh_c=
mt: Document "cmt-48" as deprecated)
CONFLICT (content): Merge conflict in kernel/time/posix-timers.c
Merging edac/edac-for-next (81f5090db843 EDAC/amd64: Support asymmetric dua=
l-rank DIMMs)
Merging irqchip/irq/irqchip-next (2178add02238 irqchip/mmp: Coexist with GI=
C root IRQ controller)
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
Merging chrome-platform/for-next (058bf149b92a platform/chrome: cros_ec_rpm=
sg: Add host command AP sleep state support)
Merging hsi/for-next (c1030cd45619 HSI: Remove dev_err() usage after platfo=
rm_get_irq())
Merging leds/for-next (4e4210402639 leds: trigger: gpio: GPIO 0 is valid)
Merging ipmi/for-next (383035211c79 ipmi: move message error checking to av=
oid deadlock)
Merging driver-core/driver-core-next (d9430f96c051 driver core: platform: E=
xport platform_get_irq_optional())
CONFLICT (content): Merge conflict in drivers/base/power/runtime.c
Merging usb/usb-next (b2fcb285ade3 usb: xhci-mtk: add an optional xhci_ck c=
lock)
CONFLICT (content): Merge conflict in drivers/staging/Makefile
CONFLICT (content): Merge conflict in drivers/staging/Kconfig
Merging usb-gadget/next (18a93cd38be3 usb: gadget: net2280: Add workaround =
for AB chip Errata 11)
Merging usb-serial/usb-next (7a786b847907 USB: serial: ftdi_sio: add suppor=
t for FT232H CBUS gpios)
Merging usb-chipidea-next/ci-for-usb-next (05559f10ed79 usb: chipidea: add =
role switch class support)
Merging phy-next/next (5af67635c36e phy: marvell: phy-mvebu-cp110-comphy: r=
ename instances of DLT)
Merging tty/tty-next (591f4ea2ed61 serial: 8250_pci: Add F81504A series Sup=
port)
Merging char-misc/char-misc-next (d4e34999a757 Merge tag 'lkdtm-next' of ht=
tps://git.kernel.org/pub/scm/linux/kernel/git/kees/linux into char-misc-nex=
t)
Merging extcon/extcon-next (a3fc57233977 extcon: adc-jack: Remove dev_err()=
 usage after platform_get_irq())
Merging soundwire/next (395713d8ca43 soundwire: intel: handle disabled link=
s)
Merging thunderbolt/next (dfda20419884 ACPI / property: Add two new Thunder=
bolt property GUIDs to the list)
Merging staging/staging-next (097a802ae15e erofs: reduntant assignment in _=
_erofs_get_meta_page())
CONFLICT (content): Merge conflict in drivers/staging/Makefile
CONFLICT (content): Merge conflict in drivers/staging/Kconfig
Merging mux/for-next (05fb8284a417 Merge branch 'i2c-mux/for-next' into for=
-next)
Merging icc/icc-next (6311b6521bcc drivers: qcom: Add BCM vote macro to hea=
der)
Merging slave-dma/next (f5e84eae7956 dmaengine: dw: platform: Split OF help=
ers to separate module)
Merging cgroup/for-next (653a23ca7e1e Use kvmalloc in cgroups-v1)
Merging scsi/for-next (22d48c3e8eb4 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (cb9e763ed9eb Merge branch '5.4/scsi-queue' into =
5.4/scsi-next)
CONFLICT (content): Merge conflict in drivers/scsi/lpfc/lpfc_sli4.h
Merging vhost/linux-next (73f628ec9e6b vhost: disable metadata prefetch opt=
imization)
Merging rpmsg/for-next (0431e0d0926d Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (1fc4f3c962b7 Merge branch 'devel' into for-next)
CONFLICT (content): Merge conflict in drivers/gpio/gpio-ixp4xx.c
Merging gpio-brgl/gpio/for-next (f2ee73147a3f gpio: lpc32xx: allow building=
 on non-lpc32xx targets)
CONFLICT (content): Merge conflict in include/linux/gpio/driver.h
Merging gpio-intel/for-next (85af79659f45 MAINTAINERS: Remove stale record =
for gpio-intel-mid.c)
Merging pinctrl/for-next (73345a18d464 pinctrl: bcm2835: Pass irqchip when =
adding gpiochip)
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
Merging hyperv/hyperv-next (9b5434196529 Tools: hv: move to tools buildsyst=
em)
Merging auxdisplay/auxdisplay (a180d023ec7b auxdisplay: ht16k33: Make ht16k=
33_fb_fix and ht16k33_fb_var constant)
Merging kgdb-dt/kgdb/for-next (ca976bfb3154 kdb: Fix bound check compiler w=
arning)
Merging pidfd/for-next (590ef0128b42 waitid: Add support for waiting for th=
e current process group)
Merging devfreq/for-next (0465814831a9 PM / devfreq: passive: fix compiler =
warning)
Merging hmm/hmm (126470c8a58b libnvdimm: Enable unit test infrastructure co=
mpile checks)
Applying: Revert "libnvdimm: Enable unit test infrastructure compile checks"
Merging fpga/for-next (e56476897448 fpga: Remove dev_err() usage after plat=
form_get_irq())
Applying: merge fixes for "dma-mapping: make dma_atomic_pool_init self-cont=
ained"
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
Merging akpm/master (3064ff1c7666 drivers/media/platform/sti/delta/delta-ip=
c.c: fix read buffer overflow)

--Sig_/zKYjYT.gAtIoQI9Q4B2RIs1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1tDl4ACgkQAVBC80lX
0GyRdQgApOPqcyeH9lLD4DNj3zADR+b4WEZEmUBXl19SfSOR+YqqhXVLRyDdAVKX
afrix+w8khDQnVUGmK1EnjlXKswXCXn4i1FGYpgs9xaYxwM8pSIJvITdgftDRNIf
hpl+EnZv00fnwtB9pxtsfFLIgH80WBJ2HeXUh79OQxQLXoF1LzqrgT4E1FT/5DU3
BI4B4tbB23xuqbAIOZa+GwEWxfri5McUkUTov39Ox70Nc/aSSw8l5DoFnYa5OTfS
WnHJZEtTu3M19ZcS5PzPLtkSqDF/Dal7VOCK91GmA6+jYVNp76YyZBUYEE1giSqT
UGyiuelXoVDSUdpn59MIYOgyCB+MrQ==
=BMAK
-----END PGP SIGNATURE-----

--Sig_/zKYjYT.gAtIoQI9Q4B2RIs1--
