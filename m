Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21B4A2B3D68
	for <lists+linux-next@lfdr.de>; Mon, 16 Nov 2020 07:59:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgKPG7T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Nov 2020 01:59:19 -0500
Received: from ozlabs.org ([203.11.71.1]:40937 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726524AbgKPG7S (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Nov 2020 01:59:18 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CZKgN5qVPz9sRR;
        Mon, 16 Nov 2020 17:59:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605509952;
        bh=w/tAHpEfzDS1nGd2vARCY7A+gohvDYgxRo7XCRn2WNo=;
        h=Date:From:To:Cc:Subject:From;
        b=amFgOWwVuaE5N1wEF7xBXliy410/RNlu601QshmpR8QqZ28z2ibMgubNUeBI0bjR2
         9ovXllm1oM6kwczw4DEYciXmWbojZAcnyuUrLE6sBDwnb437KScgx+SuS6jraXDjzQ
         jCBTJZWqydPXE6V2bn1rqDAmdQda4W7Od5Nma82owGY0PN+qb138K6pMUUxygYvKmz
         9L09fpXKzU+JNR0/H5SDT0Hu4rIhRZQuXxnyyyiUihp6AlZ7N9LULbG6/FuJO9riOf
         d/VuabXoqpkNWDy0MEbgNhJL2xoyFLHbzf+uA9BuC+BNczFwx48MCCsVi4v6pEF04S
         H3YhounZK+t8A==
Date:   Mon, 16 Nov 2020 17:59:12 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 16
Message-ID: <20201116175912.5f6a78d9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SNiVyROskNfo61pgwQWr9y.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SNiVyROskNfo61pgwQWr9y.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20201113:

The drivers-memory tree lost its build failure.

The ext3 tree lost its build failure.

The amdgpu tree gained a conflict against the drm tree.

The usb-chipidea-next tree lost its build failure.

Non-merge commits (relative to Linus' tree): 5389
 5443 files changed, 532938 insertions(+), 90825 deletions(-)

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
Merging origin/master (a6af8718b98e Merge tag 'drm-fixes-2020-11-16' of git=
://anongit.freedesktop.org/drm/drm)
Merging fixes/fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging kbuild-current/fixes (d1889589a4f5 builddeb: Fix rootless build in =
setuid/setgid directory)
Merging arc-current/for-curr (3b57533b460c ARC: [plat-hsdk] Remap CCMs supe=
r early in asm boot trampoline)
Merging arm-current/fixes (9fa2e7af3d53 ARM: 9019/1: kprobes: Avoid fortify=
_panic() when copying optprobe template)
Merging arm64-fixes/for-next/fixes (23c216416056 arm64: cpu_errata: Apply E=
rratum 845719 to KRYO2XX Silver)
Merging arm-soc-fixes/arm/fixes (b57d5437e374 Merge tag 'sunxi-fixes-for-5.=
10-1' of git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm=
/fixes)
Merging drivers-memory-fixes/fixes (275374b46da2 memory: pl353-smc: fix com=
pile test on !ARM_AMBA)
Merging m68k-current/for-linus (50c5feeea0af ide/macide: Convert Mac IDE dr=
iver to platform driver)
Merging powerpc-fixes/fixes (01776f070ffc powerpc/32s: Use relocation offse=
t when setting early hash table)
Merging s390-fixes/fixes (78d732e1f326 s390/cpum_sf.c: fix file permission =
for cpum_sfb_size)
Merging sparc/master (0a95a6d1a4cd sparc: use for_each_child_of_node() macr=
o)
Merging fscrypt-current/for-stable (d19d8d345eec fscrypt: fix inline encryp=
tion not used on new files)
Merging net/master (849920c70339 devlink: Add missing genlmsg_cancel() in d=
evlink_nl_sb_port_pool_fill())
Merging bpf/master (f782e2c300a7 bpf: Relax return code check for subprogra=
ms)
Merging ipsec/master (48f486e13ffd net: xfrm: fix memory leak in xfrm_user_=
policy())
Merging netfilter/master (fea07a487c6d net: openvswitch: silence suspicious=
 RCU usage warning)
Merging ipvs/master (fea07a487c6d net: openvswitch: silence suspicious RCU =
usage warning)
Merging wireless-drivers/master (fe56d05ee6c8 iwlwifi: mvm: fix kernel pani=
c in case of assert during CSA)
Merging mac80211/master (1395f8df87b0 Merge tag 'mac80211-for-net-2020-11-1=
3' of git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211)
Merging rdma-fixes/for-rc (f8394f232b1e Linux 5.10-rc3)
Merging sound-current/for-linus (02a9c6ee4183 ALSA: firewire: Clean up a lo=
cking issue in copy_resp_to_buf())
Merging sound-asoc-fixes/for-linus (ee57a9cf5438 Merge remote-tracking bran=
ch 'asoc/for-5.10' into asoc-linus)
Merging regmap-fixes/for-linus (3650b228f83a Linux 5.10-rc1)
Merging regulator-fixes/for-linus (f5c042b23f74 regulator: workaround self-=
referent regulators)
Merging spi-fixes/for-linus (386eaa2deaba Merge remote-tracking branch 'spi=
/for-5.10' into spi-linus)
Merging pci-current/for-linus (51e2e24504ad PCI: Add function 1 DMA alias q=
uirk for Marvell 9215 SATA controller)
Merging driver-core.current/driver-core-linus (f8394f232b1e Linux 5.10-rc3)
Merging tty.current/tty-linus (425af483523b serial: ar933x_uart: disable cl=
k on error handling path in probe)
Merging usb.current/usb-linus (6d853c9e4104 usb: cdc-acm: Add DISABLE_ECHO =
for Renesas USB Download mode)
Merging usb-gadget-fixes/fixes (129aa9734559 usb: raw-gadget: fix memory le=
ak in gadget_setup)
Merging usb-serial-fixes/usb-linus (f8394f232b1e Linux 5.10-rc3)
Merging usb-chipidea-fixes/for-usb-fixes (7b7f84797023 usb: cdns3: gadget: =
calculate TD_SIZE based on TD)
Merging phy/fixes (25d76fed7ffe phy: cpcap-usb: Use IRQF_ONESHOT)
Merging staging.current/staging-linus (18db36a073db docs: ABI: testing: iio=
: stm32: remove re-introduced unsupported ABI)
Merging char-misc.current/char-misc-linus (092561f06702 uio: Fix use-after-=
free in uio_unregister_device())
Merging soundwire-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging thunderbolt-fixes/fixes (f6439c531d52 thunderbolt: Add support for =
Intel Tiger Lake-H)
Merging input-current/for-linus (ae3d6083acf6 Input: elan_i2c - fix firmwar=
e update on newer ICs)
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
Merging omap-fixes/fixes (99fba3205cd4 ARM: dts: am437x-l4: fix compatible =
for cpsw switch dt node)
Merging kvm-fixes/master (c887c9b9ca62 kvm: mmu: fix is_tdp_mmu_check when =
the TDP MMU is not in use)
Merging kvms390-fixes/master (6cbf1e960fa5 KVM: s390: remove diag318 reset =
code)
Merging hwmon-fixes/hwmon (60268b0e8258 hwmon: (amd_energy) modify the visi=
bility of the counters)
Merging nvdimm-fixes/libnvdimm-fixes (88b67edd7247 dax: Fix compilation for=
 CONFIG_DAX && !CONFIG_FS_DAX)
Merging btrfs-fixes/next-fixes (46630599693a Merge branch 'misc-5.10' into =
next-fixes)
Merging vfs-fixes/fixes (6a9f696d1627 fix return values of seq_read_iter())
Merging dma-mapping-fixes/for-linus (892fc9f6835e dma-pool: Fix an uninitia=
lized variable bug in atomic_pool_expand())
Merging i3c-fixes/master (6fbc7275c7a9 Linux 5.2-rc7)
Merging drivers-x86-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging samsung-krzk-fixes/fixes (cd12e4f14f7c CREDITS: remove trailing whi=
te spaces)
Merging pinctrl-samsung-fixes/fixes (3650b228f83a Linux 5.10-rc1)
Merging devicetree-fixes/dt/linus (bdac39a3bd28 dt-bindings: clock: imx5: f=
ix example)
Merging scsi-fixes/fixes (2e6f11a797a2 scsi: ufshcd: Fix missing destroy_wo=
rkqueue())
Merging drm-fixes/drm-fixes (8f598d15ee65 Merge branch 'linux-5.10' of git:=
//github.com/skeggsb/linux into drm-fixes)
Merging amdgpu-fixes/drm-fixes (2c409ba81be2 drm/radeon: fix si_enable_smc_=
cac() failed issue)
Merging drm-intel-fixes/for-linux-next-fixes (5ce6861d36ed drm/i915: Correc=
tly set SFC capability for video engines)
Merging mmc-fixes/fixes (03d80e042a8e Revert "mmc: renesas_sdhi: workaround=
 a regression when reinserting SD cards")
Merging rtc-fixes/rtc-fixes (9123e3a74ec7 Linux 5.9-rc1)
Merging gnss-fixes/gnss-linus (48778464bb7d Linux 5.8-rc2)
Merging hyperv-fixes/hyperv-fixes (92e4dc8b0566 Drivers: hv: vmbus: Allow c=
leanup of VMBUS_CONNECT_CPU if disconnected)
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
Merging drm-misc-fixes/for-linux-next-fixes (bc551d776b69 drm: bridge: dw-h=
dmi: Avoid resetting force in the detect function)
Merging kspp-gustavo/for-next/kspp (3650b228f83a Linux 5.10-rc1)
Merging kbuild/for-next (729e39a558eb kconfig: qconf: convert to Qt5 new si=
gnal/slot connection syntax)
Merging compiler-attributes/compiler-attributes (bbf5c979011a Linux 5.9)
Merging dma-mapping/for-next (48ab6d5d1f09 dma-mapping: fix 32-bit overflow=
 with CONFIG_ARM_LPAE=3Dn)
Merging asm-generic/master (129eb82bd5f2 Merge branch 'asm-generic-fixes' i=
nto asm-generic)
Merging arc/for-next (def9d2780727 Linux 5.5-rc7)
Merging arm/for-next (40bd54f12902 Merge branch 'devel-stable' into for-nex=
t)
Merging arm64/for-next/core (fad058cc2a38 Merge branch 'for-next/kvm-build-=
fix' into for-next/core)
Merging arm-perf/for-next/perf (887e2cff0f8d perf: arm-cmn: Fix conversion =
specifiers for node type)
Merging arm-soc/for-next (0d4a574f4e88 ARM: soc: document merges)
Merging amlogic/for-next (84a1411c7549 Merge branch 'v5.11/soc' into tmp/am=
l-rebuild)
Merging aspeed/for-next (fc6fd3e6ac5a Merge branch 'soc-for-v5.11' into for=
-next)
Merging at91/at91-next (0698efbb33ef Merge branches 'at91-soc', 'at91-dt' a=
nd 'at91-defconfig' into at91-next)
Merging drivers-memory/for-next (d203435ba497 Merge branch 'fixes' into for=
-next)
Merging imx-mxs/for-next (c37ca3890c0c Merge branch 'imx/defconfig' into fo=
r-next)
Merging keystone/next (a5e886fb26f2 Merge branch 'for_5.11/drivers-soc' int=
o next)
Merging mediatek/for-next (9c6658a0dd4f Merge branch 'v5.10-next/soc' into =
for-next)
Merging mvebu/for-next (f89c9685f6a1 Merge branch 'mvebu/dt64' into mvebu/f=
or-next)
Merging omap/for-next (2565feb3ad18 Merge branch 'omap-for-v5.11/dt' into f=
or-next)
Merging qcom/for-next (64a915bfae47 Merge branches 'arm64-for-5.11', 'arm64=
-defconfig-for-5.11', 'drivers-for-5.11' and 'dts-for-5.11' into for-next)
Merging raspberrypi/for-next (3650b228f83a Linux 5.10-rc1)
Merging realtek/for-next (486f29df6941 Merge branch 'v5.8/dt' into next)
Merging renesas/next (6215772bbe58 Merge branches 'renesas-arm-defconfig-fo=
r-v5.11' and 'renesas-arm-dt-for-v5.11' into renesas-next)
Merging reset/reset/next (d414a5eca57c reset: make shared pulsed reset cont=
rols re-triggerable)
Merging rockchip/for-next (db4d9df43533 Merge branch 'v5.11-armsoc/drivers'=
 into for-next)
Merging samsung-krzk/for-next (85c3c2bd52f1 Merge branch 'next/dt' into for=
-next)
Merging scmi/for-linux-next (3cea11cd5e3b Linux 5.10-rc2)
Merging stm32/stm32-next (a41ee1a9bf6d ARM: dts: stm32: reorder spi4 within=
 stm32mp15-pinctrl)
Merging sunxi/sunxi/for-next (12f6c7209fc3 Merge branch 'sunxi/dt-for-5.11'=
 into sunxi/for-next)
Merging tegra/for-next (08f3ad8c86b0 Merge branch for-5.11/arm64/dt into fo=
r-next)
Merging ti-k3/ti-k3-next (1e3d655fe7b4 Merge branch 'ti-k3-config-next' int=
o ti-k3-next)
Merging ti-k3-new/ti-k3-next (65e919494d96 Merge branch 'ti-k3-dts-next' in=
to ti-k3-next)
Merging clk/clk-next (d42ec70bfd47 Merge branch 'clk-qcom' into clk-next)
Merging clk-samsung/for-next (3650b228f83a Linux 5.10-rc1)
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
Merging mips/mips-next (a3fb655027c3 mips: boot: add support for self-extra=
cting FIT images (vmlinuz.itb))
Merging nds32/next (54bde873682b nds32: Fix bogus reference to <asm/procinf=
o.h>)
Merging nios2/for-next (6b57fa4d374b nios2: signal: Mark expected switch fa=
ll-through)
Merging openrisc/for-next (1da81e5562fa drivers/tty/serial: add LiteUART dr=
iver)
Merging parisc-hd/for-next (19621e5fd02b parisc: Switch to clockevent based=
 timers)
CONFLICT (content): Merge conflict in arch/parisc/kernel/time.c
Applying: revert the rest of "parisc: use legacy_timer_tick"
Merging powerpc/next (3cea11cd5e3b Linux 5.10-rc2)
Merging fsl/next (a76bea0287ce powerpc/kmcent2: add ranges to the pci bridg=
es)
Merging soc-fsl/next (d97b957e32b1 soc: fsl: qe: Remove unnessesary check i=
n ucc_set_tdm_rxtx_clk)
Merging risc-v/for-next (ae386e9d809c riscv: Ignore Image.* and loader.bin)
Merging s390/for-next (94192be7c0ce Merge branch 'features' into for-next)
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
CONFLICT (content): Merge conflict in fs/btrfs/inode.c
Merging ceph/master (62575e270f66 ceph: check session state after bumping s=
ession->s_seq)
Merging cifs/for-next (830c9f9cf885 smb3: Handle error case during offload =
read path)
Merging configfs/for-next (65cdb4a214c0 configfs: fix kernel-doc markup iss=
ue)
Merging ecryptfs/next (8b614cb8f1dc Merge tag '5.6-rc4-smb3-fixes' of git:/=
/git.samba.org/sfrench/cifs-2.6)
Merging erofs/dev (915f4c9358db erofs: remove unnecessary enum entries)
Merging exfat/dev (f9893351acae Merge tag 'kconfig-v5.10' of git://git.kern=
el.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild)
Merging ext3/for_next (d5dc76f9bb43 Merge ext2 cleanup from Ira Weiny.)
Merging ext4/dev (d196e229a80c Revert "ext4: fix superblock checksum calcul=
ation race")
Merging f2fs/dev (a945d4f0d38c f2fs: avoid race condition for shinker count)
Merging fsverity/fsverity (f8394f232b1e Linux 5.10-rc3)
Merging fuse/for-next (9d769e6aa252 fuse: support SB_NOSEC flag to improve =
write performance)
Merging jfs/jfs-next (c61b3e483900 jfs: Fix array index bounds check in dbA=
djTree)
Merging nfs/linux-next (f8394f232b1e Linux 5.10-rc3)
Merging nfs-anna/linux-next (11decaf8127b NFS: Remove unnecessary inode loc=
k in nfs_fsync_dir())
Merging nfsd/nfsd-next (c3213d260a23 SUNRPC: Fix oops in the rpc_xdr_buf ev=
ent class)
Merging cel/cel-next (dc4152fc512e svcrdma: Catch another Reply chunk overf=
low case)
Merging orangefs/for-next (e848643b524b orangefs: remove unnecessary assign=
ment to variable ret)
Merging overlayfs/overlayfs-next (c11faf32599f ovl: fix incorrect extent in=
fo in metacopy case)
Merging ubifs/next (e2a05cc7f822 ubifs: mount_ubifs: Release authentication=
 resource in error handling path)
Merging v9fs/9p-next (7ca1db21ef8e net: 9p: initialize sun_server.sun_path =
to have addr's value only when addr is valid)
Merging xfs/for-next (2bd3fa793aaa xfs: fix a missing unlock on error in xf=
s_fs_map_blocks)
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
Merging printk/for-next (9194df34b8b8 Merge branch 'for-5.10-trivial' into =
for-next)
Merging pci/next (405196258f54 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (137c6236aeec mailmap: Add WeiXiong Liao)
CONFLICT (content): Merge conflict in .mailmap
Merging hid/for-next (e76f0c214c41 Merge branch 'for-5.10/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (c97e7615c15b Merge branch 'i2c/for-current' into =
i2c/for-next)
Merging i3c/i3c/next (abea14bfdebb i3c: master: Fix error return in cdns_i3=
c_master_probe())
Merging dmi/dmi-for-next (3cb4d29a2633 MAINTAINERS: The DMI/SMBIOS tree has=
 moved)
Merging hwmon-staging/hwmon-next (414920a4a5d5 hwmon: (corsair-psu) Fix fan=
 rpm calculation)
Merging jc_docs/docs-next (99d56196a700 Documentation: Chinese translation =
of Documentation/arm64/perf.rst)
Merging v4l-dvb/master (0ab4f9087ea9 media: platform: add missing put_devic=
e() call in mtk_jpeg_probe() and mtk_jpeg_remove())
CONFLICT (content): Merge conflict in drivers/media/platform/marvell-ccic/m=
mp-driver.c
Merging v4l-dvb-next/master (d0a9fffedca1 docs: fs: api-summary.rst: get ri=
d of kernel-doc include)
Merging fbdev/fbdev-for-next (732146a3f1dc video: fbdev: imxfb: fix a typo =
in imxfb_probe())
Merging pm/linux-next (52d108cd060d Merge branch 'powercap' into linux-next)
Merging cpufreq-arm/cpufreq/arm/linux-next (32c855670808 cpufreq: vexpress-=
spc: Add missing MODULE_ALIAS)
Merging cpupower/cpupower (748f0d70087c cpupower: Provide online and offlin=
e CPU information)
Merging devfreq/devfreq-next (404d59c57b26 PM / devfreq: exynos-bus: Add re=
gistration of interconnect child device)
Merging opp/opp/linux-next (4e6fe1a4123c drm/lima: Unconditionally call dev=
_pm_opp_of_remove_table())
Merging thermal/thermal/linux-next (e78acf7efebf thermal: intel_pch_thermal=
: Add PCI ids for Lewisburg PCH.)
Merging thermal-rzhang/next (54ecb8f7028c Linux 5.4-rc1)
Merging thermal-soc/next (6c375eccded4 thermal: db8500: Rewrite to be a pur=
e OF sensor)
Merging ieee1394/for-next (67f8e65e4fc1 firewire: net: remove set but not u=
sed variable 'guid')
Merging dlm/next (4f19d071f9be fs: dlm: check on existing node address)
Merging swiotlb/linux-next (fc0021aa340a swiotlb: remove the tbl_dma_addr a=
rgument to swiotlb_tbl_map_single)
Merging rdma/for-next (f946e45f59ef IB/mlx5: Add support for NDR link speed)
Merging net-next/master (0064c5c1b3bf net: xfrm: use core API for updating/=
providing stats)
Merging bpf-next/for-next (2d38c5802f46 Merge branch 'ionic-updates')
Merging ipsec-next/master (8be33ecfc1ff net: skb_vlan_untag(): don't reset =
transport offset if set by GRO layer)
Merging mlx5-next/mlx5-next (3650b228f83a Linux 5.10-rc1)
Merging netfilter-next/master (70408949a35f Merge branch 'inet-prevent-skb-=
changes-in-udp-4-6-_lib_lookup_skb')
Merging ipvs-next/master (c9448e828d11 Merge tag 'mlx5-updates-2020-11-03' =
of git://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux)
Merging wireless-drivers-next/master (1ccaa898868d rtw88: coex: simplify th=
e setting and condition about WLAN TX limitation)
Merging bluetooth/master (22fbcfc54705 Bluetooth: Replace BT_DBG with bt_de=
v_dbg in HCI request)
Merging mac80211-next/master (da1e9dd3a11c nl80211: fix kernel-doc warning =
in the new SAE attribute)
Merging gfs2/for-next (4e79e3f08e57 gfs2: Fix case in which ail writes are =
done to jdata holes)
Merging mtd/mtd/next (232b67c39942 mtd: remove unneeded break)
Merging nand/nand/next (3ebbdef13f82 mtd: rawnand: sunxi: Add MDMA support)
Merging spi-nor/spi-nor/next (ad624dfd7bb6 mtd: spi-nor: micron-st: allow u=
sing MT35XU512ABA in Octal DTR mode)
Merging crypto/master (c4fc6328d6c6 crypto: arm64/chacha - simplify tail bl=
ock handling)
Merging drm/drm-next (31b05212360c Merge branch 'linux-5.11' of git://githu=
b.com/skeggsb/linux into drm-next)
CONFLICT (content): Merge conflict in drivers/gpu/drm/nouveau/nouveau_bo.c
Merging amdgpu/drm-next (d1aaab57e620 drm/amdgpu: Enable GPU reset for vang=
ogh)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/amdgpu/amdgpu_ttm=
.c
Merging drm-intel/for-linux-next (bafcdad64346 drm/i915: Add hw.pipe_mode t=
o allow bigjoiner pipe/transcoder split)
Merging drm-tegra/drm/tegra/for-next (123f01a0c989 drm/tegra: output: Do no=
t put OF node twice)
Merging drm-misc/for-linux-next (a14d546f7270 drm/lima: Unconditionally cal=
l dev_pm_opp_of_remove_table())
CONFLICT (content): Merge conflict in drivers/gpu/drm/lima/lima_devfreq.c
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
Merging regmap/for-next (f7d01359b0d9 regmap: Fix order of regmap write log)
Merging sound/for-next (8461352ddf07 ALSA: firewire: fix comparison to bool=
 warning)
Merging sound-asoc/for-next (6f3ff1ddee0f Merge remote-tracking branch 'aso=
c/for-5.11' into asoc-next)
Merging modules/modules-next (24b9f0d22081 module: fix comment style)
Merging input/next (cd536aa5b438 Input: imx6ul_tsc - remove set but unused =
variable 'value')
Merging block/for-next (03b19ed6ab66 Merge branch 'for-5.11/io_uring' into =
for-next)
Merging device-mapper/for-next (530313c2fffa dm table: Remove BUG_ON(in_int=
errupt()))
Merging pcmcia/pcmcia-next (46d079790663 pcmcia: make pccard_loop_tuple() s=
tatic)
Merging mmc/next (fc69b6a3113a Merge branch 'fixes' into next)
Merging mfd/for-mfd-next (394a569203fc mfd: htc-i2cpld: Add the missed i2c_=
put_adapter() in htcpld_register_chip_i2c())
Merging backlight/for-backlight-next (789eb04b6c56 backlight: pwm_bl: Fix i=
nterpolation)
Merging battery/for-next (7007fab4ae82 power: reset: POWER_RESET_OCELOT_RES=
ET should depend on Ocelot or Sparx5)
Merging regulator/for-next (7633381878cf Merge remote-tracking branch 'regu=
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
Merging selinux/next (b159e86b5a2a selinux: drop super_block backpointer fr=
om superblock_security_struct)
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
Merging spi/for-next (cc1fc5bdb37a Merge remote-tracking branch 'spi/for-5.=
11' into spi-next)
Merging tip/auto-latest (c3c30db1b191 Merge branch 'x86/fpu')
Merging clockevents/timers/drivers/next (4576f62086eb dt-bindings: timer: r=
enesas: tmu: Convert to json-schema)
Merging edac/edac-for-next (82b9c922783e Merge branch 'edac-igen6' into eda=
c-for-next)
Merging irqchip/irq/irqchip-next (d95bdca75b3f irqchip/ti-sci-inta: Add sup=
port for unmapped event handling)
Merging ftrace/for-next (58954b3be8b7 MAINTAINERS: assign ./fs/tracefs to T=
RACING)
Merging rcu/rcu/next (bf6a52d6ce5f fixup! scftorture: Add debug output for =
wrong-CPU warning)
Merging kvm/linux-next (e792415c5d3e KVM: MIPS/VZ: Fix build error caused b=
y 'kvm_run' cleanup)
Merging kvm-arm/next (ed4ffaf49bf9 KVM: arm64: Handle SCXTNUM_ELx traps)
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
Merging chrome-platform/for-next (de0f49487db3 platform/chrome: cros_ec_typ=
ec: Register partner altmodes)
Merging hsi/for-next (bb6d3fb354c5 Linux 5.6-rc1)
Merging leds/for-next (6c3e42616bf2 leds: various: add missing put_device()=
 call in netxbig_leds_get_of_pdata())
Merging ipmi/for-next (0df7b988d9df char: ipmi: remove unneeded break)
Merging driver-core/driver-core-next (33c0c9bdf7a5 drivers: base: fix some =
kernel-doc markups)
Merging usb/usb-next (56c62080d5b5 usb: hcd.h: Remove RUN_CONTEXT)
Merging usb-gadget/next (b2c586eb07ef usb: dwc2: Fix INTR OUT transfers in =
DDMA mode.)
Merging usb-serial/usb-next (975323ab8f11 USB: serial: mos7720: fix paralle=
l-port state restore)
Merging usb-chipidea-next/for-usb-next (56d0cca62371 usb: chipidea: trace: =
fix the endian issue)
Merging phy-next/next (c36f74566cef MAINTAINERS: Add entry for Qualcomm IPQ=
4019 USB PHY)
CONFLICT (content): Merge conflict in MAINTAINERS
Merging tty/tty-next (8eddcca2a746 tty: tty_ldisc: Fix some kernel-doc rela=
ted misdemeanours)
Merging char-misc/char-misc-next (ef84928cff58 uio/uio_pci_generic: use dev=
ice-managed function equivalents)
Merging extcon/extcon-next (54589b557a8d extcon: fsa9480: Support TI TSU611=
1 variant)
Merging soundwire/next (3650b228f83a Linux 5.10-rc1)
Merging thunderbolt/next (4e58171aa93f MAINTAINERS: Add Isaac as maintainer=
 of Thunderbolt DMA traffic test driver)
Merging vfio/next (2e6cfd496f5b vfio iommu type1: Fix memory leak in vfio_i=
ommu_type1_pin_pages)
Merging staging/staging-next (0d79a48440f5 staging: vt6655: Remove useless =
else)
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
Merging scsi/for-next (9cdcab394724 Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (cb2b4e8f5ea6 scsi: bnx2fc: Fix comparison to boo=
l warning)
Merging vhost/linux-next (b966777f6220 virtio: virtio_console: fix DMA memo=
ry allocation for rproc serial)
Merging rpmsg/for-next (3e53119a2521 Merge branches 'hwspinlock-next', 'rpm=
sg-next' and 'rproc-next' into for-next)
Merging gpio/for-next (27b5ea2fcb90 Merge branch 'devel' into for-next)
Merging gpio-brgl/gpio/for-next (37174f334130 gpio: tegra: Use raw_spinlock)
Merging gpio-intel/for-next (3650b228f83a Linux 5.10-rc1)
Merging pinctrl/for-next (722491772123 Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (0ddebf8580fa pinctrl: lynxpoint: Unify init=
call location in the code)
Merging pinctrl-samsung/for-next (c5564a50d990 pinctrl: samsung: s3c24xx: r=
emove unneeded break)
Merging pwm/for-next (247b2a7bd5e2 pwm: Use -EINVAL for unsupported polarit=
y)
Merging userns/for-next (99ec4d2745d5 signal: clear non-uapi flag bits when=
 passing/returning sa_flags)
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
Merging rtc/rtc-next (767fbb7102c6 rtc: rv3032: fix nvram nvmem priv pointe=
r)
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
Merging auxdisplay/auxdisplay (decbaf182d8f auxdisplay: fix platform_no_drv=
_owner.cocci warnings)
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
Merging akpm-current/current (12cb1f3b5654 lib/lzo/lzo1x_compress.c: make l=
zogeneric1x_1_compress() static)
CONFLICT (content): Merge conflict in include/linux/sched.h
CONFLICT (content): Merge conflict in arch/arc/Kconfig
$ git checkout -b akpm remotes/origin/akpm/master
$ git rebase --onto master remotes/origin/akpm/master-base
Merging akpm/master (58680c2ecef8 mm/gup: assert that the mmap lock is held=
 in __get_user_pages())

--Sig_/SNiVyROskNfo61pgwQWr9y.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+yI0AACgkQAVBC80lX
0GxZ0wf+IjRFTN41wZr0GvaVxbHzNCtHFeScfldoyfoRhRg/kBpdTCLPsbEQIyQ4
UwABh348CffAPkEnbst+LEpUE5TYKkP9ijE9y+8UUp+4nvO/gK7sHs43Xz2rkI+P
+NxiZs2xz9YMy+zhzGxMTTQlbXk+JBplcT9w0b3Mok6cqgfboYmsxDa/7BsGeFel
AsiJMlzw4hIOXauOgaL9CFkWlG3D8k4xzmGz35eaLCjRzd96bp9c37EHkseq0gWe
paZDMW0ZDR7q1zLU0pziKd8PIQs+swTS1tV8qL9mbI8ijiO17dWQHdAiVjGxdzbd
QYssBFrUzvMMbsbyYpu0GPgyfk8qfg==
=VB2x
-----END PGP SIGNATURE-----

--Sig_/SNiVyROskNfo61pgwQWr9y.--
