Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A205C2D0CF8
	for <lists+linux-next@lfdr.de>; Mon,  7 Dec 2020 10:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbgLGJ0I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 04:26:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgLGJ0G (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Dec 2020 04:26:06 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C77FC0613D0;
        Mon,  7 Dec 2020 01:25:25 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CqHwK4pDdz9sW1;
        Mon,  7 Dec 2020 20:25:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607333121;
        bh=T7oRBNTKX2au+fRq4FWopouAjc0nxDWjmusZkbXSf2g=;
        h=Date:From:To:Cc:Subject:From;
        b=W0gNvn4c5yDwKrZoVWYBQ8uR7CTdZdibWWoYeIyjne/xoZe/0iBl20TT6CI3CbDP+
         Be6iamKm8vuvDqISlVXKycjS8HE+sBKdRYpi2npM1a3yIFBnes+FKwSBr3e5tLhaFU
         5WJKOw8DegybM7h0bXiKylZ3nucEVy3pUv4wHCQ/U2RreFrxa2gBaCRZIlpZ8wzqln
         eTnS3QxHPbfsqDbjo6LrDIVQ94O4YM9RWsakeW/TwNVYntESZECm+twOW8M8cNJoyM
         guxveUW6Q7KU6XaRjNWSpSr1UkHjOjtmAkFz+njFDM6ThLENPpBiyYbzJeE8pxCyej
         GmJZUVfLKsOPg==
Date:   Mon, 7 Dec 2020 20:25:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Dec 7
Message-ID: <20201207202520.3ced306c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uxkTdTGZ+1+H6ZT/qHy2sgD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uxkTdTGZ+1+H6ZT/qHy2sgD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20201204:

The nfs-anna tree gained a conflict against the nfs tree.

The block tree gained a conflict against the btrfs tree and a semantic
conflict against the bpf-next tree.

The rcu tree lost its build failure.

The kvm-arm tree gained a difficult conflict against the arm64 tree so
I used the version from next-20201203.

The staging tree gained a semantic conflict against the tip tree.

Non-merge commits (relative to Linus' tree): 10267
 9437 files changed, 716509 insertions(+), 173023 deletions(-)

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
Merging origin/master (ab91292cb3e9 Merge tag 'char-misc-5.10-rc7' of git:/=
/git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc)
Merging fixes/fixes (4e33a343ac74 powerpc: fix the allyesconfig build)
Merging kbuild-current/fixes (7d32358be8ac kbuild: avoid split lines in .mo=
d files)
Merging arc-current/for-curr (3a71e423133a ARC: build: use $(READELF) inste=
ad of hard-coded readelf)
Merging arm-current/fixes (9fa2e7af3d53 ARM: 9019/1: kprobes: Avoid fortify=
_panic() when copying optprobe template)
Merging arm64-fixes/for-next/fixes (929c1f3384d7 arm64: mte: fix prctl(PR_G=
ET_TAGGED_ADDR_CTRL) if TCF0=3DNONE)
Merging arm-soc-fixes/arm/fixes (ae597565d13f Merge tag 'optee-valid-memory=
-type-for-v5.11' of git://git.linaro.org/people/jens.wiklander/linux-tee in=
to arm/fixes)
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
Merging net/master (edd2410b165e net: mscc: ocelot: fix dropping of unknown=
 IPv4 multicast on Seville)
Merging bpf/master (12c8a8ca117f xsk: Return error code if force_zc is set)
Merging ipsec/master (48f486e13ffd net: xfrm: fix memory leak in xfrm_user_=
policy())
Merging netfilter/master (bbe2ba04c5a9 Merge tag 'net-5.10-rc7' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/netdev/net)
Merging ipvs/master (bbe2ba04c5a9 Merge tag 'net-5.10-rc7' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/netdev/net)
Merging wireless-drivers/master (74a8c816fa8f rtw88: debug: Fix uninitializ=
ed memory in debugfs code)
Merging mac80211/master (bdeca45a0cc5 mac80211: set SDATA_STATE_RUNNING for=
 monitor interfaces)
Merging rdma-fixes/for-rc (b65054597872 Linux 5.10-rc6)
Merging sound-current/for-linus (c72b9bfe0f91 ALSA: hda/realtek: make bass =
spk volume adjustable on a yoga laptop)
Merging sound-asoc-fixes/for-linus (7dd105ff02c8 Merge remote-tracking bran=
ch 'asoc/for-5.10' into asoc-linus)
Merging regmap-fixes/for-linus (e6e9354b5830 regmap: Remove duplicate `type=
` field from regmap `regcache_sync` trace event)
Merging regulator-fixes/for-linus (291de1d102fa regulator: axp20x: Fix DLDO=
2 voltage control register mask for AXP22x)
Merging spi-fixes/for-linus (9a1cddca6c95 Merge remote-tracking branch 'spi=
/for-5.10' into spi-linus)
Merging pci-current/for-linus (cce14622a703 PCI: Add function 1 DMA alias q=
uirk for Marvell 9215 SATA controller)
Merging driver-core.current/driver-core-linus (f8394f232b1e Linux 5.10-rc3)
Merging tty.current/tty-linus (c8bcd9c5be24 tty: Fix ->session locking)
Merging usb.current/usb-linus (a4b98a7512f1 usb: gadget: f_fs: Use local co=
py of descriptors for userspace copy)
Merging usb-gadget-fixes/fixes (129aa9734559 usb: raw-gadget: fix memory le=
ak in gadget_setup)
Merging usb-serial-fixes/usb-linus (3f203f057edf USB: serial: kl5kusb105: f=
ix memleak on open)
Merging usb-chipidea-fixes/for-usb-fixes (e6c11a2dcaec usb: chipidea: ci_hd=
rc_imx: Pass DISABLE_DEVICE_STREAMING flag to imx6ul)
Merging phy/fixes (fb89b2544b64 phy: mediatek: fix spelling mistake in Kcon=
fig "veriosn" -> "version")
Merging staging.current/staging-linus (418baf2c28f3 Linux 5.10-rc5)
Merging char-misc.current/char-misc-linus (264f53b41946 Revert "mei: virtio=
: virtualization frontend driver")
Merging soundwire-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging thunderbolt-fixes/fixes (600c0849cf86 thunderbolt: Fix use-after-fr=
ee in remove_unplugged_switch())
Merging input-current/for-linus (8c3b55a299c3 Input: atmel_mxt_ts - fix los=
t interrupts)
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
Merging omap-fixes/fixes (f1dc15cd7fc1 ARM: dts: OMAP3: disable AES on N950=
/N9)
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
Merging drm-fixes/drm-fixes (de9b485d1dc9 Merge tag 'drm-misc-fixes-2020-12=
-03' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes)
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
Merging arm64/for-next/core (ecc28f75f519 Merge remote-tracking branch 'arm=
64/for-next/iommu/core' into for-next/core)
Merging arm-perf/for-next/perf (ce4b2c01781a arm64: Fix build failure when =
HARDLOCKUP_DETECTOR_PERF is enabled)
Merging arm-soc/for-next (33fa6976a384 soc: document merges)
Merging amlogic/for-next (685aa8d083e1 Merge branch 'v5.11/soc' into tmp/am=
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
Merging omap/for-next (06d6b9e10f25 Merge branch 'omap-for-v5.11/dt' into f=
or-next)
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
Merging scmi/for-linux-next (b65054597872 Linux 5.10-rc6)
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
Merging m68knommu/for-next (3237f7dedb6d m68k: m68328: remove duplicate cod=
e)
Merging microblaze/next (ed2124c0b9a8 microblaze: add support for TIF_NOTIF=
Y_SIGNAL)
Merging mips/mips-next (4f1682b8a97d MIPS: Move memblock_dump_all() to the =
end of setup_arch())
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
Merging powerpc/next (c9344769e2b4 selftests/powerpc: Fix uninitialized var=
iable warning)
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
Merging fscrypt/master (4a4b8721f1a5 fscrypt: simplify master key locking)
Merging afs/afs-next (8409f67b6437 afs: Adjust the fileserver rotation algo=
rithm to reprobe/retry more quickly)
Merging btrfs/for-next (219d4f384127 Merge branch 'for-next-next-v5.10-2020=
1201' into for-next-20201201)
Merging ceph/master (62575e270f66 ceph: check session state after bumping s=
ession->s_seq)
Merging cifs/for-next (ea64370bcae1 cifs: refactor create_sd_buf() and and =
avoid corrupting the buffer)
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
Merging f2fs/dev (fb51dab71878 f2fs: fix race of pending_pages in decompres=
sion)
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
Merging pci/next (46f821a9cff2 Merge branch 'remotes/lorenzo/pci/misc')
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
Merging jc_docs/docs-next (f5889e70b9cc scripts: get_feat.pl: reduce table =
width for all features output)
Merging v4l-dvb/master (63288c829b1a media: pixfmt-compressed.rst: fix 'bul=
let' formatting)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging v4l-dvb-next/master (d0a9fffedca1 docs: fs: api-summary.rst: get ri=
d of kernel-doc include)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (c35cc6e0cf05 Merge branch 'acpi-scan' into linux-nex=
t)
Merging cpufreq-arm/cpufreq/arm/linux-next (32c855670808 cpufreq: vexpress-=
spc: Add missing MODULE_ALIAS)
Merging cpupower/cpupower (748f0d70087c cpupower: Provide online and offlin=
e CPU information)
Merging devfreq/devfreq-next (98fd9972ed60 PM / devfreq: tegra20: Deprecate=
 in a favor of emc-stat based driver)
Merging opp/opp/linux-next (ed40e33c0b91 opp: Reduce the size of critical s=
ection in _opp_kref_release())
Merging thermal/thermal/linux-next (e57eb8b5050c thermal: imx8mm: Disable t=
he clock on probe failure)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (4f19d071f9be fs: dlm: check on existing node address)
Merging swiotlb/linux-next (fc0021aa340a swiotlb: remove the tbl_dma_addr a=
rgument to swiotlb_tbl_map_single)
Merging rdma/for-next (f93c39bc9547 RDMA/hns: Add support for QP stash)
CONFLICT (content): Merge conflict in include/linux/dma-mapping.h
Merging net-next/master (4054eebf0fb0 Merge branch 'r8169-improve-rtl_rx-an=
d-NUM_RX_DESC-handling')
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
Merging wireless-drivers-next/master (9eb597c74483 Merge ath-next from git:=
//git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git)
Merging bluetooth/master (f71b680cb35f Bluetooth: Set missing suspend task =
bits)
Merging mac80211-next/master (0064c5c1b3bf net: xfrm: use core API for upda=
ting/providing stats)
Merging gfs2/for-next (6e5c4ea37a99 gfs2: in signal_our_withdraw wait for u=
nfreeze of _this_ fs only)
Merging mtd/mtd/next (22ca56a34b32 mtd: devices: powernv_flash: Add functio=
n names to headers and fix 'dev')
Merging nand/nand/next (21ad647ff44f mtd: rawnand: gpmi: fix reference coun=
t leak in gpmi ops)
Merging spi-nor/spi-nor/next (ad624dfd7bb6 mtd: spi-nor: micron-st: allow u=
sing MT35XU512ABA in Octal DTR mode)
Merging crypto/master (0464e0ef4f14 crypto: aegis128 - avoid spurious refer=
ences crypto_aegis128_update_simd)
Merging drm/drm-next (5eb3c85e343a Merge branch 'etnaviv/next' of https://g=
it.pengutronix.de/git/lst/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/nouveau/nouveau_bo.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/gvt/gvt.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/ast/ast_mode.c
Merging amdgpu/drm-next (14133a21f0b5 drm/amdgpu/display: move link_bandwid=
th_kbps under CONFIG_DRM_AMD_DC_DCN)
CONFLICT (content): Merge conflict in drivers/gpu/drm/radeon/radeon_drv.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/clk_mg=
r/dcn21/rn_clk_mgr.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ttm=
.c
Merging drm-intel/for-linux-next (9d8fddf8579a drm/i915: Disable outputs du=
ring unregister)
Merging drm-tegra/drm/tegra/for-next (bf3a3cdcad40 drm/tegra: sor: Disable =
clocks on error in tegra_sor_init())
Merging drm-misc/for-linux-next (47b1adc1d2a3 drm/panel: s6e63m0: Fix init =
sequence again)
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
Merging sound-asoc/for-next (69701680846a Merge remote-tracking branch 'aso=
c/for-5.11' into asoc-next)
Merging modules/modules-next (147ad605dc12 init: use type alignment for ker=
nel parameters)
Merging input/next (7ce8d91b8a84 Input: vsxxxaa - fix Kconfig spelling mist=
ake)
Merging block/for-next (b994d23bfe57 Merge branch 'for-5.11/io_uring' into =
for-next)
CONFLICT (content): Merge conflict in fs/f2fs/super.c
CONFLICT (content): Merge conflict in fs/f2fs/f2fs.h
CONFLICT (content): Merge conflict in fs/f2fs/checkpoint.c
CONFLICT (content): Merge conflict in fs/btrfs/check-integrity.c
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
Merging devicetree/for-next (d7a3fd7f00ee dt-bindings: fsl-imx-drm: fix exa=
mple compatible string)
Merging mailbox/mailbox-for-next (017909281eb0 mailbox: stm32-ipcc: cast vo=
id pointers to unsigned long)
Merging spi/for-next (23597b99043d Merge remote-tracking branch 'spi/for-5.=
11' into spi-next)
Merging tip/auto-latest (2521bfed6027 Merge branch 'linus' into auto-latest)
CONFLICT (content): Merge conflict in tools/power/cpupower/utils/helpers/mi=
sc.c
CONFLICT (content): Merge conflict in arch/x86/pci/i386.c
CONFLICT (content): Merge conflict in Documentation/x86/index.rst
Merging clockevents/timers/drivers/next (e588acdb8087 clocksource/drivers/r=
iscv: Make RISCV_TIMER depends on RISCV_SBI)
Merging edac/edac-for-next (8763e5cbb958 Merge remote-tracking branch 'ras/=
edac-spr' into edac-for-next)
Merging irqchip/irq/irqchip-next (74cde1a53368 irqchip/gic-v3-its: Uncondit=
ionally save/restore the ITS state on suspend)
Merging ftrace/for-next (b111545d26c0 tracing: Remove the useless value ass=
ignment in test_create_synth_event())
Merging rcu/rcu/next (2c05cc592050 percpu_ref: Print stack trace upon refer=
ence-count underflow)
Merging kvm/linux-next (e792415c5d3e KVM: MIPS/VZ: Fix build error caused b=
y 'kvm_run' cleanup)
Merging kvm-arm/next (e12a393fa549 Merge remote-tracking branch 'origin/kvm=
-arm64/psci-relay' into kvmarm-master/queue)
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
Merging hsi/for-next (8a77ed6d1fdd HSI: core: fix a kernel-doc markup)
Merging leds/for-next (98650b087417 leds: turris-omnia: check for LED_COLOR=
_ID_RGB instead LED_COLOR_ID_MULTI)
Merging ipmi/for-next (368ffd9adc7a ipmi: msghandler: Suppress suspicious R=
CU usage warning)
Merging driver-core/driver-core-next (784b2c48ac12 driver core: auxiliary b=
us: Fix auxiliary bus shutdown null auxdrv ptr)
Merging usb/usb-next (e3541d5de544 usb: mtu3: mtu3_debug: remove an unused =
struct member)
Merging usb-gadget/next (b2c586eb07ef usb: dwc2: Fix INTR OUT transfers in =
DDMA mode.)
Merging usb-serial/usb-next (daa919196be4 USB: serial: cp210x: clean up dtr=
_rts())
Merging usb-chipidea-next/for-usb-next (5126075ac4cf usb: chipidea: ci_hdrc=
_imx: Use of_device_get_match_data())
Merging phy-next/next (18b648322d44 phy: mediatek: statify mtk_hdmi_phy_dri=
ver)
CONFLICT (content): Merge conflict in drivers/phy/samsung/phy-exynos-pcie.c
CONFLICT (content): Merge conflict in MAINTAINERS
Merging tty/tty-next (e0efb3168d34 tty: Remove dead termiox code)
Merging char-misc/char-misc-next (888982a84752 Merge tag 'mhi-for-v5.11' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi into char-misc-next)
CONFLICT (content): Merge conflict in drivers/misc/habanalabs/common/memory=
.c
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
Merging scsi/for-next (aa6a6ffe922b Merge branch 'fixes' into for-next)
Merging scsi-mkp/for-next (492096ecfa39 scsi: target: core: Fix fall-throug=
h warnings for Clang)
Merging vhost/linux-next (fb202878ae6b vdpa: ifcvf: Use dma_set_mask_and_co=
herent to simplify code)
Merging rpmsg/for-next (ca08b94fd559 Merge branches 'hwspinlock-next', 'rpm=
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
Merging hyperv/hyperv-next (b0c03eff79a6 drivers: hv: vmbus: Fix checkpatch=
 SPLIT_STRING)
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
Merging akpm-current/current (c564d100b334 lib/lzo/lzo1x_compress.c: make l=
zogeneric1x_1_compress() static)
CONFLICT (content): Merge conflict in mm/memcontrol.c
CONFLICT (content): Merge conflict in mm/highmem.c
CONFLICT (content): Merge conflict in include/linux/sched.h
CONFLICT (content): Merge conflict in include/linux/mm.h
CONFLICT (content): Merge conflict in include/linux/memcontrol.h
CONFLICT (content): Merge conflict in include/linux/kernel.h
CONFLICT (content): Merge conflict in arch/riscv/Kconfig
CONFLICT (content): Merge conflict in arch/arc/Kconfig
CONFLICT (content): Merge conflict in arch/Kconfig
Applying: fixup for "mm: move lruvec stats update functions to vmstat.h"
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (c69848b7e332 secretmem: test: add basic selftest for m=
emfd_secret(2))

--Sig_/uxkTdTGZ+1+H6ZT/qHy2sgD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/N9QAACgkQAVBC80lX
0GzaqwgAmOcmQ0/QUh/QYQ0EctLK22YaUveWt13+hiEwqVuURMirtrfDMir990SQ
UUPduPTyqDOjKRq06dhpu0OUpXK/4NxLoepmM0ud8ff97dYzxJfZeMt+CL9xtNMq
YG5HEKwKUhlK+2agtxT/Si8D3Rn3vo4MQjHyrhXX+n1QmjXowcz6mo7x0MY39KBh
YzPAWpYiHcru5Rp5/UhAydbwjjmzzp0vLHSroyj+113OccAAENUVVPY09TjX4fKq
4DBF7SroYzDy8QM9mSxzDqU5kpAwCEz8+Yo4Hc2fBmeNnHdCC7RXlSXwTc3rNE1L
UKfRSGwdP9i4oPYtBPrTsU/H6KBpWw==
=nNEh
-----END PGP SIGNATURE-----

--Sig_/uxkTdTGZ+1+H6ZT/qHy2sgD--
