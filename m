Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0502A3D72
	for <lists+linux-next@lfdr.de>; Tue,  3 Nov 2020 08:19:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727687AbgKCHTj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Nov 2020 02:19:39 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:49341 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725958AbgKCHTh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 3 Nov 2020 02:19:37 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CQLkq6yv8z9sT6;
        Tue,  3 Nov 2020 18:19:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604387972;
        bh=WxrFPAjKSOxefXxlXnvWvvEEFVesRxEXVNzk026uB8s=;
        h=Date:From:To:Cc:Subject:From;
        b=VuzuePwb/4h/DU5ciJD1cDJCLSwlT0agNP8ZBHAKdfEtCvhZauT4t0TK3G/fjJY3C
         VdTFnKJ2NiIwNcBZ6vBFm+sf0+CsmCfpBfeJXNDEp4y/DYaNhErpDc5pWgpODjcds/
         r0zYnL+rYGWxrxYVRxUA/fMhXs+LdG42DQkNzTcvIX/zJXsgWAtBpYeEdbeLy+mEnr
         Ms0PLQyrIrL8svy7WYsQpXmQ3aAw+O8TGCsHdybWeKjuMNFd/yHa7iYny6n28JTu3w
         sETnMsORGX/Zy5IJStroNbkicCCNt3NhGdOAR9oC8ruQ5sucO83iqowaqCvIBLhbUm
         Z5YilSGJdqBaA==
Date:   Tue, 3 Nov 2020 18:19:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 3
Message-ID: <20201103181931.0ea86551@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VpYFItkmT9J39AznRU2GoyZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VpYFItkmT9J39AznRU2GoyZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20201102:

The imx-mxs tree gained a build failure for which I reverted a commit.

The f2fs tree gained a build failure so I used the version from
next-20201102.

The amdgpu tree gained a conflict against Linus' tree.

The drm-misc tree gained a conflict against the amdgpu tree.

The pinctrl tree still had its build failure.

