Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0EE29D4AD
	for <lists+linux-next@lfdr.de>; Wed, 28 Oct 2020 22:54:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728521AbgJ1Vx4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Oct 2020 17:53:56 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60931 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728569AbgJ1Vxy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Oct 2020 17:53:54 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CLZyR01jbz9sVx;
        Wed, 28 Oct 2020 15:16:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603858591;
        bh=ZDQgCLIa2qWIWWEi3wMUDSz63TZtlt0IKj86UWPdfhY=;
        h=Date:From:To:Cc:Subject:From;
        b=qkkEYk5qt3DRfA9PNNE0TRQZqIAO2fGP3R4Xb0s12yEiXVdjoPY7DnUjzalbbO2ca
         aon/aUkkYVmUuwkLOlo3Xkz+kC//uraEgt8Fyd6dvWZFrjjJ13odruRywZn+bOUq+y
         Z5J7e7WvyKCxkNdKPzNgWlwdQrCYD+G3SQaacemixBa6ASzz8MUwR1ALsH+4fSPgWd
         RApeGhoG1peFWkOj0xCWILvgr7htWKfEXWmeLkgR0+v77R6d2cNvywhXIeONHCMxPp
         cLvPLnjevDdgQhoWnuqM84aG+XUaRGje5UzPgnBUSWWJ8Pp5GvR0x2JYTLyD21/w61
         uko9mQZi9wl4Q==
Date:   Wed, 28 Oct 2020 15:16:30 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 28
Message-ID: <20201028151630.3178de00@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lu1QMvYnIzIKSCuUdIJJpwc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lu1QMvYnIzIKSCuUdIJJpwc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20201027:

The sunxi tree lost its build failure.

The amdgpu tree lost its build failure.

The drm-misc tree gained a conflict against the amdgpu tree.

