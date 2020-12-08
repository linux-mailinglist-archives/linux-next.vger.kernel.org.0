Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F409D2D2912
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 11:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728735AbgLHKjo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Dec 2020 05:39:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728699AbgLHKjn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Dec 2020 05:39:43 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56EF3C061749;
        Tue,  8 Dec 2020 02:39:02 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CqxVq6MBKz9sVq;
        Tue,  8 Dec 2020 21:38:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607423940;
        bh=Z7sYQi7GPNgG8WbslwRxj9RJIempwacNAqHU64IvE5o=;
        h=Date:From:To:Cc:Subject:From;
        b=VIUtDVY1hkqpRpX3ntmnnOjA0k4CT1i5vMTHnsQli4lEB1mJNAoqNu/rJWhOn7lzZ
         HKq/EmRy8G6BkQ7uEGwtUs3GQE62m5UERPAC2aS//fdERhlzSKSGmeTj8CazC4J00V
         6xBrjnt4tFWNARhBynliWc52eOFonsnYp4krtmhxgP0mr63T8Od3I52zRZvfpKYlM1
         nrTV6lizw1ocVlZ1QzZeCXpERV0wt7GErwLuWUWivLr/seuxi6/eAzDtd8b55qjVMJ
         9FmAI/PLGxv3uTJQSmyCigFvPW5zCEwbAoBHHm++W/bKEtGN7Fk8EOCUgpEyYWA17I
         H6yttY78DabaA==
Date:   Tue, 8 Dec 2020 21:38:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Dec 8
Message-ID: <20201208213858.14f5d16b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iACfRDvCi494Ke=XkwIJeDc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/iACfRDvCi494Ke=XkwIJeDc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20201207:

The v4l-dvb tree gained a conflict against the arm-soc tree.

The wireless-drivers-next tree gained a build failure for which I applied
a patch.

The nand tree gained a build failure so I used the version from
next-20201207.

The drm tree gained a conflict against the pci tree.

The amdgpu tree gained a conflict against the pci tree.

The ftrace tree gained a conflict against Linus' tree.

The kvm-arm tree lost its difficult conflict against the arm64 tree.

The scsi-mkp tree gained a build failure for which I applied a patch.

The akpm-current tree gained a conflict against the powerpc tree.

