Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C749D2AE936
	for <lists+linux-next@lfdr.de>; Wed, 11 Nov 2020 07:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgKKGsv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Nov 2020 01:48:51 -0500
Received: from ozlabs.org ([203.11.71.1]:36659 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725867AbgKKGsf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Nov 2020 01:48:35 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CWFgH63yHz9s0b;
        Wed, 11 Nov 2020 17:48:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605077307;
        bh=ZnsrUwBSnw3dXdOuKGRlPKdtL9u8v7xaxRQzBJGd+1I=;
        h=Date:From:To:Cc:Subject:From;
        b=Hrw47pXNUv/t+A9LxhuPcEOSQUu8b7gXhQabLUmQNPnQq+jWI0wrTxxHKuNzpvra2
         lFDiP0RCFslR4WDOXFcwxPK/OTdJBWd/7wRfr7pB6HI3veRYQuMNzhnTiihkL0s0KX
         yFnkBTi5cnSV2JXMZA5jQjDoGQpo17UwmL7PFkzXqRYGO3RiJhgLCNB96N88tcks3U
         d6aoP6cf7X7Qli9+DzVyxQQh3bHarY9v5QJ2qoOqk1UjkmI7916+fiDC8OWms63Lfq
         /8pdcbL72FKUJ7RZirdLXe/l4ThVSI5GwuKeefVGeo7IQyTOXQJ4/tDhqsHQwViPsQ
         PldTQ1mgfCi5Q==
Date:   Wed, 11 Nov 2020 17:48:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 11
Message-ID: <20201111174826.732b0b21@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SgoCELQhyksoudiaT.wnaUd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SgoCELQhyksoudiaT.wnaUd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20201110:

New tree: stm32

The drivers-memory tree still had its build failure.

The mac80211-next tree gained a build failure, so I used the version
from next-20201110.

The drm-misc tree lost its build failure.

The akpm tree gained a build failure for which I applied a patch.

Non-merge commits (relative to Linus' tree): 4465
 4753 files changed, 513029 insertions(+), 76414 deletions(-)

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
Merging origin/master (eccc87672492 Merge branch 'fixes' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/viro/vfs)
Merging fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging kbuild-current/fixes (d1889589a4f5 builddeb: Fix rootless build in =
setuid/setgid directory)
Merging arc-current/for-curr (3b57533b460c ARC: [plat-hsdk] Remap CCMs supe=
r early in asm boot trampoline)
Merging arm-current/fixes (9fa2e7af3d53 ARM: 9019/1: kprobes: Avoid fortify=
_panic() when copying optprobe template)
Merging arm64-fixes/for-next/fixes (04e613ded8c2 arm64: smp: Tell RCU about=
 CPUs that fail to come online)
Merging arm-soc-fixes/arm/fixes (3d696f42c7f4 soc: ti: ti_sci_pm_domains: c=
heck for proper args count in xlate)
Merging drivers-memory-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging m68k-current/for-linus (50c5feeea0af ide/macide: Convert Mac IDE dr=
iver to platform driver)
Merging powerpc-fixes/fixes (01776f070ffc powerpc/32s: Use relocation offse=
t when setting early hash table)
Merging s390-fixes/fixes (ce9dfafe29be s390: fix system call exit path)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (92cfcd030e4b fscrypt: remove reachable =
WARN in fscrypt_setup_iv_ino_lblk_32_key())
Merging net/master (989ef49bdf10 mptcp: provide rmem[0] limit)
Merging bpf/master (abbaa433de07 bpf: Fix passing zero to PTR_ERR() in bpf_=
btf_printf_prepare)
Merging ipsec/master (bc0230b6461c Merge branch 'xfrm/compat: syzbot-found =
fixes')
Merging netfilter/master (fea07a487c6d net: openvswitch: silence suspicious=
 RCU usage warning)
Merging ipvs/master (fea07a487c6d net: openvswitch: silence suspicious RCU =
usage warning)
Merging wireless-drivers/master (fe56d05ee6c8 iwlwifi: mvm: fix kernel pani=
c in case of assert during CSA)
Merging mac80211/master (989ef49bdf10 mptcp: provide rmem[0] limit)
Merging rdma-fixes/for-rc (f8394f232b1e Linux 5.10-rc3)
Merging sound-current/for-linus (446b8185f0c3 ALSA: hda/realtek - Add suppo=
rted for Lenovo ThinkPad Headset Button)
Merging sound-asoc-fixes/for-linus (025893350b74 Merge remote-tracking bran=
ch 'asoc/for-5.10' into asoc-linus)
Merging regmap-fixes/for-linus (780f88b04704 Merge remote-tracking branch '=
regmap/for-5.10' into regmap-linus)
Merging regulator-fixes/for-linus (c088a4985e5f regulator: core: don't disa=
ble regulator if is_enabled return error.)
Merging spi-fixes/for-linus (1a7154e2ec65 Merge remote-tracking branch 'spi=
/for-5.10' into spi-linus)
Merging pci-current/for-linus (832ea234277a PCI: mvebu: Fix duplicate resou=
rce requests)
Merging driver-core.current/driver-core-linus (f8394f232b1e Linux 5.10-rc3)
Merging tty.current/tty-linus (f8394f232b1e Linux 5.10-rc3)
Merging usb.current/usb-linus (368183029cc4 Merge tag 'thunderbolt-for-v5.1=
0-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt=
 into usb-linus)
Merging usb-gadget-fixes/fixes (129aa9734559 usb: raw-gadget: fix memory le=
ak in gadget_setup)
Merging usb-serial-fixes/usb-linus (f8394f232b1e Linux 5.10-rc3)
Merging usb-chipidea-fixes/for-usb-fixes (e11d2bf27158 usb: cdns3: gadget: =
own the lock wrongly at the suspend routine)
Merging phy/fixes (25d76fed7ffe phy: cpcap-usb: Use IRQF_ONESHOT)
Merging staging.current/staging-linus (aee9dccc5b64 staging: rtl8723bs: Add=
 024c:0627 to the list of SDIO device-ids)
Merging char-misc.current/char-misc-linus (092561f06702 uio: Fix use-after-=
free in uio_unregister_device())
Merging soundwire-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging thunderbolt-fixes/fixes (f6439c531d52 thunderbolt: Add support for =
Intel Tiger Lake-H)
Merging input-current/for-linus (77e70d351db7 Input: sunkbd - avoid use-aft=
er-free in teardown paths)
Merging crypto-current/master (c3a98c3ad5c0 crypto: x86/poly1305 - add back=
 a needed assignment)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (e4eccb853664 vfio/pci: Bypass IGD init in cas=
e of -ENODEV)
Merging kselftest-fixes/fixes (7d764b685ee1 selftests: binderfs: use SKIP i=
nstead of XFAIL)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (29a25b9246f7 dmaengine: ti: omap-dma: Block =
PM if SDMA is busy to fix audio)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (9efac6ce7f62 mtd: rawnand: stm32_fmc2: fix bro=
ken ECC)
Merging mfd-fixes/for-mfd-fixes (22380b65dc70 mfd: mfd-core: Ensure disable=
d devices are ignored without error)
Merging v4l-dvb-fixes/fixes (9ac924b98728 media: cedrus: h264: Fix check fo=
r presence of scaling matrix)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (31b4d8e172f6 MIPS: export has_transparent_hu=
gepage() for modules)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (030464198f9d ARM: dts: am437x-l4: fix compatible =
for cpsw switch dt node)
Merging kvm-fixes/master (6d6a18fdde8b KVM: selftests: allow two iterations=
 of dirty_log_perf_test)
Merging kvms390-fixes/master (f20d4e924b44 docs: kvm: add documentation for=
 KVM_CAP_S390_DIAG318)
Merging hwmon-fixes/hwmon (18e8db7f6526 hwmon: (pmbus) Add mutex locking fo=
r sysfs reads)
Merging nvdimm-fixes/libnvdimm-fixes (88b67edd7247 dax: Fix compilation for=
 CONFIG_DAX && !CONFIG_FS_DAX)
Merging btrfs-fixes/next-fixes (6ce53ec0aba7 Merge branch 'misc-5.10' into =
next-fixes)
Merging vfs-fixes/fixes (77f6ab8b7768 don't dump the threads that had been =
already exiting when zapped.)
Merging dma-mapping-fixes/for-linus (892fc9f6835e dma-pool: Fix an uninitia=
lized variable bug in atomic_pool_expand())
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging samsung-krzk-fixes/fixes (cd12e4f14f7c CREDITS: remove trailing whi=
te spaces)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging pinctrl-samsung-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging devicetree-fixes/dt/linus (f84e2c5c528d dt-bindings: Another round =
of adding missing 'additionalProperties/unevalutatedProperties')
Merging scsi-fixes/fixes (0f52fcb99ea2 scsi: ufs: Try to save power mode ch=
ange and UIC cmd completion timeout)
Merging drm-fixes/drm-fixes (f8394f232b1e Linux 5.10-rc3)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (2f5f2e25e025 drm/i915/gem: Al=
low backends to override pread implementation)
Merging mmc-fixes/fixes (03d80e042a8e Revert "mmc: renesas_sdhi: workaround=
 a regression when reinserting SD cards")
Merging rtc-fixes/rtc-fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging gnss-fixes/gnss-linus (48778464bb7d Linux 5.8-rc2)
Merging hyperv-fixes/hyperv-fixes (dbf563eee0b8 x86/hyperv: Clarify comment=
 on x2apic mode)
Merging soc-fsl-fixes/fix (fe8fe7723a3a soc: fsl: dpio: register dpio irq h=
andlers after dpio create)
Merging risc-v-fixes/fixes (c2c81bb2f691 RISC-V: Fix the VDSO symbol genera=
ton for binutils-2.35+)
Merging pidfd-fixes/fixes (bda4c60d02e9 sys: Convert to the new fallthrough=
 notation)
Merging fpga-fixes/fixes (8614afd689df fpga: dfl: fix bug in port reset han=
dshake)
Merging spdx/spdx-linus (3cea11cd5e3b Linux 5.10-rc2)
Merging gpio-intel-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging pinctrl-intel-fixes/fixes (f3c75e7a9349 pinctrl: intel: Set default=
 bias in case no particular value given)
Merging erofs-fixes/fixes (a30573b3cdc7 erofs: fix setting up pcluster for =
temporary pages)
Merging integrity-fixes/fixes (843385694721 evm: Fix a small race in init_d=
esc())
Merging kunit-fixes/kunit-fixes (3084db0e0d50 kunit: fix display of failed =
expectations for strings)
Merging ubifs-fixes/fixes (78c7d49f55d8 ubifs: journal: Make sure to not di=
rty twice for auth nodes)
Merging memblock-fixes/fixes (b9bc36704cca ARM, xtensa: highmem: avoid clob=
bering non-page aligned memory reservations)
Merging drm-misc-fixes/for-linux-next-fixes (06ad8d339524 drm/gma500: Fix o=
ut-of-bounds access to struct drm_device.vblank[])
Merging kspp-gustavo/for-next/kspp (3650b228f83a Linux 5.10-rc1)
Merging kbuild/for-next (729e39a558eb kconfig: qconf: convert to Qt5 new si=
gnal/slot connection syntax)
Merging compiler-attributes/compiler-attributes (bbf5c979011a Linux 5.9)
Merging dma-mapping/for-next (48ab6d5d1f09 dma-mapping: fix 32-bit overflow=
 with CONFIG_ARM_LPAE=3Dn)
Merging asm-generic/master (78d127fd6892 Merge branch 'asm-generic-timers' =
into asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (a0796429c6ab arm: add support for TIF_NOTIFY_SIGNAL *=
for build testing with linux-next*)
Merging arm64/for-next/core (8221882eca66 Merge branches 'for-next/va-refac=
tor', 'for-next/lto', 'for-next/mem-hotplug' and 'for-next/misc' into for-n=
ext/core)
Merging arm-perf/for-next/perf (887e2cff0f8d perf: arm-cmn: Fix conversion =
specifiers for node type)
Merging arm-soc/for-next (36ab3c32cafc ARM: SoC: document merges)
Merging amlogic/for-next (84a1411c7549 Merge branch 'v5.11/soc' into tmp/am=
l-rebuild)
Merging aspeed/for-next (93db293b2aba Merge branch 'soc-for-v5.11' into for=
-next)
Merging at91/at91-next (0698efbb33ef Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging drivers-memory/for-next (0afa08cf8706 Merge branch 'for-v5.11/tegra=
-mc' into for-next)
Applying: fix "memory: tegra: Add and use devm_tegra_memory_controller_get(=
)"
Merging imx-mxs/for-next (c37ca3890c0c Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (a5e886fb26f2 Merge branch 'for_5.11/drivers-soc' int=
o next)
Merging mediatek/for-next (9c6658a0dd4f Merge branch 'v5.10-next/soc' into =
for-next)
Merging mvebu/for-next (f89c9685f6a1 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (71b51fb77745 Merge branch 'omap-for-v5.11/dt' into f=
or-next)
Merging qcom/for-next (25d25c5f83b1 Merge branches 'arm64-for-5.11', 'drive=
rs-for-5.11' and 'dts-for-5.11' into for-next)
Merging raspberrypi/for-next (4564363351e2 ARM: dts: bcm2711: Enable the di=
splay pipeline)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (6215772bbe58 Merge branches 'renesas-arm-defconfig-fo=
r-v5.11' and 'renesas-arm-dt-for-v5.11' into renesas-next)
Merging reset/reset/next (da8c0e4ee95a reset: meson: make it possible to bu=
ild as a module)
Merging rockchip/for-next (6d84cf53a456 Merge branch 'v5.11-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (b2205eb74f0d Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (3cea11cd5e3b Linux 5.10-rc2)
Merging stm32/stm32-next (a41ee1a9bf6d ARM: dts: stm32: reorder spi4 within=
 stm32mp15-pinctrl)
Merging sunxi/sunxi/for-next (12f6c7209fc3 Merge branch 'sunxi/dt-for-5.11'=
 into sunxi/for-next)
Merging tegra/for-next (01d1c33a8d38 Merge branch for-5.11/arm64/dt into fo=
r-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (9dcd17be61e4 arm64: dts: ti: k3-am65: ringacc=
: drop ti, dma-ring-reset-quirk)
Merging clk/clk-next (f1b6e57d4e4b Merge branch 'clk-qcom' into clk-next)
Applying: clk: pm_clock: provide stubs for pm_clk_runtime_suspend/_resume
Merging clk-samsung/for-next (ff8e0ff9b996 clk: samsung: Use cached clk_hws=
 instead of __clk_lookup() calls)
Merging csky/linux-next (d09101cb3c22 csky: Fixup show_regs doesn't contain=
 regs->usp)
Merging h8300/h8300-next (8808515be0ed h8300: Replace <linux/clk-provider.h=
> by <linux/of_clk.h>)
Merging ia64/next (c331649e6371 ia64: Use libata instead of the legacy ide =
driver in defconfigs)
Merging m68k/for-next (1fe9bacab2ac m68k: Remove unused mach_max_dma_addres=
s)
Merging m68knommu/for-next (4f39612a50c7 m68k: m68328: remove duplicate cod=
e)
Merging microblaze/next (e167a59c654a microblaze: Replace <linux/clk-provid=
er.h> by <linux/of_clk.h>)
Merging mips/mips-next (c424dc4cd180 mips: Vr41xx: add missing iounmap() on=
 error in vr41xx_pciu_init())
Merging nds32/next (54bde873682b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (1da81e5562fa drivers/tty/serial: add LiteUART dr=
iver)
Merging parisc-hd/for-next (34f255dec4d9 parisc: Make user stack size confi=
gurable)
CONFLICT (content): Merge conflict in arch/parisc/kernel/time.c
Applying: revert the rest of "parisc: use legacy_timer_tick"
Merging powerpc/next (3cea11cd5e3b Linux 5.10-rc2)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (d97b957e32b1 soc: fsl: qe: Remove unnessesary check i=
n ucc_set_tdm_rxtx_clk)
Merging risc-v/for-next (ae386e9d809c riscv: Ignore Image.* and loader.bin)
Merging s390/for-next (191f15485624 Merge branch 'features' into for-next)
Merging sh/for-next (b0cfc315ff38 sh: fix syscall tracing)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (9a5085b3fad5 um: Call pgtable_pmd_page_dtor() in __=
pmd_free_tlb())
Merging xtensa/xtensa-for-next (4ca4c562efb6 xtensa: uaccess: Add missing _=
_user to strncpy_from_user() prototype)
Merging fscrypt/master (5b2a828b98ec fscrypt: export fscrypt_d_revalidate())
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (a12315094469 Merge branch 'for-next-next-v5.10-2020=
1105' into for-next-20201105)
Merging ceph/master (62575e270f66 ceph: check session state after bumping s=
ession->s_seq)
Merging cifs/for-next (9809e2b5c061 cifs: fix a memleak with modefromsid)
Merging configfs/for-next (76ecfcb0852e samples: configfs: prefer pr_err() =
over bare printk(KERN_ERR)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (915f4c9358db erofs: remove unnecessary enum entries)
Merging exfat/dev (f9893351acae Merge tag 'kconfig-v5.10' of git://git.kern=
el.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging ext3/for_next (22435b281728 Merge fanotify parent info fix and inot=
ify limits improvements.)
Merging ext4/dev (05d5233df85e jbd2: fix up sparse warnings in checkpoint c=
ode)
Merging f2fs/dev (aabe197f7422 f2fs: add F2FS_IOC_SET_COMPRESS_OPTION ioctl)
Merging fsverity/fsverity (f3db0bed4583 fs-verity: use smp_load_acquire() f=
or ->i_verity_info)
Merging fuse/for-next (42d3e2d041f0 virtiofs: calculate number of scatter-g=
ather elements accurately)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (f8394f232b1e Linux 5.10-rc3)
Merging nfs-anna/linux-next (7302e49ff190 NFS: Remove unnecessary inode loc=
k in nfs_fsync_dir())
Merging nfsd/nfsd-next (ae2975046dbc net/sunrpc: fix useless comparison in =
proc_do_xprt())
Merging cel/cel-next (6c17eb98521e nfsd/nfs3: remove unused macro nfsd3_fha=
ndleres)
Merging orangefs/for-next (e848643b524b orangefs: remove unnecessary assign=
ment to variable ret)
Merging overlayfs/overlayfs-next (be4df0cea08a ovl: use generic vfs_ioc_set=
flags_prepare() helper)
Merging ubifs/next (e2a05cc7f822 ubifs: mount_ubifs: Release authentication=
 resource in error handling path)
Merging v9fs/9p-next (7ca1db21ef8e net: 9p: initialize sun_server.sun_path =
to have addr's value only when addr is valid)
Merging xfs/for-next (46afb0628b86 xfs: only flush the unshared range in xf=
s_reflink_unshare)
Merging zonefs/for-next (48bfd5c6fac1 zonefs: document the explicit-open mo=
unt option)
Merging iomap/iomap-for-next (1a31182edd00 iomap: Call inode_dio_end() befo=
re generic_write_sync())
Merging djw-vfs/vfs-for-next (407e9c63ee57 vfs: move the generic write and =
copy checks out of mm)
Merging file-locks/locks-next (8d1ddb5e7937 fcntl: Fix potential deadlock i=
n send_sig{io, urg}())
Merging vfs/for-next (61c207915a76 Merge branches 'work.sparc', 'work.epoll=
', 'work.sparc32' and 'regset.followup' into for-next)
Merging printk/for-next (9194df34b8b8 Merge branch 'for-5.10-trivial' into =
for-next)
Merging pci/next (405196258f54 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (137c6236aeec mailmap: Add WeiXiong Liao)
CONFLICT (content): Merge conflict in .mailmap
Merging hid/for-next (42e584ce112d Merge branch 'for-5.10/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (c97e7615c15b Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (abea14bfdebb i3c: master: Fix error return in cdns_i3=
c_master_probe())
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (02a316e583d9 hwmon: (corsair-psu) fix uni=
ntentional sign extension issue)
Merging jc_docs/docs-next (f8394f232b1e Linux 5.10-rc3)
Merging v4l-dvb/master (0ab4f9087ea9 media: platform: add missing put_devic=
e() call in mtk_jpeg_probe() and mtk_jpeg_remove())
CONFLICT (content): Merge conflict in drivers/media/platform/marvell-ccic/m=
mp-driver.c
Merging v4l-dvb-next/master (d0a9fffedca1 docs: fs: api-summary.rst: get ri=
d of kernel-doc include)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (fc4b18739b23 Merge branch 'acpi-dptf' into linux-nex=
t)
Merging cpufreq-arm/cpufreq/arm/linux-next (a43128837003 cpufreq: mediatek:=
 add missing platform_driver_unregister() on error in mtk_cpufreq_driver_in=
it)
Merging cpupower/cpupower (748f0d70087c cpupower: Provide online and offlin=
e CPU information)
Merging devfreq/devfreq-next (09d56d92ad25 PM / devfreq: tegra30: Silence d=
eferred probe error)
Merging opp/opp/linux-next (4e6fe1a4123c drm/lima: Unconditionally call dev=
_pm_opp_of_remove_table())
Merging thermal/thermal/linux-next (ef63b043ac86 thermal: intel: pch: fix S=
0ix failure due to PCH temperature above threshold)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (4f19d071f9be fs: dlm: check on existing node address)
Merging swiotlb/linux-next (fc0021aa340a swiotlb: remove the tbl_dma_addr a=
rgument to swiotlb_tbl_map_single)
Merging rdma/for-next (f946e45f59ef IB/mlx5: Add support for NDR link speed)
Merging net-next/master (1aa844b92176 net: pch_gbe: remove unneeded variabl=
e retval in __pch_gbe_suspend)
Merging bpf-next/for-next (9600d623dba4 Merge branch 'Remove unused test_ip=
ip.sh test and add missed')
Merging ipsec-next/master (8be33ecfc1ff net: skb_vlan_untag(): don't reset =
transport offset if set by GRO layer)
Merging mlx5-next/mlx5-next (3650b228f83a Linux 5.10-rc1)
Merging netfilter-next/master (c9448e828d11 Merge tag 'mlx5-updates-2020-11=
-03' of git://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux)
Merging ipvs-next/master (c9448e828d11 Merge tag 'mlx5-updates-2020-11-03' =
of git://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux)
Merging wireless-drivers-next/master (1ccaa898868d rtw88: coex: simplify th=
e setting and condition about WLAN TX limitation)
Merging bluetooth/master (0d484db60fc0 Bluetooth: btusb: btrtl: Add support=
 for RTL8852A)
Merging mac80211-next/master (526fa517d287 nl80211: fix kernel-doc warning =
in the new SAE attribute)
$ git reset --hard HEAD^
Merging next-20201110 version of mac80211-next
Merging gfs2/for-next (f9ddc8b10f69 gfs2: fix possible reference leak in gf=
s2_check_blk_type)
Merging mtd/mtd/next (232b67c39942 mtd: remove unneeded break)
Merging nand/nand/next (3ebbdef13f82 mtd: rawnand: sunxi: Add MDMA support)
Merging spi-nor/spi-nor/next (ad624dfd7bb6 mtd: spi-nor: micron-st: allow u=
sing MT35XU512ABA in Octal DTR mode)
Merging crypto/master (ab95bd2aa904 crypto: caam - fix printing on xts fall=
back allocation error path)
Merging drm/drm-next (512bce50a41c Merge v5.10-rc3 into drm-next)
Merging amdgpu/drm-next (6f60b0ddcfa0 drm/amdgpu: Enable GPU reset for vang=
ogh)
Merging drm-intel/for-linux-next (1ba1014db258 drm/i915/edp/jsl: Update vsw=
ing table for HBR and HBR2)
Merging drm-tegra/drm/tegra/for-next (cb7ff314e1d9 drm/tegra: sor: Don't wa=
rn on probe deferral)
Merging drm-misc/for-linux-next (7e542ff8b463 drm/mediatek: Use struct dma_=
buf_map in GEM vmap ops)
Applying: swiotlb: using SIZE_MAX needs limits.h included
Merging drm-msm/msm-next (e8c765811b10 drm/msm/dp: do not notify audio subs=
ystem if sink doesn't support audio)
CONFLICT (content): Merge conflict in include/drm/drm_crtc.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/msm_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/disp/dpu1/dpu_crt=
c.c
Applying: drm/msm/gem: fix up for "drm/msm: Introduce GEM object funcs"
Merging imx-drm/imx-drm/next (36fba366cf9f drm/imx: tve remove extraneous t=
ype qualifier)
Merging etnaviv/etnaviv/next (4612bad5701e drm/etnaviv: Add lockdep annotat=
ions for context lock)
Merging regmap/for-next (f243af4d473b Merge remote-tracking branch 'regmap/=
for-5.11' into regmap-next)
Merging sound/for-next (8461352ddf07 ALSA: firewire: fix comparison to bool=
 warning)
Merging sound-asoc/for-next (908401b6a0ee Merge remote-tracking branch 'aso=
c/for-5.11' into asoc-next)
Merging modules/modules-next (24b9f0d22081 module: fix comment style)
Merging input/next (7e9098914161 Input: synaptics-rmi4 - fix kerneldoc warn=
ings)
Merging block/for-next (6d95853fb8ee Merge branch 'tif-task_work.arch' into=
 for-next)
Merging device-mapper/for-next (28784347451f dm: rename multipath path sele=
ctor source files to have "dm-ps" prefix)
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (fc69b6a3113a Merge branch 'fixes' into next)
Merging mfd/for-mfd-next (b1b8cd18347e gpio: tps65910: use regmap accessors)
Merging backlight/for-backlight-next (789eb04b6c56 backlight: pwm_bl: Fix i=
nterpolation)
Merging battery/for-next (7007fab4ae82 power: reset: POWER_RESET_OCELOT_RES=
ET should depend on Ocelot or Sparx5)
Merging regulator/for-next (da358c105604 Merge remote-tracking branch 'regu=
lator/for-5.11' into regulator-next)
Merging security/next-testing (bc62d68e2a0a device_cgroup: Fix RCU list deb=
ugging warning)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (b000d5cb954f ima: defer arch_ima_get_secu=
reboot() call to IMA init time)
Merging keys/keys-next (b6f61c314649 keys: Implement update for the big_key=
 type)
Merging safesetid/safesetid-next (03ca0ec13892 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (200ea5a2292d selinux: fix inode_doinit_with_dentry() =
LABEL_INVALID error handling)
Merging smack/next (edd615371b66 Smack: Remove unnecessary variable initial=
ization)
Merging tomoyo/master (e991a40b3d00 tomoyo: Limit wildcard recursion depth.)
Merging tpmdd/next (8ffd778aff45 tpm: efi: Don't create binary_bios_measure=
ments file for an empty log)
Merging watchdog/master (3650b228f83a Linux 5.10-rc1)
Merging iommu/next (4dd6ce478003 iommu: Fix a check in iommu_check_bind_dat=
a())
Merging audit/next (6d915476e67d audit: trigger accompanying records when n=
o rules present)
Merging devicetree/for-next (616fde2dd60f dt-bindings: misc: convert fsl,dp=
aa2-console from txt to YAML)
Merging mailbox/mailbox-for-next (c7dacf5b0f32 mailbox: avoid timer start f=
rom callback)
Merging spi/for-next (ea42ca2fc95e Merge remote-tracking branch 'spi/for-5.=
11' into spi-next)
Merging tip/auto-latest (8624d09ea0d5 Merge branch 'core/entry')
Merging clockevents/timers/drivers/next (732019fef32d dt-bindings: timer: A=
dd new OST support for the upcoming new driver.)
Merging edac/edac-for-next (82b9c922783e Merge branch 'edac-igen6' into eda=
c-for-next)
Merging irqchip/irq/irqchip-next (d95bdca75b3f irqchip/ti-sci-inta: Add sup=
port for unmapped event handling)
Merging ftrace/for-next (e1981f75d398 ring-buffer: Update the description f=
or ring_buffer_wait)
Merging rcu/rcu/next (005ea9053045 rcutorture: Use "all" and "last" in "noh=
z_full" and "rcu_nocbs")
Merging kvm/linux-next (e792415c5d3e KVM: MIPS/VZ: Fix build error caused b=
y 'kvm_run' cleanup)
Merging kvm-arm/next (c512298eed03 KVM: arm64: Remove AA64ZFR0_EL1 accessor=
s)
Merging kvm-ppc/kvm-ppc-next (cf59eb13e151 KVM: PPC: Book3S: Fix symbol und=
eclared warnings)
Merging kvms390/next (23a60f834406 s390/kvm: diagnose 0x318 sync and reset)
Merging xen-tip/linux-next (65cae18882f9 x86/xen: don't unbind uninitialize=
d lock_kicker_irq)
Merging percpu/for-next (eb4c8d15efda Merge branch 'for-5.11' into for-next)
Merging workqueues/for-next (10cdb1575954 workqueue: use BUILD_BUG_ON() for=
 compile time test instead of WARN_ON())
Merging drivers-x86/for-next (97ab4516205e platform/x86: intel-hid: fix _DS=
M function index handling)
Merging chrome-platform/for-next (3650b228f83a Linux 5.10-rc1)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (6c3e42616bf2 leds: various: add missing put_device()=
 call in netxbig_leds_get_of_pdata())
Merging ipmi/for-next (0df7b988d9df char: ipmi: remove unneeded break)
Merging driver-core/driver-core-next (33c0c9bdf7a5 drivers: base: fix some =
kernel-doc markups)
Merging usb/usb-next (57cde551225b Merge 5.10-rc3 into usb-next)
Merging usb-gadget/next (b2c586eb07ef usb: dwc2: Fix INTR OUT transfers in =
DDMA mode.)
Merging usb-serial/usb-next (975323ab8f11 USB: serial: mos7720: fix paralle=
l-port state restore)
Merging usb-chipidea-next/for-usb-next (4e8e3d65c0c2 usb: cdns3: Rids of du=
plicate error message)
Merging phy-next/next (c36f74566cef MAINTAINERS: Add entry for Qualcomm IPQ=
4019 USB PHY)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging tty/tty-next (9b085d6e8890 Merge 5.10-rc3 into tty-next)
Merging char-misc/char-misc-next (17adb469bf1e firmware: gsmi: Drop the use=
 of dma_pool_* API functions)
Merging extcon/extcon-next (54589b557a8d extcon: fsa9480: Support TI TSU611=
1 variant)
Merging soundwire/next (3650b228f83a Linux 5.10-rc1)
Merging thunderbolt/next (f8394f232b1e Linux 5.10-rc3)
Merging vfio/next (2e6cfd496f5b vfio iommu type1: Fix memory leak in vfio_i=
ommu_type1_pin_pages)
Merging staging/staging-next (f4acd33c446b staging: rtl8723bs: replace ieee=
80211_back_actioncode)
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (fce52ad34832 interconnect: qcom: use icc_sync state f=
or sm8[12]50)
Merging dmaengine/next (0e15ca5fe224 dmaengine: pxa_dma: remove redundant i=
rqsave and irqrestore in hardIRQ)
CONFLICT (content): Merge conflict in drivers/dma/idxd/registers.h
CONFLICT (content): Merge conflict in drivers/dma/idxd/device.c
Merging cgroup/for-next (65026da59cda cgroup: Zero sized write should be no=
-op)
Merging scsi/for-next (d63f64446ef4 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (151f1b664ffb scsi: ufs: Allow an error return va=
lue from ->device_reset())
Merging vhost/linux-next (29ea7644edd2 swiotlb: using SIZE_MAX needs limits=
.h included)
Merging rpmsg/for-next (3e53119a2521 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (4c15bd0cae70 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (37174f334130 gpio: tegra: Use raw_spinlock)
Merging gpio-intel/for-next (3650b228f83a Linux 5.10-rc1)
Merging pinctrl/for-next (c4f103cf8464 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0ddebf8580fa pinctrl: lynxpoint: Unify init=
call location in the code)
Merging pinctrl-samsung/for-next (c5564a50d990 pinctrl: samsung: s3c24xx: r=
emove unneeded break)
Merging pwm/for-next (3b1954cd57bf dt-bindings: pwm: renesas,pwm-rcar: Add =
r8a7742 support)
Merging userns/for-next (7fce69dff8db Implement kernel_execve)
Merging ktest/for-next (ff131efff141 ktest.pl: Fix spelling mistake "Cant" =
-> "Can't")
Merging random/dev (ab9a7e27044b random: avoid warnings for !CONFIG_NUMA bu=
ilds)
Merging kselftest/next (c2e46f6b3e35 selftests/cgroup: Fix build on older d=
istros)
Merging y2038/y2038 (c4e71212a245 Revert "drm/etnaviv: reject timeouts with=
 tv_nsec >=3D NSEC_PER_SEC")
Merging livepatching/for-next (59fc1e476962 Merge branch 'for-5.10/flive-pa=
tching' into for-next)
Merging coresight/next (c04e5d7bbf6f coresight: tmc-etr: Assign boolean val=
ues to a bool variable)
Merging rtc/rtc-next (28d211919e42 rtc: sun6i: Fix memleak in sun6i_rtc_clk=
_init)
Merging nvdimm/libnvdimm-for-next (a1b8638ba132 Linux 5.9-rc7)
Merging at24/at24/for-next (3650b228f83a Linux 5.10-rc1)
Merging ntb/ntb-next (3650b228f83a Linux 5.10-rc1)
Merging seccomp/for-next/seccomp (38c37e8fd3d2 arm: Enable seccomp architec=
ture tracking)
Merging kspp/for-next/kspp (9b80e4c4ddac overflow: Add __must_check attribu=
te to check_*() helpers)
Merging gnss/gnss-next (48778464bb7d Linux 5.8-rc2)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (c3e02abdf9af slimbus: fix a kernel-doc markup)
Merging nvmem/for-next (436d15fbeaee nvmem: qfprom: Don't touch certain fus=
es)
Merging xarray/main (fb11305101c2 XArray: Fix split documentation)
Merging hyperv/hyperv-next (626b901f6044 Drivers: hv: vmbus: Add parsing of=
 VMbus interrupt in ACPI DSDT)
Merging auxdisplay/auxdisplay (2cfd72f81cf6 auxdisplay: fix use after free =
in lcd2s_i2c_remove())
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
Merging mhi/mhi-next (666dc267e005 bus: mhi: core: Skip RDDM download for u=
nknown execution environment)
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
Merging counters/counters (3650b228f83a Linux 5.10-rc1)
Merging akpm-current/current (b6afcaed9a8a lib/lzo/lzo1x_compress.c: make l=
zogeneric1x_1_compress() static)
CONFLICT (content): Merge conflict in include/linux/sched.h
CONFLICT (content): Merge conflict in arch/arc/Kconfig
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (f93863f3c419 mm/gup: assert that the mmap lock is held=
 in __get_user_pages())
Applying: kasan-split-out-shadowc-from-commonc-fix2

--Sig_/SgoCELQhyksoudiaT.wnaUd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+riToACgkQAVBC80lX
0GyzuAf9ETWW4QVsaz8eKDrgniB+9RI+KXLmRJ2U/OF+OO+K9lYeeWaL+gU1R4+S
Jt00Bh6K8oAaEznivTulw5O04K8f8nmMN9pXdvOwLtNl5jJ6T/6jl4s44uHt3flD
3JHGicWeAcgikTdtib+KnIWDySoeVyFmmsMREaCjyu2Q4PN8feW0ZxHppSIRudnE
v33YZi9UdHekex0eRIOPx0XLdfFNYXlrHIFGkj8isn1o5NQltWoKGvquBUtfwTFQ
25cbXSmGZ+ZauckEEjA1o35roQiw09Slnti0d4emxXUjN3OskIXdqJ3BEV/siSNj
aEjxhp2a54CMautsfplr9S6ywzmSNg==
=OOx5
-----END PGP SIGNATURE-----

--Sig_/SgoCELQhyksoudiaT.wnaUd--
