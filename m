Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 310932C8022
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 09:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbgK3IhQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 03:37:16 -0500
Received: from ozlabs.org ([203.11.71.1]:54119 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728090AbgK3IhN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 03:37:13 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ckz972RxJz9sT6;
        Mon, 30 Nov 2020 19:36:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606725387;
        bh=/YyiCeqdv7u9zlTy1vsYUwMU4w8IoknWinDa4/J+0/U=;
        h=Date:From:To:Cc:Subject:From;
        b=fGAyB4NDDTjoiROIz4ajOUHZN+3rBPALGlaSW7OyVtcct5xhNIjDDbW+dQiRbyHHN
         f1mLWohtHkcGKUK2sz3bonrMYwZhtdDOjCDnq4PE76Bkd732COcp37WLDM6/c6RLtH
         d3sHnKS2HJ1ziXkB6RkJZwtC6HB2mbTpTiUDAmFsTVW7RUcbFIHrWbKn+KQCUWHlee
         IRTMgHUb3wWBNGKbd4aQckY2NI08EoUv58FY8dYo6Lrjog5tobsDMmM9z3dm3sbOK2
         ANfv7ZBeM48aVPNa+xnrAf+UXrDJsAOb5Y3EnvpzRemkE7p7RyylGDIj411P5Tew5F
         C9462sLUuq0Zg==
Date:   Mon, 30 Nov 2020 19:36:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 30
Message-ID: <20201130193626.1c408e47@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OhqPB6js6WOqOU++dvb5QzN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OhqPB6js6WOqOU++dvb5QzN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20201127:

The dma-mapping tree lost its build failure.

The net-next tree gained a conflict against the net tree.

The regmap tree stll had its build failure.

The tip tree lost its build failure but gained a conflict against the
pci tree.

The akpm tree gained conflicts against the arm64 tree.

Non-merge commits (relative to Linus' tree): 8436
 8043 files changed, 637772 insertions(+), 136172 deletions(-)

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
Merging origin/master (f91a3aa6bce4 Merge tag 'locking-urgent-2020-11-29' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip)
Merging fixes/fixes (168af485621a powerpc: fix the allyesconfig build)
Merging kbuild-current/fixes (d1889589a4f5 builddeb: Fix rootless build in =
setuid/setgid directory)
Merging arc-current/for-curr (f737561c7096 ARC: stack unwinding: reorganize=
 how initial register state setup)
Merging arm-current/fixes (9fa2e7af3d53 ARM: 9019/1: kprobes: Avoid fortify=
_panic() when copying optprobe template)
Merging arm64-fixes/for-next/fixes (ff1712f953e2 arm64: pgtable: Ensure dir=
ty bit is preserved across pte_wrprotect())
Merging arm-soc-fixes/arm/fixes (ae597565d13f Merge tag 'optee-valid-memory=
-type-for-v5.11' of git://git.linaro.org/people/jens.wiklander/linux-tee in=
to arm/fixes)
Merging drivers-memory-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging m68k-current/for-linus (50c5feeea0af ide/macide: Convert Mac IDE dr=
iver to platform driver)
Merging powerpc-fixes/fixes (b6b79dd53082 powerpc/64s: Fix allnoconfig buil=
d since uaccess flush)
Merging s390-fixes/fixes (1179f170b6f0 s390: fix fpu restore in entry.S)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (4d521943f76b dt-bindings: net: correct interrupt flags =
in examples)
Merging bpf/master (9a44bc9449cf bpf: Add MAINTAINERS entry for BPF LSM)
Merging ipsec/master (48f486e13ffd net: xfrm: fix memory leak in xfrm_user_=
policy())
Merging netfilter/master (4d521943f76b dt-bindings: net: correct interrupt =
flags in examples)
Merging ipvs/master (c0700dfa2cae netfilter: nf_tables: avoid false-postive=
 lockdep splat)
Merging wireless-drivers/master (fe56d05ee6c8 iwlwifi: mvm: fix kernel pani=
c in case of assert during CSA)
Merging mac80211/master (849920c70339 devlink: Add missing genlmsg_cancel()=
 in devlink_nl_sb_port_pool_fill())
Merging rdma-fixes/for-rc (17475e104dcb RDMA/hns: Bugfix for memory window =
mtpt configuration)
Merging sound-current/for-linus (aeedad250499 ALSA: hda/realtek: Add mute L=
ED quirk to yet another HP x360 model)
Merging sound-asoc-fixes/for-linus (356c199d0b72 Merge remote-tracking bran=
ch 'asoc/for-5.10' into asoc-linus)
Merging regmap-fixes/for-linus (e6e9354b5830 regmap: Remove duplicate `type=
` field from regmap `regcache_sync` trace event)
Merging regulator-fixes/for-linus (34c5aa2666db regulator: Kconfig: Fix REG=
ULATOR_QCOM_RPMH dependencies to avoid build error)
Merging spi-fixes/for-linus (893ff790cf6a Merge remote-tracking branch 'spi=
/for-5.10' into spi-linus)
Merging pci-current/for-linus (cce14622a703 PCI: Add function 1 DMA alias q=
uirk for Marvell 9215 SATA controller)
Merging driver-core.current/driver-core-linus (f8394f232b1e Linux 5.10-rc3)
Merging tty.current/tty-linus (418baf2c28f3 Linux 5.10-rc5)
Merging usb.current/usb-linus (484cfbe5fb61 usb: typec: stusb160x: fix powe=
r-opmode property with typec-power-opmode)
Merging usb-gadget-fixes/fixes (129aa9734559 usb: raw-gadget: fix memory le=
ak in gadget_setup)
Merging usb-serial-fixes/usb-linus (6d6556c04eba USB: serial: option: add s=
upport for Thales Cinterion EXS82)
Merging usb-chipidea-fixes/for-usb-fixes (3ed55d528a54 usb: cdns3: core: fi=
x goto label for error path)
Merging phy/fixes (fb89b2544b64 phy: mediatek: fix spelling mistake in Kcon=
fig "veriosn" -> "version")
Merging staging.current/staging-linus (418baf2c28f3 Linux 5.10-rc5)
Merging char-misc.current/char-misc-linus (c7acb6b9c07b MAINTAINERS: Adding=
 help for coresight subsystem)
Merging soundwire-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging thunderbolt-fixes/fixes (600c0849cf86 thunderbolt: Fix use-after-fr=
ee in remove_unplugged_switch())
Merging input-current/for-linus (855b69857830 Input: i8042 - fix error retu=
rn code in i8042_setup_aux())
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
Merging mtd-fixes/mtd/fixes (b36bf0a0fe5d mtd: rawnand: socrates: Move the =
ECC initialization to ->attach_chip())
Merging mfd-fixes/for-mfd-fixes (bbf5c979011a Linux 5.9)
Merging v4l-dvb-fixes/fixes (44f28934af14 media: vidtv.rst: add kernel-doc =
markups)
Merging reset-fixes/reset/fixes (b460e0a9e240 reset: intel: add unspecified=
 HAS_IOMEM dependency)
Merging mips-fixes/mips-fixes (ac3b57adf87a MIPS: Alchemy: Fix memleak in a=
lchemy_clk_setup_cpu)
Merging at91-fixes/at91-fixes (54ecb8f7028c Linux 5.4-rc1)
Merging omap-fixes/fixes (05d5de6ba7db ARM: dts: dra76x: m_can: fix order o=
f clocks)
Merging kvm-fixes/master (c2b1209d852f MAINTAINERS: Update email address fo=
r Sean Christopherson)
Merging kvms390-fixes/master (735931f9a51a MAINTAINERS: add uv.c also to KV=
M/s390)
Merging hwmon-fixes/hwmon (418baf2c28f3 Linux 5.10-rc5)
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
Merging scsi-fixes/fixes (e92643db5148 scsi: ufs: Fix race between shutdown=
 and runtime resume flow)
Merging drm-fixes/drm-fixes (9595930db4bb Merge tag 'drm-misc-fixes-2020-11=
-26' of ssh://git.freedesktop.org/git/drm/drm-misc into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (280ffdb6ddb5 drm/i915/gt: Fre=
e stale request on destroying the virtual engine)
Merging mmc-fixes/fixes (a42a7ec9bb99 mmc: sdhci-of-arasan: Fix clock regis=
tration error for Keem Bay SOC)
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
Merging spdx/spdx-linus (3cea11cd5e3b Linux 5.10-rc2)
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
Merging drm-misc-fixes/for-linux-next-fixes (aec9fe892812 drm/rockchip: Avo=
id uninitialized use of endpoint id in LVDS)
Merging kspp-gustavo/for-next/kspp (36f9ff9e03de lib: Fix fall-through warn=
ings for Clang)
Merging kbuild/for-next (0ce21d58b7af kconfig: qconf: show Qt version in th=
e About dialog)
Merging compiler-attributes/compiler-attributes (971385eae4fc Compiler Attr=
ibutes: remove CONFIG_ENABLE_MUST_CHECK)
Merging dma-mapping/for-next (7679325702c9 selftests/dma: add test applicat=
ion for DMA_MAP_BENCHMARK)
Merging asm-generic/master (8eb42bcea5ae Merge branch 'asm-generic-fixes' i=
nto asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (40bd54f12902 Merge branch 'devel-stable' into for-nex=
t)
Merging arm64/for-next/core (78fae44603f1 Merge branch 'for-next/misc' into=
 for-next/core)
Merging arm-perf/for-next/perf (367c820ef080 arm64: Enable perf events base=
d hard lockup detector)
Merging arm-soc/for-next (33fa6976a384 soc: document merges)
Merging amlogic/for-next (84a1411c7549 Merge branch 'v5.11/soc' into tmp/am=
l-rebuild)
Merging aspeed/for-next (41707a524026 Merge branches 'soc-for-v5.11' and 'd=
efconfig-for-v5.11' into for-next)
Merging at91/at91-next (65cc8babccce Merge branches 'at91-drivers', 'at91-d=
t' and 'at91-defconfig' into at91-next)
Merging drivers-memory/for-next (a4f11eac544c Merge branch 'mem-ctrl-next' =
into for-next)
Merging imx-mxs/for-next (24462a1e187c Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (b2a8f6ce4bdc Merge branch 'for_5.11/drivers-soc' int=
o next)
Merging mediatek/for-next (727bfb2c55b0 Merge branch 'v5.10-next/soc' into =
for-next)
Merging mvebu/for-next (5c5bf284e9e4 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (6a5044c84dfa Merge branch 'omap-for-v5.11/genpd' int=
o for-next)
Merging qcom/for-next (ab57017c45f2 Merge branches 'arm64-for-5.11', 'arm64=
-defconfig-for-5.11', 'drivers-for-5.11' and 'dts-for-5.11' into for-next)
Merging raspberrypi/for-next (278407a53c3b ARM: dts: bcm283x: increase dwc2=
's RX FIFO size)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (d5360d3b5aee Merge branch 'renesas-arm-dt-for-v5.11' =
into renesas-next)
Merging reset/reset/next (3bfe8933f9d1 reset: meson: make it possible to bu=
ild as a module)
Merging rockchip/for-next (db4d9df43533 Merge branch 'v5.11-armsoc/drivers'=
 into for-next)
Merging samsung-krzk/for-next (4792bcc96771 Merge branch 'next/defconfig' i=
nto for-next)
Merging scmi/for-linux-next (d07628cb5092 Merge tag 'scmi-updates-5.11' of =
git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-l=
inux-next)
Merging stm32/stm32-next (814fddb955f8 ARM: multi_v7_defconfig: enable STM3=
2 dfsdm audio support)
Merging sunxi/sunxi/for-next (8ebd74f80194 Merge branches 'sunxi/dt-for-5.1=
1', 'sunxi/fixes-for-5.10' and 'sunxi/config-for-5.11' into sunxi/for-next)
Merging tegra/for-next (b11a0dfbd316 Merge branch for-5.11/arm64/defconfig =
into for-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (090f54565722 Merge branch 'ti-k3-dts-next' in=
to ti-k3-next)
Merging clk/clk-next (9dc1f9729380 Merge branch 'clk-qcom' into clk-next)
Merging clk-samsung/for-next (44a9e78f9242 clk: samsung: Prevent potential =
endless loop in the PLL ops)
Merging csky/linux-next (ba3b26607f55 csky: Optimize atomic operations with=
 correct barrier usage)
Merging h8300/h8300-next (8808515be0ed h8300: Replace <linux/clk-provider.h=
> by <linux/of_clk.h>)
Merging ia64/next (c331649e6371 ia64: Use libata instead of the legacy ide =
driver in defconfigs)
Merging m68k/for-next (a7b5458ce73b m68k: Fix WARNING splat in pmac_zilog d=
river)
Merging m68knommu/for-next (d0198645d610 m68k: m68328: remove duplicate cod=
e)
Merging microblaze/next (ed2124c0b9a8 microblaze: add support for TIF_NOTIF=
Y_SIGNAL)
Merging mips/mips-next (1dac4585f585 MIPS: Loongson64: Fix up reserving ker=
nel memory range)
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
Merging powerpc/next (0bd4b96d9910 powernv/memtrace: don't abuse memory hot=
(un)plug infrastructure for memory allocations)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (e95f287deed2 soc: fsl: handle RCPM errata A-008646 on=
 SoC LS1021A)
Merging risc-v/for-next (b5b11a8ac4b5 RISC-V: Move dynamic relocation secti=
on under __init)
Merging s390/for-next (b79e43ff5aa0 Merge branch 'features' into for-next)
CONFLICT (content): Merge conflict in arch/s390/include/asm/mmu_context.h
Merging sh/for-next (b0cfc315ff38 sh: fix syscall tracing)
Merging sparc-next/master (dd0d718152e4 Merge tag 'spi-fix-v5.8-rc2' of git=
://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi)
Merging uml/linux-next (9a5085b3fad5 um: Call pgtable_pmd_page_dtor() in __=
pmd_free_tlb())
Merging xtensa/xtensa-for-next (dc293f210690 xtensa: uaccess: Add missing _=
_user to strncpy_from_user() prototype)
Merging fscrypt/master (4a4b8721f1a5 fscrypt: simplify master key locking)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (30da94ea78c2 Merge branch 'for-next-next-v5.10-2020=
1127' into for-next-20201127)
Merging ceph/master (62575e270f66 ceph: check session state after bumping s=
ession->s_seq)
Merging cifs/for-next (cab4cc1e5a42 cifs: fix potential use-after-free in c=
ifs_echo_request())
Merging configfs/for-next (65cdb4a214c0 configfs: fix kernel-doc markup iss=
ue)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (1b2b66d55670 erofs: remove a void EROFS_VERSION macro se=
t in Makefile)
Merging exfat/dev (f9893351acae Merge tag 'kconfig-v5.10' of git://git.kern=
el.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging ext3/for_next (d2bc88b6e0fd Pull reiserfs disk corruption handling =
fix.)
Merging ext4/dev (f902b2165010 ext4: fix bogus warning in ext4_update_dx_fl=
ag())
Merging f2fs/dev (632cc618fa14 f2fs: Handle casefolding with Encryption)
Merging fsverity/fsverity (bde493349025 fs-verity: move structs needed for =
file signing to UAPI header)
Merging fuse/for-next (9d769e6aa252 fuse: support SB_NOSEC flag to improve =
write performance)
Merging jfs/jfs-next (c61b3e483900 jfs: Fix array index bounds check in dbA=
djTree)
Merging nfs/linux-next (418baf2c28f3 Linux 5.10-rc5)
Merging nfs-anna/linux-next (11decaf8127b NFS: Remove unnecessary inode loc=
k in nfs_fsync_dir())
Merging nfsd/nfsd-next (c3213d260a23 SUNRPC: Fix oops in the rpc_xdr_buf ev=
ent class)
Merging cel/cel-next (e0d8f79730f5 Revert "nfsd4: support change_attr_type =
attribute")
Merging orangefs/for-next (e848643b524b orangefs: remove unnecessary assign=
ment to variable ret)
Merging overlayfs/overlayfs-next (c11faf32599f ovl: fix incorrect extent in=
fo in metacopy case)
Merging ubifs/next (e2a05cc7f822 ubifs: mount_ubifs: Release authentication=
 resource in error handling path)
Merging v9fs/9p-next (5bfe97d7382b 9p: Fix writeback fid incorrectly being =
attached to dentry)
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
Merging pci/next (46f821a9cff2 Merge branch 'remotes/lorenzo/pci/misc')
Merging pstore/for-next/pstore (3cea11cd5e3b Linux 5.10-rc2)
Merging hid/for-next (cdaa1e42b483 Merge branch 'for-5.10/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (c97e7615c15b Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (015cbe1f0506 i3c: Resign from my maintainer role)
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (439ed83acc19 hwmon: (pwm-fan) Convert to =
hwmon_device_register_with_info API)
Merging jc_docs/docs-next (ac7711427014 doc:it_IT: align Italian documentat=
ion)
Merging v4l-dvb/master (a3f132df0e5f media: bttv: use generic power managem=
ent)
CONFLICT (content): Merge conflict in drivers/media/platform/marvell-ccic/m=
mp-driver.c
Merging v4l-dvb-next/master (d0a9fffedca1 docs: fs: api-summary.rst: get ri=
d of kernel-doc include)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (735f7fba25ec Merge branch 'pm-acpi' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (32c855670808 cpufreq: vexpress-=
spc: Add missing MODULE_ALIAS)
Merging cpupower/cpupower (748f0d70087c cpupower: Provide online and offlin=
e CPU information)
Merging devfreq/devfreq-next (98fd9972ed60 PM / devfreq: tegra20: Deprecate=
 in a favor of emc-stat based driver)
Merging opp/opp/linux-next (ed40e33c0b91 opp: Reduce the size of critical s=
ection in _opp_kref_release())
Merging thermal/thermal/linux-next (90a996544946 thermal: power allocator: =
change the 'k_*' always in estimate_pid_constants())
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (4f19d071f9be fs: dlm: check on existing node address)
Merging swiotlb/linux-next (fc0021aa340a swiotlb: remove the tbl_dma_addr a=
rgument to swiotlb_tbl_map_single)
Merging rdma/for-next (dd37d2f59eb8 RDMA/cma: Fix deadlock on &lock in rdma=
_cma_listen_on_all() error unwind)
CONFLICT (content): Merge conflict in include/linux/dma-mapping.h
Merging net-next/master (e71d2b957ee4 Merge branch 'net-ipa-start-adding-ip=
a-v4-5-support')
CONFLICT (content): Merge conflict in drivers/net/ethernet/ibm/ibmvnic.c
Merging bpf-next/for-next (bb1b25cab043 xdp: Remove the functions xsk_map_i=
nc and xsk_map_put)
Merging ipsec-next/master (8be33ecfc1ff net: skb_vlan_untag(): don't reset =
transport offset if set by GRO layer)
Merging mlx5-next/mlx5-next (3650b228f83a Linux 5.10-rc1)
Merging netfilter-next/master (988187e88103 ipvs: replace atomic_add_return=
())
Merging ipvs-next/master (988187e88103 ipvs: replace atomic_add_return())
Merging wireless-drivers-next/master (7ec8a926188e cw1200: fix missing dest=
roy_workqueue() on error in cw1200_init_common)
Merging bluetooth/master (7c6601813962 Bluetooth: Fix attempting to set RPA=
 timeout when unsupported)
Merging mac80211-next/master (0064c5c1b3bf net: xfrm: use core API for upda=
ting/providing stats)
Merging gfs2/for-next (5927aa13822a Revert "GFS2: Prevent delete work from =
occurring on glocks used for create")
Merging mtd/mtd/next (22ca56a34b32 mtd: devices: powernv_flash: Add functio=
n names to headers and fix 'dev')
Merging nand/nand/next (9ec8e263068f mtd: rawnand: gpmi: fix reference coun=
t leak in gpmi ops)
Merging spi-nor/spi-nor/next (ad624dfd7bb6 mtd: spi-nor: micron-st: allow u=
sing MT35XU512ABA in Octal DTR mode)
Merging crypto/master (05c2a705917b crypto: ccree - rework cache parameters=
 handling)
Merging drm/drm-next (22f8c80566c4 Merge tag 'drm-misc-next-2020-11-18' of =
ssh://git.freedesktop.org/git/drm/drm-misc into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/nouveau/nouveau_bo.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/ast/ast_mode.c
Merging amdgpu/drm-next (7ff818f97c30 drm/amdgpu: Enable GPU reset for vang=
ogh)
CONFLICT (content): Merge conflict in drivers/gpu/drm/radeon/radeon_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ttm=
.c
Merging drm-intel/for-linux-next (5cc2b61fb251 drm/i915/display: Suppress "=
Combo PHY A HW state changed unexpectedly")
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/gvt.h
Merging drm-tegra/drm/tegra/for-next (bf3a3cdcad40 drm/tegra: sor: Disable =
clocks on error in tegra_sor_init())
Merging drm-misc/for-linux-next (a96ee0f6b58d drm: panel: simple: Add BOE N=
V110WTM-N61)
Merging drm-msm/msm-next (ff8b941a39d1 drm/msm/disp/dpu1/dpu_encoder: Remov=
e a bunch of unused variables)
CONFLICT (content): Merge conflict in include/drm/drm_crtc.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/msm_drv.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/msm/disp/dpu1/dpu_crt=
c.c
Applying: drm/msm/gem: fix up for "drm/msm: Introduce GEM object funcs"
Merging imx-drm/imx-drm/next (099e5bde9bd2 drm/imx: depend on COMMON_CLK to=
 fix compile tests)
Merging etnaviv/etnaviv/next (4612bad5701e drm/etnaviv: Add lockdep annotat=
ions for context lock)
Merging regmap/for-next (cc65f43aa88f Merge remote-tracking branch 'regmap/=
for-5.11' into regmap-next)
Applying: Revert "ASoC/SoundWire: rt715-sdca: First version of rt715 sdw sd=
ca codec driver"
Merging sound/for-next (0183a855eeb7 ALSA: remove trailing semicolon in mac=
ro definition)
Merging sound-asoc/for-next (7cd624c7d41a Merge remote-tracking branch 'aso=
c/for-5.11' into asoc-next)
Merging modules/modules-next (2aec389e1915 params: clean up module-param ma=
cros)
Merging input/next (f7bda6662fd4 Input: libps2 - fix fall-through warnings =
for Clang)
Merging block/for-next (090a2a2a647c Merge branch 'for-5.11/block' into for=
-next)
Merging device-mapper/for-next (3f5dba110d12 dm writecache: remove BUG() an=
d fail gracefully instead)
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (8223e885e74b mmc: mxc: Convert the driver to DT-only)
Merging mfd/for-mfd-next (14639a22de65 mfd: cpcap: Fix interrupt regression=
 with regmap clear_ack)
Merging backlight/for-backlight-next (789eb04b6c56 backlight: pwm_bl: Fix i=
nterpolation)
Merging battery/for-next (faa2cec66798 power: supply: wm831x_power: remove =
unneeded break)
Merging regulator/for-next (ec0abec390d4 Merge remote-tracking branch 'regu=
lator/for-5.11' into regulator-next)
Merging security/next-testing (3650b228f83a Linux 5.10-rc1)
Merging apparmor/apparmor-next (e37986097ba6 apparmor: Use true and false f=
or bool variable)
Merging integrity/next-integrity (b000d5cb954f ima: defer arch_ima_get_secu=
reboot() call to IMA init time)
Merging keys/keys-next (b6f61c314649 keys: Implement update for the big_key=
 type)
Merging safesetid/safesetid-next (03ca0ec13892 LSM: SafeSetID: Fix warnings=
 reported by test bot)
Merging selinux/next (3df98d79215a lsm,selinux: pass flowi_common instead o=
f flowi to the LSM hooks)
Merging smack/next (9b0072e2b2b5 security/smack: remove unused varible 'rc')
Merging tomoyo/master (1b6b924efeb9 tomoyo: Fix null pointer check)
Merging tpmdd/next (1ce46c91fdfe tpm: Fix fall-through warnings for Clang)
Merging watchdog/master (3650b228f83a Linux 5.10-rc1)
Merging iommu/next (4dd6ce478003 iommu: Fix a check in iommu_check_bind_dat=
a())
Merging audit/next (ba59eae72385 audit: fix macros warnings)
Merging devicetree/for-next (616fde2dd60f dt-bindings: misc: convert fsl,dp=
aa2-console from txt to YAML)
Merging mailbox/mailbox-for-next (c7dacf5b0f32 mailbox: avoid timer start f=
rom callback)
Merging spi/for-next (893e98cc5f63 Merge remote-tracking branch 'spi/for-5.=
11' into spi-next)
Merging tip/auto-latest (c1c38fd953ac Merge branch 'core/entry')
CONFLICT (content): Merge conflict in tools/power/cpupower/utils/helpers/mi=
sc.c
CONFLICT (content): Merge conflict in arch/x86/pci/i386.c
Merging clockevents/timers/drivers/next (e588acdb8087 clocksource/drivers/r=
iscv: Make RISCV_TIMER depends on RISCV_SBI)
Merging edac/edac-for-next (8763e5cbb958 Merge remote-tracking branch 'ras/=
edac-spr' into edac-for-next)
Merging irqchip/irq/irqchip-next (74cde1a53368 irqchip/gic-v3-its: Uncondit=
ionally save/restore the ITS state on suspend)
Merging ftrace/for-next (b111545d26c0 tracing: Remove the useless value ass=
ignment in test_create_synth_event())
Merging rcu/rcu/next (5ca88db79d8d torture: Add --kcsan-kmake-arg to tortur=
e.sh for KCSAN)
Merging kvm/linux-next (e792415c5d3e KVM: MIPS/VZ: Fix build error caused b=
y 'kvm_run' cleanup)
Merging kvm-arm/next (90f0e16c649a Merge branch 'kvm-arm64/misc-5.11' into =
kvmarm-master/next)
Merging kvm-ppc/kvm-ppc-next (cf59eb13e151 KVM: PPC: Book3S: Fix symbol und=
eclared warnings)
Merging kvms390/next (d121365715a0 s390/gmap: make gmap memcg aware)
Merging xen-tip/linux-next (65cae18882f9 x86/xen: don't unbind uninitialize=
d lock_kicker_irq)
Merging percpu/for-next (eb4c8d15efda Merge branch 'for-5.11' into for-next)
Merging workqueues/for-next (ac87f8ff6cf1 workqueue: Kick a worker based on=
 the actual activation of delayed works)
Merging drivers-x86/for-next (912b341585e3 platform/x86: mlx-platform: Remo=
ve PSU EEPROM from MSN274x platform configuration)
Merging chrome-platform/for-next (de0f49487db3 platform/chrome: cros_ec_typ=
ec: Register partner altmodes)
Merging hsi/for-next (41fff6e19bc8 HSI: omap_ssi: Don't jump to free ID in =
ssi_add_controller())
Merging leds/for-next (98650b087417 leds: turris-omnia: check for LED_COLOR=
_ID_RGB instead LED_COLOR_ID_MULTI)
Merging ipmi/for-next (368ffd9adc7a ipmi: msghandler: Suppress suspicious R=
CU usage warning)
Merging driver-core/driver-core-next (33c0c9bdf7a5 drivers: base: fix some =
kernel-doc markups)
Merging usb/usb-next (ab37fa851c48 usb: typec: Add type sysfs attribute fil=
e for partners)
Merging usb-gadget/next (b2c586eb07ef usb: dwc2: Fix INTR OUT transfers in =
DDMA mode.)
Merging usb-serial/usb-next (053af9e6e817 USB: serial: mos7720: defer state=
 restore to a workqueue)
Merging usb-chipidea-next/for-usb-next (d75fcc0d4da2 usb: chipidea: ci_hdrc=
_imx: Use of_device_get_match_data())
Merging phy-next/next (768a711e2d4b phy: samsung: phy-exynos-pcie: fix typo=
 'tunning')
CONFLICT (content): Merge conflict in drivers/phy/samsung/phy-exynos-pcie.c
CONFLICT (content): Merge conflict in MAINTAINERS
Merging tty/tty-next (f35a07f92616 tty: serial: bcm63xx: lower driver depen=
dencies)
Merging char-misc/char-misc-next (f80c21509984 coresight-stm: Fix W=3D1 war=
ning in STM driver)
Merging extcon/extcon-next (54589b557a8d extcon: fsa9480: Support TI TSU611=
1 variant)
Merging soundwire/next (47edc0104c61 soundwire: qcom: Fix build failure whe=
n slimbus is module)
Merging thunderbolt/next (4e58171aa93f MAINTAINERS: Add Isaac as maintainer=
 of Thunderbolt DMA traffic test driver)
Merging vfio/next (2e6cfd496f5b vfio iommu type1: Fix memory leak in vfio_i=
ommu_type1_pin_pages)
Merging staging/staging-next (1de16e38f1fd staging: mt7621-pci: remove 'RAL=
INK_PCI_IMBASEBAR0_ADDR' register)
Merging mux/for-next (05f19f7f8944 mux: adgs1408: Add mod_devicetable.h and=
 remove of_match_ptr)
Merging icc/icc-next (8fb0f9de8eaf Merge branch 'icc-5.11' into HEAD)
Merging dmaengine/next (5d051f37f49d dmaengine: ti: drop of_match_ptr and m=
ark of_device_id table as maybe unused)
CONFLICT (content): Merge conflict in drivers/dma/idxd/submit.c
CONFLICT (content): Merge conflict in drivers/dma/idxd/registers.h
CONFLICT (content): Merge conflict in drivers/dma/idxd/device.c
Merging cgroup/for-next (5a7b5f32c5aa cgroup/cgroup.c: replace 'of->kn->pri=
v' with of_cft())
Merging scsi/for-next (f9123bc98a4f Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (3256b4682386 scsi: fnic: Validate io_req before =
others)
Merging vhost/linux-next (502cb1133adb vhost_vdpa: switch to vmemdup_user())
Merging rpmsg/for-next (ca08b94fd559 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (6c33287665e0 pinctrl: pinctrl-microchip-sgpio: Add p=
inctrl driver for Microsemi Serial GPIO)
Merging gpio-brgl/gpio/for-next (5300ebb695fa gpio: exar: use devm action f=
or freeing the IDA and drop remove())
Merging gpio-intel/for-next (e709a7b5a066 gpiolib: acpi: Make Intel GPIO tr=
ee official for GPIO ACPI work)
Merging pinctrl/for-next (8e5008b1a9a0 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0b74e40a4e41 pinctrl: baytrail: Avoid clear=
ing debounce value when turning it off)
Merging pinctrl-samsung/for-next (c5564a50d990 pinctrl: samsung: s3c24xx: r=
emove unneeded break)
Merging pwm/for-next (228fe8e4deb2 pwm: keembay: Fix build failure with -Os)
Merging userns/for-next (4762edf556ad Merge of signal-for-v5.11, and exec-f=
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
Merging coresight/next (c5348c8a239b coresight-stm: Fix W=3D1 warning in ST=
M driver)
Merging rtc/rtc-next (673536cc5f21 rtc: pcf8523: use BIT)
Merging nvdimm/libnvdimm-for-next (a1b8638ba132 Linux 5.9-rc7)
Merging at24/at24/for-next (3650b228f83a Linux 5.10-rc1)
Merging ntb/ntb-next (3650b228f83a Linux 5.10-rc1)
Merging seccomp/for-next/seccomp (7ef95e3dbcee Merge branch 'for-linus/secc=
omp' into for-next/seccomp)
CONFLICT (content): Merge conflict in arch/csky/include/asm/Kbuild
Merging kspp/for-next/kspp (f2f20a989227 orphans: Disable CONFIG_LD_ORPHAN_=
WARN for ld.lld 10.0.1)
Merging gnss/gnss-next (48778464bb7d Linux 5.8-rc2)
Merging fsi/next (4a851d714ead fsi: aspeed: Support CFAM reset GPIO)
Merging slimbus/for-next (567d838588d8 slimbus: qcom-ngd-ctrl: remove redun=
dant out of memory messages)
Merging nvmem/for-next (292b72c982a6 nvmem: imx-ocotp: add support for the =
unaliged word count)
Merging xarray/main (80c1dbebf308 XArray: Fix splitting to non-zero orders)
Merging hyperv/hyperv-next (206ad34d52a2 hv_netvsc: Validate number of allo=
cated sub-channels)
Merging auxdisplay/auxdisplay (351dcacc6d77 auxdisplay: panel: Remove redun=
dant charlcd_ops structures)
Merging kgdb/kgdb/for-next (d081a6e35316 kdb: Fix pager search for multi-li=
ne strings)
Merging pidfd/for-next (e06ce5515b74 Merge branch 'pidfd_o_nonblock' into f=
or-next)
Merging hmm/hmm (3650b228f83a Linux 5.10-rc1)
Merging fpga/for-next (aaf8fe39c952 Revert "fpga: dfl: fix the definitions =
of type & feature_id for dfl devices")
Merging kunit/test (3650b228f83a Linux 5.10-rc1)
Merging generic-ioremap/for-next (4bdc0d676a64 remove ioremap_nocache and d=
evm_ioremap_nocache)
Merging cfi/cfi/next (5de15b610f78 mtd: hyperbus: add Renesas RPC-IF driver)
Merging kunit-next/kunit (3650b228f83a Linux 5.10-rc1)
Merging trivial/for-next (9ff9b0d392ea Merge tag 'net-next-5.10' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging zx2c4/for-next (16fbf79b0f83 Linux 5.6-rc7)
Merging mhi/mhi-next (10ea8bcda5ae bus: mhi: core: Fix device hierarchy)
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
Merging akpm-current/current (ab573a2b40b2 lib/lzo/lzo1x_compress.c: make l=
zogeneric1x_1_compress() static)
CONFLICT (content): Merge conflict in mm/highmem.c
CONFLICT (content): Merge conflict in include/linux/sched.h
CONFLICT (content): Merge conflict in include/linux/mm.h
CONFLICT (content): Merge conflict in include/linux/kernel.h
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
CONFLICT (content): Merge conflict in arch/arc/Kconfig
CONFLICT (content): Merge conflict in arch/Kconfig
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --a=
bort".
CONFLICT (content): Merge conflict in arch/arm64/kernel/mte.c
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --a=
bort".
CONFLICT (content): Merge conflict in arch/arm64/kernel/mte.c
CONFLICT (content): Merge conflict in arch/arm64/include/asm/processor.h
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --a=
bort".
CONFLICT (content): Merge conflict in arch/arm64/kernel/mte.c
CONFLICT (content): Merge conflict in arch/arm64/kernel/entry.S
Merging akpm/master (76761ffa9ea1 mm/memcg: bail out early when !memcg in m=
em_cgroup_lruvec)

--Sig_/OhqPB6js6WOqOU++dvb5QzN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/ErwoACgkQAVBC80lX
0GwZcgf+LmdohMW7orDH3cf5vBwFT5qUfuUDyEszzSvThk5CM/fcTgVepr0bS6H1
9eT5eTA/OIzMs/Yc9hXDK4jVNGPmK/MlXYOqcm/ZmAwre5nmiPrrWSTtgYPhkt+a
Gj/8u3K0eE0SMyq03rU383chENgQ7yukRYez7UglxUiW9uIL6LI25iTIfpa3QbXN
zBX9WtAM/Sw6nCqj/8bkQxqPZQ1X/43lC7JVYho03luHIAWS0u7u4FFDXNPCAGKj
eHCAdaYLGVdBECMlVwlPs4QkxUYzsisHSZvy/Vhhgdkc41MVjTHZF7+PlADV5FAo
GWJkIfGzQia5P2NmM6j/7sbU/fOPSg==
=l3sE
-----END PGP SIGNATURE-----

--Sig_/OhqPB6js6WOqOU++dvb5QzN--