Non-merge commits (relative to Linus' tree): 2680
 3072 files changed, 350481 insertions(+), 36125 deletions(-)

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
Merging origin/master (b7cbaf59f62f Merge branch 'akpm' (patches from Andre=
w))
Merging fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging kbuild-current/fixes (d1889589a4f5 builddeb: Fix rootless build in =
setuid/setgid directory)
Merging arc-current/for-curr (3b57533b460c ARC: [plat-hsdk] Remap CCMs supe=
r early in asm boot trampoline)
Merging arm-current/fixes (9fa2e7af3d53 ARM: 9019/1: kprobes: Avoid fortify=
_panic() when copying optprobe template)
Merging arm64-fixes/for-next/fixes (ec9d78070de9 arm64: Change .weak to SYM=
_FUNC_START_WEAK_PI for arch/arm64/lib/mem*.S)
Merging arm-soc-fixes/arm/fixes (3d696f42c7f4 soc: ti: ti_sci_pm_domains: c=
heck for proper args count in xlate)
Merging drivers-memory-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging m68k-current/for-linus (50c5feeea0af ide/macide: Convert Mac IDE dr=
iver to platform driver)
Merging powerpc-fixes/fixes (99f070b62322 powerpc/smp: Call rcu_cpu_startin=
g() earlier)
Merging s390-fixes/fixes (8e90b4b1305a s390: correct __bootdata / __bootdat=
a_preserved macros)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (2b4eae95c736 fscrypt: don't evict dirty=
 inodes after removing key)
Merging net/master (99cab7107d91 net: dsa: qca8k: Fix port MTU setting)
Merging bpf/master (7a078d2d1880 libbpf, hashmap: Fix undefined behavior in=
 hash_bits)
Merging ipsec/master (a779d91314ca net: xfrm: fix a race condition during a=
llocing spi)
Merging netfilter/master (859191b234f8 Merge git://git.kernel.org/pub/scm/l=
inux/kernel/git/pablo/nf)
Merging ipvs/master (c77761c8a594 netfilter: nf_fwd_netdev: clear timestamp=
 in forwarding path)
Merging wireless-drivers/master (04516706bb99 iwlwifi: pcie: limit memory r=
ead spin time)
Merging mac80211/master (c2f468145211 mac80211: don't require VHT elements =
for HE on 2.4 GHz)
Merging rdma-fixes/for-rc (00469c97ef64 RDMA/vmw_pvrdma: Fix the active_spe=
ed and phys_state value)
Merging sound-current/for-linus (9fc149c3bce7 ALSA: hda: Reinstate runtime_=
allow() for all hda controllers)
Merging sound-asoc-fixes/for-linus (47568405ff83 Merge remote-tracking bran=
ch 'asoc/for-5.10' into asoc-linus)
Merging regmap-fixes/for-linus (780f88b04704 Merge remote-tracking branch '=
regmap/for-5.10' into regmap-linus)
Merging regulator-fixes/for-linus (c432bf3e3d82 Merge remote-tracking branc=
h 'regulator/for-5.10' into regulator-linus)
Merging spi-fixes/for-linus (21d3055d1ac7 Merge remote-tracking branch 'spi=
/for-5.10' into spi-linus)
Merging pci-current/for-linus (af0dd809f3d3 PCI: Add Designated Vendor-Spec=
ific Extended Capability #defines)
Merging driver-core.current/driver-core-linus (9d4fdda33446 scripts: get_ap=
i.pl: Add sub-titles to ABI output)
Merging tty.current/tty-linus (d54654790302 vt_ioctl: fix GIO_UNIMAP regres=
sion)
Merging usb.current/usb-linus (58d51f330e76 Merge tag 'fixes-for-v5.10-rc2'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb into usb-linus)
Merging usb-gadget-fixes/fixes (129aa9734559 usb: raw-gadget: fix memory le=
ak in gadget_setup)
Merging usb-serial-fixes/usb-linus (a46b973bced1 USB: serial: option: add Q=
uectel EC200T module support)
Merging usb-chipidea-fixes/for-usb-fixes (e11d2bf27158 usb: cdns3: gadget: =
own the lock wrongly at the suspend routine)
Merging phy/fixes (25d76fed7ffe phy: cpcap-usb: Use IRQF_ONESHOT)
Merging staging.current/staging-linus (3cea11cd5e3b Linux 5.10-rc2)
Merging char-misc.current/char-misc-linus (3cea11cd5e3b Linux 5.10-rc2)
Merging soundwire-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging thunderbolt-fixes/fixes (7342ca34d931 thunderbolt: Add the missed i=
da_simple_remove() in ring_request_msix())
Merging input-current/for-linus (b1884583fcd1 Input: i8042 - allow insmod t=
o succeed on devices without an i8042 controller)
Merging crypto-current/master (c3a98c3ad5c0 crypto: x86/poly1305 - add back=
 a needed assignment)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (aae7a75a821a vfio/type1: Add proper error unw=
ind for vfio_iommu_replay())
Merging kselftest-fixes/fixes (1488472e712d selftests: binderfs: use SKIP i=
nstead of XFAIL)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (768664114b1a dmaengine: ti: k3-udma: fix -We=
num-conversion warning)
Merging backlight-fixes/for-backlight-fixes (219d54332a09 Linux 5.4)
Merging mtd-fixes/mtd/fixes (9efac6ce7f62 mtd: rawnand: stm32_fmc2: fix bro=
ken ECC)
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
Merging kvm-fixes/master (9478dec3b5e7 KVM: vmx: remove unused variable)
Merging kvms390-fixes/master (f20d4e924b44 docs: kvm: add documentation for=
 KVM_CAP_S390_DIAG318)
Merging hwmon-fixes/hwmon (402dab548d0d hwmon: (pmbus/max20730) use scnprin=
tf() instead of snprintf())
Merging nvdimm-fixes/libnvdimm-fixes (88b67edd7247 dax: Fix compilation for=
 CONFIG_DAX && !CONFIG_FS_DAX)
Merging btrfs-fixes/next-fixes (45d8f990a77f Merge branch 'misc-5.10' into =
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
Merging scsi-fixes/fixes (af61bc1e33d2 scsi: hpsa: Fix memory leak in hpsa_=
init_one())
Merging drm-fixes/drm-fixes (7babd126327b Merge tag 'drm-intel-fixes-2020-1=
0-29' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (854b32440144 drm/i915/gvt: Fi=
x mmio handler break on BXT/APL.)
Merging mmc-fixes/fixes (011fde48394b mmc: sdhci-of-esdhc: make sure delay =
chain locked for HS400)
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
Merging spdx/spdx-linus (3cea11cd5e3b Linux 5.10-rc2)
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
Merging drm-misc-fixes/for-linux-next-fixes (dcda7c28bff2 drm/vc4: kms: Add=
 functions to create the state objects)
Merging kspp-gustavo/for-next/kspp (3650b228f83a Linux 5.10-rc1)
Merging kbuild/for-next (729e39a558eb kconfig: qconf: convert to Qt5 new si=
gnal/slot connection syntax)
Merging compiler-attributes/compiler-attributes (bbf5c979011a Linux 5.9)
Merging dma-mapping/for-next (48ab6d5d1f09 dma-mapping: fix 32-bit overflow=
 with CONFIG_ARM_LPAE=3Dn)
Merging asm-generic/master (78d127fd6892 Merge branch 'asm-generic-timers' =
into asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (20f96e606509 Merge branches 'fixes' and 'misc' into f=
or-next)
Merging arm64/for-next/core (66dd3474702a arm64: proton-pack: Update commen=
t to reflect new function name)
Merging arm-perf/for-next/perf (887e2cff0f8d perf: arm-cmn: Fix conversion =
specifiers for node type)
Merging arm-soc/for-next (36ab3c32cafc ARM: SoC: document merges)
Merging amlogic/for-next (4393916840fc Merge branch 'v5.11/soc' into tmp/am=
l-rebuild)
Merging aspeed/for-next (93db293b2aba Merge branch 'soc-for-v5.11' into for=
-next)
Merging at91/at91-next (0698efbb33ef Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging drivers-memory/for-next (5ddebb22417b Merge branch 'for-v5.11/tegra=
-mc' into for-next)
Merging imx-mxs/for-next (cfaf0f4a7297 Merge branch 'imx/defconfig' into fo=
r-next)
Applying: Revert "ARM: imx: add missing clk_disable_unprepare() when remove=
 imx_mmdc"
Merging keystone/next (a5e886fb26f2 Merge branch 'for_5.11/drivers-soc' int=
o next)
Merging mediatek/for-next (9c6658a0dd4f Merge branch 'v5.10-next/soc' into =
for-next)
Merging mvebu/for-next (f89c9685f6a1 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (7a159a1ad494 Merge branch 'fixes' into for-next)
Merging qcom/for-next (923bb4f70ceb Merge branches 'arm64-for-5.11', 'drive=
rs-for-5.11' and 'dts-for-5.11' into for-next)
Merging raspberrypi/for-next (4564363351e2 ARM: dts: bcm2711: Enable the di=
splay pipeline)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (b860052992d7 Merge branch 'renesas-dt-bindings-for-v5=
.11' into renesas-next)
Merging reset/reset/next (da8c0e4ee95a reset: meson: make it possible to bu=
ild as a module)
Merging rockchip/for-next (1fdc65a3eb82 Merge branch 'v5.11-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (f76fe8d86291 Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (3cea11cd5e3b Linux 5.10-rc2)
Merging sunxi/sunxi/for-next (2f098e04ce16 Merge branch 'sunxi/fixes-for-5.=
10' into sunxi/for-next)
Merging tegra/for-next (9ea55312ba10 Merge branch for-5.10/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (9dcd17be61e4 arm64: dts: ti: k3-am65: ringacc=
: drop ti, dma-ring-reset-quirk)
Merging clk/clk-next (3650b228f83a Linux 5.10-rc1)
Merging clk-samsung/for-next (ff8e0ff9b996 clk: samsung: Use cached clk_hws=
 instead of __clk_lookup() calls)
Merging csky/linux-next (7c2c8f7beeb7 csky: Fixup show_regs doesn't contain=
 regs->usp)
Merging h8300/h8300-next (8808515be0ed h8300: Replace <linux/clk-provider.h=
> by <linux/of_clk.h>)
Merging ia64/next (c331649e6371 ia64: Use libata instead of the legacy ide =
driver in defconfigs)
Merging m68k/for-next (1fe9bacab2ac m68k: Remove unused mach_max_dma_addres=
s)
Merging m68knommu/for-next (ce93d1c29c02 m68k: m68328: remove duplicate cod=
e)
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
CONFLICT (content): Merge conflict in arch/parisc/kernel/time.c
Applying: revert the rest of "parisc: use legacy_timer_tick"
Merging powerpc/next (3cea11cd5e3b Linux 5.10-rc2)
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
Merging btrfs/for-next (89956069c9d6 Merge branch 'for-next-next-v5.10-2020=
1102' into for-next-20201102)
Merging ceph/master (28e1581c3b4e libceph: clear con->out_msg on Policy::st=
ateful_server faults)
Merging cifs/for-next (3cea11cd5e3b Linux 5.10-rc2)
Merging configfs/for-next (76ecfcb0852e samples: configfs: prefer pr_err() =
over bare printk(KERN_ERR)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (915f4c9358db erofs: remove unnecessary enum entries)
Merging exfat/dev (f9893351acae Merge tag 'kconfig-v5.10' of git://git.kern=
el.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging ext3/for_next (e44b86917b3f Pull direct IO fix from Gabriel Krisman=
.)
Merging ext4/dev (00c69f98e83d ext4: use IS_ERR() for error checking of pat=
h)
Merging f2fs/dev (3281ed2c116e f2fs: add F2FS_IOC_SET_COMPRESS_OPTION ioctl)
$ git reset --hard HEAD^
Merging next-20201102 version of f2fs
Merging fsverity/fsverity (f3db0bed4583 fs-verity: use smp_load_acquire() f=
or ->i_verity_info)
Merging fuse/for-next (42d3e2d041f0 virtiofs: calculate number of scatter-g=
ather elements accurately)
Merging jfs/jfs-next (7aba5dcc2346 jfs: Replace zero-length array with flex=
ible-array member)
Merging nfs/linux-next (3cea11cd5e3b Linux 5.10-rc2)
Merging nfs-anna/linux-next (8c39076c276b NFSv4.2: support EXCHGID4_FLAG_SU=
PP_FENCE_OPS 4.2 EXCHANGE_ID flag)
Merging nfsd/nfsd-next (856deb866d16 Linux 5.9-rc5)
Merging cel/cel-next (a826e2b2dd61 NFSD: A semicolon is not needed after a =
switch statement.)
Merging orangefs/for-next (e848643b524b orangefs: remove unnecessary assign=
ment to variable ret)
Merging overlayfs/overlayfs-next (be4df0cea08a ovl: use generic vfs_ioc_set=
flags_prepare() helper)
Merging ubifs/next (e2a05cc7f822 ubifs: mount_ubifs: Release authentication=
 resource in error handling path)
Merging v9fs/9p-next (7ca1db21ef8e net: 9p: initialize sun_server.sun_path =
to have addr's value only when addr is valid)
Merging xfs/for-next (2c334e12f957 xfs: set xefi_discard when creating a de=
ferred agfl free log intent item)
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
Merging printk/for-next (17ab0541542f Merge branch 'for-5.10-trivial' into =
for-next)
Merging pci/next (3650b228f83a Linux 5.10-rc1)
Merging pstore/for-next/pstore (137c6236aeec mailmap: Add WeiXiong Liao)
CONFLICT (content): Merge conflict in .mailmap
Merging hid/for-next (2039112f7c1c Merge branch 'for-5.11/core' into for-ne=
xt)
Merging i2c/i2c/for-next (3650b228f83a Linux 5.10-rc1)
Merging i3c/i3c/next (abea14bfdebb i3c: master: Fix error return in cdns_i3=
c_master_probe())
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (eb3f6f77d58c hwmon: (pmbus) shrink code a=
nd remove pmbus_do_remove())
Merging jc_docs/docs-next (6fee9372e0af Merge branch 'mauro-warnings' into =
docs-next)
Merging v4l-dvb/master (dfe3d19bd092 Merge tag 'v5.10-rc1' into patchwork)
Merging v4l-dvb-next/master (d0a9fffedca1 docs: fs: api-summary.rst: get ri=
d of kernel-doc include)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (bb88d1f9b431 Merge branch 'pm-opp' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (a43128837003 cpufreq: mediatek:=
 add missing platform_driver_unregister() on error in mtk_cpufreq_driver_in=
it)
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
Merging swiotlb/linux-next (fc0021aa340a swiotlb: remove the tbl_dma_addr a=
rgument to swiotlb_tbl_map_single)
Merging rdma/for-next (32053e584e4a RDMA/hns: Add support for filling GMV t=
able)
Merging net-next/master (0e8c266c59b5 net: dsa: mt7530: remove unneeded sem=
icolon)
Merging bpf-next/for-next (f4c3881edbcc Merge branch 'bpf-migrate-tcp-bpf')
Merging ipsec-next/master (68bb4665a2ce Merge branch 'l2-multicast-forwardi=
ng-for-ocelot-switch')
Merging mlx5-next/mlx5-next (3650b228f83a Linux 5.10-rc1)
Merging netfilter-next/master (35b7ee34abdb netfilter: nftables: Add __prin=
tf() attribute)
Merging ipvs-next/master (3cb12d27ff65 Merge tag 'net-5.10-rc1' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging wireless-drivers-next/master (3650b228f83a Linux 5.10-rc1)
Merging bluetooth/master (44d59235ace5 Bluetooth: hci_h5: close serdev devi=
ce and free hu in h5_close)
Merging mac80211-next/master (3cb12d27ff65 Merge tag 'net-5.10-rc1' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging gfs2/for-next (6bd1c7bd4ee7 gfs2: Don't call cancel_delayed_work_sy=
nc from within delete work function)
Merging mtd/mtd/next (232b67c39942 mtd: remove unneeded break)
Merging nand/nand/next (3ebbdef13f82 mtd: rawnand: sunxi: Add MDMA support)
Merging spi-nor/spi-nor/next (3650b228f83a Linux 5.10-rc1)
Merging crypto/master (18d05ca4486f crypto: lib/sha256 - Unroll LOAD and BL=
END loops)
Merging drm/drm-next (3cea11cd5e3b Linux 5.10-rc2)
Merging amdgpu/drm-next (18128bd7c292 drm/amdgpu/display: FP fixes for DCN3=
.x)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/pm/swsmu/amdgpu_s=
mu.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dcn10/=
dcn10_optc.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/nv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ttm=
.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_dev=
ice.c
Merging drm-intel/for-linux-next (24cb4f312697 drm/i915: Reduce severity fo=
r fixing up mistaken VBT tc->legacy_port)
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_di=
splay.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_dd=
i.c
Merging drm-tegra/drm/tegra/for-next (d9f980ebcd01 drm/tegra: output: rgb: =
Wrap directly-connected panel into DRM bridge)
Merging drm-misc/for-linux-next (7a60c2dd0f57 drm: Remove SCATTERLIST_MAX_S=
EGMENT)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/amdgpu_dm=
/amdgpu_dm.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_gem=
.c
Applying: merge fix up for "drm/amdgpu: Add debugfs entry for printing VM i=
nfo"
Applying: swiotlb: using SIZE_MAX needs limits.h included
Merging drm-msm/msm-next (d1ea91492585 drm/msm/dp: fix incorrect function p=
rototype of dp_debug_get())
Merging mali-dp/for-upstream/mali-dp (f634c6a80287 dt/bindings: display: Ad=
d optional property node define for Mali DP500)
Merging imx-drm/imx-drm/next (36fba366cf9f drm/imx: tve remove extraneous t=
ype qualifier)
Merging etnaviv/etnaviv/next (4612bad5701e drm/etnaviv: Add lockdep annotat=
ions for context lock)
Merging regmap/for-next (f243af4d473b Merge remote-tracking branch 'regmap/=
for-5.11' into regmap-next)
Merging sound/for-next (ad26098970b6 ALSA: remove unneeded break)
Merging sound-asoc/for-next (47dcdb79bc7c Merge remote-tracking branch 'aso=
c/for-5.11' into asoc-next)
Merging modules/modules-next (5e8ed280dab9 module: set MODULE_STATE_GOING s=
tate when a module fails to load)
Merging input/next (8a30c6eb29e0 Input: Add MAINTAINERS entry for SiS i2c t=
ouch input driver)
Merging block/for-next (5af8cdb023c6 Merge branch 'tif-task_work.arch' into=
 for-next)
Merging device-mapper/for-next (681cc5e8667e dm: fix request-based DM to no=
t bounce through indirect dm_submit_bio)
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (cc85a5ef3c83 mmc: rtsx_pci: Add SD Express mode support f=
or RTS5261)
Merging mfd/for-mfd-next (6d81dc3c79d4 mfd: kempld-core: Fix unused variabl=
e 'kempld_acpi_table' when !ACPI)
Merging backlight/for-backlight-next (97ecfda1a8ff backlight: tosa_bl: Incl=
ude the right header)
Merging battery/for-next (7007fab4ae82 power: reset: POWER_RESET_OCELOT_RES=
ET should depend on Ocelot or Sparx5)
Merging regulator/for-next (62966abe7834 Merge remote-tracking branch 'regu=
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
Merging selinux/next (44141f58e143 selinux: allow dontauditx and auditallow=
x rules to take effect without allowx)
Merging smack/next (edd615371b66 Smack: Remove unnecessary variable initial=
ization)
Merging tomoyo/master (d9594e040965 tomoyo: fix clang pointer arithmetic wa=
rning)
Merging tpmdd/next (bbd521ce63ab tpm: efi: Don't create binary_bios_measure=
ments file for an empty log)
Merging watchdog/master (3650b228f83a Linux 5.10-rc1)
Merging iommu/next (7e3c3883c381 Merge branches 'arm/allwinner', 'arm/media=
tek', 'arm/renesas', 'arm/tegra', 'arm/qcom', 'arm/smmu', 'ppc/pamu', 'x86/=
amd', 'x86/vt-d' and 'core' into next)
Merging audit/next (6d915476e67d audit: trigger accompanying records when n=
o rules present)
Merging devicetree/for-next (3cea11cd5e3b Linux 5.10-rc2)
Merging mailbox/mailbox-for-next (c7dacf5b0f32 mailbox: avoid timer start f=
rom callback)
Merging spi/for-next (d51bba5fb892 Merge remote-tracking branch 'spi/for-5.=
11' into spi-next)
Merging tip/auto-latest (6f72faf4a323 Merge branch 'locking/urgent')
Merging clockevents/timers/drivers/next (f087e452f27e clocksource: sp804: e=
nable Hisilicon sp804 timer 64bit mode)
Merging edac/edac-for-next (24269999027e EDAC: Fix some kernel-doc markups)
Merging irqchip/irq/irqchip-next (d95bdca75b3f irqchip/ti-sci-inta: Add sup=
port for unmapped event handling)
Merging ftrace/for-next (e1981f75d398 ring-buffer: Update the description f=
or ring_buffer_wait)
Merging rcu/rcu/next (76b43ef30dc3 kcsan: Fix encoding masks and regain add=
ress bit)
Merging kvm/linux-next (e792415c5d3e KVM: MIPS/VZ: Fix build error caused b=
y 'kvm_run' cleanup)
Merging kvm-arm/next (22f553842b14 KVM: arm64: Handle Asymmetric AArch32 sy=
stems)
Merging kvm-ppc/kvm-ppc-next (cf59eb13e151 KVM: PPC: Book3S: Fix symbol und=
eclared warnings)
Merging kvms390/next (23a60f834406 s390/kvm: diagnose 0x318 sync and reset)
Merging xen-tip/linux-next (1a89c1dc9520 Documentation: add xen.fifo_events=
 kernel parameter description)
Merging percpu/for-next (eb4c8d15efda Merge branch 'for-5.11' into for-next)
Merging workqueues/for-next (10cdb1575954 workqueue: use BUILD_BUG_ON() for=
 compile time test instead of WARN_ON())
Merging drivers-x86/for-next (e8a60aa7404b platform/x86: Introduce support =
for Systems Management Driver over WMI for Dell Systems)
Merging chrome-platform/for-next (3650b228f83a Linux 5.10-rc1)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (6c3e42616bf2 leds: various: add missing put_device()=
 call in netxbig_leds_get_of_pdata())
Merging ipmi/for-next (0df7b988d9df char: ipmi: remove unneeded break)
Merging driver-core/driver-core-next (3cea11cd5e3b Linux 5.10-rc2)
Merging usb/usb-next (8fba56b4cd53 Merge 5.10-rc2 into usb-next)
Merging usb-gadget/next (b2c586eb07ef usb: dwc2: Fix INTR OUT transfers in =
DDMA mode.)
Merging usb-serial/usb-next (d1849b9ff9f4 USB: serial: iuu_phoenix: remove =
unneeded break)
Merging usb-chipidea-next/for-usb-next (eba158772841 usb: cdns3: Rids of du=
plicate error message)
Merging phy-next/next (c36f74566cef MAINTAINERS: Add entry for Qualcomm IPQ=
4019 USB PHY)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging tty/tty-next (da31de35cd2f tty: goldfish: use __raw_writel()/__raw_=
readl())
Merging char-misc/char-misc-next (48a3d90adafc Merge 5.10-rc2 into char-mis=
c-next)
Merging extcon/extcon-next (ca26071da1bb dt-bindings: extcon: add binding f=
or TUSB320)
Merging soundwire/next (3650b228f83a Linux 5.10-rc1)
Merging thunderbolt/next (3cea11cd5e3b Linux 5.10-rc2)
Merging vfio/next (2e6cfd496f5b vfio iommu type1: Fix memory leak in vfio_i=
ommu_type1_pin_pages)
Merging staging/staging-next (83e63b2cc416 Merge 5.10-rc2 into staging-next)
CONFLICT (modify/delete): tools/testing/selftests/android/ion/ipcsocket.h d=
eleted in staging/staging-next and modified in HEAD. Version HEAD of tools/=
testing/selftests/android/ion/ipcsocket.h left in tree.
CONFLICT (modify/delete): tools/testing/selftests/android/ion/ipcsocket.c d=
eleted in staging/staging-next and modified in HEAD. Version HEAD of tools/=
testing/selftests/android/ion/ipcsocket.c left in tree.
$ git rm -f tools/testing/selftests/android/ion/ipcsocket.c tools/testing/s=
elftests/android/ion/ipcsocket.h
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (fce52ad34832 interconnect: qcom: use icc_sync state f=
or sm8[12]50)
Merging dmaengine/next (4749f51ddd8a dmaengine: idxd: Add ABI documentation=
 for shared wq)
CONFLICT (content): Merge conflict in drivers/dma/idxd/registers.h
CONFLICT (content): Merge conflict in drivers/dma/idxd/device.c
Merging cgroup/for-next (65026da59cda cgroup: Zero sized write should be no=
-op)
Merging scsi/for-next (af61bc1e33d2 scsi: hpsa: Fix memory leak in hpsa_ini=
t_one())
Merging scsi-mkp/for-next (d90196317484 scsi: zfcp: Handle event-lost notif=
ication for Version Change events)
Merging vhost/linux-next (29ea7644edd2 swiotlb: using SIZE_MAX needs limits=
.h included)
Merging rpmsg/for-next (3e53119a2521 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (50afb29ae413 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (183245c4f204 gpio: rcar: Implement gpio_ch=
ip.get_multiple())
Merging gpio-intel/for-next (3650b228f83a Linux 5.10-rc1)
Merging pinctrl/for-next (03dec17c36a7 Merge branch 'devel' into for-next)
Applying: Revert "pinctrl: rockchip: make driver be tristate module"
Merging pinctrl-intel/for-next (4670abbb298e pinctrl: intel: Add blank line=
 before endif in Kconfig)
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
Merging coresight/next (7aef456716dc coresight: etm4x: Handle TRCVIPCSSCTLR=
 accesses)
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
Merging mhi/mhi-next (3650b228f83a Linux 5.10-rc1)
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
Merging akpm-current/current (a1f9165f0d93 lib/lzo/lzo1x_compress.c: make l=
zogeneric1x_1_compress() static)
CONFLICT (content): Merge conflict in include/linux/sched.h
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (55f4bff8073f mm/gup: assert that the mmap lock is held=
 in __get_user_pages())

--Sig_/VpYFItkmT9J39AznRU2GoyZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+hBIMACgkQAVBC80lX
0GzQcwf/Sn9+nJxm1T6FgTN/qirGzezvqxaM6czdDJiQ+IY9mrqPMRRuiQt9GisF
3+6oBajqC+42apjMPIeZbqwrWdokV9WcKC9Gdq1lovlMGgKppYQYRi+EVFE6Hj1Y
E3bZJ1DfzQMGmqsN7zm69WkL0JrrB8MvPcjyIvgX3juzwMdOpgW2fwG9h5EsUHod
HWsbuK6/WSZ2/DPTQQSRziR+9MOTk8sGuHHiNhSRPdRS6qW6vwLUAjRTVEZzOQeU
LedrJ2R/iPAw09L8cTmY+YioB3xQXdQ439CqNPm/f4dNH5Rxlo6fIF3WjbeQIZ4L
X+s0jNa9t8oUrp7JYJUdsfKP5+G/Ew==
=fVRY
-----END PGP SIGNATURE-----

--Sig_/VpYFItkmT9J39AznRU2GoyZ--