Non-merge commits (relative to Linus' tree): 1607
 1811 files changed, 316610 insertions(+), 18572 deletions(-)

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
and sparc64 defconfig and htmldocs. And finally, a simple boot test
of the powerpc pseries_le_defconfig kernel in qemu (with and without
kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 327 trees (counting Linus' and 85 trees of bug
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
Merging origin/master (ed8780e3f2ec Merge tag 'x86-urgent-2020-10-27' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging kbuild-current/fixes (7654e9a8389a kbuild: remove unused OBJSIZE)
Merging arc-current/for-curr (3650b228f83a Linux 5.10-rc1)
Merging arm-current/fixes (9fa2e7af3d53 ARM: 9019/1: kprobes: Avoid fortify=
_panic() when copying optprobe template)
Merging arm64-fixes/for-next/fixes (0fa97e9403c7 arm64: vdso32: Allow ld.ll=
d to properly link the VDSO)
Merging arm-soc-fixes/arm/fixes (e5a329790409 Merge tag 'imx-fixes-5.10-2' =
of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fi=
xes)
Merging drivers-memory-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging m68k-current/for-linus (50c5feeea0af ide/macide: Convert Mac IDE dr=
iver to platform driver)
Merging powerpc-fixes/fixes (4ff753feab02 powerpc/pseries: Avoid using addr=
_to_pfn in real mode)
Merging s390-fixes/fixes (8e90b4b1305a s390: correct __bootdata / __bootdat=
a_preserved macros)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (e3364c5ff3ff net: hns3: Clear the CMDQ registers before=
 unmapping BAR region)
Merging bpf/master (c66dca98a24c samples/bpf: Set rlimit for memlock to inf=
inity in all samples)
Merging ipsec/master (a779d91314ca net: xfrm: fix a race condition during a=
llocing spi)
Merging netfilter/master (c77761c8a594 netfilter: nf_fwd_netdev: clear time=
stamp in forwarding path)
Merging ipvs/master (c77761c8a594 netfilter: nf_fwd_netdev: clear timestamp=
 in forwarding path)
Merging wireless-drivers/master (3650b228f83a Linux 5.10-rc1)
Merging mac80211/master (435ccfa894e3 tcp: Prevent low rmem stalls with SO_=
RCVLOWAT.)
Merging rdma-fixes/for-rc (3650b228f83a Linux 5.10-rc1)
Merging sound-current/for-linus (f15cfca818d7 ALSA: usb-audio: Add implicit=
 feedback quirk for Zoom UAC-2)
Merging sound-asoc-fixes/for-linus (34c9859fad95 Merge remote-tracking bran=
ch 'asoc/for-5.10' into asoc-linus)
Merging regmap-fixes/for-linus (780f88b04704 Merge remote-tracking branch '=
regmap/for-5.10' into regmap-linus)
Merging regulator-fixes/for-linus (2d05bb732dc8 Merge remote-tracking branc=
h 'regulator/for-5.10' into regulator-linus)
Merging spi-fixes/for-linus (7c6e0c9419d1 Merge remote-tracking branch 'spi=
/for-5.10' into spi-linus)
Merging pci-current/for-linus (3650b228f83a Linux 5.10-rc1)
Merging driver-core.current/driver-core-linus (3650b228f83a Linux 5.10-rc1)
Merging tty.current/tty-linus (3650b228f83a Linux 5.10-rc1)
Merging usb.current/usb-linus (3650b228f83a Linux 5.10-rc1)
Merging usb-gadget-fixes/fixes (51609fba0cca usb: dwc3: simple: add support=
 for Hikey 970)
CONFLICT (content): Merge conflict in drivers/usb/dwc3/gadget.c
CONFLICT (content): Merge conflict in drivers/usb/dwc3/dwc3-of-simple.c
CONFLICT (content): Merge conflict in drivers/usb/cdns3/gadget.c
Merging usb-serial-fixes/usb-linus (3650b228f83a Linux 5.10-rc1)
Merging usb-chipidea-fixes/ci-for-usb-stable (2d79b3360dcc usb: chipidea: c=
ore: add wakeup support for extcon)
Merging phy/fixes (3650b228f83a Linux 5.10-rc1)
Merging staging.current/staging-linus (7e97e4cbf300 staging: fieldbus: anyb=
uss: jump to correct label in an error path)
Merging char-misc.current/char-misc-linus (3650b228f83a Linux 5.10-rc1)
Merging soundwire-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging thunderbolt-fixes/fixes (7342ca34d931 thunderbolt: Add the missed i=
da_simple_remove() in ring_request_msix())
Merging input-current/for-linus (bb0bc0cfeabc Merge branch 'next' into for-=
linus)
Merging crypto-current/master (c3a98c3ad5c0 crypto: x86/poly1305 - add back=
 a needed assignment)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (aae7a75a821a vfio/type1: Add proper error unw=
ind for vfio_iommu_replay())
Merging kselftest-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (3aee8a3a88fa mtd: rawnand: ifc: Move the ECC e=
ngine initialization to the right place)
Merging mfd-fixes/for-mfd-fixes (22380b65dc70 mfd: mfd-core: Ensure disable=
d devices are ignored without error)
Merging v4l-dvb-fixes/fixes (d0254f82d702 media: dt-bindings: media: imx274=
: Convert to json-schema)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (31b4d8e172f6 MIPS: export has_transparent_hu=
gepage() for modules)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (8f04aea048d5 ARM: OMAP2+: Restore MPU power domai=
n if cpu_cluster_pm_enter() fails)
Merging kvm-fixes/master (77377064c3a9 KVM: ioapic: break infinite recursio=
n on lazy EOI)
Merging kvms390-fixes/master (f20d4e924b44 docs: kvm: add documentation for=
 KVM_CAP_S390_DIAG318)
Merging hwmon-fixes/hwmon (402dab548d0d hwmon: (pmbus/max20730) use scnprin=
tf() instead of snprintf())
Merging nvdimm-fixes/libnvdimm-fixes (88b67edd7247 dax: Fix compilation for=
 CONFIG_DAX && !CONFIG_FS_DAX)
Merging btrfs-fixes/next-fixes (45d8f990a77f Merge branch 'misc-5.10' into =
next-fixes)
Merging vfs-fixes/fixes (8a018eb55e3a pipe: Fix memory leaks in create_pipe=
_files())
Merging dma-mapping-fixes/for-linus (892fc9f6835e dma-pool: Fix an uninitia=
lized variable bug in atomic_pool_expand())
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging samsung-krzk-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging pinctrl-samsung-fixes/pinctrl-fixes (3650b228f83a Linux 5.10-rc1)
Merging devicetree-fixes/dt/linus (f84e2c5c528d dt-bindings: Another round =
of adding missing 'additionalProperties/unevalutatedProperties')
Merging scsi-fixes/fixes (fab09aaee803 scsi: hisi_sas: Stop using queue #0 =
always for v2 hw)
Merging drm-fixes/drm-fixes (3650b228f83a Linux 5.10-rc1)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (c9f7fc65564f Merge tag 'gvt-f=
ixes-2020-10-27' of https://github.com/intel/gvt-linux into drm-intel-fixes)
Merging mmc-fixes/fixes (0add6e9b88d0 mmc: sdhci-of-esdhc: set timeout to m=
ax before tuning)
Merging rtc-fixes/rtc-fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging gnss-fixes/gnss-linus (48778464bb7d Linux 5.8-rc2)
Merging hyperv-fixes/hyperv-fixes (dbf563eee0b8 x86/hyperv: Clarify comment=
 on x2apic mode)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (84814460eef9 riscv: Fixup bootup failure with H=
ARDENED_USERCOPY)
Merging pidfd-fixes/fixes (bda4c60d02e9 sys: Convert to the new fallthrough=
 notation)
Merging fpga-fixes/fixes (8614afd689df fpga: dfl: fix bug in port reset han=
dshake)
Merging spdx/spdx-linus (3650b228f83a Linux 5.10-rc1)
Merging gpio-intel-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging pinctrl-intel-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging erofs-fixes/fixes (9ebcfadb0610 Linux 5.8-rc3)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (0d0d245104a4 kunit: tools: fix kunit_tool =
tests for parsing test plans)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (5f7b81c18366 ia64: fix min_low_pfn/max_low_pf=
n build errors)
Merging drm-misc-fixes/for-linux-next-fixes (58d043690deb drm/vc4: hdmi: Av=
oid sleeping in atomic context)
Merging kspp-gustavo/for-next/kspp (736116436e5b include: jhash/signal: Fix=
 fall-through warnings for Clang)
Merging kbuild/for-next (f11901ed723d Merge tag 'xfs-5.10-merge-7' of git:/=
/git.kernel.org/pub/scm/fs/xfs/xfs-linux)
Merging compiler-attributes/compiler-attributes (bbf5c979011a Linux 5.9)
Merging dma-mapping/for-next (6857a5ebaabc dma-mapping: document dma_{alloc=
,free}_pages)
Merging asm-generic/master (0c7239ddfe69 Merge branch 'asm-generic-mmu-cont=
ext' into asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (e7b21ce9bf46 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (66dd3474702a arm64: proton-pack: Update commen=
t to reflect new function name)
Merging arm-perf/for-next/perf (887e2cff0f8d perf: arm-cmn: Fix conversion =
specifiers for node type)
Merging arm-soc/for-next (3330b6c40161 ARM: SoC: document merges)
Merging amlogic/for-next (4393916840fc Merge branch 'v5.11/soc' into tmp/am=
l-rebuild)
Merging aspeed/for-next (48127d01a153 Merge branch 'soc-for-v5.10' into for=
-next)
Merging at91/at91-next (d1f170f8447d Merge branches 'at91-soc' and 'at91-dt=
' into at91-next)
Merging drivers-memory/for-next (5ddebb22417b Merge branch 'for-v5.11/tegra=
-mc' into for-next)
Merging imx-mxs/for-next (1f35c2c8497a Merge branch 'imx/dt64' into for-nex=
t)
Merging keystone/next (703dff8cb900 Merge branch 'for_5.10/drivers-soc' int=
o next)
Merging mediatek/for-next (6c7949eccdbd Merge branch 'v5.10-tmp/soc' into f=
or-next)
Merging mvebu/for-next (f89c9685f6a1 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (7a159a1ad494 Merge branch 'fixes' into for-next)
Merging qcom/for-next (6bf920418f6c Merge branches 'arm64-for-5.11', 'drive=
rs-for-5.11' and 'dts-for-5.11' into for-next)
Merging raspberrypi/for-next (4564363351e2 ARM: dts: bcm2711: Enable the di=
splay pipeline)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (97fc35aeb797 Merge branches 'renesas-arm-dt-for-v5.11=
' and 'renesas-drivers-for-v5.11' into renesas-next)
Merging reset/reset/next (da8c0e4ee95a reset: meson: make it possible to bu=
ild as a module)
Merging rockchip/for-next (ba0ceb95f560 Merge branch 'v5.10-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (b9cf16c4bfd1 Merge branch 'for-v5.10/dt-late=
' into for-next)
Merging scmi/for-linux-next (3650b228f83a Linux 5.10-rc1)
Merging sunxi/sunxi/for-next (fbd6c612d370 Merge branches 'sunxi/dt-for-5.1=
1' and 'sunxi/fixes-for-5.10' into sunxi/for-next)
Merging tegra/for-next (9ea55312ba10 Merge branch for-5.10/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (9dcd17be61e4 arm64: dts: ti: k3-am65: ringacc=
: drop ti, dma-ring-reset-quirk)
Merging clk/clk-next (5f56888fad46 Merge branches 'clk-ingenic', 'clk-at91'=
, 'clk-kconfig', 'clk-imx', 'clk-qcom', 'clk-prima2' and 'clk-bcm' into clk=
-next)
Merging clk-samsung/for-next (ff8e0ff9b996 clk: samsung: Use cached clk_hws=
 instead of __clk_lookup() calls)
Merging csky/linux-next (1c8499089bc6 csky: Add memory layout 2.5G(user):1.=
5G(kernel))
Merging h8300/h8300-next (8808515be0ed h8300: Replace <linux/clk-provider.h=
> by <linux/of_clk.h>)
Merging ia64/next (c331649e6371 ia64: Use libata instead of the legacy ide =
driver in defconfigs)
Merging m68k/for-next (50c5feeea0af ide/macide: Convert Mac IDE driver to p=
latform driver)
Merging m68knommu/for-next (02a0b3141ed9 m68knommu: align BSS section to 4-=
byte boundaries)
Merging microblaze/next (4a17e8513376 microblaze: fix kbuild redundant file=
 warning)
Merging mips/mips-next (ab7cffb8d236 MIPS: ingenic: remove unused platform_=
data header file)
Merging nds32/next (54bde873682b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (55b2662ec665 openrisc: uaccess: Add user address=
 space check to access_ok)
Merging parisc-hd/for-next (3b7ab4a74a2d parisc: Switch to clockevent based=
 timers)
Merging powerpc/next (ffd0b25ca049 Revert "powerpc/pci: unmap legacy INTx i=
nterrupts when a PHB is removed")
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (d97b957e32b1 soc: fsl: qe: Remove unnessesary check i=
n ucc_set_tdm_rxtx_clk)
Merging risc-v/for-next (f69e1c7418b1 RISC-V: Fix the VDSO symbol generaton=
 for binutils-2.35+)
CONFLICT (content): Merge conflict in arch/riscv/kernel/vdso/Makefile
Merging s390/for-next (00be34947616 Merge branch 'fixes' into for-next)
Merging sh/for-next (b0cfc315ff38 sh: fix syscall tracing)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (f06885b3f3e3 um: vector: Add dynamic tap interfaces=
 and scripting)
Merging xtensa/xtensa-for-next (4ca4c562efb6 xtensa: uaccess: Add missing _=
_user to strncpy_from_user() prototype)
Merging fscrypt/master (5b2a828b98ec fscrypt: export fscrypt_d_revalidate())
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (c4795f038f2e Merge branch 'for-next-current-v5.9-20=
201015' into for-next-20201015)
Merging ceph/master (28e1581c3b4e libceph: clear con->out_msg on Policy::st=
ateful_server faults)
Merging cifs/for-next (3650b228f83a Linux 5.10-rc1)
Merging configfs/for-next (76ecfcb0852e samples: configfs: prefer pr_err() =
over bare printk(KERN_ERR)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (915f4c9358db erofs: remove unnecessary enum entries)
Merging exfat/dev (f9893351acae Merge tag 'kconfig-v5.10' of git://git.kern=
el.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging ext3/for_next (e44b86917b3f Pull direct IO fix from Gabriel Krisman=
.)
Merging ext4/dev (1322181170bb ext4: fix invalid inode checksum)
Merging f2fs/dev (bcfd79928961 f2fs: call f2fs_get_meta_page_retry for nat =
page)
Merging fsverity/fsverity (f3db0bed4583 fs-verity: use smp_load_acquire() f=
or ->i_verity_info)
Merging fuse/for-next (42d3e2d041f0 virtiofs: calculate number of scatter-g=
ather elements accurately)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (3650b228f83a Linux 5.10-rc1)
Merging nfs-anna/linux-next (8c39076c276b NFSv4.2: support EXCHGID4_FLAG_SU=
PP_FENCE_OPS 4.2 EXCHANGE_ID flag)
Merging nfsd/nfsd-next (856deb866d16 Linux 5.9-rc5)
Merging cel/cel-next (13a9a9d74d4d SUNRPC: Fix svc_flush_dcache())
Merging orangefs/for-next (e848643b524b orangefs: remove unnecessary assign=
ment to variable ret)
Merging overlayfs/overlayfs-next (be4df0cea08a ovl: use generic vfs_ioc_set=
flags_prepare() helper)
Merging ubifs/next (e2a05cc7f822 ubifs: mount_ubifs: Release authentication=
 resource in error handling path)
Merging v9fs/9p-next (7ca1db21ef8e net: 9p: initialize sun_server.sun_path =
to have addr's value only when addr is valid)
Merging xfs/for-next (2e76f188fd90 xfs: cancel intents immediately if proce=
ss_intents fails)
Merging zonefs/for-next (48bfd5c6fac1 zonefs: document the explicit-open mo=
unt option)
Merging iomap/iomap-for-next (1a31182edd00 iomap: Call inode_dio_end() befo=
re generic_write_sync())
Merging djw-vfs/vfs-for-next (407e9c63ee57 vfs: move the generic write and =
copy checks out of mm)
Merging file-locks/locks-next (529adfe8f131 locks: fix a typo at a kernel-d=
oc markup)
Merging vfs/for-next (8853bf827ca8 Merge branches 'work.sparc', 'work.epoll=
', 'work.sparc32' and 'regset.followup' into for-next)
Applying: fix up for merge of arch/sparc/lib/memset.S
Merging printk/for-next (26911e6b1302 Merge branch 'for-5.10-fixup' into fo=
r-next)
Merging pci/next (3650b228f83a Linux 5.10-rc1)
Merging pstore/for-next/pstore (137c6236aeec mailmap: Add WeiXiong Liao)
CONFLICT (content): Merge conflict in .mailmap
Merging hid/for-next (f5795950202d Merge branch 'for-5.10/vivaldi' into for=
-next)
Merging i2c/i2c/for-next (3650b228f83a Linux 5.10-rc1)
Merging i3c/i3c/next (abea14bfdebb i3c: master: Fix error return in cdns_i3=
c_master_probe())
Merging dmi/dmi-for-next (a3d13a0a23ea Replace HTTP links with HTTPS ones: =
DMI/SMBIOS SUPPORT)
Merging hwmon-staging/hwmon-next (eb3f6f77d58c hwmon: (pmbus) shrink code a=
nd remove pmbus_do_remove())
Merging jc_docs/docs-next (62af696471e5 docs: Add two missing entries in vm=
 sysctl index)
Merging v4l-dvb/master (c386e0797d26 media: dvb-frontends/drxk_hard.c: fix =
uninitialized variable warning)
Merging v4l-dvb-next/master (d0a9fffedca1 docs: fs: api-summary.rst: get ri=
d of kernel-doc include)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (e213cd8f175c Merge branch 'opp/fixes' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/vireshk/pm)
Merging cpufreq-arm/cpufreq/arm/linux-next (bc9b9c5ab9d8 cpufreq: qcom: Don=
't add frequencies without an OPP)
Merging cpupower/cpupower (748f0d70087c cpupower: Provide online and offlin=
e CPU information)
Merging devfreq/devfreq-next (09d56d92ad25 PM / devfreq: tegra30: Silence d=
eferred probe error)
Merging opp/opp/linux-next (b0756034202a opp: Don't return opp_dev from _fi=
nd_opp_dev())
Merging thermal/thermal/linux-next (345a8af7ea63 thermal: core: Move power_=
actor_set_power into IPA)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (4f2b30fd9b4b fs: dlm: fix race in nodeid2con)
Merging swiotlb/linux-next (b51e627158cb swiotlb: Mark max_segment with sta=
tic keyword)
Merging rdma/for-next (3650b228f83a Linux 5.10-rc1)
Merging net-next/master (585bd812de4e net: microchip: Remove unneeded varia=
ble ret)
Merging bpf-next/for-next (3cb12d27ff65 Merge tag 'net-5.10-rc1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ipsec-next/master (3cb12d27ff65 Merge tag 'net-5.10-rc1' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging mlx5-next/mlx5-next (3650b228f83a Linux 5.10-rc1)
Merging netfilter-next/master (3cb12d27ff65 Merge tag 'net-5.10-rc1' of git=
://git.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ipvs-next/master (3cb12d27ff65 Merge tag 'net-5.10-rc1' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging wireless-drivers-next/master (3650b228f83a Linux 5.10-rc1)
Merging bluetooth/master (44d59235ace5 Bluetooth: hci_h5: close serdev devi=
ce and free hu in h5_close)
Merging mac80211-next/master (3cb12d27ff65 Merge tag 'net-5.10-rc1' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging gfs2/for-next (b765472b8010 gfs2: init_journal's undo directive sho=
uld also undo the statfs inodes)
Merging mtd/mtd/next (6402f4ce9581 mtd: hyperbus: Fix build failure when on=
ly RPCIF_HYPERBUS is enabled)
Merging nand/nand/next (88e315d12fbb mtd: onenand: simplify the return expr=
ession of onenand_transfer_auto_oob)
Merging spi-nor/spi-nor/next (9a3422a110c8 Revert "mtd: spi-nor: Prefer asy=
nchronous probe")
Merging crypto/master (3093e7c16e12 X.509: Fix modular build of public_key_=
sm2)
Merging drm/drm-next (b45b6fbc671c Merge tag 'drm-intel-next-fixes-2020-10-=
22' of git://anongit.freedesktop.org/drm/drm-intel into drm-next)
Merging amdgpu/drm-next (2e3a5bc5feea drm/amdgpu/display: fix warnings when=
 CONFIG_DRM_AMD_DC_DCN is not set)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/amdgpu_s=
mu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn10/=
dcn10_optc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ttm=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_dev=
ice.c
Merging drm-intel/for-linux-next (b18c1eb975ce drm/i915/dg1: invert HPD pin=
s)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_di=
splay.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dd=
i.c
Merging drm-tegra/drm/tegra/for-next (d9f980ebcd01 drm/tegra: output: rgb: =
Wrap directly-connected panel into DRM bridge)
Merging drm-misc/for-linux-next (65b7da27d2f6 drm/tilcdc: avoid 'make W=3D2=
' build failure)
CONFLICT (content): Merge conflict in include/drm/drm_dp_helper.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/virtio/virtgpu_vq.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/disp/dpu1/dpu_crt=
c.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/ingenic/ingenic-drm-d=
rv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_gem=
.c
Applying: merge fix up for "drm/amdgpu: Add debugfs entry for printing VM i=
nfo"
Merging drm-msm/msm-next (d1ea91492585 drm/msm/dp: fix incorrect function p=
rototype of dp_debug_get())
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (36fba366cf9f drm/imx: tve remove extraneous t=
ype qualifier)
Merging etnaviv/etnaviv/next (3136fed4f91e drm/etnaviv: Drop local dma_parm=
s)
Merging regmap/for-next (f243af4d473b Merge remote-tracking branch 'regmap/=
for-5.11' into regmap-next)
Merging sound/for-next (ad26098970b6 ALSA: remove unneeded break)
Merging sound-asoc/for-next (c8076df6437e Merge remote-tracking branch 'aso=
c/for-5.11' into asoc-next)
Merging modules/modules-next (fdf09ab88782 module: statically initialize in=
it section freeing data)
Merging input/next (8a30c6eb29e0 Input: Add MAINTAINERS entry for SiS i2c t=
ouch input driver)
Merging block/for-next (2120d12a2ad3 Merge branch 'libata-5.10' into for-ne=
xt)
Merging device-mapper/for-next (681cc5e8667e dm: fix request-based DM to no=
t bounce through indirect dm_submit_bio)
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (d7084def54b6 mmc: sdhci-acpi: AMDI0040: Allow changing HS=
200/HS400 driver strength)
Merging mfd/for-mfd-next (6d81dc3c79d4 mfd: kempld-core: Fix unused variabl=
e 'kempld_acpi_table' when !ACPI)
Merging backlight/for-backlight-next (97ecfda1a8ff backlight: tosa_bl: Incl=
ude the right header)
Merging battery/for-next (7007fab4ae82 power: reset: POWER_RESET_OCELOT_RES=
ET should depend on Ocelot or Sparx5)
Merging regulator/for-next (4a65ab4941e7 Merge remote-tracking branch 'regu=
lator/for-5.11' into regulator-next)
Merging security/next-testing (bc62d68e2a0a device_cgroup: Fix RCU list deb=
ugging warning)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (aa662fc04f5b ima: Fix NULL pointer derefe=
rence in ima_file_hash)
Merging keys/keys-next (b6f61c314649 keys: Implement update for the big_key=
 type)
Merging safesetid/safesetid-next (03ca0ec13892 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (3650b228f83a Linux 5.10-rc1)
Merging smack/next (edd615371b66 Smack: Remove unnecessary variable initial=
ization)
Merging tomoyo/master (ae7e63d1e34a Merge branch 'master' of https://scm.os=
dn.net/gitroot/tomoyo/tomoyo-test1)
Merging tpmdd/next (d3b03163a328 tpm_tis: Disable interrupts on ThinkPad T4=
90s)
Merging watchdog/master (3650b228f83a Linux 5.10-rc1)
Merging iommu/next (7e3c3883c381 Merge branches 'arm/allwinner', 'arm/media=
tek', 'arm/renesas', 'arm/tegra', 'arm/qcom', 'arm/smmu', 'ppc/pamu', 'x86/=
amd', 'x86/vt-d' and 'core' into next)
Merging audit/next (3650b228f83a Linux 5.10-rc1)
Merging devicetree/for-next (bd36e51d10e7 dt-bindings: misc: explicitly add=
 #address-cells for slave mode)
Merging mailbox/mailbox-for-next (c7dacf5b0f32 mailbox: avoid timer start f=
rom callback)
Merging spi/for-next (e00ee68dc1f7 Merge remote-tracking branch 'spi/for-5.=
11' into spi-next)
Merging tip/auto-latest (65609b26b21a Merge branch 'locking/urgent')
Merging clockevents/timers/drivers/next (f087e452f27e clocksource: sp804: e=
nable Hisilicon sp804 timer 64bit mode)
Merging edac/edac-for-next (f09056c1dece EDAC/amd64: Remove unneeded breaks)
Merging irqchip/irq/irqchip-next (a7480c5d725c irqchip/sifive-plic: Fix bro=
ken irq_set_affinity() callback)
Merging ftrace/for-next (e1981f75d398 ring-buffer: Update the description f=
or ring_buffer_wait)
Merging rcu/rcu/next (a9863c90f503 Merge branch 'urezki-pcount.2020.10.01a'=
 into HEAD)
CONFLICT (content): Merge conflict in include/linux/lockdep.h
Merging kvm/linux-next (e792415c5d3e KVM: MIPS/VZ: Fix build error caused b=
y 'kvm_run' cleanup)
Merging kvm-arm/next (4e5dc64c4319 Merge branches 'kvm-arm64/pt-new' and 'k=
vm-arm64/pmu-5.9' into kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (cf59eb13e151 KVM: PPC: Book3S: Fix symbol und=
eclared warnings)
Merging kvms390/next (23a60f834406 s390/kvm: diagnose 0x318 sync and reset)
Merging xen-tip/linux-next (1a89c1dc9520 Documentation: add xen.fifo_events=
 kernel parameter description)
Merging percpu/for-next (38cabe062b96 Merge branch 'for-5.10-fixes' into fo=
r-next)
Merging workqueues/for-next (10cdb1575954 workqueue: use BUILD_BUG_ON() for=
 compile time test instead of WARN_ON())
Merging drivers-x86/for-next (3650b228f83a Linux 5.10-rc1)
Merging chrome-platform/for-next (3650b228f83a Linux 5.10-rc1)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (3650b228f83a Linux 5.10-rc1)
Merging ipmi/for-next (0df7b988d9df char: ipmi: remove unneeded break)
Merging driver-core/driver-core-next (3650b228f83a Linux 5.10-rc1)
Merging usb/usb-next (3650b228f83a Linux 5.10-rc1)
Merging usb-gadget/next (b2c586eb07ef usb: dwc2: Fix INTR OUT transfers in =
DDMA mode.)
Merging usb-serial/usb-next (d1849b9ff9f4 USB: serial: iuu_phoenix: remove =
unneeded break)
Merging usb-chipidea-next/ci-for-usb-next (71ac680e6339 usb: chipidea: ci_h=
drc_imx: restore pinctrl)
Merging phy-next/next (3650b228f83a Linux 5.10-rc1)
Merging tty/tty-next (3650b228f83a Linux 5.10-rc1)
Merging char-misc/char-misc-next (3650b228f83a Linux 5.10-rc1)
Merging extcon/extcon-next (ca26071da1bb dt-bindings: extcon: add binding f=
or TUSB320)
Merging soundwire/next (3650b228f83a Linux 5.10-rc1)
Merging thunderbolt/next (3650b228f83a Linux 5.10-rc1)
Merging vfio/next (2e6cfd496f5b vfio iommu type1: Fix memory leak in vfio_i=
ommu_type1_pin_pages)
Merging staging/staging-next (9ab476ba001e staging: r8188eu: inline rtw_ini=
t_netdev_name())
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (fce52ad34832 interconnect: qcom: use icc_sync state f=
or sm8[12]50)
Merging dmaengine/next (3650b228f83a Linux 5.10-rc1)
Merging cgroup/for-next (65026da59cda cgroup: Zero sized write should be no=
-op)
Merging scsi/for-next (fab09aaee803 scsi: hisi_sas: Stop using queue #0 alw=
ays for v2 hw)
Merging scsi-mkp/for-next (f24a69a43c95 scsi: aic7xxx: aic79xx: Return nega=
tive error when register access fails)
Merging vhost/linux-next (70a62fce2628 vdpa_sim: implement get_iova_range())
Merging rpmsg/for-next (49a29612d7cf Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (3d6e8262d3c0 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (11b3de087a1c dt-bindings: gpio: pca953x: A=
dd support for the NXP PCAL9554B/C)
Merging gpio-intel/for-next (3650b228f83a Linux 5.10-rc1)
Merging pinctrl/for-next (c348abca14dc Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (f3c75e7a9349 pinctrl: intel: Set default bi=
as in case no particular value given)
Merging pinctrl-samsung/for-next (c5564a50d990 pinctrl: samsung: s3c24xx: r=
emove unneeded break)
Merging pwm/for-next (3b1954cd57bf dt-bindings: pwm: renesas,pwm-rcar: Add =
r8a7742 support)
Merging userns/for-next (7fce69dff8db Implement kernel_execve)
Merging ktest/for-next (ff131efff141 ktest.pl: Fix spelling mistake "Cant" =
-> "Can't")
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (b2f1c3db2887 kselftest: Extend vdso correctness tes=
t to clock_gettime64)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (59fc1e476962 Merge branch 'for-5.10/flive-pa=
tching' into for-next)
Merging coresight/next (200bbb88b76c coresight: add module license)
Merging rtc/rtc-next (ba1c30bf3f25 rtc: pcf2127: fix pcf2127_nvmem_read/wri=
te() returns)
Merging nvdimm/libnvdimm-for-next (a1b8638ba132 Linux 5.9-rc7)
Merging at24/at24/for-next (3650b228f83a Linux 5.10-rc1)
Merging ntb/ntb-next (3650b228f83a Linux 5.10-rc1)
Merging seccomp/for-next/seccomp (57a339117e52 selftests/seccomp: Compare b=
itmap vs filter overhead)
Merging kspp/for-next/kspp (9b80e4c4ddac overflow: Add __must_check attribu=
te to check_*() helpers)
Merging gnss/gnss-next (48778464bb7d Linux 5.8-rc2)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (c3e02abdf9af slimbus: fix a kernel-doc markup)
Merging nvmem/for-next (d9dc6001196e dt-bindings: nvmem: mtk-efuse: add doc=
umentation for MT8516 SoC)
Merging xarray/main (fb11305101c2 XArray: Fix split documentation)
Merging hyperv/hyperv-next (626b901f6044 Drivers: hv: vmbus: Add parsing of=
 VMbus interrupt in ACPI DSDT)
Merging auxdisplay/auxdisplay (bbf5c979011a Linux 5.9)
Merging kgdb/kgdb/for-next (d081a6e35316 kdb: Fix pager search for multi-li=
ne strings)
Merging pidfd/for-next (e06ce5515b74 Merge branch 'pidfd_o_nonblock' into f=
or-next)
Merging hmm/hmm (3650b228f83a Linux 5.10-rc1)
Merging fpga/for-next (cbadbf5a53b5 Merge branch 'dfl_modularization' into =
for-next)
Merging kunit/test (3650b228f83a Linux 5.10-rc1)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (5de15b610f78 mtd: hyperbus: add Renesas RPC-IF driver)
Merging kunit-next/kunit (3650b228f83a Linux 5.10-rc1)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (298edb32160f bus: mhi: debugfs: Print channel context=
 read-pointer)
Merging notifications/notifications-pipe-core (841a0dfa5113 watch_queue: sa=
mple: Display mount tree change notifications)
CONFLICT (content): Merge conflict in include/uapi/asm-generic/unistd.h
CONFLICT (content): Merge conflict in arch/xtensa/kernel/syscalls/syscall.t=
bl
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_64.tbl
CONFLICT (content): Merge conflict in arch/x86/entry/syscalls/syscall_32.tbl
CONFLICT (content): Merge conflict in arch/sparc/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/sh/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/s390/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/powerpc/kernel/syscalls/syscall.=
tbl
CONFLICT (content): Merge conflict in arch/parisc/kernel/syscalls/syscall.t=
bl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_o32=
.tbl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_n64=
.tbl
CONFLICT (content): Merge conflict in arch/mips/kernel/syscalls/syscall_n32=
.tbl
CONFLICT (content): Merge conflict in arch/microblaze/kernel/syscalls/sysca=
ll.tbl
CONFLICT (content): Merge conflict in arch/m68k/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/ia64/kernel/syscalls/syscall.tbl
CONFLICT (content): Merge conflict in arch/arm64/include/asm/unistd32.h
CONFLICT (content): Merge conflict in arch/arm/tools/syscall.tbl
CONFLICT (content): Merge conflict in arch/alpha/kernel/syscalls/syscall.tbl
Applying: rest of merge fix up for syscall conflict
Merging memblock/for-next (762d4d1a174c arch/ia64: Restore arch-specific pg=
d_offset_k implementation)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (2095725c325b drivers/edac: convert pci counters =
to counter_atomic32)
CONFLICT (content): Merge conflict in lib/Makefile
CONFLICT (content): Merge conflict in drivers/char/ipmi/ipmi_msghandler.c
Merging akpm-current/current (c8a1d90e0bdd lib/lzo/lzo1x_compress.c: make l=
zogeneric1x_1_compress() static)
CONFLICT (content): Merge conflict in include/linux/sched.h
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (b05c4cc686fc mm/gup: assert that the mmap lock is held=
 in __get_user_pages())

--Sig_/lu1QMvYnIzIKSCuUdIJJpwc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+Y8J4ACgkQAVBC80lX
0Gwrgwf/eHcjSnIRdCwZfEcT/t4mO6OARRvcL/asmUwQolk/Wxz/26hKkxl231/U
W+vY3hhqB2JGrSHgq1O7iDGo/bUUwD7cw6NMSXLcwhejv/AGyjFWwmG6dI90T+pH
itkmNgdP8OiRSaPxsnOWpL5FED57EhlciITdzkPLJ3HlbD4h1mdmnHRGbZSmmoIQ
2KhBnRIsz8JJDwogyyYzeVh3aD4NWNufXjTNRz8vSmUA5F+TP8gG22LgzX3zUuzY
yAZnJYD9IA/j34Y3Pz/3cuYsQ5GK3nU9Cbtdtthc6tFcqWMA49yzTIunDnUJNfgO
PzZYp0Z/4Hzbzr+vm/GWDF5ZKCe67g==
=11eZ
-----END PGP SIGNATURE-----

--Sig_/lu1QMvYnIzIKSCuUdIJJpwc--