Non-merge commits (relative to Linus' tree): 10710
 9722 files changed, 739569 insertions(+), 181273 deletions(-)

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
Merging origin/master (cd796ed33450 Merge tag 'trace-v5.10-rc7' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace)
Merging fixes/fixes (4c11d930f61a clk: renesas: r9a06g032: Drop __packed fo=
r portability)
Merging kbuild-current/fixes (7d32358be8ac kbuild: avoid split lines in .mo=
d files)
Merging arc-current/for-curr (3a71e423133a ARC: build: use $(READELF) inste=
ad of hard-coded readelf)
Merging arm-current/fixes (9fa2e7af3d53 ARM: 9019/1: kprobes: Avoid fortify=
_panic() when copying optprobe template)
Merging arm64-fixes/for-next/fixes (929c1f3384d7 arm64: mte: fix prctl(PR_G=
ET_TAGGED_ADDR_CTRL) if TCF0=3DNONE)
Merging arm-soc-fixes/arm/fixes (5e2e74024779 Merge tag 'imx-fixes-5.10-5' =
of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fi=
xes)
Merging drivers-memory-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging m68k-current/for-linus (50c5feeea0af ide/macide: Convert Mac IDE dr=
iver to platform driver)
Merging powerpc-fixes/fixes (a1ee28117077 powerpc/64s/powernv: Fix memory c=
orruption when saving SLB entries on MCE)
Merging s390-fixes/fixes (b1cae1f84a0f s390: fix irq state tracing)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (10c678bd0a03 udp: fix the proto value passed to ip_prot=
ocol_deliver_rcu for the segments)
Merging bpf/master (e3366884b383 lwt_bpf: Replace preempt_disable() with mi=
grate_disable())
Merging ipsec/master (48f486e13ffd net: xfrm: fix memory leak in xfrm_user_=
policy())
Merging netfilter/master (10c678bd0a03 udp: fix the proto value passed to i=
p_protocol_deliver_rcu for the segments)
Merging ipvs/master (bbe2ba04c5a9 Merge tag 'net-5.10-rc7' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/netdev/net)
Merging wireless-drivers/master (74a8c816fa8f rtw88: debug: Fix uninitializ=
ed memory in debugfs code)
Merging mac80211/master (bdeca45a0cc5 mac80211: set SDATA_STATE_RUNNING for=
 monitor interfaces)
Merging rdma-fixes/for-rc (93416ab0f994 RDMA/efa: Use the correct current a=
nd new states in modify QP)
Merging sound-current/for-linus (c72b9bfe0f91 ALSA: hda/realtek: make bass =
spk volume adjustable on a yoga laptop)
Merging sound-asoc-fixes/for-linus (7ae6b1ffb066 Merge remote-tracking bran=
ch 'asoc/for-5.10' into asoc-linus)
Merging regmap-fixes/for-linus (e6e9354b5830 regmap: Remove duplicate `type=
` field from regmap `regcache_sync` trace event)
Merging regulator-fixes/for-linus (291de1d102fa regulator: axp20x: Fix DLDO=
2 voltage control register mask for AXP22x)
Merging spi-fixes/for-linus (7119658cd62b Merge remote-tracking branch 'spi=
/for-5.10' into spi-linus)
Merging pci-current/for-linus (cce14622a703 PCI: Add function 1 DMA alias q=
uirk for Marvell 9215 SATA controller)
Merging driver-core.current/driver-core-linus (f8394f232b1e Linux 5.10-rc3)
Merging tty.current/tty-linus (0477e9288185 Linux 5.10-rc7)
Merging usb.current/usb-linus (0477e9288185 Linux 5.10-rc7)
Merging usb-gadget-fixes/fixes (129aa9734559 usb: raw-gadget: fix memory le=
ak in gadget_setup)
Merging usb-serial-fixes/usb-linus (3f203f057edf USB: serial: kl5kusb105: f=
ix memleak on open)
Merging usb-chipidea-fixes/for-usb-fixes (e6c11a2dcaec usb: chipidea: ci_hd=
rc_imx: Pass DISABLE_DEVICE_STREAMING flag to imx6ul)
Merging phy/fixes (fb89b2544b64 phy: mediatek: fix spelling mistake in Kcon=
fig "veriosn" -> "version")
Merging staging.current/staging-linus (418baf2c28f3 Linux 5.10-rc5)
Merging char-misc.current/char-misc-linus (0477e9288185 Linux 5.10-rc7)
Merging soundwire-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging thunderbolt-fixes/fixes (0477e9288185 Linux 5.10-rc7)
Merging input-current/for-linus (223f61b8c5ad Input: soc_button_array - add=
 Lenovo Yoga Tablet2 1051L to the dmi_use_low_level_irq list)
Merging crypto-current/master (c3a98c3ad5c0 crypto: x86/poly1305 - add back=
 a needed assignment)
Merging ide/master (6800cd8cbc6e ide-acpi: use %*ph to print small buffer)
Merging vfio-fixes/for-linus (e4eccb853664 vfio/pci: Bypass IGD init in cas=
e of -ENODEV)
Merging kselftest-fixes/fixes (7d764b685ee1 selftests: binderfs: use SKIP i=
nstead of XFAIL)
Merging modules-fixes/modules-linus (57baec7b1b04 scripts/nsdeps: make sure=
 to pass all module source files to spatch)
Merging dmaengine-fixes/fixes (418baf2c28f3 Linux 5.10-rc5)
Merging backlight-fixes/for-backlight-fixes (bbf5c979011a Linux 5.9)
Merging mtd-fixes/mtd/fixes (9c8f45d970a3 mtd: rawnand: xway: Do not force =
a particular software ECC engine)
Merging mfd-fixes/for-mfd-fixes (bbf5c979011a Linux 5.9)
Merging v4l-dvb-fixes/fixes (cc2ff9730e0f media: vidtv: fix kernel-doc mark=
ups)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (ac3b57adf87a MIPS: Alchemy: Fix memleak in a=
lchemy_clk_setup_cpu)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (ec76c2eea903 ARM: OMAP2+: omap_device: fix idling=
 of devices during probe)
Merging kvm-fixes/master (c2b1209d852f MAINTAINERS: Update email address fo=
r Sean Christopherson)
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (bce776f10069 hwmon: (ina3221) Fix PM usage count=
er unbalance in ina3221_write_enable)
Merging nvdimm-fixes/libnvdimm-fixes (88b67edd7247 dax: Fix compilation for=
 CONFIG_DAX && !CONFIG_FS_DAX)
Merging btrfs-fixes/next-fixes (462b8e885b92 Merge branch 'misc-5.10' into =
next-fixes)
Merging vfs-fixes/fixes (4bbf439b09c5 fix return values of seq_read_iter())
Merging dma-mapping-fixes/for-linus (892fc9f6835e dma-pool: Fix an uninitia=
lized variable bug in atomic_pool_expand())
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (c9aa128080cb platform/x86: touchscreen_dmi=
: Add info for the Irbis TW118 tablet)
Merging samsung-krzk-fixes/fixes (cd12e4f14f7c CREDITS: remove trailing whi=
te spaces)
Merging pinctrl-samsung-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging devicetree-fixes/dt/linus (bdac39a3bd28 dt-bindings: clock: imx5: f=
ix example)
Merging scsi-fixes/fixes (eeaf06af6f87 scsi: be2iscsi: Revert "Fix a theore=
tical leak in beiscsi_create_eqs()")
Merging drm-fixes/drm-fixes (0477e9288185 Linux 5.10-rc7)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (ccc9e67ab26f drm/i915/display=
: Defer initial modeset until after GGTT is initialised)
Merging mmc-fixes/fixes (c0d638a03bc5 mmc: mediatek: mark PM functions as _=
_maybe_unused)
Merging rtc-fixes/rtc-fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging gnss-fixes/gnss-linus (48778464bb7d Linux 5.8-rc2)
Merging hyperv-fixes/hyperv-fixes (5f1251a48c17 video: hyperv_fb: Fix the c=
ache type when mapping the VRAM)
Merging soc-fsl-fixes/fix (2663b3388551 soc: fsl: dpio: Get the cpumask thr=
ough cpumask_of(cpu))
Merging risc-v-fixes/fixes (30aca1bacb39 RISC-V: fix barrier() use in <vdso=
/processor.h>)
Merging pidfd-fixes/fixes (aabe19b82793 nsproxy: use put_nsproxy() in switc=
h_task_namespaces())
Merging fpga-fixes/fixes (8614afd689df fpga: dfl: fix bug in port reset han=
dshake)
Merging spdx/spdx-linus (0477e9288185 Linux 5.10-rc7)
Merging gpio-intel-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging pinctrl-intel-fixes/fixes (5f714771d01e pinctrl: baytrail: Avoid cl=
earing debounce value when turning it off)
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
Merging drm-misc-fixes/for-linux-next-fixes (fd4e788e971c drm/omap: sdi: fi=
x bridge enable/disable)
Merging kspp-gustavo/for-next/kspp (36f9ff9e03de lib: Fix fall-through warn=
ings for Clang)
Merging kbuild/for-next (f5037e22315c kconfig: clean up header inclusion)
Merging compiler-attributes/compiler-attributes (196793946264 Compiler Attr=
ibutes: remove CONFIG_ENABLE_MUST_CHECK)
Merging dma-mapping/for-next (7679325702c9 selftests/dma: add test applicat=
ion for DMA_MAP_BENCHMARK)
Merging asm-generic/master (8eb42bcea5ae Merge branch 'asm-generic-fixes' i=
nto asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (40bd54f12902 Merge branch 'devel-stable' into for-nex=
t)
Merging arm64/for-next/core (42a81f5719de Merge remote-tracking branch 'arm=
64/for-next/iommu/core' into for-next/core)
Merging arm-perf/for-next/perf (ce4b2c01781a arm64: Fix build failure when =
HARDLOCKUP_DETECTOR_PERF is enabled)
Merging arm-soc/for-next (33fa6976a384 soc: document merges)
Merging amlogic/for-next (2a3f3f27aaff Merge branch 'v5.11/soc' into tmp/am=
l-rebuild)
Merging aspeed/for-next (41707a524026 Merge branches 'soc-for-v5.11' and 'd=
efconfig-for-v5.11' into for-next)
Merging at91/at91-next (e77be1651978 Merge branches 'at91-drivers', 'at91-d=
t' and 'at91-defconfig' into at91-next)
Merging drivers-memory/for-next (1133e15678af Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (09690c0e0d1c Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (b2a8f6ce4bdc Merge branch 'for_5.11/drivers-soc' int=
o next)
Merging mediatek/for-next (727bfb2c55b0 Merge branch 'v5.10-next/soc' into =
for-next)
Merging mvebu/for-next (dc14300bb67b Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (4675dcacc1ed Merge branch 'omap-for-v5.11/defconfig-=
take2' into for-next)
Merging qcom/for-next (d7288346e0a4 Merge branches 'arm64-for-5.11', 'arm64=
-defconfig-for-5.11', 'drivers-for-5.11' and 'dts-for-5.11' into for-next)
Merging raspberrypi/for-next (278407a53c3b ARM: dts: bcm283x: increase dwc2=
's RX FIFO size)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (c51a6c86347a Merge branch 'renesas-drivers-for-v5.11'=
 into renesas-next)
Merging reset/reset/next (d06c4dec98b6 reset-controller: ti: force the writ=
e operation when assert or deassert)
Merging rockchip/for-next (e15c5c9836dc Merge branch 'v5.11-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (72f4b57a4d4b Merge branch 'next/drivers' int=
o for-next)
Merging scmi/for-linux-next (0477e9288185 Linux 5.10-rc7)
Merging stm32/stm32-next (814fddb955f8 ARM: multi_v7_defconfig: enable STM3=
2 dfsdm audio support)
Merging sunxi/sunxi/for-next (9e3b3fad3579 Merge branch 'sunxi/fixes-for-5.=
10' into sunxi/for-next)
Merging tegra/for-next (b11a0dfbd316 Merge branch for-5.11/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (de7caab0974f Merge branch 'ti-k3-dts-next' in=
to ti-k3-next)
Merging clk/clk-next (e931bfe4196f Merge branch 'clk-samsung' into clk-next)
Merging clk-samsung/for-next (44a9e78f9242 clk: samsung: Prevent potential =
endless loop in the PLL ops)
Merging csky/linux-next (ba3b26607f55 csky: Optimize atomic operations with=
 correct barrier usage)
Merging h8300/h8300-next (8808515be0ed h8300: Replace <linux/clk-provider.h=
> by <linux/of_clk.h>)
Merging ia64/next (c331649e6371 ia64: Use libata instead of the legacy ide =
driver in defconfigs)
Merging m68k/for-next (2ae92e8b9b7e MAINTAINERS: Update m68k Mac entry)
Merging m68knommu/for-next (8b22820efb35 m68k: m68328: remove duplicate cod=
e)
Merging microblaze/next (ed2124c0b9a8 microblaze: add support for TIF_NOTIF=
Y_SIGNAL)
Merging mips/mips-next (991838f90e93 MIPS: DTS: img: Fix schema warnings fo=
r pwm-leds)
Merging nds32/next (54bde873682b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (d8398bf840f8 openrisc: add local64.h to fix blk-=
iocost build)
Merging parisc-hd/for-next (19621e5fd02b parisc: Switch to clockevent based=
 timers)
CONFLICT (content): Merge conflict in arch/parisc/kernel/time.c
Applying: revert the rest of "parisc: use legacy_timer_tick"
Merging powerpc/next (250ad7a45b1e powerpc/powernv/idle: Restore CIABR afte=
r idle for Power9)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e95f287deed2 soc: fsl: handle RCPM errata A-008646 on=
 SoC LS1021A)
Merging risc-v/for-next (b5b11a8ac4b5 RISC-V: Move dynamic relocation secti=
on under __init)
Merging s390/for-next (a184e7e2b71c Merge branch 'features' into for-next)
CONFLICT (content): Merge conflict in arch/s390/include/asm/mmu_context.h
Merging sh/for-next (b0cfc315ff38 sh: fix syscall tracing)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (9a5085b3fad5 um: Call pgtable_pmd_page_dtor() in __=
pmd_free_tlb())
Merging xtensa/xtensa-for-next (dc293f210690 xtensa: uaccess: Add missing _=
_user to strncpy_from_user() prototype)
Merging fscrypt/master (a14d0b676491 fscrypt: allow deleting files with uns=
upported encryption policy)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (219d4f384127 Merge branch 'for-next-next-v5.10-2020=
1201' into for-next-20201201)
Merging ceph/master (62575e270f66 ceph: check session state after bumping s=
ession->s_seq)
Merging cifs/for-next (0477e9288185 Linux 5.10-rc7)
Merging configfs/for-next (65cdb4a214c0 configfs: fix kernel-doc markup iss=
ue)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (c8390cfaa07c erofs: remove a void EROFS_VERSION macro se=
t in Makefile)
Merging exfat/dev (f9893351acae Merge tag 'kconfig-v5.10' of git://git.kern=
el.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging ext3/for_next (7aa6e73c960e Pull fsnotify fixes from Amir)
Merging ext4/dev (f902b2165010 ext4: fix bogus warning in ext4_update_dx_fl=
ag())
Merging f2fs/dev (93e624c86095 f2fs: inline: fix wrong inline inode stat)
Merging fsverity/fsverity (bde493349025 fs-verity: move structs needed for =
file signing to UAPI header)
Merging fuse/for-next (9d769e6aa252 fuse: support SB_NOSEC flag to improve =
write performance)
Merging jfs/jfs-next (c61b3e483900 jfs: Fix array index bounds check in dbA=
djTree)
Merging nfs/linux-next (bf701b765eaa NFS: switch nfsiod to be an UNBOUND wo=
rkqueue.)
Merging nfs-anna/linux-next (861b1da5a534 SUNRPC: Keep buf->len in sync wit=
h xdr->nwords when expanding holes)
CONFLICT (content): Merge conflict in net/sunrpc/xdr.c
Merging nfsd/nfsd-next (c3213d260a23 SUNRPC: Fix oops in the rpc_xdr_buf ev=
ent class)
Merging cel/cel-next (4d1d4f30deed nfsd: Record NFSv4 pre/post-op attribute=
s as non-atomic)
Merging orangefs/for-next (e848643b524b orangefs: remove unnecessary assign=
ment to variable ret)
Merging overlayfs/overlayfs-next (c11faf32599f ovl: fix incorrect extent in=
fo in metacopy case)
Merging ubifs/next (e2a05cc7f822 ubifs: mount_ubifs: Release authentication=
 resource in error handling path)
Merging v9fs/9p-next (324a158fe535 fs: 9p: add generic splice_write file op=
eration)
Merging xfs/for-next (eb8409071a1d xfs: revert "xfs: fix rmap key and recor=
d comparison functions")
Merging zonefs/for-next (48bfd5c6fac1 zonefs: document the explicit-open mo=
unt option)
Merging iomap/iomap-for-next (1a31182edd00 iomap: Call inode_dio_end() befo=
re generic_write_sync())
Merging djw-vfs/vfs-for-next (9b8523423b23 vfs: move __sb_{start,end}_write=
* to fs.h)
Merging file-locks/locks-next (8d1ddb5e7937 fcntl: Fix potential deadlock i=
n send_sig{io, urg}())
Merging vfs/for-next (61c207915a76 Merge branches 'work.sparc', 'work.epoll=
', 'work.sparc32' and 'regset.followup' into for-next)
Merging printk/for-next (eb4e76080fcf Merge branch 'for-5.10-pr_cont-fixup'=
 into for-next)
Merging pci/next (2f378db5c894 Merge branch 'remotes/lorenzo/pci/misc')
Merging pstore/for-next/pstore (26fecbf7602d pstore: Move kmsg_bytes defaul=
t into Kconfig)
Merging hid/for-next (cdaa1e42b483 Merge branch 'for-5.10/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (c80de4722a01 Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (015cbe1f0506 i3c: Resign from my maintainer role)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (a19028293d6c dt-bindings: hwmon: Add docu=
mentation for ltc2992)
Merging jc_docs/docs-next (4aaf08dcb961 docs: nios2: add missing ReST file)
Merging v4l-dvb/master (7ea4d2329330 media: ccs: Add support for obtaining =
C-PHY configuration from firmware)
CONFLICT (content): Merge conflict in drivers/staging/media/sunxi/cedrus/ce=
drus.c
CONFLICT (content): Merge conflict in MAINTAINERS
Merging v4l-dvb-next/master (d0a9fffedca1 docs: fs: api-summary.rst: get ri=
d of kernel-doc include)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (960e625edeb5 Merge branches 'acpi-processor' and 'ac=
pi-ec' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (f45f89a778e8 cpufreq: tegra194:=
 Rename tegra194_get_speed_common function)
Merging cpupower/cpupower (748f0d70087c cpupower: Provide online and offlin=
e CPU information)
Merging devfreq/devfreq-next (6a575e84f11e PM / devfreq: tegra30: Separate =
configurations per-SoC generation)
Merging opp/opp/linux-next (ed40e33c0b91 opp: Reduce the size of critical s=
ection in _opp_kref_release())
Merging thermal/thermal/linux-next (f34a32fae7fd platform/x86/drivers/acerh=
df: Check the interval value when it is set)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (4f19d071f9be fs: dlm: check on existing node address)
Merging swiotlb/linux-next (fc0021aa340a swiotlb: remove the tbl_dma_addr a=
rgument to swiotlb_tbl_map_single)
Merging rdma/for-next (87524494a7d9 RDMA/efa: Use dma_set_mask_and_coherent=
() to simplify code)
CONFLICT (content): Merge conflict in include/linux/dma-mapping.h
Merging net-next/master (b1f7b0983601 Merge branch 's390-qeth-next')
Applying: fix up for "xdp: Handle MEM_TYPE_XSK_BUFF_POOL correctly in xdp_r=
eturn_buff()"
Merging bpf-next/for-next (34da87213d3d selftests/bpf: Test bpf_sk_storage_=
get in tcp iterators)
Merging ipsec-next/master (c7a5899eb26e xfrm: redact SA secret with lockdow=
n confidentiality)
Merging mlx5-next/mlx5-next (04b222f95773 RDMA/mlx5: Remove IB representors=
 dead code)
Merging netfilter-next/master (04295878beac netfilter: use actual socket sk=
 for REJECT action)
Merging ipvs-next/master (04295878beac netfilter: use actual socket sk for =
REJECT action)
Merging wireless-drivers-next/master (871a825c3902 brcmfmac: remove redunda=
nt assignment to pointer 'entry')
Merging bluetooth/master (02be5f13aacb MAINTAINERS: Update Bluetooth entrie=
s)
Merging mac80211-next/master (0064c5c1b3bf net: xfrm: use core API for upda=
ting/providing stats)
Merging gfs2/for-next (6e5c4ea37a99 gfs2: in signal_our_withdraw wait for u=
nfreeze of _this_ fs only)
Merging mtd/mtd/next (ffad560394de mtd: phram: Allow the user to set the er=
ase page size.)
Merging nand/nand/next (6d963277fb0f mtd: rawnand: mxc: Use a single line f=
or of_device_id)
$ git reset --hard HEAD^
Merging next-20201207 version of nand
Merging spi-nor/spi-nor/next (ad624dfd7bb6 mtd: spi-nor: micron-st: allow u=
sing MT35XU512ABA in Octal DTR mode)
Merging crypto/master (0464e0ef4f14 crypto: aegis128 - avoid spurious refer=
ences crypto_aegis128_update_simd)
Merging drm/drm-next (5eb3c85e343a Merge branch 'etnaviv/next' of https://g=
it.pengutronix.de/git/lst/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/vga/vga_switcheroo.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/nouveau/nouveau_bo.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/gvt.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/ast/ast_mode.c
Merging amdgpu/drm-next (14133a21f0b5 drm/amdgpu/display: move link_bandwid=
th_kbps under CONFIG_DRM_AMD_DC_DCN)
CONFLICT (content): Merge conflict in drivers/pci/pcie/err.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/radeon/radeon_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/clk_mg=
r/dcn21/rn_clk_mgr.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ttm=
.c
Merging drm-intel/for-linux-next (d371d6ea92ad drm/i915/display/dp: Compute=
 the correct slice count for VDSC on DP)
Merging drm-tegra/drm/tegra/for-next (bf3a3cdcad40 drm/tegra: sor: Disable =
clocks on error in tegra_sor_init())
Merging drm-misc/for-linux-next (a3d0d8347978 drm: fix typos in plane and C=
RTC overviews)
Merging drm-msm/msm-next (e319a1b956f7 drm/msm: add IOMMU_SUPPORT dependenc=
y)
CONFLICT (content): Merge conflict in include/drm/drm_crtc.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/msm_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/disp/dpu1/dpu_crt=
c.c
Applying: drm/msm/gem: fix up for "drm/msm: Introduce GEM object funcs"
Merging imx-drm/imx-drm/next (099e5bde9bd2 drm/imx: depend on COMMON_CLK to=
 fix compile tests)
Merging etnaviv/etnaviv/next (4612bad5701e drm/etnaviv: Add lockdep annotat=
ions for context lock)
Merging regmap/for-next (4616c509d187 Merge remote-tracking branch 'regmap/=
for-5.11' into regmap-next)
Merging sound/for-next (88a06d6fd6b3 ALSA: rawmidi: Access runtime->avail a=
lways in spinlock)
Merging sound-asoc/for-next (49c0a6c3d162 Merge remote-tracking branch 'aso=
c/for-5.11' into asoc-next)
Merging modules/modules-next (2d26c716fc49 module: drop semicolon from vers=
ion macro)
Merging input/next (7ce8d91b8a84 Input: vsxxxaa - fix Kconfig spelling mist=
ake)
Merging block/for-next (330c5cb64c5e Merge branch 'for-5.11/drivers' into f=
or-next)
CONFLICT (content): Merge conflict in fs/f2fs/super.c
CONFLICT (content): Merge conflict in fs/f2fs/f2fs.h
CONFLICT (content): Merge conflict in fs/f2fs/checkpoint.c
CONFLICT (content): Merge conflict in arch/arm64/include/asm/thread_info.h
Applying: fixup for "block: merge struct block_device and struct hd_struct"
Applying: fixup for "net: Remove the err argument from sock_from_file"
Merging device-mapper/for-next (a2b8b2d97567 dm crypt: export sysfs of kcry=
ptd workqueue)
Merging pcmcia/pcmcia-next (70d3a462fc24 pcmcia: omap: Fix error return cod=
e in omap_cf_probe())
Merging mmc/next (6f56023aea3a Merge branch 'fixes' into next)
Merging mfd/for-mfd-next (0cd3aa995740 mfd: kempld-core: Add support for ad=
ditional devices)
Merging backlight/for-backlight-next (789eb04b6c56 backlight: pwm_bl: Fix i=
nterpolation)
Merging battery/for-next (faa2cec66798 power: supply: wm831x_power: remove =
unneeded break)
Merging regulator/for-next (9408285b3084 Merge remote-tracking branch 'regu=
lator/for-5.11' into regulator-next)
Merging security/next-testing (9dcd47fc1f7d Merge branch 'fixes-v5.10' into=
 next-testing)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (207cdd565dfc ima: Don't modify file descr=
iptor mode on the fly)
Merging keys/keys-next (b6f61c314649 keys: Implement update for the big_key=
 type)
Merging safesetid/safesetid-next (03ca0ec13892 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (3df98d79215a lsm,selinux: pass flowi_common instead o=
f flowi to the LSM hooks)
Merging smack/next (9b0072e2b2b5 security/smack: remove unused varible 'rc')
Merging tomoyo/master (15269fb19310 tomoyo: Fix typo in comments.)
Merging tpmdd/next (bec020d3b6fd tpm: Fix fall-through warnings for Clang)
Merging watchdog/master (3650b228f83a Linux 5.10-rc1)
Merging iommu/next (4dd6ce478003 iommu: Fix a check in iommu_check_bind_dat=
a())
Merging audit/next (6b3211842a11 audit: replace atomic_add_return())
Merging devicetree/for-next (13c7e1a6f5ee dt-bindings: Correct GV11B GPU re=
gister sizes)
Merging mailbox/mailbox-for-next (017909281eb0 mailbox: stm32-ipcc: cast vo=
id pointers to unsigned long)
Merging spi/for-next (56608ab4f927 Merge remote-tracking branch 'spi/for-5.=
11' into spi-next)
Merging tip/auto-latest (2521bfed6027 Merge branch 'linus' into auto-latest)
CONFLICT (content): Merge conflict in tools/power/cpupower/utils/helpers/mi=
sc.c
CONFLICT (content): Merge conflict in Documentation/x86/index.rst
Merging clockevents/timers/drivers/next (e588acdb8087 clocksource/drivers/r=
iscv: Make RISCV_TIMER depends on RISCV_SBI)
Merging edac/edac-for-next (f4161dcc4e2c Merge branch 'edac-drivers' into e=
dac-for-next)
Merging irqchip/irq/irqchip-next (74cde1a53368 irqchip/gic-v3-its: Uncondit=
ionally save/restore the ITS state on suspend)
Merging ftrace/for-next (5b7be9c709e1 ring-buffer: Add test to validate the=
 time stamp deltas)
CONFLICT (content): Merge conflict in kernel/trace/ring_buffer.c
Merging rcu/rcu/next (2c05cc592050 percpu_ref: Print stack trace upon refer=
ence-count underflow)
Merging kvm/linux-next (e792415c5d3e KVM: MIPS/VZ: Fix build error caused b=
y 'kvm_run' cleanup)
Merging kvm-arm/next (e12a393fa549 Merge remote-tracking branch 'origin/kvm=
-arm64/psci-relay' into kvmarm-master/queue)
Merging kvm-ppc/kvm-ppc-next (cf59eb13e151 KVM: PPC: Book3S: Fix symbol und=
eclared warnings)
Merging kvms390/next (b0579b1d693f KVM: s390: track synchronous pfault even=
ts in kvm_stat)
Merging xen-tip/linux-next (65cae18882f9 x86/xen: don't unbind uninitialize=
d lock_kicker_irq)
Merging percpu/for-next (eb4c8d15efda Merge branch 'for-5.11' into for-next)
Merging workqueues/for-next (ac87f8ff6cf1 workqueue: Kick a worker based on=
 the actual activation of delayed works)
Merging drivers-x86/for-next (dea5b80a043f platform/x86: intel-hid: Do not =
create SW_TABLET_MODE input-dev when a KIOX010A ACPI dev is present)
CONFLICT (content): Merge conflict in drivers/platform/x86/intel-vbtn.c
Merging chrome-platform/for-next (de0f49487db3 platform/chrome: cros_ec_typ=
ec: Register partner altmodes)
Merging hsi/for-next (8a77ed6d1fdd HSI: core: fix a kernel-doc markup)
Merging leds/for-next (98650b087417 leds: turris-omnia: check for LED_COLOR=
_ID_RGB instead LED_COLOR_ID_MULTI)
Merging ipmi/for-next (368ffd9adc7a ipmi: msghandler: Suppress suspicious R=
CU usage warning)
Merging driver-core/driver-core-next (784b2c48ac12 driver core: auxiliary b=
us: Fix auxiliary bus shutdown null auxdrv ptr)
Merging usb/usb-next (93837812a5dc Merge 5.10-rc7 into usb-next)
Merging usb-gadget/next (b2c586eb07ef usb: dwc2: Fix INTR OUT transfers in =
DDMA mode.)
Merging usb-serial/usb-next (daa919196be4 USB: serial: cp210x: clean up dtr=
_rts())
Merging usb-chipidea-next/for-usb-next (08bb455ee0cf MAINTAINERS: add Caden=
ce USBSSP DRD IP driver entry)
CONFLICT (content): Merge conflict in drivers/usb/cdns3/core.c
Merging phy-next/next (18b648322d44 phy: mediatek: statify mtk_hdmi_phy_dri=
ver)
CONFLICT (content): Merge conflict in drivers/phy/samsung/phy-exynos-pcie.c
CONFLICT (content): Merge conflict in MAINTAINERS
Merging tty/tty-next (ba3b8bb1263d Merge 5.10-rc7 into tty-next)
Merging char-misc/char-misc-next (a3ab07c642b2 Merge 5.10-rc7 into char-mis=
c-next)
Merging extcon/extcon-next (54589b557a8d extcon: fsa9480: Support TI TSU611=
1 variant)
Merging soundwire/next (17e0da0b8979 soundwire: intel: fix another unused-f=
unction warning)
Merging thunderbolt/next (db0746e3399e thunderbolt: Add support for Intel M=
aple Ridge)
Merging vfio/next (bccce80bbd44 vfio-ccw: Wire in the request callback)
Merging staging/staging-next (138f3e126548 Staging: rtl8723bs/core fix brac=
e coding style issues in rtw_ioctl_set.c)
CONFLICT (modify/delete): Documentation/devicetree/bindings/iio/adc/mt6577_=
auxadc.txt deleted in staging/staging-next and modified in HEAD. Version HE=
AD of Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt left in t=
ree.
$ git rm -f Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
Applying: fixup for "irq_work: Cleanup"
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (abb888d86f62 Merge branch 'icc-5.11' into HEAD)
Merging dmaengine/next (5d051f37f49d dmaengine: ti: drop of_match_ptr and m=
ark of_device_id table as maybe unused)
CONFLICT (content): Merge conflict in drivers/dma/idxd/submit.c
CONFLICT (content): Merge conflict in drivers/dma/idxd/registers.h
CONFLICT (content): Merge conflict in drivers/dma/idxd/device.c
Merging cgroup/for-next (5a7b5f32c5aa cgroup/cgroup.c: replace 'of->kn->pri=
v' with of_cft())
Merging scsi/for-next (57a6552b3a63 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (419be8b82389 scsi: mpt3sas: Update driver versio=
n to 36.100.00.00)
CONFLICT (content): Merge conflict in drivers/scsi/qla2xxx/qla_nvme.c
Merging vhost/linux-next (fb202878ae6b vdpa: ifcvf: Use dma_set_mask_and_co=
herent to simplify code)
Merging rpmsg/for-next (285359d4dc0a Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (0f8d9ac8978b Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (48f32a835373 gpio: mvebu: switch pwm durat=
ion registers to regmap)
CONFLICT (content): Merge conflict in drivers/gpio/gpiolib-acpi.c
Merging gpio-intel/for-next (e709a7b5a066 gpiolib: acpi: Make Intel GPIO tr=
ee official for GPIO ACPI work)
Merging pinctrl/for-next (9b185cd4fdca Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0b74e40a4e41 pinctrl: baytrail: Avoid clear=
ing debounce value when turning it off)
Merging pinctrl-samsung/for-next (c5564a50d990 pinctrl: samsung: s3c24xx: r=
emove unneeded break)
Merging pwm/for-next (45b6efd75c8f pwm: keembay: Fix build failure with -Os)
Merging userns/for-next (a1142ad21375 Merge of signal-for-v5.11, and exec-f=
or-v5.11 for testing in linux-next)
CONFLICT (content): Merge conflict in kernel/bpf/task_iter.c
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
Merging coresight/next (66a09659259c coresight: remove broken __exit annota=
tions)
Merging rtc/rtc-next (ce9af8939202 rtc: s3c: Remove dead code related to pe=
riodic tick handling)
Merging nvdimm/libnvdimm-for-next (a1b8638ba132 Linux 5.9-rc7)
Merging at24/at24/for-next (3650b228f83a Linux 5.10-rc1)
Merging ntb/ntb-next (75b6f6487ced ntb: intel: add Intel NTB LTR vendor sup=
port for gen4 NTB)
Merging seccomp/for-next/seccomp (2c07343abd89 selftests/seccomp: Update ke=
rnel config)
CONFLICT (content): Merge conflict in arch/csky/include/asm/Kbuild
Merging kspp/for-next/kspp (09162bc32c88 Linux 5.10-rc4)
Merging gnss/gnss-next (48778464bb7d Linux 5.8-rc2)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (6790dc4a58f3 slimbus: qcom-ngd-ctrl: fix SSR depe=
ndencies)
CONFLICT (content): Merge conflict in drivers/slimbus/Kconfig
Merging nvmem/for-next (292b72c982a6 nvmem: imx-ocotp: add support for the =
unaliged word count)
Merging xarray/main (80c1dbebf308 XArray: Fix splitting to non-zero orders)
Merging hyperv/hyperv-next (5c641fee4ccf drivers/hv: remove obsolete TODO a=
nd fix misleading typo in comment)
Merging auxdisplay/auxdisplay (351dcacc6d77 auxdisplay: panel: Remove redun=
dant charlcd_ops structures)
Merging kgdb/kgdb/for-next (d081a6e35316 kdb: Fix pager search for multi-li=
ne strings)
Merging pidfd/for-next (4e62d55d77bb selftests: openat2: add RESOLVE_ confl=
ict test)
Merging hmm/hmm (3650b228f83a Linux 5.10-rc1)
Merging fpga/for-next (aaf8fe39c952 Revert "fpga: dfl: fix the definitions =
of type & feature_id for dfl devices")
Merging kunit/test (3650b228f83a Linux 5.10-rc1)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (5de15b610f78 mtd: hyperbus: add Renesas RPC-IF driver)
Merging kunit-next/kunit (5f6b99d0287d fs: ext4: Modify inode-test.c to use=
 KUnit parameterized testing feature)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (4ea6fa2cb921 mhi: pci_generic: Fix implicit conversio=
n warning)
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
Merging memblock/for-next (5bdba520c1b3 mm: memblock: drop __init from memb=
lock functions to make it inline)
Merging init/init-user-pointers (38b082236e77 initramfs: use vfs_utimes in =
do_copy)
Merging counters/counters (3650b228f83a Linux 5.10-rc1)
Applying: rtw88: pci: "extern" is necessary for header declarations of data
Applying: scsi: block: fix for "scsi: block: Do not accept any requests whi=
le suspended"
Merging akpm-current/current (c564d100b334 lib/lzo/lzo1x_compress.c: make l=
zogeneric1x_1_compress() static)
CONFLICT (content): Merge conflict in tools/testing/selftests/lkdtm/tests.t=
xt
CONFLICT (content): Merge conflict in mm/memcontrol.c
CONFLICT (content): Merge conflict in mm/highmem.c
CONFLICT (content): Merge conflict in include/linux/sched.h
CONFLICT (content): Merge conflict in include/linux/mm.h
CONFLICT (content): Merge conflict in include/linux/memcontrol.h
CONFLICT (content): Merge conflict in include/linux/kernel.h
CONFLICT (content): Merge conflict in drivers/misc/lkdtm/lkdtm.h
CONFLICT (content): Merge conflict in drivers/misc/lkdtm/Makefile
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
CONFLICT (content): Merge conflict in arch/arc/Kconfig
CONFLICT (content): Merge conflict in arch/Kconfig
Applying: fixup for "mm: move lruvec stats update functions to vmstat.h"
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (623794d94dce secretmem: test: add basic selftest for m=
emfd_secret(2))

--Sig_/iACfRDvCi494Ke=XkwIJeDc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/PV8IACgkQAVBC80lX
0GwrTwf/Z9OI8tCEd2HAtMRur6k3EuJeaNx4+Z7qZgsH8KlR2O4a4aNQEsI3FVsp
/7FnMjP5BRpEr7M+RRU1FeIWa6Ebehdj66bX5jphQkSpofpahiGrh6jfnfVPp5bJ
ol/RL4DRWr2TavcpOef0ysDszIUd1LmUzAAyvrjd7g+WJcHoDRvzdbmANK4LtDhr
UvXFbS55VU0Dt8fCjeLbk25q83EH0g+4Bhy4PimQEoFD+0y+Bo9uLYcWT+aAp0W7
KzW/cIDD5DW8Q6yS3ibtZgl9tqQuw8yMA5GzwdJc3Wi+JnbPUeD/mWo85IIv7098
YJ0zjosk62u+S8YhM/3hB1q5/8mu0w==
=9yx1
-----END PGP SIGNATURE-----

--Sig_/iACfRDvCi494Ke=XkwIJeDc--
